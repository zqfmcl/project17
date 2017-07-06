package com.lzcb.bigitem.utils;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadBase;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.ProgressListener;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.lzcb.bigitem.Entity.FuJian;

public class FileUADHelper {
	/**
	 * 文件删除实现
	 * @param request
	 * @param tablename
	 * @param tableid
	 * @param bean
	 * @param type
	 * @return
	 */
	public static Object uploadFile(HttpServletRequest request,String tablename,String tableid,Object bean,String type) {
		String savePath = request.getSession().getServletContext()
				.getRealPath("/WEB-INF/upload");
		// 上传时生成的临时文件保存目录
		String tempPath = request.getSession().getServletContext()
				.getRealPath("/WEB-INF/temp");
		
		File file = new File(tempPath);
		if (!file.exists() && !file.isDirectory()) {
			System.out.println("目录或文件不存在！");
			file.mkdir();
		}
		try {
			// 使用Apache文件上传组件处理文件上传步骤：
			// 1、创建一个DiskFileItemFactory工厂
			DiskFileItemFactory diskFileItemFactory = new DiskFileItemFactory();
			// 设置工厂的缓冲区的大小，当上传的文件大小超过缓冲区的大小时，就会生成一个临时文件存放到指定的临时目录当中。
			diskFileItemFactory.setSizeThreshold(1024 * 100);
			// 设置上传时生成的临时文件的保存目录
			diskFileItemFactory.setRepository(file);
			// 2、创建一个文件上传解析器
			ServletFileUpload fileUpload = new ServletFileUpload(
					diskFileItemFactory);
			// 解决上传文件名的中文乱码
			fileUpload.setHeaderEncoding("UTF-8");
			// 监听文件上传进度
			fileUpload.setProgressListener(new ProgressListener() {
				public void update(long pBytesRead, long pContentLength,
						int arg2) {
//					System.out.println("文件大小为：" + pContentLength + ",当前已处理："
//							+ pBytesRead);
				}
			});
			// 3、判断提交上来的数据是否是上传表单的数据
			if (!fileUpload.isMultipartContent(request)) {
				System.out.println("按照传统方式获取数据");
				// 按照传统方式获取数据
				return null;
			}
			// 设置上传单个文件的大小的最大值，目前是设置为1024*1024字节，也就是1MB
			fileUpload.setFileSizeMax(1024 * 1024 * 10);
			// 设置上传文件总量的最大值，最大值=同时上传的多个文件的大小的最大值的和，目前设置为20MB
			fileUpload.setSizeMax(1024 * 1024 * 100);
			// 4、使用ServletFileUpload解析器解析上传数据，解析结果返回的是一个List<FileItem>集合，每一个FileItem对应一个Form表单的输入项
			List<FileItem> list = fileUpload.parseRequest(request);
			Map<String, String> m=new HashMap<String, String>();
			for (FileItem item : list) {
				// 如果fileitem中封装的是普通输入项的数据
				if(item.isFormField()){
//					System.out.println(item.getFieldName());
					m.put(item.getFieldName(), item.getString("UTF-8"));
				}
				if (!item.isFormField()&&item.getName()!=null&&!"".equals(item.getName())&&!"null".equals(item.getName())) {
					// 如果fileitem中封装的是上传文件，得到上传的文件名称，
					FuJian fj=new FuJian();
					fj.setSsbm(tablename);
					fj.setSsjldm(tableid);
					fj.setSsjlzd(item.getFieldName());
					String fileName = item.getName();
					fj.setWjmc(fileName);
//					System.out.println(fileName);
					if (fileName == null || fileName.trim().equals("")) {
						continue;
					}
					// 注意：不同的浏览器提交的文件名是不一样的，有些浏览器提交上来的文件名是带有路径的，如：
					// c:\a\b\1.txt，而有些只是单纯的文件名，如：1.txt
					// 处理获取到的上传文件的文件名的路径部分，只保留文件名部分
					fileName = fileName.substring(fileName
							.lastIndexOf(File.separator) + 1);
					// 得到上传文件的扩展名
					String fileExtName = fileName.substring(fileName
							.lastIndexOf(".") + 1);
					if ("zip".equals(fileExtName) || "rar".equals(fileExtName)
							|| "tar".equals(fileExtName)
							|| "jar".equals(fileExtName)) {
						System.out.println("上传文件的类型不符合！！！");
						return null;
					}
					// 如果需要限制上传的文件类型，那么可以通过文件的扩展名来判断上传的文件类型是否合法
//					System.out.println("上传文件的扩展名为:" + fileExtName);
					// 获取item中的上传文件的输入流
					InputStream is = item.getInputStream();
					// 得到文件保存的名称
					fileName = mkFileName(fileName);
					fj.setSjmc(fileName);
					// 得到文件保存的路径
					String savePathStr = mkFilePath(savePath, fileName);
//					System.out.println("保存路径为:" + savePathStr);
					fj.setWjlj(savePathStr);
					// 创建一个文件输出流
					FileOutputStream fos = new FileOutputStream(savePathStr
							+ File.separator + fileName);
					// 创建一个缓冲区
					byte buffer[] = new byte[1024];              
					// 判断输入流中的数据是否已经读完的标识
					int length = 0;
					// 循环将输入流读入到缓冲区当中，(len=in.read(buffer))>0就表示in里面还有数据
					while ((length = is.read(buffer)) > 0) {
						// 使用FileOutputStream输出流将缓冲区的数据写入到指定的目录(savePath + "\\"
						// + filename)当中
						fos.write(buffer, 0, length);
					}
					// 关闭输入流
					is.close();
					// 关闭输出流
					fos.close();
					// 删除处理文件上传时生成的临时文件
					item.delete();
					if("update".equals(type)&&!fj.getSsjlzd().startsWith("xmjztp")){
						//查看该字段是否已存在,存在则删除
						String fjid=DbHelper.queryForString("select id from fujian where ssbm='"+fj.getSsbm()+"' and ssjldm='"+fj.getSsjldm()+"' and ssjlzd='"+fj.getSsjlzd()+"'");
						if(fjid!=null){
							DbHelper.update("delete from fujian where id="+fjid);
						}
					}
					if(!addFj(fj)){
						System.out.println("文件录入失败");
						return null;
					}
					System.out.println("文件"+fj.getSjmc()+"上传成功！");
				}
			}
			System.out.println("map:"+m.toString());
			BeanRefUtil.setFieldValue(bean, m);
			return "ok";
		} catch (FileUploadBase.FileSizeLimitExceededException e) {
			System.out.println("单个文件超出最大值！！！");
			e.printStackTrace();
			return null;
		} catch (FileUploadBase.SizeLimitExceededException e) {
			System.out.println("上传文件的总的大小超出限制的最大值！！！");
			e.printStackTrace();
			return null;
		} catch (FileUploadException e) {
			System.out.println("文件上传失败");
			e.printStackTrace();
			return null;
		} catch (IOException e) {
			e.printStackTrace();
			return null;
		}
	}
	/**
	 * 获取唯一文件名
	 * @param fileName
	 * @return
	 */
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
