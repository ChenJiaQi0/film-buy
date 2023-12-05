<template>
	<view class="diy-tree">
		<view class="diy-tree-view">
			<block v-for="(item, index) in treeList" :key="index">
				<view class="diy-tree-item" :style="[{
					color:titleColor,
					paddingLeft: item.rank*15 + 'px',
					zIndex: item.rank*-1 +50
				}]"  :class="{
					selected:selectId==item.id,
					border: border === true,
					show: item.show,
					last: item.lastRank,
					showchild: item.showChild,
					open: item.open,
				}">
					<view class="diy-tree-label"  @tap.stop="_treeItemTap(item, index)">
						<view class="diy-tree-icon" :class="{rotate:item.showChild}">
							<i :class="item.lastRank ? lastIcon : item.showChild ? currentIcon : defaultIcon"></i>
						</view>
						{{item.name}}
					</view>
					<template v-if="mode!=''">
						<view class="diy-tree-check" @tap.stop="_treeItemSelect(item, index)"
							v-if="selectParent?true:item.lastRank">
							<view class="diy-tree-check-yes" v-if="item.checked" :class="{'radio':mode=='radio'}"
								:style="{'border-color':confirmColor}">
								<view class="diy-tree-check-yes-b" :style="{'background-color':confirmColor}"></view>
							</view>
							<view class="diy-tree-check-no" v-else :class="{'radio':mode=='radio'}"
								:style="{'border-color':confirmColor}"></view>
						</view>
					</template>
				</view>
			</block>
		</view>
	</view>
</template>

