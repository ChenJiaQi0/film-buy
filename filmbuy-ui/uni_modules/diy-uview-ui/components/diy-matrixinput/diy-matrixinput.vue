<template>
	<view style="width: 100%;overflow: hidden;">
		<view class="flex-sub flex-table flex  flex-direction-column"
			:style="{ '--table-border-color': tableBorderColor }">
			<view class="flex  items-stretch">
				<view class="td td0 justify-center align-center"></view>
				<view class="td td1 justify-center align-center" v-for="(item, index) in columns">
					{{ item[labelName]}}
				</view>
			</view>
			<view class="flex items-stretch" v-for="(rowitem, rowindex) in rows">
				<view class="td td0 flex justify-center align-center">{{ rowitem[labelName] }}</view>
				<view class="td td1 flex justify-center align-center" @click="change(rowitem[valueName],colitem[valueName])"
					v-for="(colitem, colindex) in columns">
					<u-input :placeholder="placeholder"  v-model="values[rowitem[valueName]+'_'+colitem[valueName]]" :disabled="disabled" clearable></u-input>
				</view>
			</view>
		</view>
	</view>
</template>

<script>
	import Emitter from "../../libs/util/emitter.js";

	export default {
		mixins: [Emitter],
		emits: ["update:modelValue", "change"],
		props: {
			// 通过双向绑定控制组件的弹出与收起
			// 绑定的值
			value: {
				type: Array,
				default: []
			},
			// 通过双向绑定控制组件的弹出与收起
			// 绑定的值
			modelValue: {
				type: Array,
				default: []
			},
			tableBorderColor: {
				type: String,
				default: '#ebeef5',
			},
			icon: {
				type: String,
				default: 'diy-icon-starfill'
			},
			iconColor: {
				type: String,
				default: '#eee'
			},
			selectIconColor: {
				type: String,
				default: '#07c160'
			},
			placeholder: {
				type: String,
				default: "请输入内容"
			},
			iconSize: {
				type: String,
				default: '24px'
			},
			disabled: {
				type: Boolean,
				default: false
			},
			// 自定义value属性名
			valueName: {
				type: String,
				default: 'value'
			},
			// 自定义label属性名
			labelName: {
				type: String,
				default: 'label'
			},
			// 行数据
			rows: {
				type: Array,
				default () {
					return [{
							value: '1',
							label: "矩阵行一"
						},
						{
							value: '2',
							label: "矩阵行二"
						},
						{
							value: '3',
							label: "矩阵行三"
						},
					];
				}
			},
			// 列数据
			columns: {
				type: Array,
				default () {
					return [{
							value: '1',
							label: "矩阵列一"
						},
						{
							value: '2',
							label: "矩阵列二"
						},
						{
							value: '3',
							label: "矩阵列三"
						}
					];
				}
			},
		},
		data() {
			return {
				values: {},
				uForm: {
					inputAlign: "",
					clearable: ""
				}
			};
		},
		computed: {
			valueCom() {
				// #ifndef VUE3
				return this.value;
				// #endif

				// #ifdef VUE3
				return this.modelValue;
				// #endif
			}
		},
		watch: {
			// valueCom(nVal, oVal) {
			// 	if (nVal != oVal) {
			// 		this.initValues()
			// 	}
			// },
			// 监听lists的变化，发出事件
			values: {
				deep: true,
				immediate:true,
				handler(n) {
					let result = []
					this.rows.forEach(row => {
						this.columns.forEach(column => {
							let key = row[this.valueName]+"_"+column[this.valueName]
							let item={
								row:row[this.valueName],
								col:column[this.valueName],
							}
							if(n[key]){
								item['value'] = n[key];
								result.push(item);
							}
						})
					})
					setTimeout(() => {
						// 将当前的值发送到 u-form-item 进行校验
						this.$emit("update:modelValue", result);
						this.$emit("change", result);
						this.dispatch("u-form-item", "onFieldChange", result);
					}, 40);
				}
			}
		},
		mounted() {
			let parent = this.$u.$parent.call(this, 'u-form');
			if (parent) {
				Object.keys(this.uForm).map(key => {
					this.uForm[key] = parent[key];
				});
			}
			this.initValues()
		},
		methods: {
			initValues() {
				let initValue = this.valueCom
				let values = {}
				this.rows.forEach(row => {
					this.columns.forEach(column => {
						let find = initValue.find(item => {
							return item.row == row[this.valueName] && item.col == column[this.valueName]
						})
						let key = row[this.valueName]+"_"+column[this.valueName]
						if(find){
							values[key]=find['value']
						}else{
							values[key]=''
						}
					})
				})
				this.values = values
			},
			getStyle(rowIndex, colIndex) {
				let style = {
					fontSize: this.iconSize
				}
				const values = this.valueCom
				let row = values.find(item => {
					return item['rowIndex'] == rowIndex
				})
				if (row && row['colIndexs'].includes(colIndex)) {
					style['color'] = this.selectIconColor
				} else {
					style['color'] = this.iconColor
				}
				return style;
			}
		}
	};
</script>
<style scoped lang="scss">
	.flex-table {
		--table-border-color: #ebeef5;
		border-top: 1px solid var(--table-border-color);
		border-left: 1px solid var(--table-border-color);


		.td {
			border-bottom: 1px solid var(--table-border-color);
			border-right: 1px solid var(--table-border-color);
			text-align: center;
			padding: 5px;
			min-height: 60rpx;
			line-height: 60rpx;
		}

		.td0 {
			min-width: 80px;
			flex: 1
		}

		.td1 {
			flex: 1
		}
	}
</style>