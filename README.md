## 项目说明	

腾讯[Buyly SDK](https://bugly.qq.com/)的Cordova插件。



## 安装

```shell
cordova plugin add cordova-plugin-mz-bugly-sdk
```

## 调用

**初始化SDK**


```javascript
var args = {
    // 通用配置
    debug:true,
    ios_appId:"",
    //是否开启卡顿检测
    block_monitor_enable:true
};

window.bugly.initSDK(function(success){
	console.log("初始化成功");
},function(err){
   console.log("初始化失败");
   console.log(err);
},args);

window.bugly.setUserId(function(success){
    console.log("设置成功");
},function(err){
    console.log("设置失败");
    console.log(err);
},{{userId}});


window.bugly.setUserValue(function(success){
    console.log("设置成功");
},function(err){
    console.log("设置失败");
    console.log(err);
},{
    userName:"{{userName}}",
    nickName:"{{nickName}}",
});

```
## 发布
npm publish --registry=https://registry.npmjs.org/
