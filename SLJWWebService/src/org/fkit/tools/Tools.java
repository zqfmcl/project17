package org.fkit.tools;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.activation.DataHandler;

import com.alibaba.fastjson.JSONObject;
import com.apex.livebos.ws.ColInfo;
import com.apex.livebos.ws.LBDocumentService;
import com.apex.livebos.ws.LBDocumentWebService;
import com.apex.livebos.ws.LBEBusinessService;
import com.apex.livebos.ws.LBEBusinessWebService;
import com.apex.livebos.ws.LbParameter;
import com.apex.livebos.ws.LbRecord;
import com.apex.livebos.ws.QueryOption;
import com.apex.livebos.ws.QueryResult;
import com.apex.livebos.ws.ValueOption;

public class Tools {
	//连接LBEBusinessWebService
	public LBEBusinessService connectWS(){
		LBEBusinessWebService service=new LBEBusinessWebService();
		LBEBusinessService client=service.getLBEBusinessServiceImplPort();
		return client;
	}
	public LBDocumentService connectDWS(){
		LBDocumentWebService service =new LBDocumentWebService();
		LBDocumentService client=service.getLBDocumentServiceImplPort();
		return client;
	}
	//处理ws返回的数据格式,方便手机调用
	public Map<String,Object> queryResultToMap(QueryResult result){
		System.out.println(JSONObject.toJSONString(result));
		if(result!=null){
		Map<String,Object> map=new HashMap<String,Object>();
		List<Object> list=new ArrayList<Object>();
		map.put("result", result.getResult());
		map.put("message", result.getMessage());
		map.put("count", result.getCount());
		map.put("hasMore", result.isHasMore());
		List<ColInfo> names=result.getMetaData().getColInfo();
		//将数据的字段名与值对应起来
		for (LbRecord record : result.getRecords()) {
			Map<String,Object> smap=new HashMap<String,Object>();
			for(int i=0;i<record.getSize();i++){
				smap.put(names.get(i).getName(), record.getValues().get(i));
			}
			list.add(smap);
		}
		map.put("keyValues",list);
		return map;
		}else{
			return null;
		}
	}
	public List<LbParameter> mapsToLbParams(JSONObject map){
		if(map!=null){
		List<LbParameter> listp=new ArrayList<LbParameter>();
		for (Map.Entry<String, Object> entry : map.entrySet()) {
			LbParameter lbparam=new LbParameter();
			   lbparam.setName(entry.getKey());
			   if(entry.getValue()!=null){
				   lbparam.setValue(entry.getValue().toString());
			   }else{
				   lbparam.setValue("");
			   }
	          
	           listp.add(lbparam);
			  } 
		return listp;
		}else{
			return null;
		}
	}
	public QueryOption jsonToQueryOption(JSONObject json){
		if(json!=null){
		QueryOption queryOption=new QueryOption();
		queryOption.setBatchNo(Integer.parseInt(json.getString("batchNo")));
		queryOption.setBatchSize(Integer.parseInt(json.getString("batchSize")));
		queryOption.setQueryCount(Boolean.parseBoolean(json.getString("queryCount")));
		ValueOption valueOpt = null;
		switch (json.getString("valueOption")){
		case "0":
			valueOpt=ValueOption.VALUE;
			break;
		case "1":
			valueOpt=ValueOption.DISPLAY;
			break;
		case "2":
			valueOpt=ValueOption.BOTH;
			break;
		}
		queryOption.setValueOption(valueOpt);
		queryOption.setOrderBy(json.getString("orderBy"));
		queryOption.setQueryId(json.getString("queryId"));
		return queryOption;
		}else{
			return null;
		}
	}
	//获取当前时间yyyyMMddHHmmss
	public  String getCurrTimeStr(){
		Date now=new Date();
		SimpleDateFormat outFormat=new SimpleDateFormat("yyyyMMddHHmmss");
		String timeStr=outFormat.format(now);
		return timeStr;
	}
	//取出一个指定长度大小的随机正整数
	public  int buildRandom(int length) {
		  int num = 1;
		  double random = Math.random();
		  if (random < 0.1) {
		   random = random + 0.1;
		  }
		  for (int i = 0; i < length; i++) {
		   num = num * 10;
		  }
		  return (int) ((random * num));
		 } 

	//根据当前时间和四位随机数生成随机文件名
	public String getDocumentName(){
		String timeS=this.getCurrTimeStr();
		String randomS=this.buildRandom(4)+"";
		return timeS+randomS;
	}
	
}
