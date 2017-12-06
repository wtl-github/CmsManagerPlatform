package com.sgnbs.cms.util.upload;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;

import org.springframework.web.multipart.MultipartFile;

import com.sgnbs.cms.util.Config;

public class AttachUtil {
	//从前台产来MultipartFile 对象。保存文件。并返回文件对象
	public static File saveAttachFile(MultipartFile tempfile){
		String fileName = System.currentTimeMillis() + ".jpg";
		String path = Config.getProperty("imgpath");
		File file = new File(path+fileName);
		 try {
			 //保存文件
			   InputStream ins = tempfile.getInputStream();
			   OutputStream os = new FileOutputStream(file);
			   int bytesRead = 0;
			   byte[] buffer = new byte[8192];
			   while ((bytesRead = ins.read(buffer, 0, 8192)) != -1) {
			    os.write(buffer, 0, bytesRead);
			   }
			   os.close();
			   ins.close();
			  } catch (Exception e) {
			   e.printStackTrace();
			}
		 return file;
	}
}
