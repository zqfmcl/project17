package com.lzcb.bigitem.servlet;

import java.awt.Rectangle;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.Collection;
import java.util.Date;
import java.util.Iterator;
import java.util.Properties;
import java.util.Random;
import java.util.UUID;

import javax.imageio.ImageIO;
import javax.imageio.ImageReadParam;
import javax.imageio.ImageReader;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.lzcb.bigitem.Entity.FuJian;
import com.lzcb.bigitem.Entity.Xmddgl;
import com.lzcb.bigitem.utils.BeanRefUtil;
import com.lzcb.bigitem.utils.DbHelper;
import com.lzcb.bigitem.utils.FileUADHelper;
@MultipartConfig
public class UploadServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
    
    public UploadServlet() {
        super();
    }
    
    @Override
    public void destroy() {
        // TODO Auto-generated method stub
        super.destroy();
    }

    @Override
    public void init() throws ServletException {
        // TODO Auto-generated method stub
        super.init();
    }



    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        request.setCharacterEncoding("UTF-8");
        
        InputStream proIn = getClass().getClassLoader().getResourceAsStream("uploadConfig.properties");
        Properties properties = new Properties();
        properties.load(proIn);
        
        //String fileSystemPath = properties.getProperty("fileSystemPath");//系统根路径
        String savePath = request.getSession().getServletContext()
				.getRealPath("/WEB-INF/upload");
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
        String ymd = sdf.format(new Date());
        
        String filePath = "upload" + "/" + ymd;
        //String savePath = fileSystemPath + "/" + filePath;
        System.out.println("QQQ"+savePath);
        String id=DbHelper.queryForString("select seq_bi_xmddgl.nextval from dual");
        Xmddgl xd=new Xmddgl();
        System.out.println("YYY"+request.getParameter("ddid"));
        String ddid=request.getParameter("ddid");
        System.out.println("zzz"+ddid);
        //创建文件夹
        File saveDir = new File(savePath);
        if(!saveDir.exists()){
            saveDir.mkdirs();
        }
        Collection<Part> parts = request.getParts();
        System.out.println(parts);
        for(Part part : parts){
            String contentDisposition = part.getHeader("content-disposition");
            String fileName = getFileName(contentDisposition);
            //System.out.println(fileName);
            
    		
            if(fileName.equals("")){
                continue;
            }else{
                String suffix = fileName.substring(fileName.lastIndexOf(".")+1);
                SimpleDateFormat sdf1 = new SimpleDateFormat("yyyyMMddhhmmss");
                //String saveFileName = fileName + "-" + sdf1.format(new Date()) + "-" + new Random().nextInt(1000) + "." + suffix;
                FuJian fj=new FuJian();
                fj.setSsbm("bi_xmddgl");
                fj.setSsjldm(ddid);
                fj.setSsjlzd("xmjztp");
                fj.setWjmc(fileName);
                fileName = mkFileName(fileName);
                fj.setSjmc(fileName);
                String savePathStr = mkFilePath(savePath, fileName);
                //System.out.println("保存路径为:" + savePathStr);
                fj.setWjlj(savePathStr);
                
                xd.setId(id);
                String sql=BeanRefUtil.makeInsertSQLForBean(fj, "fujian", true);
        		System.out.println("nnn"+sql);
        		part.write(savePathStr + "/" + fileName);
        		DbHelper.update(sql);
                System.out.println("xxx"+part);
            }
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    public String getFileName(String contentDisposition){
        String[] strArr1 = contentDisposition.split(";");
        if(strArr1.length < 3){
            return "";
        }else{
            String[] strArr2 = strArr1[2].split("=");
            String fileName = strArr2[1];
            fileName = fileName.replaceAll("\"", "");//把双引号去除掉
            return fileName;
         }
        
    } 
    private void imageProcess(String filename, String ext, InputStream is) throws IOException {
		Iterator<ImageReader> irs = ImageIO.getImageReadersByFormatName(ext);
		ImageReader ir = irs.hasNext()?irs.next():null;
		if(ir == null) 
			return;
		ir.setInput(ImageIO.createImageInputStream(is));//必须转换为ImageInputStream，否则异常
		
		ImageReadParam rp = ir.getDefaultReadParam();
		Rectangle rect = new Rectangle(0,0,200,200);
		rp.setSourceRegion(rect);
		
		int imageNum = ir.getNumImages(true);//allowSearch必须为true，否则有些图片格式imageNum为-1。
		
		System.out.println("imageNum:" + imageNum);
		
		for(int imageIndex = 0;imageIndex < imageNum;imageIndex++){
			BufferedImage bi = ir.read(imageIndex,rp);
			ImageIO.write(bi, ext, new File(getClass().getResource("/").getPath()+filename));
		}
	}
    private static String mkFileName(String fileName) {
		return UUID.randomUUID().toString() + "_" + fileName;
	}
	/**
	 * 生成文件实际保存路径
	 * @param savePath
	 * @param fileName
	 * @return
	 */
	private static String mkFilePath(String savePath, String fileName) {
		// 得到文件名的hashCode的值，得到的就是filename这个字符串对象在内存中的地址
		int hashcode = fileName.hashCode();
		int dir1 = hashcode & 0xf;
		int dir2 = (hashcode & 0xf0) >> 4;
		// 构造新的保存目录
		String dir = savePath + "/" + dir1 + "/" + dir2;
		// File既可以代表文件也可以代表目录
		File file = new File(dir);
		if (!file.exists()) {
			file.mkdirs();
		}
		return dir;
	}
	/**
	 * 数据库添加附件信息记录
	 * @param fj
	 * @return
	 */
	private static boolean addFj(FuJian fj){
		return DbHelper.update("insert into fujian values(seq_fujian.nextval,'"+fj.getWjmc()+"','"+fj.getSsbm()+"',"+fj.getSsjldm()+",'"+fj.getWjlj()+"','"+fj.getSjmc()+"','','"+fj.getSsjlzd()+"')");
	}

}
