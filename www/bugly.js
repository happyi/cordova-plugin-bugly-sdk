var exec = require('cordova/exec');

exports.initSDK = function(success, error, arg0) {
    exec(success, error, "Bugly", "initSDK", [arg0]);
};
