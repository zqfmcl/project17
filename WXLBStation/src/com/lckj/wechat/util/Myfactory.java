package com.lckj.wechat.util;

import java.io.InputStream;
import java.util.Properties;
import java.util.ResourceBundle;
/**
 * properties文件读取模块
 * @author 崔皓然 2017-3-14
 *
 */
public class Myfactory {
	public static String user;
	public static String pwd;
	static {
		ResourceBundle rsb=ResourceBundle.getBundle("connection");
		user=rsb.getString("user");
		pwd=rsb.getString("pwd");
	}
	public static void main(String[] args) {
		System.out.println(user+" "+pwd);
	}
}
