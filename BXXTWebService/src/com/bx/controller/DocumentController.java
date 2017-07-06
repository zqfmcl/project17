package com.bx.controller;

import java.io.BufferedOutputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.HashMap;
import java.util.Map;

import javax.activation.DataHandler;
import javax.servlet.http.HttpServletRequest;

import org.fkit.tools.Tools;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import sun.misc.BASE64Decoder;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.apex.livebos.ws.Document;
import com.apex.livebos.ws.DocumentEntryResult;
import com.apex.livebos.ws.DocumentResult;
import com.apex.livebos.ws.LBDocumentService;
import com.apex.livebos.ws.LbeResult;
import com.sun.istack.internal.ByteArrayDataSource;

@Controller
public class DocumentController {
	private static LBDocumentService client;
	private static Tools tool;
	private static void initClient(){
		tool=new Tools();
		client=tool.connectDWS();
	}
	static {
		initClient();
	}
	//获取指定文档信息
	@RequestMapping(value="/getDocument",method=RequestMethod.POST)
	public String getDocument(Model model,
			@RequestParam String sessionId,
			@RequestParam String objectName,
			@RequestParam String columnName,
			@RequestParam String id,
			@RequestParam String entryNo,
			HttpServletRequest request) throws IOException{
		DocumentResult result=client.getDocument(sessionId, objectName, columnName, id, entryNo);
		DataHandler data=result.getDocument().getDocumentData();
		String fileName=result.getDocument().getFilename();
		String filePath=request.getServletContext().getRealPath("/downloads");
		InputStream is=data.getInputStream();
		String orginalName=tool.getDocumentName()+fileName.substring(fileName.lastIndexOf("."));
		FileOutputStream fos= new FileOutputStream(filePath+"//"+orginalName);
		byte[] bytes=new byte[2048];
		int len=0;
		while((len=is.read(bytes))!=-1){
			fos.write(bytes,0,len);
		}
		fos.flush();
		fos.close();
		is.close();
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("result", 1);
		map.put("filePath", "downloads/"+orginalName);
		map.put("fileName", fileName);
		map.put("originalName", orginalName);
		String jsonStr=JSON.toJSONString(map);
		model.addAttribute("json", jsonStr);
		System.out.println(jsonStr);
		return "getJson";
	}
	//查询文档信息
	@RequestMapping(value="/queryEntry",method=RequestMethod.POST)
	public String queryEntry(Model model,
			@RequestParam String sessionId,
			@RequestParam String objectName,
			@RequestParam String columnName,
			@RequestParam String id){
		DocumentEntryResult result=client.queryEntry(sessionId, objectName, columnName, id);
		String jsonStr=JSONObject.toJSONString(result);
		System.out.println(jsonStr);
		model.addAttribute("json", jsonStr);
		return "getJson";
	}
	//上传文档信息
	@RequestMapping(value="/putDocument",method=RequestMethod.POST)
	public String putDocument(Model model,
			@RequestParam String sessionId,
			@RequestParam String documentStr,
			@RequestParam String objectName,
			@RequestParam String columnName,
			@RequestParam String id) throws IOException{
			JSONObject json = JSON.parseObject(documentStr);
			if(json.getString("dataStr")!=null){
				String[] strs=json.getString("dataStr").split(",");
				String base64Str=strs[1];
				//System.out.println(base64Str);
				//将base64解密
				BASE64Decoder decorder=new BASE64Decoder();
				Document document=new Document();
				byte[] b=decorder.decodeBuffer(base64Str);
				//byte转dataSource
				ByteArrayDataSource source=new ByteArrayDataSource(b,"application/octet-stream");
				DataHandler dh=new DataHandler(source);
				document.setDocumentData(dh);
				document.setFilename(json.getString("filename"));
				document.setLength(Long.parseLong(json.getString("length")));
				LbeResult result=client.putDocument(sessionId, document, objectName, columnName, id);
				String jsonStr=JSONObject.toJSONString(result);
				System.out.println("result:"+jsonStr);
				model.addAttribute("json", jsonStr);
				
			}

			return "getJson";
	}
	//删除指定文档信息
	@RequestMapping(value="/deleteDocument",method=RequestMethod.POST)
	public String deleteDocument(Model model,
			@RequestParam String sessionId,
			@RequestParam String objectName,
			@RequestParam String columnName,
			@RequestParam String id,
			@RequestParam String entryNo){
			LbeResult result=client.deleteDocument(sessionId, objectName, columnName, id, entryNo);
			String jsonStr=JSONObject.toJSONString(result);
			System.out.println(jsonStr);
			model.addAttribute("json", jsonStr);
		return "getJson";
	}
	//下载附件
	@RequestMapping(value="/downloadDocument")
	public ResponseEntity<byte[]> downloadDocument(Model model,
			@RequestParam String dataStr,
			@RequestParam String fileName,
			HttpServletRequest request) throws IOException{
		String filePath=request.getServletContext().getRealPath("/"+dataStr);
		byte[] buffer=null;
		try{
		File file=new File(filePath);
		FileInputStream fis=new FileInputStream(file);
		ByteArrayOutputStream bos=new ByteArrayOutputStream(1000);
		byte[] b=new byte[1024];
		int len=-1;
		while((len=fis.read(b))!=-1){
			bos.write(b,0,len);
		}
		fis.close();
		bos.close();
		buffer=bos.toByteArray();
		}catch(Exception e){
			
		}
		
		//浏览器下载文�?
		HttpHeaders headers=new HttpHeaders();
		String fileName1=new String(fileName.getBytes("UTF-8"),"iso-8859-1");
		System.out.println(fileName1);
		headers.setContentDispositionFormData("attachment", fileName1);
		headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
		return new ResponseEntity<byte[]>(buffer,headers,HttpStatus.CREATED);
		
	}
	//将文件传输到本服务器downloads文件夹下
	//@SuppressWarnings("resource")
	@RequestMapping(value="/sendDocument",method=RequestMethod.POST)
	public String sendDocument(Model model,
			@RequestParam String dataStr,
			@RequestParam String fileName,
			HttpServletRequest request) throws IOException{
		DataHandler data= (DataHandler)JSON.parseObject(dataStr, DataHandler.class);
		byte[] b=new byte[data.getInputStream().available()];
		BufferedOutputStream bos=null;
		FileOutputStream fos=null;
		File file=null;
		String filePath=request.getServletContext().getRealPath("/downloads");
		try{
			file=new File(filePath+"//"+fileName);
			fos=new FileOutputStream(file);
			bos=new BufferedOutputStream(fos);
			bos.write(b);
			String jsonStr="{\"result\":1,\"filePath\":"+ filePath+"//"+fileName+"}";
			model.addAttribute("json", jsonStr);
			System.out.println(jsonStr);
		}catch(Exception e){
			e.printStackTrace();
		}finally {  
            if (bos != null) {  
                try {  
                    bos.close();  
                } catch (IOException e1) {  
                    e1.printStackTrace();  
                }  
            }  
            if (fos != null) {  
                try {  
                    fos.close();  
                } catch (IOException e1) {  
                    e1.printStackTrace();  
                }  
            }  
        }  
		return "getJson";
	}
}
