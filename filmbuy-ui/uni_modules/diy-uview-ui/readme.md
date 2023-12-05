# diy-uview-ui

## 🌈 介绍 `diy-uview-ui` 与 `uview-ui` 的关系？

`diy-uview-ui` 是基于 `vk-uview-ui`、`uview-ui 1.8.3` 版本改造而来，其本质依然还是 `uview-ui`，是 `DIY` 的珍藏版，由 `DIY` 维护。

> 在这里，也感谢 `vk-uview-ui`、`uview-ui 1.8.3` 作者的开源奉献，再次为开源点赞。 同时 `diy-uview-ui` 也是无条件开源。

## `diy-uview-ui` 与 `uview-ui 1.8.3` 功能上有什么区别？

-   1、最大的亮点：同时支持 `Vue3.0` 和 `Vue2.0`，你没看错，现在 `uview-ui` 支持 `Vue3.0` 了（这应该是目前为数不多的 `uniapp Vue3.0` 组件库）（2021-11-18）
-   2、以 `uni_modules` 模块形式发布，方便一键更新（同时组件会自动按需加载，无需手动写 `easycom` 规则（注意，你需要把之前写的 `easycom` 规则删除，在项目根目录的 `pages.json` 中删除）
-   3、删除了 `uview-ui` 内置的 `国际化语言` 功能，（改造成 `Vue3` 比较麻烦，故作者干脆直接删除了）
-   4、增加手写签名、二维码条码扫码输入、气泡弹窗、分页、下拉多选选择、分页、新闻跑马灯等组件。

**_目前大的问题应该没有了，作者自己的项目也是用此组件库开发，因此你无需担心后期无人维护。_**

如果你了解了以上须知，那么请继续阅读快速上手。

## ⚡ 快速上手之 Vue2.0

即使是 `Vue2` 版本，同样比原版 `uView1.0` 做了一些优化，如（车牌号键盘点击 1 次中文后会自动切英文，倒计时支持毫秒等等）

支持：H5、App(vue)、微信小程序、支付宝小程序（其他小程序未测试）

-   1、main.js 引入 diy-uview-ui

```js
import uView from './uni_modules/diy-uview-ui';
Vue.use(uView);
```

-   2、App.vue 引入基础样式（注意 style 标签需声明 scss 属性支持）

```html
<style lang="scss">
    @import './uni_modules/diy-uview-ui/index.scss';
</style>
```

-   3、uni.scss 引入全局 scss 变量文件

```css
@import '@/uni_modules/diy-uview-ui/theme.scss';
```

## ⚡ 快速上手之 Vue3.0

不建议把老项目 升级到 Vue3.0 (升级非常麻烦，建议新项目才考虑是否使用 Vue3.0)

支持：H5、App(vue)、微信小程序（其他小程序未测试）

目前 发现 Vue3 H5 版本一个重大 bug（与此 UI 框架无关），调试开发没问题，发布到前端托管时样式会错乱，已确定是 HBX 的问题，等待 HBX 修复此问题。（hbx3.3.0 版本已修复此问题）

-   1、前置步骤：修改 `manifest.json` 内的 `vue` 版本为 `vue3`
-   2、项目根目录新增 `index.html` 文件，文件代码为

```html
<!DOCTYPE html>
<html lang="zh-CN">
    <head>
        <meta charset="UTF-8" />
        <meta
            name="viewport"
            content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0"
        />
        <title></title>
        <!--preload-links-->
        <!--app-context-->
        <!-- 配置H5的 web图标static/logo.png -->
        <link rel="icon" href="./static/logo.png" />
    </head>
    <body>
        <div id="app">
            <!--app-html-->
        </div>
        <script type="module" src="/main.js"></script>
    </body>
</html>
```

-   3、main.js 引入 diy-uview-ui

```js
// 引入 uView UI
import uView from './uni_modules/diy-uview-ui';

import { createSSRApp } from 'vue';

export function createApp() {
    const app = createSSRApp(App);

    // 使用 uView UI
    app.use(uView);

    return { app };
}
```

-   4、App.vue 引入基础样式（注意 style 标签需声明 scss 属性支持）

```html
<style lang="scss">
    @import './uni_modules/diy-uview-ui/index.scss';
</style>
```

-   5、uni.scss 引入全局 scss 变量文件

```css
@import '@/uni_modules/diy-uview-ui/theme.scss';
```
