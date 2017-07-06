package org.fkit.controller;

import java.util.List;
import java.util.Map;

import org.fkit.tools.Tools;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.apex.livebos.ws.CreateResult;
import com.apex.livebos.ws.LBEBusinessService;
import com.apex.livebos.ws.LbParameter;
import com.apex.livebos.ws.LbeResult;
import com.apex.livebos.ws.QueryOption;
import com.apex.livebos.ws.QueryResult;

@Controller
public class CreateJLController {
	private static LBEBusinessService client;
	private static Tools tool;
	private static void initClient(){
		tool=new Tools();
		client=tool.connectWS();
	}
	static{
		initClient();
	}
	//创建记录
	@RequestMapping(value="/addJL",method=RequestMethod.POST)
	public String addJL(Model model,
			@RequestParam String sessionId,
			@RequestParam String objectName,
			@RequestParam String params){
		List<LbParameter> list=tool.mapsToLbParams(JSON.parseObject(params));
		CreateResult result=client.create(sessionId, objectName, list);
		String jsonStr=JSONObject.toJSONString(result);
		model.addAttribute("json", jsonStr);
		return "getJson";
	}
	//修改记录
	@RequestMapping(value="/updateJL",method=RequestMethod.POST)
	public String updateJL(Model model,
			@RequestParam String sessionId,
			@RequestParam String objectName,
			@RequestParam String params,
			@RequestParam String id){
		List<LbParameter> list=tool.mapsToLbParams(JSON.parseObject(params));
		LbeResult result=client.update(sessionId, objectName, id, list);
		String jsonStr=JSONObject.toJSONString(result);
		model.addAttribute("json", jsonStr);
		return "getJson";
	}
	//删除记录
	@RequestMapping(value="/deleteJL",method=RequestMethod.POST)
	public String deleteJL(Model model,
			@RequestParam String sessionId,
			@RequestParam String objectName,
			@RequestParam String id){
		LbeResult result=client.delete(sessionId, objectName, id);
		String jsonStr=JSONObject.toJSONString(result);
		model.addAttribute("json", jsonStr);
		return "getJson";
	}
	//数据查询
	@RequestMapping(value="/Query",method=RequestMethod.POST)
	public String query(Model model,
			@RequestParam String sessionId,
			@RequestParam String objectName,
			@RequestParam String params,
			@RequestParam String condition,
			@RequestParam String queryOptionStr
			){
		QueryOption qopt=tool.jsonToQueryOption(JSON.parseObject(queryOptionStr));
		List<LbParameter> list=tool.mapsToLbParams(JSON.parseObject(params));
		QueryResult result=client.query(sessionId, objectName, list, condition, qopt);
		System.out.println(JSONObject.toJSONString(result));
		if(result.getResult()==1){
		Map<String,Object> map=tool.queryResultToMap(result);
		String jsonStr=JSONObject.toJSONString(map);
		model.addAttribute("json", jsonStr);
		}else{
			String jsonStr="{\"result\":-1}";
			model.addAttribute("json", jsonStr);
		}
		return "getJson";
	}
}
