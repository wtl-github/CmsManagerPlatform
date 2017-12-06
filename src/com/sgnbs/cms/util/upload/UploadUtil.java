package com.sgnbs.cms.util.upload;

import java.io.File;
import java.util.Random;

import org.apache.commons.io.FileUtils;

public class UploadUtil {

	public static void uploadFile(File upload, String uploadPath, String fileName) throws Exception {
		File saveFile = new File(uploadPath, fileName);
		FileUtils.copyFile(upload, saveFile);
	}

	/**
	 * 文件名生成规则 System.currentTimeMillis()+4位随机数
	 * 
	 * 
	 * @return
	 */
	public static String generarteFileName() {
		return String.format("%s%s", new Object[] { System.currentTimeMillis(), random(4) });
	}

	public static String random(int length) {
		StringBuilder sb = new StringBuilder();
		Random random = new Random();
		for (int i = 0; i < length; i++) {
			sb.append(random.nextInt(10));
		}
		return sb.toString();
	}
}
