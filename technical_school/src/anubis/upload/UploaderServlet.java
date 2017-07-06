package anubis.upload;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.FileUtils;

import school.date.NRYtransform.Tool;

/**
 * @项目名称: plupload   
 * @类名称: UploaderServlet   
 * @类描述: 上传后台处理 
 * @创建人: serical
 * @创建时间: 2015-9-18 下午4:21:14   
 * @修改人: serical 
 * @修改时间: 2015-9-18 下午4:21:14   
 * @修改备注:   
 * @version: 1.0
 */
public class UploaderServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
	String repositoryPath;
	String uploadPath;

	/**
	 * 上传处理
	 * @方法名:doPost 
	 * @参数:@param request
	 * @参数:@param response
	 * @参数:@throws ServletException
	 * @参数:@throws IOException 
	 * @see javax.servlet.http.HttpServlet#doPost(javax.servlet.http.HttpServletRequest, javax.servlet.http.HttpServletResponse)
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		Integer schunk = null;//分割块数
		Integer schunks = null;//总分割数
		String name = null;//文件名
		BufferedOutputStream outputStream=null; 
		if (ServletFileUpload.isMultipartContent(request)) {
			try {
				DiskFileItemFactory factory = new DiskFileItemFactory();
				factory.setSizeThreshold(1024);
				factory.setRepository(new File(repositoryPath));//设置临时目录
				ServletFileUpload upload = new ServletFileUpload(factory);
				upload.setHeaderEncoding("UTF-8");
				upload.setSizeMax(1024 * 1024 * 1024);//设置文件最大值
				List<FileItem> items = upload.parseRequest(request);
				//生成新文件名
				String newFileName = null;
				for (FileItem item : items) {
					if (!item.isFormField()) {// 如果是文件类型
						
						name=item.getName();//获取文件名，比如1.txt
						String filenametemp=name.substring(name.lastIndexOf("\\")+1,name.lastIndexOf("."));
						String fileextension=name.substring(name.lastIndexOf("."),name.length());						
						newFileName=filenametemp+"-"+Tool.getNowtime()+fileextension;
												
						if (name != null) {
							String nFname = newFileName;
							if (schunk != null) {
								nFname = schunk + "_" + name;
							}
							File savedFile = new File(uploadPath, nFname);
							item.write(savedFile);
						}
					} else {
						//判断是否带分割信息
						if (item.getFieldName().equals("chunk")) {
							schunk = Integer.parseInt(item.getString());
						}
						if (item.getFieldName().equals("chunks")) {
							schunks = Integer.parseInt(item.getString());
						}
						if (item.getFieldName().equals("fileName")) {
							//System.out.println(item.getString());
						}
					}
				}
				
				if (schunk != null && schunk + 1 == schunks) {
					outputStream = new BufferedOutputStream(new FileOutputStream(new File(uploadPath, newFileName)));
					//遍历文件合并
					for (int i = 0; i < schunks; i++) {
						File tempFile=new File(uploadPath,i+"_"+name);
						byte[] bytes=FileUtils.readFileToByteArray(tempFile);  
						outputStream.write(bytes);
						outputStream.flush();
						tempFile.delete();
					}
					outputStream.flush();
				}
				response.getWriter().write("{\"status\":true,\"newName\":\""+newFileName+"\"}");
			} catch (FileUploadException e) {
				e.printStackTrace();
				response.getWriter().write("{\"status\":false}");
			} catch (Exception e) {
				e.printStackTrace();
				response.getWriter().write("{\"status\":false}");
			}finally{  
	            try {  
	            	if(outputStream!=null)
	            		outputStream.close();  
	            } catch (IOException e) {  
	                e.printStackTrace();  
	            }  
	        }   
		}
	}

	@Override
	public void init(ServletConfig config) throws ServletException {
		repositoryPath = FileUtils.getTempDirectoryPath();
		uploadPath = config.getServletContext().getRealPath(config.getInitParameter("uploadPath"));
		File up = new File(uploadPath);
		if(!up.exists()){
			up.mkdir();
		}
	}
}
