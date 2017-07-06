package com.bx.controller;

import java.util.Map;

import org.fkit.tools.Tools;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.alibaba.fastjson.JSONObject;
import com.apex.livebos.ws.LBEBusinessService;
import com.apex.livebos.ws.QueryResult;

//http://218.56.106.137:11500/service/LBEBusiness?wsdl
@Controller
public class LoginController {
	@RequestMapping(value="/Login")
	public String Login(Model model,
			@RequestParam String userId,
			@RequestParam String password,
			@RequestParam String sessionId){

		Tools tool=new Tools();
		LBEBusinessService client=tool.connectWS();
		QueryResult result=client.validateUser(sessionId, userId, password, "plain","");
		Map<String,Object> map=tool.queryResultToMap(result);
		String jsonStr=JSONObject.toJSONString(map);
		model.addAttribute("json", jsonStr);
		return "getJson";
	}
}
