package com.lzcb.bigitem.utils;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

import org.apache.poi.hwpf.HWPFDocument;
import org.apache.poi.hwpf.usermodel.Range;
import org.apache.poi.xwpf.extractor.XWPFWordExtractor;
import org.apache.poi.xwpf.usermodel.Borders;
import org.apache.poi.xwpf.usermodel.BreakClear;
import org.apache.poi.xwpf.usermodel.BreakType;
import org.apache.poi.xwpf.usermodel.LineSpacingRule;
import org.apache.poi.xwpf.usermodel.ParagraphAlignment;
import org.apache.poi.xwpf.usermodel.TextAlignment;
import org.apache.poi.xwpf.usermodel.UnderlinePatterns;
import org.apache.poi.xwpf.usermodel.VerticalAlign;
import org.apache.poi.xwpf.usermodel.XWPFDocument;
import org.apache.poi.xwpf.usermodel.XWPFParagraph;
import org.apache.poi.xwpf.usermodel.XWPFRun;

public class WordHelper {
    public static void main(String[] args) throws Exception {
    	new WordHelper().createWord();
    }
    public void createWord() throws Exception{
    	//生成文档
    	XWPFDocument doc = new XWPFDocument();
    	//生成段落
    	XWPFParagraph pt1 = doc.createParagraph();
    	pt1.setAlignment(ParagraphAlignment.CENTER);
    	pt1.setVerticalAlignment(TextAlignment.TOP);
    	
    	XWPFRun title=pt1.createRun();
    	title.setBold(true);
    	title.setFontSize(18);
    	title.setText("建设单位名称");
    	title.addBreak();
    	title.setText("项目名称");
    	//一、
    	XWPFParagraph pt2 = doc.createParagraph();
    	pt2.setAlignment(ParagraphAlignment.LEFT);
    	pt2.setIndentationFirstLine(600);
    	
    	XWPFRun t2=pt2.createRun();
    	t2.setBold(true);
    	t2.setFontSize(16);
    	t2.setText("一、项目建设单位基本情况");

    	XWPFParagraph pc2 = doc.createParagraph();
    	pc2.setAlignment(ParagraphAlignment.LEFT);
    	pc2.setIndentationFirstLine(600);
    	
    	XWPFRun c2=pc2.createRun();
    	c2.setBold(false);
    	c2.setFontSize(16);
    	c2.setText("建设单位名称");

    	//二、
    	XWPFParagraph pt3 = doc.createParagraph();
    	pt3.setAlignment(ParagraphAlignment.LEFT);
    	pt3.setIndentationFirstLine(600);
    	
    	XWPFRun t3=pt3.createRun();
    	t3.setBold(true);
    	t3.setFontSize(16);
    	t3.setText("二、项目基本情况");

    	XWPFParagraph pc3 = doc.createParagraph();
    	pc3.setAlignment(ParagraphAlignment.LEFT);
    	pc3.setIndentationFirstLine(600);
    	
    	XWPFRun c3=pc3.createRun();
    	c3.setBold(false);
    	c3.setFontSize(16);
    	c3.setText("1、建设规模及主要建设内容：${gmjjsnr}");
    	c3.addBreak();
    	c3.setText("2、项目投资：总投资${ztz}亿元，当年计划投资${ndjhtz}亿元，${dnjsnr}");
    	c3.addBreak();
    	c3.setText("3、建设地点：${szqx}占地面积${zdmj}亩。");
    	c3.addBreak();
    	c3.setText("4、建设起止年限：${qsnf}至${jsnf}。");
    	c3.addBreak();
    	c3.setText("5、预期经济效益：销售收入：${xssr}利润：${lr}税金：${sj}");
    	c3.addBreak();
    	
    	//三、
    	XWPFParagraph pt4 = doc.createParagraph();
    	pt4.setAlignment(ParagraphAlignment.LEFT);
    	pt4.setIndentationFirstLine(400);
    	
    	XWPFRun t4=pt4.createRun();
    	t4.setBold(true);
    	t4.setFontSize(16);
    	t4.setText("三、手续办理情况");

    	XWPFParagraph pc4 = doc.createParagraph();
    	pc4.setAlignment(ParagraphAlignment.LEFT);
    	pc4.setIndentationFirstLine(400);
    	
    	XWPFRun c4=pc4.createRun();
    	c4.setBold(false);
    	c4.setFontSize(16);
    	
    	c4.setText("1、立项：${lx}");
    	c4.addBreak();
    	c4.setText("2、环保：${hp}");
    	c4.addBreak();
    	c4.setText("3、规划：${gcghxk}");
    	c4.addBreak();
    	c4.setText("4、土地：${td}");
    	c4.addBreak();
    	c4.setText("5、施工：${sg}");
    	c4.addBreak();
    	c4.setText("6、林地：${ld}");
    	c4.addBreak();
    	c4.setText("7、消防：${xfxk}");
    	c4.addBreak();
    	
    	FileOutputStream out = new FileOutputStream("e://simple.docx");
    	doc.write(out);
    	out.close();
    }
    public void testWrite() throws Exception {
    	String templatePath = "E:\\simple.docx";
    	InputStream is = new FileInputStream(templatePath);
    	HWPFDocument doc = new HWPFDocument(is);
    	//把range范围内的${reportDate}替换为当前的日期
    	Range range=doc.getRange();
    	range.replaceText("${aaa}", "曾今的aaa");
    	OutputStream os = new FileOutputStream("E:\\aaa.doc");
    	//把doc输出到输出流中
    	doc.write(os);
    	closeStream(os);
    	closeStream(is);
    }
    
