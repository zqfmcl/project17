package school.date.NRYtransform;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

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

import school.connectDB.OperateDB;

public class NRYtransform extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	ServletContext sc;
	String attachment_savePath;
	/**
	 * Constructor of the object.
	 */
	public NRYtransform() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}
	
	
	public void init(ServletConfig config) throws ServletException {
		// Put your code here
		
		sc=config.getServletContext();
		attachment_savePath=config.getInitParameter("attachment_savePath");
		//System.out.println("web.xml閿熸枻鎷烽敓鏂ゆ嫹:"+attachment_savePath);
	}

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		
	}

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		DiskFileItemFactory factory=new DiskFileItemFactory();
		
		ServletFileUpload upload=new ServletFileUpload(factory);
		
		upload.setHeaderEncoding("ISO-8859-1");
		
		String []temp=new String[11];//閿熻姤鍌ㄩ敓鏂ゆ嫹閫氶敓锟介敓鏂ゆ嫹
		
		
		
		if(ServletFileUpload.isMultipartContent(request))//閿熷彨纭锋嫹閿熸枻鎷烽敓鏂ゆ嫹閿熸枻鎷烽敓绛嬶紝閿熸枻鎷烽敓鍙》鎷烽敓鏂ゆ嫹FileItem閿熸枻鎷烽敓鏂ゆ嫹
		{
			try {
				List<FileItem> items=upload.parseRequest(request);
				int i=-1;//缁熼敓鏂ゆ嫹閿熸枻鎷烽�氶敓锟介敓鏂ゆ嫹閿熸枻鎷�
				//int m=0;//缁熼敓鐙￠潻鎷烽敓鏂ゆ嫹閿熸枻鎷烽敓锟�
				for(FileItem item:items){
					if (item.isFormField())//閿熸枻鎷烽敓鍓跨鎷烽敓閰碉拷鎷�?閿熸枻鎷�
					{					
						i++;
						//String inputName=item.getFieldName();
						String inputValue=item.getString();
						temp[i]=new String(inputValue.getBytes("ISO-8859-1"),"UTF-8");
						//System.out.println(inputName+":"+temp[i]);
					}
					
				}
			} catch (FileUploadException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		
		String tablename=request.getParameter("tablename");//閿熸枻鎷峰彇閿熸枻鎷烽敓鏂ゆ嫹
		int tableID=Integer.parseInt(request.getParameter("tableID"));
		OperateDB o=new OperateDB();//閿熸枻鎷烽敓鏂ゆ嫹閿熸枻鎷烽敓鏂ゆ嫹閿熸枻鎷疯彉閿熸枻鎷烽敓鏂ゆ嫹
		int lastid=o.get_lastid(tablename);//閿熸枻鎷峰彇閿熺煫鎲嬫嫹閿熸枻鎷烽敓鏂ゆ嫹閿熸彮浼欐嫹閿燂拷d
		temp[0]=temp[0].replaceAll("\\s*","");//閿熸枻鎷穐tml option閿熸埅纭锋嫹閿熸枻鎷烽敓鏂ゆ嫹閿熸枻鎷烽攲宕敓楗恒儻鎷烽敓锟�
		
		
		HttpSession session=request.getSession(); 
		String swfjudge=null;
		swfjudge=session.getAttribute("UsedState").toString();
		boolean judge1=false;
		boolean judge2=true;
		String imgtemp=null;
		String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort();//获取服务器地址
		
		if (temp[10]!=null) //如果第九个输入框不为空，说明是第二种form表单
		{	
			if (swfjudge.equals("1")) //如果使用了word格式转换
			{
				temp[10]=Tool.swfShow_First(temp[10]);//替换flash显示插件
				session.invalidate();
			}
			else {
				temp[10]=Tool.swfShow_Second(temp[10]); //替换flash显示插件宽高
			}
			imgtemp=Tool.Return_img_src(temp[10]);//返回正文中第一张图片的路径
			temp[10]=Tool.Return_replace_img_src(temp[10],basePath);//把正文中的图片路径更改为带有项目名称的路径
			judge1=o.insert_article_haveTopImg(temp, lastid+1,tablename,imgtemp,tableID);//插入
		}
		else {
			if (swfjudge.equals("1")) //如果使用了word格式转换
			{
			    temp[8]=Tool.swfShow_First(temp[8]);//替换flash显示插件
				session.invalidate();
			}
			else {
				temp[8]=Tool.swfShow_Second(temp[8]);   //替换flash显示插件宽高
			}
			imgtemp=Tool.Return_img_src(temp[8]);
			temp[8]=Tool.Return_replace_img_src(temp[8],basePath);
			judge1=o.insert_article_NoTopImg(temp,lastid+1,tablename,tableID); //閿熸枻鎷烽敓鏂ゆ嫹閿熸枻鎷疯彉閿燂拷	
		}

		if(temp[5].equals("0")&&imgtemp!=null)//閿熸枻鎷烽敓閰电鎷烽敓鏂ゆ嫹鎬侀敓鏂ゆ嫹
		{
			int dynamic=o.get_lastid("Entity_GDLGL");
			if (temp[10]!=null) {
				judge2=o.insert_article_to_roll(dynamic+1,lastid+1,imgtemp,tablename,tableID,temp[7]);	
			}
			else {
				judge2=o.insert_article_to_roll(dynamic+1,lastid+1,imgtemp,tablename,tableID,temp[6]);	

			}
		}
		response.setContentType("text/html;charset=utf-8");
    	PrintWriter out=response.getWriter();  	
        if (judge2&&judge1) {
        	request.setAttribute("judge", "1");
        	request.getRequestDispatcher("/breakPage.jsp").forward(request, response);
		}
        else {
        	request.setAttribute("judge", "2");
        	request.getRequestDispatcher("/breakPage.jsp").forward(request, response);
		}
       // out.write("<script>document.parent.href ='www.baidu.com';</script>");		
        out.flush();
		out.close();
		
		o.ReleaseConn();
	}
	
	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occurs
	 */

}
