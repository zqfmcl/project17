package school.upfile.wordtoswf;

import java.io.BufferedInputStream;

import java.io.File;

import java.io.IOException;

import java.io.InputStream;

import com.artofsolving.jodconverter.DocumentConverter;

import com.artofsolving.jodconverter.openoffice.connection.OpenOfficeConnection;

import com.artofsolving.jodconverter.openoffice.connection.SocketOpenOfficeConnection;

import com.artofsolving.jodconverter.openoffice.converter.OpenOfficeDocumentConverter;

 

/*

 * doc docx格式转换

 * @author Administrator

 */

public class DocConverter {

    private static final int environment=1;//环境1：windows 2:linux(涉及pdf2swf路径问题)

    private String fileString;

    private String outputPath="";//输入路径，如果不设置就输出在默认位置

    private String fileName;

    private File pdfFile;

    private File swfFile;

    private File docFile;
    private String src;

   

    public DocConverter(String fileString,String batsrc)

    {

        ini(fileString);
        src=batsrc;

    }

   

    /*

     * 重新设置 file

     * @param fileString

     */

    public void setFile(String fileString)

    {

        ini(fileString);

    }

   

    /*

     * 初始化

     * @param fileString

     */

    private void ini(String fileString)

    {

        this.fileString=fileString;

        fileName=fileString.substring(0,fileString.lastIndexOf("."));

        docFile=new File(fileString);

        pdfFile=new File(fileName+".pdf");

        swfFile=new File(fileName+".swf");

    }

   

    /*

     * 转为PDF

     * @param file

     */

    private void doc2pdf() throws Exception

    {

        if(docFile.exists())

        {

            if(!pdfFile.exists())

            {
            	 //String command = "C:/Program Files (x86)/OpenOffice 4/program/soffice.exe -headless -accept=\"socket,host=127.0.0.1,port=8100;urp;\"";  
            	// String command = "C:/Program Files/OpenOffice 4/program/soffice -headless -accept=\"socket,host=127.0.0.1,port=8100;urp;\"";

            	 //command=command.replaceAll("%20", " ");  
            	// Process p = Runtime.getRuntime().exec(command);
            	JavaCallOpenoffice callOpenoffice=new JavaCallOpenoffice(src);

                 OpenOfficeConnection connection = new SocketOpenOfficeConnection("127.0.0.1", 8100);

                try

                {

                    connection.connect();

                    DocumentConverter converter=new OpenOfficeDocumentConverter(connection);

                    converter.convert(docFile,pdfFile);

                    //close the connection

                    connection.disconnect();
                    
                   // p.destroy();
                    DistorySoffice.turnoffSoffice();

                    if (docFile.exists()) {
                    	if(docFile.delete()==true){
    						System.out.println("删除成功");
                    	}
                    	else {
							System.out.println("删除失败");
						}
					}
                    System.out.println("****pdf转换成功，PDF输出："+pdfFile.getPath()+"****");

                }

                catch(java.net.ConnectException e)

                {

                    //ToDo Auto-generated catch block

                    e.printStackTrace();

                    System.out.println("****swf转换异常，openoffice服务未启动！****");

                    throw e;

                }

                catch(com.artofsolving.jodconverter.openoffice.connection.OpenOfficeException e)

                {

                    e.printStackTrace();

                    System.out.println("****swf转换器异常，读取转换文件失败****");

                    throw e;

                }

                catch(Exception e)

                {

                    e.printStackTrace();

                    throw e;

                }

            }

            else

            {

                System.out.println("****已经转换为pdf，不需要再进行转化****");

            }

        }

        else

        {

            System.out.println("****swf转换器异常，需要转换的文档不存在，无法转换****");

        }

    }

   

    /*

     * 转换成swf

     */

    private void pdf2swf() throws Exception

    {

        Runtime r=Runtime.getRuntime();

        if(!swfFile.exists())

        {

            if(pdfFile.exists())

            {

                if(environment==1)//windows环境处理

                {

                    try {
                        Process p=r.exec("D:\\SWFTools\\pdf2swf.exe "+pdfFile.getPath()+" -o "+swfFile.getPath()+" -T 9");

                        System.out.print(loadStream(p.getInputStream()));
                       // System.out.println("OK");

                        System.err.print(loadStream(p.getErrorStream()));
                       // System.out.println("OK");


                        System.out.print(loadStream(p.getInputStream()));

                        System.err.println("****swf转换成功，文件输出："+swfFile.getPath()+"****");

                       if(pdfFile.exists())

                        {

                            pdfFile.delete();

                        }

                    } catch (Exception e) {

                        e.printStackTrace();

                        throw e;

                    }

                }

                

            }

            else {

                System.out.println("****pdf不存在，无法转换****");

            }

        }

        else {

            System.out.println("****swf已存在不需要转换****");

        }

    }

   

    static String loadStream(InputStream in) throws IOException

    {

        int ptr=0;

        in=new BufferedInputStream(in);

        StringBuffer buffer=new StringBuffer();

       

        while((ptr=in.read())!=-1)

        {

            buffer.append((char)ptr);

        }

        return buffer.toString();

    }

   

    /*

     * 转换主方法

     */

    public boolean conver()

    {

        if(swfFile.exists())

        {

            System.out.println("****swf转换器开始工作，该文件已经转换为swf****");

            return true;

        }

       

      

       

        try {

            doc2pdf();

            pdf2swf();

        } catch (Exception e) {

            // TODO: Auto-generated catch block

            e.printStackTrace();

            return false;

        }

       

        if(swfFile.exists())

        {

            return true;

        }

        else {

            return false;

        }

    }


}