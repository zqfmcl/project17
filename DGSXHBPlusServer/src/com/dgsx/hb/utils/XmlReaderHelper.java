package com.dgsx.hb.utils;

import java.util.Iterator;
import java.util.List;

import org.dom4j.Attribute;
import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;

/**
 * dom4j读xml工具类
 * @author 崔皓然
 * create on 2017-5-19
 */
public class XmlReaderHelper {
	/**
	 * xml的dtd文件地址
	 */
	private static String dtdurl="file:///E:/javaworkplace/DGSXHBPlusServer/WebRoot/workflow/workflow_2_8_abs.dtd";
	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		System.out.println(getStepNameById("19","WF_XSQYSQGZL"));
	}
	/**
	 * 获取流程步骤名称
	 * @param id 步骤id
	 * @param gzl
	 * @return
	 */
	public static String getStepNameById(String id,String gzl){
		String xmls=DbHelper.queryAClob("select * from os_workflowdefs where wf_name='"+gzl+"'", "WF_DEFINITION,WF_LAYOUT").get("WF_DEFINITION").toString();
		xmls=xmls.replaceFirst("PUBLIC", "SYSTEM").replaceFirst("-//Apexsoft LiveBos//DTD Workflow 2.8//EN\" \"http://www.livebos.com/workflow/workflow_2_8_abs.dtd", dtdurl);
		try {
			Document document = DocumentHelper.parseText(xmls);
			Element root=document.getRootElement();
			Element steps=root.element("steps");
			Element step=getChildByAttribute(steps,"id","19");
//			System.out.println(step.attributeValue("name"));
			return step.attributeValue("name");
		} catch (DocumentException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	/**
	 * 获取属性为某一值 的子节点
	 * @param parent
	 * @param attrName
	 * @param attrValue
	 * @return
	 */
	private static Element getChildByAttribute(Element parent,String attrName,String attrValue){
		Iterator it = parent.elementIterator();
		// 遍历迭代器，获取根节点中的信息（书籍）
		while (it.hasNext()) {
			Element c = (Element) it.next();
			// 获取book的属性名以及 属性值
			List<Attribute> bookAttrs = c.attributes();
			for (Attribute attr : bookAttrs) {
				if(attr.getName().equals(attrName)&&attr.getValue().equals(attrValue))
					return c;
			}
		}
		return null;
	}
}
