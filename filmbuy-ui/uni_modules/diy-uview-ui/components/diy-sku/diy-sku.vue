<template>
	<u-popup v-model="popupValue" :popup="false" @close="close"  mode="bottom">
		<view class="diy-sku">
			<view class="diy-sku__body flex flex-direction-column">
				<view class="flex margin-bottom-md flex-direction-row">
					<u-image width="200rpx" class="margin-right-md" height="200rpx" v-if="thumb||(selectedObj && selectedObj.thumb)"  :src="selectedObj&&selectedObj.thumb?selectedObj.thumb:thumb"></u-image>
					<view class="flex  flex-sub justify-between flex-direction-column">
						<view class="text-bold  align-baseline flex-direction-row">
							<text  :style="{color:priceColor}" class="diygw-text-md">¥</text>
							<text  :style="{color:priceColor}" class="diygw-text-lg margin-right-xs">{{selectedObj?selectedObj.price:price}}</text>
							<text  :style="{color:remarkColor}" class="diygw-text-md line-price" v-if="(selectedObj&&selectedObj.linePrice)||linePrice">¥{{selectedObj?selectedObj.linePrice:linePrice}}</text>
						</view>
						<view :style="{color:remarkColor}">
							<text>库存：{{selectedObj?selectedObj.amount:totalAmount}}</text>
						</view>

						<view v-if="specSelected">
							<text  :style="{color:remarkColor}">已选：</text>
							<template v-for="(selectValue,selectIndex) in selectedSpecIndexList">
								<template v-for="(item, index) in mSpecList[selectIndex][specListKey]">
									<text :style="{color:priceColor}" class="margin-right-xs" v-if="selectValue==index">
										{{item.title}}
									</text>
								</template>
							</template>
						</view>
					</view>
				</view>
				<view>
					<slot name="sku" v-for="(specMap, row) in mSpecList" :row="row" :specMap="specMap" :disable="disable"
						:active="specMap.active"></slot>
				</view>
				<view v-if="isStep"  class="diy-sku-step flex justify-between">
					<text class="diygw-text-md">数量</text>
					<u-number-box :input-width="100" :size="stepSize" :min="minBuyNum" :max="maxBuyNum" v-model="stepNum" :color="stepColor"  :bgColor="stepBgColor" :input-height="60"></u-number-box>
				</view>
				<view  v-if="isAddCart||isBuyNow"  class="flex diygw-col-24">
					<button @tap="addCart" v-if="isAddCart" :style="{background:addCartBackground,color:addCartColor}" class="diygw-btn   radius flex-sub margin-xs">{{addCartText}}</button>
					<button @tap="buyNow"  v-if="isBuyNow" :style="{background:buyNowBackground,color:buyNowColor}" :class="buyNowBackground" class="diygw-btn   radius flex-sub margin-xs">{{buyNowText}}</button>
				</view>
			</view>
		</view>
	</u-popup>
</template>

