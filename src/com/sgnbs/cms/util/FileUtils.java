package com.sgnbs.cms.util;

import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLConnection;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;

public class FileUtils {
	/**
	 * 检测网络资源是否存在
	 * 
	 * @param strUrl
	 * @return
	 */
	public static boolean isNetFileAvailable(String strUrl) {
		InputStream netFileInputStream = null;
		try {
			URL url = new URL(strUrl);
			URLConnection urlConn = url.openConnection();
			netFileInputStream = urlConn.getInputStream();
			if (null != netFileInputStream) {
				return true;
			} else {
				return false;
			}
		} catch (IOException e) {
			return false;
		} finally {
			try {
				if (netFileInputStream != null)
					netFileInputStream.close();
			} catch (IOException e) {
			}
		}
	}

/*	public static void main(String[] args) {
//		String url = "http://resource.yjdlq.net/image/14816160682047328.jpg";
		String url = "http://resource.yjdlq.net/image/chongzk.jpg";
		if(isNetFileAvailable(url)) {
			System.out.println("ok");
		}
		else {
			System.out.println("bad");
		}
	}*/
	
	public static void main(String[] args) {
		Map allList = getAllFiles("E:/cmwork/eova/webapp/static/ftpUpload","20170212");
	}
	
	public static Map getAllFiles(String path,String begin) 
	{
		
		Map returnMap = new HashMap();
		
		List allfileList = new ArrayList();
		 File file = new File(path);
	        if (file.exists()) {
	            File[] files = file.listFiles();
	            if (files.length == 0) {
	                System.out.println("文件夹是空的!");
	                return null;
	            } else {
	                for (int i=0;i<files.length;i++) {
	                	File file2 = files[i];
	                    if (file2.isDirectory()) {
	                        System.out.println("文件夹:" + file2.getAbsolutePath());
	                        //getAllFiles(file2.getAbsolutePath());
	                    } else {
	                    	
	                    	try{
	                    		String createTime = createTime(file2);
		                    	String time = formatTime(createTime);
		                    	if(!time.equals(begin))
		                    	{
		                    		continue;
		                    	}
		                    	Map fileMap = new HashMap();
//		                        long bitime = Long.valueOf(formatTime(createTime(file2))) ;
//		                        fileMap.put("longTime",  bitime);
		                        fileMap.put("filekey", i);
		                        //fileMap.put("filePath", file2.getAbsolutePath());
		                        fileMap.put("filePath", "/static/ftpUpload/"+file2.getName());
		                        fileMap.put("fileName",  file2.getName());
		                        fileMap.put("fileSize",  convertFileSize(file2.length()));
		                        fileMap.put("createTime",createTime);
//		                        fileMap.put("lastTime",  getFilelastTime(file2));
		                        allfileList.add(fileMap);
	                    	}
	                    	catch(Exception e)
	                    	{
	                    		allfileList = new ArrayList();
	                    		returnMap.put("fileList", allfileList);
	                   	     	returnMap.put("code", "201");
	                   	     	returnMap.put("msg", "FTP文件夹中："+file2.getName()+"文件名不规范或文件异常，请对该文件重新上传");
	                   	     	return returnMap;
	                    	}
	                    	
	                    }
	                }
	            }
	        } else {
	            System.out.println("文件不存在!");
	        }
	     returnMap.put("fileList", allfileList);
	     returnMap.put("code", "200");
	     return returnMap;   
	}
	
	public static String formatTime(String strs)
	{
		String[] str = strs.split(" ");
	    String[] time = str[0].split("/");
	    StringBuffer bf = new StringBuffer();
	    bf.append(time[0]);
	    bf.append(time[1]);
	    bf.append(time[2]);
	    
//	    String[] times = str[1].split(":");
//	    bf.append(times[0]);
//	    bf.append(times[1]);
		return bf.toString();
	}
	
	
	public static String createTime(File _file)
	{
		File file = _file;
		try {
			Process ls_proc = Runtime.getRuntime().exec("cmd.exe /c dir " + file.getAbsolutePath() + " /tc");
			BufferedReader br = new BufferedReader(new InputStreamReader(ls_proc.getInputStream()));
			for (int i = 0; i < 5; i++) {
				br.readLine();
			}
			String stuff = br.readLine();
			StringTokenizer st = new StringTokenizer(stuff);
			String dateC = st.nextToken();
			String time = st.nextToken();
			String datetime = dateC+" "+time;
			br.close();
			return datetime;
		} catch (Exception e) {
			return null;
		}
	}
	
	public static String getFilelastTime(File file2)
	{
		Calendar cal = Calendar.getInstance();  
        long time = file2.lastModified();  
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");         
        cal.setTimeInMillis(time);    
		return formatter.format(cal.getTime());  
	}
	
	
	public static String convertFileSize(long size) {
        long kb = 1024;
        long mb = kb * 1024;
        long gb = mb * 1024;
 
        if (size >= gb) {
            return String.format("%.1f GB", (float) size / gb);
        } else if (size >= mb) {
            float f = (float) size / mb;
            return String.format(f > 100 ? "%.0f MB" : "%.1f MB", f);
        } else if (size >= kb) {
            float f = (float) size / kb;
            return String.format(f > 100 ? "%.0f KB" : "%.1f KB", f);
        } else
            return String.format("%d B", size);
    }
}
