
(function($, owner) {

	/**
	 * 用户输入验证
	 **/
	owner.check = function(regInfo, callback) {
		callback = callback || $.noop;
		regInfo = regInfo || {};
		regInfo.account = regInfo.account || '';
		regInfo.password = regInfo.password || '';
		if (regInfo.account.length < 5) {
			callback('用户名最短需要 5 个字符');
			return false;
		}
		if (regInfo.password.length < 6) {
			callback('密码最短需要 6 个字符');
			return false;
		}
		return true;
	};

	/**
	 * 获取当前状态
	 **/
	owner.getState = function() {
		var stateText = localStorage.getItem('$state') || "{}";
		return JSON.parse(stateText);
	};

	/**
	 * 设置当前状态
	 **/
	owner.setState = function(state) {
		state = state || {};
		localStorage.setItem('$state', JSON.stringify(state));
		//var settings = owner.getSettings();
		//settings.gestures = '';
		//owner.setSettings(settings);
	};

	var checkEmail = function(email) {
		email = email || '';
		return (email.length > 3 && email.indexOf('@') > -1);
	};

	/**
	 * 获取应用本地配置
	 **/
	owner.setSettings = function(settings) {
		settings = settings || {};
		localStorage.setItem('$settings', JSON.stringify(settings));
	}

	/**
	 * 设置应用本地配置
	 **/
	owner.getSettings = function() {
			var settingsText = localStorage.getItem('$settings') || "{}";
			return JSON.parse(settingsText);
		}
		/**
		 * 获取本地是否安装客户端
		 **/
	owner.isInstalled = function(id) {
		if (id === 'qihoo' && mui.os.plus) {
			return true;
		}
		if (mui.os.android) {
			var main = plus.android.runtimeMainActivity();
			var packageManager = main.getPackageManager();
			var PackageManager = plus.android.importClass(packageManager)
			var packageName = {
				"qq": "com.tencent.mobileqq",
				"weixin": "com.tencent.mm",
				"sinaweibo": "com.sina.weibo"
			}
			try {
				return packageManager.getPackageInfo(packageName[id], PackageManager.GET_ACTIVITIES);
			} catch (e) {}
		} else {
			switch (id) {
				case "qq":
					var TencentOAuth = plus.ios.import("TencentOAuth");
					return TencentOAuth.iphoneQQInstalled();
				case "weixin":
					var WXApi = plus.ios.import("WXApi");
					return WXApi.isWXAppInstalled()
				case "sinaweibo":
					var SinaAPI = plus.ios.import("WeiboSDK");
					return SinaAPI.isWeiboAppInstalled()
				default:
					break;
			}
		}
	}
}(mui, window.app = {}));
//window.HOSTURL='http://192.168.0.119:8888/DGSXWebSforApp/';
window.HOSTURL='http://218.56.106.137:8080/DGSXWebSforApp/';
function setCharacters(){
window.SESSIONID=plus.storage.getItem('sessionId');
window.USERID=plus.storage.getItem('UserID');
window.PASSWORD=plus.storage.getItem('Password');
window.XM=plus.storage.getItem("XM");
window.XH=plus.storage.getItem("XH");
window.ZYBID=plus.storage.getItem("ZYBID");
window.ZYBNAME=plus.storage.getItem("ZYBNAME");
window.ZYID=plus.storage.getItem("ZYID");
window.ZYNAME=plus.storage.getItem("ZYNAME");
window.BJID=plus.storage.getItem("BJID");
window.BJNAME=plus.storage.getItem("BJNAME");
window.XSID=plus.storage.getItem("XSID");
window.YHID=plus.storage.getItem("YHID");
window.QYID=plus.storage.getItem("QYID");
window.GWID=plus.storage.getItem("GWID");
window.QYNAME=plus.storage.getItem("QYNAME");
window.GWNAME=plus.storage.getItem("GWNAME");
}
Date.prototype.Format = function(fmt)  
{ //author: meizz  
 var o = {  
  "M+" : this.getMonth()+1,         //月份  
  "d+" : this.getDate(),          //日  
  "h+" : this.getHours(),          //小时  
  "m+" : this.getMinutes(),         //分  
  "s+" : this.getSeconds(),         //秒  
  "q+" : Math.floor((this.getMonth()+3)/3), //季度  
  "S" : this.getMilliseconds()       //毫秒  
 };  
 if(/(y+)/.test(fmt))  
  fmt=fmt.replace(RegExp.$1, (this.getFullYear()+"").substr(4 - RegExp.$1.length));  
 for(var k in o)  
  if(new RegExp("("+ k +")").test(fmt))  
 fmt = fmt.replace(RegExp.$1, (RegExp.$1.length==1) ? (o[k]) : (("00"+ o[k]).substr((""+ o[k]).length)));  
 return fmt;  
} 
function splitStr(str){
	//["11","jdkfjd"]
	if(str!=null){
	var length=str.length;
	var str1=str.substring(1,length-1);
	var strArr=str1.split(",");
	var strArr1=[];
	for(var i=0;i<strArr.length;i++){
		var lengths=strArr[i].length;
		var strs=strArr[i].substring(1,lengths-1);
		strArr1[strArr1.length]=strs;
	}
	return strArr1;
	}else{
		return '';
	}
}
function getNowFormatDate() {
    var date = new Date();
    var seperator1 = "-";
    var seperator2 = ":";
    var month = date.getMonth() + 1;
    var strDate = date.getDate();
    if (month >= 1 && month <= 9) {
        month = "0" + month;
    }
    if (strDate >= 0 && strDate <= 9) {
        strDate = "0" + strDate;
    }
    var currentdate = date.getFullYear() + seperator1 + month + seperator1 + strDate;
            //+ " " + date.getHours() + seperator2 + date.getMinutes()
            //+ seperator2 + date.getSeconds();
    return currentdate;
}