<script>
	/**
	 * sku主组建
	 */
	export default {
		title: "diy-sku",
		props: {
			// 通过双向绑定控制组件的弹出与收起
			value: {
				type: Boolean,
				default: false
			},
			modelValue: {
				type: Boolean,
				default: false
			},
			isPopup: {
				type: Boolean,
				default: true
			},
			// 弹出的z-index值
			zIndex: {
				type: [String, Number],
				default: 0
			},
			safeAreaInsetBottom: {
				type: Boolean,
				default: false
			},
			// 是否允许通过点击遮罩关闭Picker
			maskCloseAble: {
				type: Boolean,
				default: true
			},
			thumb:{
				type: String,
				default: ''
			},
			priceColor: {
				type: String,
				default: '#19be6b'
			},
			remarkColor:{
				type: String,
				default: '#959495'
			},
			price:{
				type: [String, Number],
				default: 0
			},
			linePrice:{
				type: [String, Number],
				default: 0
			},
			isStep:{
				type: Boolean,
				default: true
			},
			minBuyNum:{
				type: Number,
				default: 1
			},
			maxBuyNum:{
				type: Number,
				default: 100000
			},
			stepBgColor:{
				type: String,
				default: "#F2F3F5"
			},
			stepColor:{
				type: String,
				default: "#323233"
			},
			stepSize:{
				type: [Number, String],
				default: 28
			},
			isBuyNow:{
				type: Boolean,
				default: true
			},
			// 立即购买按钮的文字
			buyNowText: {
				type: String,
				default: '立即购买'
			},
			// 立即购买按钮的字体颜色
			buyNowColor: {
				type: String,
				default: '#ffffff'
			},
			// 立即购买按钮的背景颜色
			buyNowBackground: {
				type: String,
				default:'#e52c2c'
			},
			isAddCart:{
				type: Boolean,
				default: true
			},
			// 加入购物车按钮的文字
			addCartText: {
				type: String,
				default: '加入购物车'
			},
			// 立即购买按钮的字体颜色
			addCartColor: {
				type: String,
				default: '#ffffff'
			},
			// 立即购买按钮的背景颜色
			addCartBackground: {
				type: String,
				default:'#fbbd08'
			},
			/**
			 * 属性Map列表
			 */
			specList: {
				type: Array,
				default: []
			},
			/**
			 * sku列表
			 */
			skuList: {
				type: Array,
				default: []
			},
			/**
			 * 是否禁止选择
			 */
			disable: {
				type: Boolean,
				default: false
			},
			/**
			 * 默认选中
			 */
			selectedIndex: {
				type: Number,
				default: 0
			},
			/**
			 * 属性项列表的key
			 */
			specListKey: {
				type: String,
				default: 'datas'
			},
			/**
			 * sku的属性Id集的key
			 */
			specIdsKey: {
				type: String,
				default: 'specIds'
			},
			/**
			 * sku属性集的分隔符
			 */
			separator: {
				type: String,
				default: ','
			},
			/**
			 * 单个属性项的正则匹配值，也是默认的代替值。这里使用specId来验证，不同的规则可以自己定义，可以为中文等等。
			 */
			specPattern: {
				type: String,
				default: '[0-9]*'
			},			
			errorTip:{
				type: String,
				default: '请选择规格'
			},
			
		},
		computed: {
			uZIndex() {
				// 如果用户有传递z-index值，优先使用
				return this.zIndex ? this.zIndex : this.$u.zIndex.popup;
			},
			/**
			 * 是否需要做sku可选判断,如果sku数量全满,则没必要做判断
			 * @returns {boolean}
			 */
			skuCheckStatus() {
				return (this.specList.length <= 0 ? 0 : this.specList.map(item => item[this.specListKey].length ?? 0)
					.reduce((a, b) => a * b)) === (this.skuList.length ?? 0);
			},
			/**
			 * 已选中的序号列表
			 * @returns {(number|boolean|default.watch.active|boolean|ServiceWorker|*)[]}
			 */
			selectedSpecIndexList() {
				return this.mSpecList.map(item => item.active);
			},
			/**
			 * 是否已经有选择
			 * @returns {*}
			 */
			specSelected() {
				return this.selectedSpecIndexList.some(active => active > -1);
			},
			/**
			 * 是否已经全部选择
			 * @returns {*}
			 */
			specAllSelected() {
				return this.selectedSpecIndexList.every(active => active > -1);
			}
		},
		data() {
			return {
				popupValue: false,
				stepNum: this.minBuyNum|| 1, // 选中数量
				mSpecList: [],
				selected: -1,
				stepTotal:1,
				totalAmount:0,
				selectedObj:null
			};
		},
		watch: {
			// 在select弹起的时候，重新初始化所有数据
			value: {
				immediate: true,
				handler(val) {
					this.popupValue = val;
				}
			},
			modelValue: {
				immediate: true,
				handler(val) {
					this.popupValue = val;
				}
			},
			specList:{
				immediate: true,
				deep:true,
				handler(newValue) {
					this.init(newValue);
				}
			},
			skuList:{
				immediate: true,
				deep:true,
				handler(newValue) {
					this.initSku(newValue);
					setTimeout(()=>{
						this.selectedSku(this.selectedIndex);
					},100)
				}
			},
			selectedSpecIndexList(newValue) {
				this.updateSpecListDisable();
			},
			selected(newValue){
				this.selectedObj = this.skuList[this.selected] ?? null
				this.$emit('selectedSkuObj', this.skuList[this.selected] ?? null);
			},
			specAllSelected(newValue) {
				if (newValue) {
					this.selectedSku();
					this.$emit('selectedSkuObj', this.skuList[this.selected]);
				} else {
					this.selected = -1;
				}
				
				this.$emit('getSelectedIndex', this.selected);
				this.$emit('getSelectedSkuObj', this.skuList[this.selected] ?? null);
			}
		},
		mounted() {
			// this.initSku(this.skuList);
			// this.init(this.specList);
			// this.selectedSku(this.selectedIndex);
			uni.$on("updateSkuSpecItemActive", e => this.updateItemActive(e));
		},
		beforeDestroy() {
			// 清除监听
			uni.$off('updateSkuSpecItemActive');
		},
		methods: {
			//点击取消按钮触发
			close() {
				this.$emit("update:modelValue", false);
				this.$emit('close')
			},
			initSku(skuList){
				let updateSkuList = JSON.parse(JSON.stringify(skuList));
				let total = 0
				for (let item of updateSkuList) {
					 total = total+ parseFloat(item.amount)
				}
				this.totalAmount = total;
			},
			/**
			 * 初始化 active状态 disable状态
			 * @param specList
			 */
			init(specList) {
				let updateSpecList = JSON.parse(JSON.stringify(specList));

				for (let spec of updateSpecList) {
					//添加active状态
					spec.active = -1;
					for (let specItem of spec[this.specListKey]) {
						//添加disable状态
						spec.disable = false;
					}
				}

				this.mSpecList = updateSpecList;
			},
			/**
			 * 获取单个选中属性值对应的sku属性id集合
			 * @param selectedSpecIndexList
			 * @returns {*}
			 */
			getSelectedSpecIds(selectedSpecIndexList) {
				return selectedSpecIndexList.map((active, row) => active > -1 ? this.mSpecList[row][this.specListKey][
					active
				].id : this.specPattern).join(this.separator)
			},
			/**
			 * 检测一个规格属性值是否禁止
			 * @param row
			 * @param active
			 * @returns {boolean}
			 */
			checkSpecItemDisable(row, active) {
				if (this.skuCheckStatus) {
					return false;
				}

				let selectedSpecIndexList = JSON.parse(JSON.stringify(this.selectedSpecIndexList));

				selectedSpecIndexList[row] = active;

				let skuPattern = this.getSelectedSpecIds(selectedSpecIndexList),
					skuReg = new RegExp(skuPattern),
					able = this.skuList.some(item => skuReg.test(item[this.specIdsKey]));

				return !able;
			},
			/**
			 * 更新规格禁止状态
			 */
			updateSpecListDisable() {
				let that = this,
					index;
				this.mSpecList.map((specMap, row) => {
					for (index in specMap[that.specListKey]) {
						this.$set(specMap[that.specListKey][index], 'disable', that.checkSpecItemDisable(row,
							index)); //优化点击事件不更新
					}
				})
				let specIds = this.getSelectedSpecIds(this.selectedSpecIndexList);
				for (let index in this.skuList) {
					if (specIds == this.skuList[index][this.specIdsKey]) {
						this.selected = index;
						break;
					}
				}
			},
			/**
			 * 选中一个sku
			 * @param skuIndex
			 */
			selectedSku(skuIndex = -1) {
				if (this.skuList.length > 0) {
					if (skuIndex > -1 && skuIndex < this.skuList.length) {
						//主动选择
						if (this.skuList.length > skuIndex) {
							let specIds = this.skuList[skuIndex][this.specIdsKey];
							specIds.split(this.separator).map((specId, row) => {
								if(this.mSpecList[row][this.specListKey]){
									for (let index in this.mSpecList[row][this.specListKey]) {
										if (this.mSpecList[row][this.specListKey][index] && this.mSpecList[row][this.specListKey][index].id == specId) {
											this.mSpecList[row].active = index
											break;
										}
									}
								}
								
							})
						}
					} else {
						//被动选择
						let specIds = this.getSelectedSpecIds(this.selectedSpecIndexList);
						for (let index in this.skuList) {
							if (specIds == this.skuList[index][this.specIdsKey]) {
								this.selected = index;
								break;
							}
						}
					}
				}
			},
			/**
			 * 事件回调
			 * @param e
			 */
			updateItemActive(e) {
				if (!this.disable) {
					let row = e.row ?? 0;
					if(this.mSpecList[row]){
						this.mSpecList[row].active = e.index ?? -1
					}
				}
			},
			/**
			 * 获取当前选中sku序号,未选中为-1
			 * @returns {number}
			 */
			getSelectedIndex() {
				return this.selected;
			},
			/**
			 * 获取当前选中sku对象,未选中为null
			 * @returns {*|null}
			 */
			getSelectedSkuObj() {
				return this.skuList[this.selected] ?? null;
			},
			//提交触发
			buyNow() {
				if(this.selectedObj){
					this.selectedObj.buyNum = this.stepNum
					this.$emit('buyNow', this.selectedObj)
					this.$emit("update:modelValue", false);
					this.$emit('close')
				}else{
					uni.$u.toast(this.errorTip)
					return;
				}
			},
			addCart(){
				if(this.selectedObj){
					this.selectedObj.buyNum = this.stepNum
					this.$emit('addCart', this.selectedObj)
					this.$emit("update:modelValue", false);
					this.$emit('close')
				}else{
					uni.$u.toast(this.errorTip)
					return;
				}
			}
		}
	}
</script>

<style lang="scss">
	.diy-sku {
		width: 100%;
		overflow: hidden;
		background-color: #fff;
		padding: 20rpx;
		.diy-sku-step{
			padding:0 24rpx 24rpx;
		}
		.diygw-btn{
			font-size: 32rpx;
			height: inherit;
			padding:24rpx 0;
		}
		.line-price{
			text-decoration:line-through
		}
	}
</style>
