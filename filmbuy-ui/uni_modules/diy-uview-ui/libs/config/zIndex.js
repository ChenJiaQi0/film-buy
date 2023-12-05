// uniapp在H5中各API的z-index值如下：
/**
 * actionsheet: 999
 * modal: 999
 * navigate: 998
 * tabbar: 998
 * toast: 999
 */

export default {
	toast: 1000090,
	noNetwork: 1000080,
	// popup包含popup，actionsheet，keyboard，picker的值
	popup: 1000075,
	mask: 1000070,
	navbar: 1000020,
	topTips: 1000015,
	sticky: 1000010,
	indexListSticky: 1000005,
}