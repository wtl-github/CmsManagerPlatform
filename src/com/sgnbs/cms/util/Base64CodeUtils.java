package com.sgnbs.cms.util;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;

public class Base64CodeUtils {

	public static String encode(String filePath) {
		String encodeBase64 = "";
		try {
			FileInputStream fis = new FileInputStream(filePath);
			byte[] bytes = new byte[fis.available()];
			fis.read(bytes);
			encodeBase64 = new String(Base64Coder.encode(bytes));
			fis.close();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return encodeBase64;
	}

	public static byte[] decode(String contentBase64) {
		try {
			byte[] base64Byte = Base64Coder.decode(contentBase64);
			return base64Byte;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	public static boolean decodeByteForFile(byte[] base64Byte, String saveFilePath) {
		FileOutputStream out;
		try {
			out = new FileOutputStream(saveFilePath, false);
			out.write(base64Byte);
			out.close();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return true;
	}
}