<script>
	export default {
		name: "diy-tree",
		emits: ["update:modelValue", "confirm", "select"],
		props: {
			value: {
				type: Array,
				default: []
			},
			modelValue: {
				type: Array,
				default: []
			},
			list: {
				type: Array,
				default: function() {
					return []
				}
			},
			mode: {
				type: String,
				default: ''
			},
			valueName: {
				type: String,
				default: 'id'
			},
			labelName: {
				type: String,
				default: 'label'
			},
			openName:{
				type: String,
				default: 'open'
			},
			selectParent: { //是否可以选父级
				type: Boolean,
				default: true
			},
			 //强制级联选中
			checkStrictly:{
				type: Boolean,
				default: true
			},
			foldAll: { //折叠时关闭所有已经打开的子集，再次打开时需要一级一级打开
				type: Boolean,
				default: false
			},
			confirmColor: { // 确定按钮颜色
				type: String,
				default: ' #07bb07'
			},
			titleColor: { // 标题颜色
				type: String,
				default: '#07bb07'
			},
			currentIcon: { // 展开时候的ic
				type: String,
				default: 'diy-icon-triangledownfill'
			},
			defaultIcon: { // 折叠时候的ic
				type: String,
				default: 'diy-icon-triangledownfill roate'
			},
			lastIcon: { // 没有子集的ic
				type: String,
				default: ''
			},
			border: { // 是否有分割线
				type: Boolean,
				default: false
			},
		},
		data() {
			return {
				showTree: false,
				treeList: [],
				selectValue:[],
				selectId: undefined,
				idArr: [],
			}
		},
		computed: {},
		methods: {
			_confirm() {
				// 处理所选数据
				let rt = [],treeId=[],obj = {};
					
				this.treeList.forEach((v, i) => {
					if (this.treeList[i].checked) {
						obj = {}
						obj.parents = this.treeList[i].parents
						obj = Object.assign(obj, this.treeList[i].source)
						// 移除子元素
						delete obj.children
						rt.push(obj)
						treeId.push(obj[this.valueName])
					}
				})
				this.$emit("update:modelValue", treeId);
				this.$emit("change", rt);
			},
			//扁平化树结构
			_renderTreeList(list = [], rank = 0, parentId = [], parents = []) {
				list.forEach(item => {
					let data = {
						id: item[this.valueName],
						name: item[this.labelName],
						source: item,
						parentId, // 父级id数组
						parents, // 父级id数组
						rank, // 层级
						showChild: item[this.openName]?item[this.openName]:false, //子级是否显示
						open: item[this.openName]?item[this.openName]:false, //是否打开
						show: item[this.openName]?item[this.openName]: rank === 0, // 自身是否显示
						hideArr: [],
						orChecked:this.selectValue.includes(item[this.valueName])? true : false,
						checked: this.selectValue.includes(item[this.valueName])? true : false,
					}
					data[this.valueName] = item[this.valueName]
					data[this.labelName] = item[this.labelName]
					this.treeList.push(data)
					if (Array.isArray(item.children) && item.children.length > 0) {
						// console.log(item)
						let parentid = [...parentId],
							parentArr = [...parents];
						delete parentArr.children
						parentid.push(item[this.valueName]);
						parentArr.push({
							[this.valueName]: item[this.valueName],
							[this.labelName]: item[this.labelName]
						})
						this._renderTreeList(item.children, rank + 1, parentid, parentArr);
					} else {
						this.treeList[this.treeList.length - 1].lastRank = true;
					}
				})
			},
			// 处理默认选择
			_defaultSelect() {
				this.treeList.forEach((v, i) => {
					if (v.showChild) {
						this.treeList.forEach((v2, i2) => {
							if(v2.parentId.includes(v.id)){
								v2.show = true
							}
						})
					}
				})
			},
			// 点击
			_treeItemTap(item, index) {
				let id = item.id;
				this.selectId = id
				this.$emit('select', item)
				if (item.lastRank === true) {
					//点击最后一级时触发事件
					// this.treeList[index].checked = !this.treeList[index].checked
					// this._fixMultiple(index)
					return;
				}
				let list = this.treeList;
				item.showChild = !item.showChild;
				item.open = item.showChild ? true : !item.open;
				list.forEach((childItem, i) => {
					if (item.showChild === false) {
						//隐藏所有子级
						if (!childItem.parentId.includes(id)) {
							return;
						}
						if (!this.foldAll) {
							if (childItem.lastRank !== true && !childItem.open) {
								childItem.showChild = false;
							}
							// 为隐藏的内容添加一个标记
							if (childItem.show) {
								childItem.hideArr[item.rank] = id
							}
						} else {
							if (childItem.lastRank !== true) {
								childItem.showChild = false;
							}
						}
						childItem.show = false;
					} else {
						// 打开子集
						if (childItem.parentId[childItem.parentId.length - 1] === id) {
							childItem.show = true;
						}
						// 打开被隐藏的子集
						if (childItem.parentId.includes(id) && !this.foldAll) {
							// console.log(childItem.hideArr)
							if (childItem.hideArr[item.rank] === id) {
								childItem.show = true;
								if (childItem.open && childItem.showChild) {
									childItem.showChild = true
								} else {
									childItem.showChild = false
								}
								childItem.hideArr[item.rank] = null
							}
							// console.log(childItem.hideArr)
						}
					}
				})
				// console.log(this.treeList)
			},
			_treeItemSelect(item, index) {
				this.treeList[index].checked = !this.treeList[index].checked
				this._fixMultiple(index)
			
				if (this.mode=='checkbox' && this.selectParent) {
					this._chenge(item, this.treeList[index].checked)
				}
				this.$nextTick(()=>{
					this._confirm()
				})
			},
			_chenge(e, e1) {
				this.idArr.push(e.id)
				if (e.source.children == undefined) {
					this.treeList.forEach((k, i) => {
						this.idArr.forEach((k1, i1) => {
							if (k.id == k1 && e1 == true) {
								this.treeList[i].checked = true
							} else if (k.id == k1 && e1 == false) {
								this.treeList[i].checked = false
							}
						})
					})
					if(this.checkStrictly){
						if (e.checked) {
							e.parentId.forEach((k, i) => {
								this.treeList.forEach((k1, i1) => {
									if (k1.id == k) {
										this.treeList[i1].checked = true
									}
								})
							})
						} else {
							e.parentId.forEach((k, i) => {
								this.treeList.forEach((k1, i1) => {
									if (k1.id == k) {
										this.treeList[i1].checked = false
									}
								})
							})
						}
						this.treeList.forEach((k1, i1) => {
							if (k1.checked) {
								k1.parentId.forEach((k2, i2) => {
									this.treeList.forEach((k3, i3) => {
										if (k3.id == k2) {
											this.treeList[i3].checked = true
										}
									})
								})
							}
						})
					}
					this.idArr = []
					return
				}
				this.handkeCheck1(e.source.children)
				this.treeList.forEach((k, i) => {
					this.idArr.forEach((k1, i1) => {
						if (k.id == k1 && e1 == true) {
							this.treeList[i].checked = true
						} else if (k.id == k1 && e1 == false) {
							this.treeList[i].checked = false
						}
					})
				})
				if(this.checkStrictly){
					if (e.checked) {
						e.parentId.forEach((k, i) => {
							this.treeList.forEach((k1, i1) => {
								if (k1.id == k) {
									this.treeList[i1].checked = true
								}
							})
						})
					} else {
						e.parentId.forEach((k, i) => {
							this.treeList.forEach((k1, i1) => {
								if (k1.id == k) {
									this.treeList[i1].checked = false
								}
							})
						})
					}
					this.treeList.forEach((k1, i1) => {
						if (k1.checked) {
							k1.parentId.forEach((k2, i2) => {
								this.treeList.forEach((k3, i3) => {
									if (k3.id == k2) {
										this.treeList[i3].checked = true
									}
								})
							})
						}
					})
				}
				this.idArr = []
			},
			handkeCheck1(list) {
				if(this.checkStrictly){
					list.forEach((k, i) => {
						this.idArr.push(k.id)
						if (k.children == undefined) return
						this.handkeCheck1(k.children)
					})
				}
			},

			handkeCheck(list, e, e1) {
				// 点击数据权限
				list.forEach((k, i) => {
					if (k.children != undefined) {
						if (k.id == e.id && e.checked == true) {
							k.checked = true
							this.handkeChecks(k.children, e, e1)
						} else if (k.id == e.id && e.checked == false) {
							k.checked = false
							this.handkeChecks(k.children, e, e1)
						} else {
							this.handkeCheck(k.children, e, e1)
						}
					} else {
						// console.log(1);
						if (k.id == e.id && e.checked == true) {
							k.checked = true
						} else if (k.id == e.id && e.checked == false) {
							k.checked = false
						}
					}
				})
			},
			handkeChecks(list, e, e1) {
				list.forEach((k, i) => {
					if (k.children != undefined) {
						if (e.checked) {
							k.checked = true
							this.handkeChecks(k.children, e, e1)
						} else {
							k.checked = false
							this.handkeChecks(k.children, e, e1)
						}
					} else {
						if (e.checked) {
							k.checked = true
						} else {
							k.checked = false
						}
					}
				})
			},
			// 处理单选多选
			_fixMultiple(index) {
				if (this.mode=='radio') {
					// 如果是单选
					this.treeList.forEach((v, i) => {
						if (i != index) {
							this.treeList[i].checked = false
						} else {
							this.treeList[i].checked = true
						}
					})
				}
			},
			// 重置数据
			_reTreeList() {
				this.treeList.forEach((v, i) => {
					this.treeList[i].checked = v.orChecked
				})
			},
			_initTree(list = this.list) {
				// console.log('接收值的事件');
				this.treeList = [];
				this._renderTreeList(list);
				this.$nextTick(() => {
					this._defaultSelect(list)
				})
			}
		},
		watch: {
			// 在select弹起的时候，重新初始化所有数据
			value: {
				immediate: true,
				handler(val) {
					this.selectValue = val||[];
				}
			},
			modelValue: {
				immediate: true,
				handler(val) {
					this.selectValue = val||[];
				}
			},
			list(list) {
				// console.log('监视值的改变1');
				this._initTree(list);
			},
			mode() {
				// console.log('监视值的改变2');
				if (this.list.length) {
					this._reTreeList();
				}
			},
			selectParent() {
				// console.log('监视值的改变3');
				if (this.list.length) {
					this._reTreeList();
				}
			},
			deep: true, // 深度监听
			immediate: true, // 初次监听即执行  
		},
		mounted() {
			this._initTree();
		}
	}
