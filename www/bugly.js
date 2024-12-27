var exec = require('cordova/exec');


var Bugly = {

    initSDK: function (success, error, arg0) {
        exec(success, error, "Bugly", "initSDK", [arg0]);
    },
    setUserId:function(onSuccess, onError,arg0){
        exec(onSuccess, onError, "Bugly", "setUserId",[arg0]);
    },
    setUserValue:function(onSuccess, onError,arg0){
        exec(onSuccess, onError, "Bugly", "setUserValue",[arg0]);
    }
};
module.exports = Bugly;
