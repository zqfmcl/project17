package school.upfile.wordtoswf;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
/**
 * 功能：开启openoffice服务
 * 使用方法：直接生成该类对象
 * *****由于本机openoffice安装路径不同，需要更改openoffice的安装路径
 * @author botao
 *
 */
public class JavaCallOpenoffice {

	public JavaCallOpenoffice(String src) {
		Runtime rn=Runtime.getRuntime();
		@SuppressWarnings("unused")
		Process p=null;
		 File file=new File(src);
		 if (false==file.exists()) {
			 System.out.println(".....");
			 try {
				FileWriter writer=new FileWriter(src);
				writer.write("@echo  off ");
				writer.write("\r\n ");
				writer.write("C:");
				writer.write("\r\n ");
				//D:\\Program Files\\OpenOffice 4\\program： openoffice的安装路径路径
				writer.write("cd C:\\Program Files\\OpenOffice 4\\program");
				writer.write("\r\n ");
				writer.write("soffice -headless -accept="+"socket,host=127.0.0.1,port=8100;urp;"+" -nofirststartwizard");
				writer.write("\r\n ");
				writer.close();
			}
			 catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			 
			
		}
		 try {
			 String command="cmd.exe /C "+src;
				p = rn.exec(command);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	}
}