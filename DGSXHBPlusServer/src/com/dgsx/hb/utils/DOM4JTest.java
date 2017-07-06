package com.dgsx.hb.utils;

import java.io.File;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.dom4j.Attribute;
import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;
import org.dom4j.io.SAXReader;


public class DOM4JTest {
	/**
	 * @param args
	 */
	public static void main(String[] args) {
		String text = "<csdn></csdn>";          
        try {
			Document document = DocumentHelper.parseText(text);
			Element root=document.getRootElement();
			System.out.println(root.getName());
		} catch (DocumentException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
       // 1.取得某节点下的某属性    Element root=document.getRootElement();        //属性名name  
    //    Attribute attribute=root.attribute("id");  
  // 2.取得属性的文字  
  // String text=attribute.getText();  
  // 3.删除某属性 Attribute attribute=root.attribute("size"); root.remove(attribute);  
 //  4.遍历某节点的所有属性     
//     Element root=document.getRootElement();        
//      for(Iterator it=root.attributeIterator();it.hasNext();){          
//          Attribute attribute = (Attribute) it.next();           
//          String text=attribute.getText();          
//          System.out.println(text);    
// }  
	}
	public static void duwenjian(){
		// 解析books.xml文件
				// 创建SAXReader的对象reader
				SAXReader reader = new SAXReader();
				try {
					// 通过reader对象的read方法加载books.xml文件,获取docuemnt对象。
					Document document = reader.read(new File("src/com/dgsx/hb/utils/a.xml"));
					// 通过document对象获取根节点bookstore
					Element bookStore = document.getRootElement();
					// 通过element对象的elementIterator方法获取迭代器
					Iterator it = bookStore.elementIterator();
					// 遍历迭代器，获取根节点中的信息（书籍）
					while (it.hasNext()) {
						System.out.println("=====开始遍历某一本书=====");
						Element book = (Element) it.next();
						// 获取book的属性名以及 属性值
						List<Attribute> bookAttrs = book.attributes();
						for (Attribute attr : bookAttrs) {
							System.out.println("属性名：" + attr.getName() + "--属性值："
									+ attr.getValue());
						}
						Iterator itt = book.elementIterator();
						while (itt.hasNext()) {
							Element bookChild = (Element) itt.next();
							System.out.println("节点名：" + bookChild.getName() + "--节点值：" + bookChild.getStringValue());
						}
						System.out.println("=====结束遍历某一本书=====");
					}
				} catch (DocumentException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
	}
}
