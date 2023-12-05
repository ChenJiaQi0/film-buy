let uploadConfig = {
	accept: 'image',
	capture: () => ['album', 'camera'],
	compressed: true,
	camera: 'back',
	maxDuration: 60,
	uploadIcon: 'camera-fill',
	uploadIconColor: '#D3D4D6',
	useBeforeRead: false,
	previewFullImage: true,
	maxCount: 52,
	disabled: false,
	imageMode: 'aspectFill',
	name: '',
	sizeType: () => ['original', 'compressed'],
	multiple: true,
	deletable: true,
	maxSize: Number.MAX_VALUE,
	fileList: () => [],
	uploadText: '',
	width: 200,
	height: 200,
	extension:'',
	previewImage: true
}
	
export default {
    props: {
		// 每个组件都有的父组件传递的样式，可以为字符串或者对象形式
		customStyle: {
		    type: [Object, String],
		    default: () => ({})
		},
		customClass: {
		    type: String,
		    default: ''
		},
        // 接受的文件类型, 可选值为all media image file video
        accept: {
            type: String,
            default: uploadConfig.accept
        },
		// 文件后缀类型
		extension:{
			type: String,
			default: uploadConfig.extension
		},
        // 	图片或视频拾取模式，当accept为image类型时设置capture可选额外camera可以直接调起摄像头
        capture: {
            type: [String, Array],
            default: uploadConfig.capture
        },
		
        // 当accept为video时生效，是否压缩视频，默认为true
        compressed: {
            type: Boolean,
            default: uploadConfig.compressed
        },
        // 当accept为video时生效，可选值为back或front
        camera: {
            type: String,
            default: uploadConfig.camera
        },
        // 当accept为video时生效，拍摄视频最长拍摄时间，单位秒
        maxDuration: {
            type: Number,
            default: uploadConfig.maxDuration
        },
        // 上传区域的图标，只能内置图标
        uploadIcon: {
            type: String,
            default: uploadConfig.uploadIcon
        },
        // 上传区域的图标的颜色，默认
        uploadIconColor: {
            type: String,
            default: uploadConfig.uploadIconColor
        },
        // 是否开启文件读取前事件
        useBeforeRead: {
            type: Boolean,
            default: uploadConfig.useBeforeRead
        },
        // 读取后的处理函数
        afterRead: {
            type: Function,
            default: null
        },
        // 读取前的处理函数
        beforeRead: {
            type: Function,
            default: null
        },
        // 是否显示组件自带的图片预览功能
        previewFullImage: {
            type: Boolean,
            default: uploadConfig.previewFullImage
        },
        // 最大上传数量
        maxCount: {
            type: [String, Number],
            default: uploadConfig.maxCount
        },
        // 是否启用
        disabled: {
            type: Boolean,
            default: uploadConfig.disabled
        },
        // 预览上传的图片时的裁剪模式，和image组件mode属性一致
        imageMode: {
            type: String,
            default: uploadConfig.imageMode
        },
        // 标识符，可以在回调函数的第二项参数中获取
        name: {
            type: String,
            default: uploadConfig.name
        },
        // 所选的图片的尺寸, 可选值为original compressed
        sizeType: {
            type: Array,
            default: uploadConfig.sizeType
        },
        // 是否开启图片多选，部分安卓机型不支持
        multiple: {
            type: Boolean,
            default: uploadConfig.multiple
        },
        // 是否展示删除按钮
        deletable: {
            type: Boolean,
            default: uploadConfig.deletable
        },
        // 文件大小限制，单位为byte
        maxSize: {
            type: [String, Number],
            default: uploadConfig.maxSize
        },
        // 显示已上传的文件列表
        fileList: {
            type: Array,
            default: uploadConfig.fileList
        },
        // 上传区域的提示文字
        uploadText: {
            type: String,
            default: uploadConfig.uploadText
        },
        // 内部预览图片区域和选择图片按钮的区域宽度
        width: {
            type: [String, Number],
            default: uploadConfig.width
        },
        // 内部预览图片区域和选择图片按钮的区域高度
        height: {
            type: [String, Number],
            default: uploadConfig.height
        },
        // 是否在上传完成后展示预览图
        previewImage: {
            type: Boolean,
            default: uploadConfig.previewImage
        },
		action: {
			type: String,
			default: ""
		},
    }
}
