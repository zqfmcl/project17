package com.bx.controller;

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
import com.apex.livebos.ws.AvailableWorkActionResponse;
import com.apex.livebos.ws.LBEBusinessService;
import com.apex.livebos.ws.WorkActionResult;
import com.apex.livebos.ws.WorkCondition;
import com.apex.livebos.ws.WorkOwnerResponse;
import com.apex.livebos.ws.LbParameter;
import com.apex.livebos.ws.QueryOption;
import com.apex.livebos.ws.QueryResult;
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
	//执行工作流动�?
	@RequestMapping(value="/doWorkAction",method=RequestMethod.POST)
	public String doWorkAction(Model model,
			@RequestParam String sessionId,
			@RequestParam String workflowName,//BXXXDGZL
			@RequestParam long instanceId,
			@RequestParam int actionId, //40
			@RequestParam String params,
			@RequestParam String caller, //yhid
			@RequestParam String summary){//
		List<LbParameter> list=tool.mapsToLbParams(JSON.parseObject(params));
		//System.out.println(list.get(0).getName()+":"+list.get(0).getValue()+"\n"+list.get(1).getName()+":"+list.get(1).getValue()+"\n"+list.get(2).getName()+":"+list.get(2).getValue()+"\n");
		WorkActionResult result=client.doWorkAction(sessionId, workflowName, instanceId,actionId, list, caller, summary);
		String jsonStr=JSONObject.toJSONString(result);
		model.addAttribute("json", jsonStr);
		return "getJson";
	} 
	//执行工作流动作�?�过工作流表�?
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
	//获取工作流当前活动信息
	@RequestMapping(value="/getWorkAvailableAction")
	public String getWorkAvailableAction(Model model,
			@RequestParam String sessionId,
			@RequestParam long instanceId){
		AvailableWorkActionResponse result=client.getWorkAvailableAction(sessionId, instanceId);
		String jsonStr=JSONObject.toJSONString(result);
		model.addAttribute("json", jsonStr);
		//client.getWorkOwner(sessionId, instanceId, stepId);
		return "getJson";
	}
	
	//获取工作流当前活动参与人
		@RequestMapping(value="/getWorkAvailableOwners")
		public String getWorkAvailableOwners(Model model,
				@RequestParam String sessionId,
				@RequestParam long instanceId,
				@RequestParam int stepId
				){
			
			WorkOwnerResponse result=client.getWorkOwner(sessionId, instanceId,stepId);
			String jsonStr=JSONObject.toJSONString(result);
			model.addAttribute("json", jsonStr);
			//client.getWorkOwner(sessionId, instanceId, stepId);
			return "getJson";
		}
	
	

	//查询用户待办任务数据 
		@RequestMapping(value="/queryTaskList")
		public String queryTaskList(Model model,
				@RequestParam String sessionId,
				@RequestParam String caller,
				@RequestParam String condition,
				@RequestParam String queryOption){
			QueryOption qopt=tool.jsonToQueryOption(JSON.parseObject(queryOption));
			WorkCondition wc = tool.jsonToWorkCondition(JSON.parseObject(condition));
//			QueryResult result = client.queryTasks(sessionId, caller, qopt);
			QueryResult result = client.queryTaskListByCondition(sessionId, caller, wc, qopt);
			System.err.println(JSONObject.toJSONString(result));
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
