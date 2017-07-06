package upLoadFile;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.*;

import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import school.date.NRYtransform.Tool;
import school.upfile.wordtoswf.DistorySoffice;
import school.upfile.wordtoswf.DocConverter;

/**
 * 
 * @author XHW
 * 
 * @date 2011-7-26
 * 
 */
public class FileUploadServlet extends HttpServlet {

 private static final long serialVersionUID = -7744625344830285257L;
 private ServletContext sc;
 private String savePath;

 public void doGet(HttpServletRequest request, HttpServletResponse response)
   throws ServletException, IOException {
  doPost(request, response);
 }
 

 public void init(ServletConfig config) {
  // 在web.xml中设置的一个初始化参数
  savePath = config.getInitParameter("savePath");
  sc = config.getServletContext();
 }
 
 public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
  request.setCharacterEncoding("UTF-8");
  DiskFileItemFactory factory = new DiskFileItemFactory();
  ServletFileUpload upload = new ServletFileUpload(factory);
  upload.setSizeMax(500*1024*1024);//设置该次上传最大值为500M  
  String swfname=null;
  try {
   List<FileItem> items = upload.parseRequest(request);

   Iterator<FileItem> itr = items.iterator();
   while (itr.hasNext()) {
    FileItem item = (FileItem) itr.next();

    if (item.isFormField())//如果是普通表单域，返回true
    {
    } 
    else //如果是文件表单域返回false
    {
     if (item.getName() != null && !item.getName().equals("")) {
     
    	 File tempfile=new File(sc.getRealPath("/")+savePath);
		if (!tempfile.exists()) {
				tempfile.mkdir();								
		}
	      
	  /* String docname=item.getName();
	   docname=docname.substring(docname.lastIndexOf("\\")+1, docname.length()-4);*/
	   String docname=null;
	   String time=Tool.getNowtime();
	   swfname=time+".swf";
	   docname=time+".doc";
       File file = new File(sc.getRealPath("/") + savePath,docname);
      // System.out.println(file.getCanonicalPath()+"----------------------------");
       item.write(file);

      /**
       *	void write(File file)
       * 	。write方法将FileItem对象中的内容保存到某个指定的文件中。
       *	如果FileItem对象中的内容是保存在某个临时文件中，
       *	该方法完成后，临时文件可以会被删除。该方法也可以将普通表单字段保存在一个文件中，
       *	但最主要的用途是把上传的文件内容保存在本地文件系统中。
       */
      
      DocConverter docConverter=new DocConverter(file.getAbsolutePath(),sc.getRealPath("/")+"openoprenoffice.bat");
      docConverter.conver();     
      
      
      HttpSession session = request.getSession();
      
      session.setAttribute("UsedState", 1);
      
      request.setAttribute("upload.message", "上传文件成功！");
     }
     else{
      request.setAttribute("upload.message", "没有选择上传文件！");
     }
    }
   }
  }catch(FileUploadException e){
   e.printStackTrace();
  } catch (Exception e) {
   e.printStackTrace();
   request.setAttribute("upload.message", "上传文件失败！");
  }
 
  response.setContentType("text/html;charset=UTF-8");
  String callback = request.getParameter("CKEditorFuncNum");
  PrintWriter out = response.getWriter();
  out.println("<script type=\"text/javascript\">");
  out.println("window.parent.CKEDITOR.tools.callFunction(" + callback + ",'" + "/technical_school/uploads/flash/"+swfname + "',''" + ")");
  out.println("</script>");
  out.flush();
  out.close();
 
 }
}