</script>

<style scoped>
	.diy-tree-view {
		background-color: #fff;
		padding-top: 20rpx;
		padding-right: 20rpx;
		padding-bottom: 20rpx;
		padding-left: 20rpx;
	}

	.diy-tree-view-sc {
		height: 100%;
		overflow: hidden;
	}

	.diy-tree-item {
		display: flex;
		justify-content: space-between;
		align-items: center;
		font-size: 26rpx;
		color: #757575;
		line-height: 1;
		height: 0;
		opacity: 0;
		transition: 0.2s;
		position: relative;
		overflow: hidden;
	}

	.diy-tree-item.show {
		height: 80rpx;
		opacity: 1;
	}

	.diy-tree-item.showchild:before {
		transform: rotate(-90deg);
	}

	.diy-tree-item.last:before {
		opacity: 0;
	}

	.diy-tree-icon {
		width: 26rpx;
		height: 26rpx;
		margin-right: 8rpx;
		display: flex;
		align-items: center;
		justify-content: center;
	}
	
	.diy-icon-triangledownfill{
		font-size:36rpx;
	}
	.roate{
		 transform: rotate(-90deg);
	}
   
	.diy-tree-label {
		flex: 1;
		display: flex;
		align-items: center;
		height: 100%;
		line-height: 1.2;
	}

	.selected {
		background-color: #f5f5f5;
	}

	.diy-tree-check {
		width: 40px;
		height: 40px;
		display: flex;
		justify-content: center;
		align-items: center;
	}

	.diy-tree-check-yes,
	.diy-tree-check-no {
		width: 20px;
		height: 20px;
		border-top-left-radius: 20%;
		border-top-right-radius: 20%;
		border-bottom-right-radius: 20%;
		border-bottom-left-radius: 20%;
		border-top-width: 1rpx;
		border-left-width: 1rpx;
		border-bottom-width: 1rpx;
		border-right-width: 1rpx;
		border-style: solid;
		border-color: #07bb07;
		display: flex;
		justify-content: center;
		align-items: center;
		box-sizing: border-box;
	}

	.diy-tree-check-yes-b {
		width: 12px;
		height: 12px;
		border-top-left-radius: 20%;
		border-top-right-radius: 20%;
		border-bottom-right-radius: 20%;
		border-bottom-left-radius: 20%;
		background-color: #07bb07;
	}

	.diy-tree-check .radio {
		border-top-left-radius: 50%;
		border-top-right-radius: 50%;
		border-bottom-right-radius: 50%;
		border-bottom-left-radius: 50%;
	}

	.diy-tree-check .radio .diy-tree-check-yes-b {
		border-top-left-radius: 50%;
		border-top-right-radius: 50%;
		border-bottom-right-radius: 50%;
		border-bottom-left-radius: 50%;
	}
</style>
