package com.lckj.wechat.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lckj.wechat.controller.WxInfoDeal;
import com.lckj.wechat.util.AesException;
import com.lckj.wechat.util.WXBizMsgCrypt;

public class ConnWechatServlet extends HttpServlet {
	private String token = "0L05Kz3mMhgJQWzEmmMvnH";  //需应用与后台一致  
    private String encodingAESKey = "avM7pACaJ4XJsoWdNcxGyPTNTIcHnANObwuNzxSDO5R";  //自动生成密钥  
    private String corpId = "wx9e6b5f7e6b9f86a2"; //企业号ID    
    private static final long serialVersionUID = 4440739483644821986L;
	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		
	    // 微信加密签名(微信传递过来的参数，我们只需要获取)  
        String msg_signature = request.getParameter("msg_signature");    
        // 时间戳(微信传递过来的参数，我们只需要获取)  
        String timestamp = request.getParameter("timestamp");    
        // 随机数(微信传递过来的参数，我们只需要获取)  
        String nonce = request.getParameter("nonce");    
        // 随机字符串(微信传递过来的参数，我们只需要获取)  
        String echostr = request.getParameter("echostr");    
            //打印看看我们自己获取到的地址是怎么样的。  
        System.out.println("request=" + request.getRequestURL());    
        
        PrintWriter out = response.getWriter();    
        // 通过检验signature对请求进行校验，若校验成功则原样返回echostr，表示接入成功，否则接入失败    
        String result = null;    
        try {    
             WXBizMsgCrypt wxcpt = new WXBizMsgCrypt(token,encodingAESKey,corpId);    
             result = wxcpt.VerifyURL(msg_signature, timestamp, nonce, echostr);    
        } catch (AesException e) {    
             e.printStackTrace();    
        }    
        if (result == null) {    
             result = token;  
        }  
  
        String str = msg_signature+" "+timestamp+" "+nonce+" "+echostr;  
        System.out.println("Exception:"+result+" "+ request.getRequestURL()+" "+"FourParames:"+str);  
   
        out.print(result);  
        out.close();    
        out = null;
	}

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		WxInfoDeal.processRequest(request, response);
	}

}
