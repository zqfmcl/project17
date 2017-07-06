package boc.payment.trans.b2c;

import java.util.HashMap;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.alibaba.fastjson.JSONObject;

import boc.payment.common.security.PKCSTool;
import boc.payment.common.system.PaymentEnvironment;

@Controller
public class B2CMobileRecvOrder {
	private static final long serialVersionUID = -6371992766865818751L;
	private static final Logger logger = Logger.getLogger("system");
	@RequestMapping(value="/B2CMobileRecvOrder",method=RequestMethod.POST)
	public String createB2CMobileOrder( Model model,
	 @RequestParam String merchantNo,
	 @RequestParam String orderNo,
	 @RequestParam String curCode,
	 @RequestParam String orderAmount,
	 @RequestParam String orderTime,
	 @RequestParam String orderNote,
	 @RequestParam String orderUrl,
	 @RequestParam String orderTimeoutDate){
		 String payType="1";

		try {
			//鍔犵
            //orderNo|orderTime|curCode|orderAmount|merchantNo
            StringBuilder plainTextBuilder =  new StringBuilder();
            plainTextBuilder.append(orderNo).append("|")
            				 .append(orderTime).append("|")
            				 .append(curCode).append("|")
            				 .append(orderAmount).append("|")
            				 .append(merchantNo);
            String plainText = plainTextBuilder.toString();

            logger.debug("[plainText]=["+plainText+"]");
            byte  plainTextByte[] = plainText.getBytes("UTF-8");
            //鑾峰彇绉侀挜璇佷功
            PKCSTool tool = PKCSTool.getSigner(PaymentEnvironment.signKeyFile,PaymentEnvironment.signkeyPassword,PaymentEnvironment.signkeyPassword,"PKCS7");
            //绛惧悕
            String signData = tool.p7Sign(plainTextByte);

            logger.info("---------- B2CMobileRecvOrder send message ----------");
            logger.info("[merchantNo]=[" + merchantNo + "]");
            logger.info("[payType]=[" + payType + "]");
            logger.info("[orderNo]=[" + orderNo + "]");
            logger.info("[curCode]=[" + curCode + "]");
            logger.info("[orderAmount]=[" + orderAmount + "]");
            logger.info("[orderTime]=[" + orderTime + "]");
            logger.info("[orderNote]=[" + orderNote + "]");
            logger.info("[orderUrl]=[" + orderUrl + "]");
            logger.info("[orderTimeoutDate]=[" + orderTimeoutDate + "]");
            logger.info("[signData]=[" + signData + "]");

            String action = PaymentEnvironment.pgwPortalUrl+"/"+"B2CMobileRecvOrder.do";
            logger.info("[action]=[" + action + "]");
            //澶勭悊鐨勫弬鏁拌繑鍥炵粰绉诲姩绔�
            Map<String,Object> map=new HashMap<String,Object>();
            map.put("result", 1);
            map.put("merchantNo", merchantNo);
            map.put("payType", payType);
            map.put("orderNo", orderNo);
            map.put("curCode", curCode);
            map.put("orderAmount", orderAmount);
            map.put("orderTime", orderTime);
            map.put("orderNote", orderNote);
            map.put("orderUrl", orderUrl);
            map.put("orderTimeoutDate", orderTimeoutDate);
            map.put("signData", signData);
            map.put("action", action);
            String jsonStr=JSONObject.toJSONString(map);
            model.addAttribute("json", jsonStr);
            System.out.println(jsonStr);
		} catch (Exception e) {

			logger.error(e);
            e.printStackTrace();
            Map<String,Object> map=new HashMap<String,Object>();
            map.put("result", -1);
            String jsonStr=JSONObject.toJSONString(map);
            model.addAttribute("json", jsonStr);
		}
		return "getJson";
	}
}
