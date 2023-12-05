let checkboxGroup={
	name: '',
	value: () => [],
	shape: 'square',
	disabled: false,
	activeColor: '#2979ff',
	inactiveColor: '#c8c9cc',
	size: 18,
	placement: 'row',
	labelSize: '',
	labelColor: '#303133',
	labelDisabled: false,
	iconColor: '#ffffff',
	iconSize: 18,
	iconPlacement: 'left',
	borderBottom: false
}
export default {
	props: {
		// 标识符
		name: {
			type: String,
			default: checkboxGroup.name
		},
		// 绑定的值
		value: {
			type: Array,
			default: checkboxGroup.value
		},
		modelValue:{
			type: Array,
			default: checkboxGroup.value
		},
		// 形状，circle-圆形，square-方形
		shape: {
			type: String,
			default: checkboxGroup.shape
		},
		// 是否禁用全部checkbox
		disabled: {
			type: Boolean,
			default: checkboxGroup.disabled
		},
        // 每个组件都有的父组件传递的样式，可以为字符串或者对象形式
		customStyle: {
			type: [Object, String],
			default: () => ({})
		},
		customClass: {
			type: String,
			default: ''
		},
		wrapClass:{
			type: String,
			default: ''
		},
		// 选中状态下的颜色，如设置此值，将会覆盖parent的activeColor值
		activeColor: {
			type: String,
			default: checkboxGroup.activeColor
		},
		// 未选中的颜色
		inactiveColor: {
			type: String,
			default: checkboxGroup.inactiveColor
		},

		// 整个组件的尺寸，默认px
		size: {
			type: [String, Number],
			default: checkboxGroup.size
		},
		// 布局方式，row-横向，column-纵向
		placement: {
			type: String,
			default: checkboxGroup.placement
		},
		// label的字体大小，px单位
		labelSize: {
			type: [String, Number],
			default: checkboxGroup.labelSize
		},
		// label的字体颜色
		labelColor: {
			type: [String],
			default: checkboxGroup.labelColor
		},
		// 是否禁止点击文本操作
		labelDisabled: {
			type: Boolean,
			default: checkboxGroup.labelDisabled
		},
		// 图标颜色
		iconColor: {
			type: String,
			default: checkboxGroup.iconColor
		},
		// 图标的大小，单位px
		iconSize: {
			type: [String, Number],
			default: checkboxGroup.iconSize
		},
		// 勾选图标的对齐方式，left-左边，right-右边
		iconPlacement: {
			type: String,
			default: checkboxGroup.iconPlacement
		},
		// 竖向配列时，是否显示下划线
		borderBottom: {
			type: Boolean,
			default: checkboxGroup.borderBottom
		}

	}
}