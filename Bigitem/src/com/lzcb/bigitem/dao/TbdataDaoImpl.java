package com.lzcb.bigitem.dao;

import java.io.FileOutputStream;
import java.util.Calendar;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import com.lzcb.bigitem.utils.DbHelper;

public class TbdataDaoImpl implements TbdataDao {

	@Override
	public void zbxmqkData() {
		// TODO Auto-generated method stub
		Calendar cld=Calendar.getInstance();
		int nowYear=cld.get(Calendar.YEAR);
		String sql="select dq1.id,dq1.dq_name,num1,count(xm.id) as num2 from  (select dq.id,dq.dq_name,count(xm.id) as num1 from  bi_dqxxb dq left join (select bi_xmxx.id,bi_xmxx.szqx from bi_xmxx where nf="+nowYear+") xm on dq.id=xm.szqx where dq.sjjd_dm=116 group by dq.id,dq.dq_name) dq1 left join (select bi_xmxx.id,bi_xmxx.szqx from bi_xmxx where nf="+(nowYear-1)+") xm on dq1.id=xm.szqx group by dq1.id,dq1.dq_name,dq1.num1 order by dq1.dq_name";
		JSONObject chart=new JSONObject();
		chart.accumulate("caption", "");
		chart.accumulate("xAxisname", "注释");
		chart.accumulate("yAxisName", "数量 (个)");
		chart.accumulate("plotFillAlpha", "80");
		chart.accumulate("paletteColors", "#0075c2,#1aaf5d");
		chart.accumulate("baseFontColor", "#333333");
		chart.accumulate("baseFont", "Helvetica Neue,Arial");
		chart.accumulate("captionFontSize", "14");
		chart.accumulate("subcaptionFontSize", "14");
		chart.accumulate("subcaptionFontBold", "0");
		chart.accumulate("showBorder", "0");
		chart.accumulate("bgColor", "#ffffff");
		chart.accumulate("showShadow", "0");
		chart.accumulate("canvasBgColor", "#ffffff");
		chart.accumulate("canvasBorderAlpha", "0");
		chart.accumulate("divlineAlpha", "100");
		chart.accumulate("divlineColor", "#999999");
		chart.accumulate("divlineThickness", "1");
		chart.accumulate("divLineIsDashed", "1");
		chart.accumulate("divLineDashLen", "1");
		chart.accumulate("divLineGapLen", "1");
		chart.accumulate("usePlotGradientColor", "0");
		chart.accumulate("showplotborder", "0");
		chart.accumulate("valueFontColor", "#ffffff");
		chart.accumulate("placeValuesInside", "1");
		chart.accumulate("showHoverEffect", "1");
		chart.accumulate("rotateValues", "1");
		chart.accumulate("showXAxisLine", "1");
		chart.accumulate("xAxisLineThickness", "1");
		chart.accumulate("xAxisLineColor", "#999999");
		chart.accumulate("showAlternateHGridColor", "0");
		chart.accumulate("legendBgAlpha", "0");
		chart.accumulate("legendBorderAlpha", "0");
		chart.accumulate("legendShadow", "0");
		chart.accumulate("legendItemFontSize", "10");
		chart.accumulate("legendItemFontColor", "#666666");
		String categories="[{ \"category\":[";
		String dataset1="{\"seriesname\":\"去年\",\"data\":[";//去年
		String dataset2="{\"seriesname\":\"今年\",\"data\":[";
		String trendlines="";
		float sum1=0;//去年
		float sum2=0;
		List<Map<String, Object>> list=DbHelper.queryForTable(sql);
		for(int i=0;i<list.size();i++){
			Map<String, Object> m=list.get(i);
			categories+="{\"label\":\""+m.get("DQ_NAME")+"\"},";
			dataset1+="{\"value\":\""+m.get("NUM2")+"\"},";
			dataset2+="{\"value\":\""+m.get("NUM1")+"\"},";
			sum1+=Float.parseFloat(m.get("NUM1").toString());
			sum2+=Float.parseFloat(m.get("NUM2").toString());
		}
		if("[{ \"category\":[".equals(categories)){
			categories="";
			dataset1="";
			dataset2="";
		}else{
			categories=categories.substring(0,categories.length()-1)+"]}]";
			dataset1=dataset1.substring(0, dataset1.length()-1)+"]}";
			dataset2=dataset2.substring(0, dataset2.length()-1)+"]}";
			trendlines="[{\"line\": [ {" +
					"\"startvalue\": \""+(sum1/list.size())+"\"," +
					"\"color\": \"#0075c2\"," +
					"\"displayvalue\": \"去年平均水平\"," +
					"\"valueOnRight\": \"1\"," +
					"\"thickness\": \"1\"," +
					"\"showBelow\": \"1\"," +
					"\"tooltext\": \"去年平均水平: "+(String.format("%.1f", (sum1/list.size())))+"\"" +
					"}," +
					"{" +
					"\"startvalue\": \""+(sum2/list.size())+"\"," +
					"\"color\": \"#1aaf5d\"," +
					"\"displayvalue\": \"今年平均水平\"," +
					"\"valueOnRight\": \"1\"," +
					"\"thickness\": \"1\"," +
					"\"showBelow\": \"1\"," +
					"\"tooltext\": \"今年平均水平: "+(String.format("%.1f", (sum2/list.size())))+"\"" +
					"}]}]";
		}
		JSONObject json=new JSONObject();
		json.accumulate("chart", chart);
		json.accumulate("categories", JSONArray.fromObject(categories));
		json.accumulate("dataset", JSONArray.fromObject("["+dataset1+","+dataset2+"]"));
		json.accumulate("trendlines", JSONArray.fromObject(trendlines));
		String jsonstr=json.toString();
		System.out.println("==="+jsonstr);
		try {
            FileOutputStream fos = new FileOutputStream("WebRoot\\Tbdata\\zbxmqk.json");
            fos.write(jsonstr.getBytes());
            fos.close();
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
	}
	/*public static void main(String[] args) {
		TbdataDao tbdao=new TbdataDaoImpl();
		tbdao.zbxmqkData();
		tbdao.dqxmslData();
		tbdao.xmtzfwData();
	}*/
	@Override
	public void xmtzfwData() {
		// TODO Auto-generated method stub
		String sql="select count(*) as xmnum,'一亿以下' as cxtj from bi_xmxx t where t.ztz<1 union all " +
				"select count(*) as xmnum,'一亿至五亿' as cxtj from bi_xmxx t where t.ztz>=1 and t.ztz<5 union all " +
				"select count(*) as xmnum,'五亿至十亿' as cxtj from bi_xmxx t where t.ztz>=5 and t.ztz<10 union all " +
				"select count(*) as xmnum,'十亿至二十亿' as cxtj from bi_xmxx t where t.ztz>=10 and t.ztz<20 union all " +
				"select count(*) as xmnum,'二十亿以上' as cxtj from bi_xmxx t where t.ztz>=20";
		JSONObject chart=new JSONObject();
		chart.accumulate("caption", "投资规模总比");
		chart.accumulate("showPercentValues", "1");
		chart.accumulate("showPercentInTooltip", "0");
		chart.accumulate("startingAngle", "30");
		chart.accumulate("decimals", "1");
		chart.accumulate("smartLineColor", "#d11b2d");
		chart.accumulate("smartLineThickness", "2");
		chart.accumulate("smartLineAlpha", "75");
		chart.accumulate("isSmartLineSlanted", "0");
		chart.accumulate("theme", "fint");
		String datas="[";
		List<Map<String, Object>> list=DbHelper.queryForTable(sql);
		for(int i=0;i<list.size();i++){
			Map<String, Object> m=list.get(i);
			datas+="{ \"label\":"+"\""+m.get("CXTJ")+"\", \"value\":"+"\""+m.get("XMNUM")+"\" },";
		}
		if("[".equals(datas)){
			datas="";
		}else{
			datas=datas.substring(0, datas.length()-1)+" ]";
		}
		JSONObject json=new JSONObject();
		json.accumulate("chart", chart);
		json.accumulate("data", JSONArray.fromObject(datas));
		String jsonstr=json.toString();
		System.out.println("==="+jsonstr);
		try {
            FileOutputStream fos = new FileOutputStream("WebRoot\\Tbdata\\xmtzfw.json");
            fos.write(jsonstr.getBytes());
            fos.close();
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
		
	}
	@Override
	public void dqxmslData() {
		// TODO Auto-generated method stub
		String sql="select dq.id,dq.dq_name,count(xm.id) xmnum from bi_dqxxb dq left join bi_xmxx xm on dq.id=xm.szqx where dq.sjjd_dm=116 group by dq.id,dq.dq_name";
		JSONObject chart=new JSONObject();
		chart.accumulate("caption", "镇办项目数量占比");
		chart.accumulate("showPercentValues", "1");
		chart.accumulate("showPercentInTooltip", "0");
		chart.accumulate("startingAngle", "30");
		chart.accumulate("decimals", "1");
		chart.accumulate("smartLineColor", "#d11b2d");
		chart.accumulate("smartLineThickness", "2");
		chart.accumulate("smartLineAlpha", "75");
		chart.accumulate("isSmartLineSlanted", "0");
		chart.accumulate("theme", "fint");
		String datas="[";
		List<Map<String, Object>> list=DbHelper.queryForTable(sql);
		for(int i=0;i<list.size();i++){
			Map<String, Object> m=list.get(i);
			datas+="{ \"label\":"+"\""+m.get("DQ_NAME")+"\", \"value\":"+"\""+m.get("XMNUM")+"\" },";
		}
		if("[".equals(datas)){
			datas="";
		}else{
			datas=datas.substring(0, datas.length()-1)+" ]";
		}
		JSONObject json=new JSONObject();
		json.accumulate("chart", chart);
		json.accumulate("data", JSONArray.fromObject(datas));
		String jsonstr=json.toString();
		try {
            FileOutputStream fos = new FileOutputStream("WebRoot\\Tbdata\\dqxmsl.json");
            fos.write(jsonstr.getBytes());
            fos.close();
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
	}

}
