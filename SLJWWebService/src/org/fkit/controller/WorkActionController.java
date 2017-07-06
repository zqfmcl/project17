package org.fkit.controller;

import java.util.List;

import org.fkit.tools.Tools;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.apex.livebos.ws.AvailableWorkActionResponse;
import com.apex.livebos.ws.LBEBusinessService;
import com.apex.livebos.ws.WorkActionResult;
import com.apex.livebos.ws.LbParameter;
//流程表单操作
@Controller
public class WorkActionController {
	private static LBEBusinessService client;
	private static Tools tool;
	private static void initClient(){
		tool=new Tools();
		client=tool.connectWS();
	}
	static{
		initClient();
	}
	//执行工作流动作
	@RequestMapping(value="/doWorkAction",method=RequestMethod.POST)
	public String doWorkAction(Model model,
			@RequestParam String sessionId,
			@RequestParam String workflowName,
			@RequestParam long instanceId,
			@RequestParam int actionId,
			@RequestParam String params,
			@RequestParam String caller,
			@RequestParam String summary){
		List<LbParameter> list=tool.mapsToLbParams(JSON.parseObject(params));
		//System.out.println(list.get(0).getName()+":"+list.get(0).getValue()+"\n"+list.get(1).getName()+":"+list.get(1).getValue()+"\n"+list.get(2).getName()+":"+list.get(2).getValue()+"\n");
		WorkActionResult result=client.doWorkAction(sessionId, workflowName, instanceId,actionId, list, caller, summary);
		String jsonStr=JSONObject.toJSONString(result);
		model.addAttribute("json", jsonStr);
		return "getJson";
	} 
	//执行工作流动作通过工作流表单
		@RequestMapping(value="/doWorkActionByObject",method=RequestMethod.POST)
		public String doWorkActionByObject(Model model,
				@RequestParam String sessionId,
				@RequestParam String objectName,
				@RequestParam String id,
				@RequestParam int actionId,
				@RequestParam String params,
				@RequestParam String caller,
				@RequestParam String summary){
			List<LbParameter> list=tool.mapsToLbParams(JSON.parseObject(params));
			WorkActionResult result=client.doWorkActionByObject(sessionId, objectName, id,actionId, list, caller, summary);
			String jsonStr=JSONObject.toJSONString(result);
			model.addAttribute("json", jsonStr);
			return "getJson";
		}
	//获取工作流当前活动参与人
	@RequestMapping(value="/getWorkAvailableOwners")
	public String getWorkAvailableOwners(Model model,
			@RequestParam String sessionId,
			@RequestParam long instanceId){
		AvailableWorkActionResponse result=client.getWorkAvailableAction(sessionId, instanceId);
		String jsonStr=JSONObject.toJSONString(result);
		model.addAttribute("json", jsonStr);
		//client.getWorkOwner(sessionId, instanceId, stepId);
		return "getJson";
	}
}
