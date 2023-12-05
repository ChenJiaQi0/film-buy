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
				<view class="td td1 flex  justify-center align-center" @click="change(rowitem[valueName],colitem[valueName])"
					v-for="(colitem, colindex) in columns">
					<text class="diy-icon-radioboxfill" :style="getStyle(rowitem[valueName],colitem[valueName])"></text>
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
			initRate: {
				type: Number,
				default: 0
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
		mounted() {
			let parent = this.$u.$parent.call(this, 'u-form');
			if (parent) {
				Object.keys(this.uForm).map(key => {
					this.uForm[key] = parent[key];
				});
			}
		},
		methods: {
			getStyle(row, col) {
				let style = {
					fontSize: this.iconSize
				}
				const values = this.valueCom
				let rowItem = values.find(item => {
					return item['row'] == row
				})
				if (rowItem && col == rowItem['col']) {
					style['color'] = this.selectIconColor
				} else {
					style['color'] = this.iconColor
				}
				return style;
			},
			change(row, col) {
				const values = JSON.parse(JSON.stringify(this.valueCom))
				let index = values.findIndex(item => {
					return item['row'] == row
				})
				if (index >= 0) {
					let rowItem = values[index]
					if (rowItem.col == col) {
						values.splice(index, 1)
					} else {
						rowItem.col = col
					}
				} else {
					let rowItem = {
						row,
						col
					}
					values.push(rowItem);
				}
				console.log(values)
				this.$emit("update:modelValue", values);
				this.$emit("change", values);
				this.dispatch("u-form-item", "onFieldChange", values);
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