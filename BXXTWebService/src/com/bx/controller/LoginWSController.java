package com.bx.controller;

import org.fkit.tools.Tools;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.servlet.ModelAndView;




import org.springframework.web.bind.annotation.RequestParam;

import com.alibaba.fastjson.JSONObject;
import com.apex.livebos.ws.LBEBusinessService;
import com.apex.livebos.ws.LoginResult;
import com.apex.livebos.ws.LogoutResult;

//http://218.56.106.138/service/LBEBusiness?wsdl
//webService用户ws_user/000000
//79f0c8955b1b3cccb7e6e1374b9402a9
@Controller
public class LoginWSController {
	private LBEBusinessService client;
	
	private void initClient(){
		Tools tool=new Tools();
		client=tool.connectWS();
	}
	//webservice用户登录获取sessionid
	@RequestMapping(value="/LoginWS")
	public String LoginWS(Model model){
		//工具�?? 
		initClient();
		LoginResult loginResult=client.login("ws_user","000000", "myapp", "plain", "");
		String jsonStr=JSONObject.toJSONString(loginResult);
		model.addAttribute("json", jsonStr);
		return "getJson";
	}
	//webservice用户注销 使sessionid无效
	@RequestMapping(value="/LogoutWS")
	public String LoginOutWS(Model model,
			@RequestParam String sessionId){
		//工具�?? 
		initClient();
		LogoutResult logoutResult=client.logout(sessionId);
		String jsonStr=JSONObject.toJSONString(logoutResult);
		model.addAttribute("json", jsonStr);
		return "getJson";
	}
}
