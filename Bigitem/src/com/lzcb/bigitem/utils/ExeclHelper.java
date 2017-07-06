package com.lzcb.bigitem.utils;

import java.io.FileOutputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONObject;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFRichTextString;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.util.HSSFColor;

public class ExeclHelper {
	public static void main(String[] args) throws Exception  
    {  
        test();
    }  
	public static void test(){
		String jsons="{'XMMC':'项目名称','NF':'年份'}";
        JSONObject json=JSONObject.fromObject(jsons);
        List<Map<String, Object>> list=new ArrayList<Map<String,Object>>();
        for(int i=0;i<10;i++){
        	Map<String, Object> m=new HashMap<String, Object>();
        	m.put("XMMC", "名称"+i);
        	m.put("NF", "nianfen"+i);
        	list.add(m);
        }
//        System.out.println(json+" \n"+list.toString());
        try {
			FileOutputStream file=new FileOutputStream("e://test.xls");
			execlExport("test", JSONObject.fromObject(json), list, file);
			System.out.println("successfull!");
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
	@SuppressWarnings("unchecked")
	public static void execlExport(String filename,JSONObject headers,List<Map<String,Object>> list,OutputStream out ){
		// 第一步，创建一个webbook，对应一个Excel文件  
        HSSFWorkbook wb = new HSSFWorkbook();  
        // 第二步，在webbook中添加一个sheet,对应Excel文件中的sheet  
        HSSFSheet sheet = wb.createSheet(filename);
        // 生成一个样式  
        HSSFCellStyle style = wb.createCellStyle();  
        // 设置这些样式  
        style.setFillForegroundColor(HSSFColor.LIGHT_YELLOW.index);  
        style.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);  
        style.setBorderBottom(HSSFCellStyle.BORDER_THIN);  
        style.setBorderLeft(HSSFCellStyle.BORDER_THIN);  
        style.setBorderRight(HSSFCellStyle.BORDER_THIN);  
        style.setBorderTop(HSSFCellStyle.BORDER_THIN);  
        style.setAlignment(HSSFCellStyle.ALIGN_CENTER);
        // 生成一个字体  
        HSSFFont font = wb.createFont();  
        font.setColor(HSSFColor.VIOLET.index);  
        font.setFontHeightInPoints((short) 12);  
        font.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);  
        // 把字体应用到当前的样式  
        style.setFont(font);  
        // 生成并设置另一个样式  
        HSSFCellStyle style2 = wb.createCellStyle();  
        style2.setFillForegroundColor(HSSFColor.WHITE.index);  
        style2.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);  
        style2.setBorderBottom(HSSFCellStyle.BORDER_THIN);  
        style2.setBorderLeft(HSSFCellStyle.BORDER_THIN);  
        style2.setBorderRight(HSSFCellStyle.BORDER_THIN);  
        style2.setBorderTop(HSSFCellStyle.BORDER_THIN);  
        style2.setAlignment(HSSFCellStyle.ALIGN_CENTER);  
        style2.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);  
        // 生成另一个字体  
        HSSFFont font2 = wb.createFont();  
        font2.setBoldweight(HSSFFont.BOLDWEIGHT_NORMAL);  
        // 把字体应用到当前的样式  
        style2.setFont(font2);  
        // 第三步，在sheet中添加表头第0行,注意老版本poi对Excel的行数列数有限制short  
        HSSFRow row = sheet.createRow((int) 0);
        Iterator iterator = headers.keys();
        List<String> header=new ArrayList<String>();
        int i=0;
        while(iterator.hasNext()){
        	String key = (String) iterator.next();
            String value = headers.getString(key);
            header.add(key);
            
            HSSFCell cell = row.createCell(i);  
            cell.setCellStyle(style);  
            HSSFRichTextString text = new HSSFRichTextString(value);  
            cell.setCellValue(text);  
            i++;
        }
//         遍历集合数据，产生数据行
        for(i=0;i<list.size();i++){
        	Map m=list.get(i);
        	row = sheet.createRow((int) i+1);
        	for(int j=0;j<header.size();j++){
        		HSSFCell cell = row.createCell(j);  
                cell.setCellStyle(style2);
                HSSFRichTextString text = new HSSFRichTextString(m.get(header.get(j))==null?"":m.get(header.get(j))+"");  
                cell.setCellValue(text);
        	}
        }
        try {
			wb.write(out);
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
}
