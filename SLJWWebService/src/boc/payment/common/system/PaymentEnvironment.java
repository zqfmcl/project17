package boc.payment.common.system;

import java.io.File;
import java.io.FileInputStream;
import java.util.Properties;

public class PaymentEnvironment {

	public PaymentEnvironment() {
	}

	public static void initialize(String s) throws Exception {
		head();
		try {
			String s1 = (new StringBuilder()).append(s)
					.append(File.separatorChar).append("payment.ini")
					.toString();
			System.out.println(s1);
			Properties properties = new Properties();
			properties.load(new FileInputStream(s1));
			//请求PGWPortal地址
			pgwPortalUrl = properties.getProperty("PGWPortal.url");
			//请求bocnetExpressUrl地址
			bocnetExpressUrl = properties.getProperty("BocnetExpress.url");
			//文件下载保存路径
			downloadDir = properties.getProperty("download.dir");
			//上传的文件
			uploadFile = properties.getProperty("upload.file");
			//证书信息
			signKeyFile = s + File.separatorChar + properties.getProperty("keystore.filename");
			signkeyPassword = properties.getProperty("keystore.password");
			verifyCerFile = s + File.separatorChar +  properties.getProperty("certificate.filename");
			
		} catch (Exception exception) {
			System.out.println("Failed to initialize the payment environment.");
			exception.printStackTrace();
			throw exception;
		}
	}

	private static void head() {
		System.out.println("========================================");
		System.out.println("BOC Payment Demo 1.0");
		System.out.println("========================================");
	}

 
	public static final String SYS_CONFIG_FILE = "payment.ini";
	public static String pgwPortalUrl;
	public static String bocnetExpressUrl;
	public static String signKeyFile;
	public static String signkeyPassword;
	public static String verifyCerFile;
	public static String downloadDir;
	public static String uploadFile;

}