    public static void XmsbWordExp(Map xmxx,OutputStream out){
    	try {
    		//生成文档
        	XWPFDocument doc = new XWPFDocument();
        	//生成段落
        	XWPFParagraph pt1 = doc.createParagraph();
        	pt1.setAlignment(ParagraphAlignment.CENTER);//设置段落对齐
        	pt1.setVerticalAlignment(TextAlignment.TOP);//垂直对齐
        	//生成字段写入器
        	XWPFRun title=pt1.createRun();
        	title.setBold(true);//设置字体加粗
        	title.setFontSize(18);//设置字体大小
        	if(xmxx.get("JSDWMC")!=null&&!" ".equals(xmxx.get("JSDWMC"))&&!"null".equals(xmxx.get("JSDWMC"))){
        		title.setText(xmxx.get("JSDWMC").toString());
        		title.addBreak();
        	}
        	title.setText("项目名称");//写入
        	//一、
        	XWPFParagraph pt2 = doc.createParagraph();
        	pt2.setAlignment(ParagraphAlignment.LEFT);
        	pt2.setIndentationFirstLine(600);//设置首行缩进
        	
        	XWPFRun t2=pt2.createRun();
        	t2.setBold(true);
        	t2.setFontSize(16);
        	t2.setText("一、项目建设单位基本情况");

        	XWPFParagraph pc2 = doc.createParagraph();
        	pc2.setAlignment(ParagraphAlignment.LEFT);
        	pc2.setIndentationFirstLine(600);
        	
        	XWPFRun c2=pc2.createRun();
        	c2.setBold(false);
        	c2.setFontSize(16);
        	if(xmxx.get("JSDWMC")!=null&&!" ".equals(xmxx.get("JSDWMC"))&&!"null".equals(xmxx.get("JSDWMC"))){
        		c2.setText(xmxx.get("JSDWMC").toString());
        	}

        	//二、
        	XWPFParagraph pt3 = doc.createParagraph();
        	pt3.setAlignment(ParagraphAlignment.LEFT);
        	pt3.setIndentationFirstLine(600);
        	
        	XWPFRun t3=pt3.createRun();
        	t3.setBold(true);
        	t3.setFontSize(16);
        	t3.setText("二、项目基本情况");

        	XWPFParagraph pqk1 = doc.createParagraph();
        	pqk1.setAlignment(ParagraphAlignment.LEFT);
        	pqk1.setIndentationFirstLine(600);
        	
        	XWPFRun qk1=pqk1.createRun();
        	qk1.setBold(false);
        	qk1.setFontSize(16);
        	qk1.setText("1、建设规模及主要建设内容："+(xmxx.get("GMJJSNR")==null?" ":xmxx.get("GMJJSNR")));

        	XWPFParagraph pqk2 = doc.createParagraph();
        	pqk2.setAlignment(ParagraphAlignment.LEFT);
        	pqk2.setIndentationFirstLine(600);
        	
        	XWPFRun qk2=pqk2.createRun();
        	qk2.setBold(false);
        	qk2.setFontSize(16);
        	qk2.setText("2、项目投资：总投资"+(xmxx.get("ZTZ")==null?" ":xmxx.get("ZTZ"))+"亿元，当年计划投资"+(xmxx.get("NDJHTZ")==null?" ":xmxx.get("NDJHTZ"))+"亿元，"+(xmxx.get("DNJSNR")==null?" ":xmxx.get("DNJSNR")));
        	
        	XWPFParagraph pqk3 = doc.createParagraph();
        	pqk3.setAlignment(ParagraphAlignment.LEFT);
        	pqk3.setIndentationFirstLine(600);
        	
        	XWPFRun qk3=pqk3.createRun();
        	qk3.setBold(false);
        	qk3.setFontSize(16);
        	qk3.setText("3、建设地点："+(xmxx.get("SZQX")==null?" ":xmxx.get("SZQX"))+"，占地面积 "+(xmxx.get("ZDMJ")==null?" ":xmxx.get("ZDMJ"))+" 亩。");
        	
        	XWPFParagraph pqk4 = doc.createParagraph();
        	pqk4.setAlignment(ParagraphAlignment.LEFT);
        	pqk4.setIndentationFirstLine(600);
        	
        	XWPFRun qk4=pqk4.createRun();
        	qk4.setBold(false);
        	qk4.setFontSize(16);
        	qk4.setText("4、建设起止年限："+(xmxx.get("QSNF")==null?" ":xmxx.get("QSNF"))+"至"+(xmxx.get("JSNF")==null?" ":xmxx.get("JSNF"))+"。");
        	
        	XWPFParagraph pqk5 = doc.createParagraph();
        	pqk5.setAlignment(ParagraphAlignment.LEFT);
        	pqk5.setIndentationFirstLine(600);
        	
        	XWPFRun qk5=pqk5.createRun();
        	qk5.setBold(false);
        	qk5.setFontSize(16);
        	qk5.setText("5、预期经济效益：销售收入："+(xmxx.get("XSSR")==null?" ":xmxx.get("XSSR"))+"，利润："+(xmxx.get("LR")==null?" ":xmxx.get("LR"))+"，税金："+(xmxx.get("SJ")==null?" ":xmxx.get("SJ"))+" ");
        	
        	//三、
        	String qk=" ";
        	XWPFParagraph pt4 = doc.createParagraph();
        	pt4.setAlignment(ParagraphAlignment.LEFT);
        	pt4.setIndentationFirstLine(600);
        	
        	XWPFRun t4=pt4.createRun();
        	t4.setBold(true);
        	t4.setFontSize(16);
        	t4.setText("三、手续办理情况");

        	XWPFParagraph psx1 = doc.createParagraph();
        	psx1.setAlignment(ParagraphAlignment.LEFT);
        	psx1.setIndentationFirstLine(600);
        	
        	XWPFRun sx1=psx1.createRun();
        	sx1.setBold(false);
        	sx1.setFontSize(16);
        	if(xmxx.get("LXSFBJ")==null){
        		qk="未办结，"+(xmxx.get("LXJZQK")==null?" ":xmxx.get("LXJZQK"));
        	}else{
        		qk="已办结，手续文号："+(xmxx.get("LXSXWH")==null?" ":xmxx.get("LXSXWH"));
        	}
        	sx1.setText("1、立项："+qk);
        	
        	XWPFParagraph psx2 = doc.createParagraph();
        	psx2.setAlignment(ParagraphAlignment.LEFT);
        	psx2.setIndentationFirstLine(600);
        	
        	XWPFRun sx2=psx2.createRun();
        	sx2.setBold(false);
        	sx2.setFontSize(16);
        	if(xmxx.get("HPSFBJ")==null){
        		qk="未办结，"+(xmxx.get("HPJZQK")==null?" ":xmxx.get("HPJZQK"));
        	}else{
        		qk="已办结，手续文号："+(xmxx.get("HPSXWH")==null?" ":xmxx.get("HPSXWH"));
        	}
        	sx2.setText("2、环保："+qk);
        	
        	XWPFParagraph psx3 = doc.createParagraph();
        	psx3.setAlignment(ParagraphAlignment.LEFT);
        	psx3.setIndentationFirstLine(600);
        	
        	XWPFRun sx3=psx3.createRun();
        	sx3.setBold(false);
        	sx3.setFontSize(16);
        	if(xmxx.get("GCGHXKSFBJ")==null){
        		qk="未办结，"+(xmxx.get("GCGHXKJZQK")==null?" ":xmxx.get("GCGHXKJZQK"));
        	}else{
        		qk="已办结，手续文号："+(xmxx.get("GCGHXKSXWH")==null?" ":xmxx.get("GCGHXKSXWH"));
        	}
        	sx3.setText("3、规划："+qk);
        	
        	XWPFParagraph psx4 = doc.createParagraph();
        	psx4.setAlignment(ParagraphAlignment.LEFT);
        	psx4.setIndentationFirstLine(600);
        	
        	XWPFRun sx4=psx4.createRun();
        	sx4.setBold(false);
        	sx4.setFontSize(16);
        	if(xmxx.get("TDSFBJ")==null){
        		qk="未办结，"+(xmxx.get("TDJZQK")==null?" ":xmxx.get("TDJZQK"));
        	}else{
        		qk="已办结，手续文号："+(xmxx.get("TDSXWH")==null?" ":xmxx.get("TDSXWH"));
        	}
        	sx4.setText("4、土地："+qk);
        	
        	XWPFParagraph psx5 = doc.createParagraph();
        	psx5.setAlignment(ParagraphAlignment.LEFT);
        	psx5.setIndentationFirstLine(600);
        	
        	XWPFRun sx5=psx5.createRun();
        	sx5.setBold(false);
        	sx5.setFontSize(16);
        	if(xmxx.get("SGSFBJ")==null){
        		qk="未办结，"+(xmxx.get("SGJZQK")==null?" ":xmxx.get("SGJZQK"));
        	}else{
        		qk="已办结，手续文号："+(xmxx.get("SGSXWH")==null?" ":xmxx.get("SGSXWH"));
        	}
        	sx5.setText("5、施工："+qk);
        	
        	XWPFParagraph psx6 = doc.createParagraph();
        	psx6.setAlignment(ParagraphAlignment.LEFT);
        	psx6.setIndentationFirstLine(600);
        	
        	XWPFRun sx6=psx6.createRun();
        	sx6.setBold(false);
        	sx6.setFontSize(16);
        	if(xmxx.get("LDSFBJ")==null){
        		qk="未办结，"+(xmxx.get("LDJZQK")==null?" ":xmxx.get("LDJZQK"));
        	}else{
        		qk="已办结，手续文号："+(xmxx.get("LDSXWH")==null?" ":xmxx.get("LDSXWH"));
        	}
        	sx6.setText("6、林地："+qk);
        	
        	XWPFParagraph psx7 = doc.createParagraph();
        	psx7.setAlignment(ParagraphAlignment.LEFT);
        	psx7.setIndentationFirstLine(600);
        	
        	XWPFRun sx7=psx7.createRun();
        	sx7.setBold(false);
        	sx7.setFontSize(16);
        	if(xmxx.get("XFXKSFBJ")==null){
        		qk="未办结，"+(xmxx.get("XFXKJZQK")==null?" ":xmxx.get("XFXKJZQK"));
        	}else{
        		qk="已办结，手续文号："+(xmxx.get("XFXKSXWH")==null?" ":xmxx.get("XFXKSXWH"));
        	}
        	sx7.setText("7、消防："+qk);
        	
        	doc.write(out);
        	out.close();
        	
    		//把doc输出到输出流中
    		doc.write(out);
    		closeStream(out);
		} catch (Exception e) {
			// TODO: handle exception
		}
    }
    
    /**
     * 关闭输入流
     * @param is
     */
    private static void closeStream(InputStream is) {
    	if (is != null) {
    		try {
    			is.close();
    		} catch (IOException e) {
    			e.printStackTrace();
    		}
    	}
    }
    
    /**
     * 关闭输出流
     * @param os
     */
    private static void closeStream(OutputStream os) {
    	if (os != null) {
    		try {
    			os.close();
    		} catch (IOException e) {
    			e.printStackTrace();
    		}
    	}
    }
    
}
