# jweixin-module

微信JS-SDK

## 安装

### NPM

```shell
npm install jweixin-module --save
```

### UMD

```http
https://unpkg.com/jweixin-module/lib/index.js
```

## VUE2使用

```js
import * as jweixin from './uni_modules/jweixin-module'
import jwx from '@/common/Wechat.js'	

Vue.prototype.$jwx = jwx
```


## VUE3使用

```js
import * as jweixin from './uni_modules/jweixin-module'
import jwx from '@/common/Wechat.js'	

app.config.globalProperties.$jwx = jwx
```

## 完整API

>[微信JS-SDK说明文档](https://mp.weixin.qq.com/wiki?t=resource/res_main&id=mp1421141115)
