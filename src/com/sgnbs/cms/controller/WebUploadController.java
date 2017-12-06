package com.sgnbs.cms.controller;

import java.io.File;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.ModelAndView;

import com.sgnbs.cms.constants.Const;
import com.sgnbs.cms.entity.Attachment;
import com.sgnbs.cms.entity.FileType;
import com.sgnbs.cms.entity.User;
import com.sgnbs.cms.entity.WebUpload;
import com.sgnbs.cms.pojo.MallOneList;
import com.sgnbs.cms.service.intf.FileTypeService;
import com.sgnbs.cms.service.intf.WebUploadService;
import com.sgnbs.cms.util.Config;

@Controller
public class WebUploadController {

	@Autowired
	private FileTypeService fileTypeService;
	
	@Autowired
	private WebUploadService webUploadService;

	@RequestMapping(value="/myFile/fileAddInit")
	public ModelAndView fileAddInit(ModelAndView mv) {
		List<FileType> fileTypeList = fileTypeService.getTypelist(null, "1"); //仅获取第一层数据
		mv.addObject("typelist", fileTypeList);
		mv.setViewName("add_text");
		return mv;
	}

	@RequestMapping(value="/myFile/fileAddInitAjax")
	@ResponseBody
	public  List<MallOneList> fileAddInitAjax(HttpServletResponse response) throws Exception{
		List<MallOneList> mallOne = fileTypeService.getThreeLevelData();
		return mallOne;
	}
	
	@RequestMapping(value="/myFile/fileadd",method=RequestMethod.POST)
	public ModelAndView fileadd(HttpServletRequest request, HttpSession session)
			throws Exception {
		String uploadName = null;
		// 将当前上下文初始化给 CommonsMutipartResolver （多部分解析器）
		CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver(
				request.getSession().getServletContext());
		// 检查form中是否有enctype="multipart/form-data"
		if (multipartResolver.isMultipart(request)) {
			List<MultipartFile> list = getMultipartFileList(request);
			if (list.size() > 0)
				uploadName = webUploadService.getUploadName(list); // 附件存到数据库
		}
		User user = (User) session.getAttribute(Const.SESSION_USER);
		String userId = user.getUserId().toString();
		Map<String, String> param = new HashMap<String, String>();
		param = getParamMap(request, userId, uploadName);
		ModelAndView mv = new ModelAndView();
		try {
			webUploadService.insertWebUpload(param);
			mv.addObject("msg","success");
		} catch (Exception e) {
			mv.addObject("msg","failed");
			e.printStackTrace();
		}
		mv.setViewName("save_result");
		return mv;
		//return "redirect:/myFile.html";
	}
	
	@RequestMapping(value = "/myFile")
	public ModelAndView fileListInit(ModelAndView mv, HttpSession session,
			WebUpload webUpload) {
		User user = (User) session.getAttribute(Const.SESSION_USER);
		webUpload.setUserId(user.getUserId().toString());
		List<WebUpload> webUploadList = webUploadService
				.listPageWebUploadByUserID(webUpload);
		mv.setViewName("my_info");
		mv.addObject("webUploadList", webUploadList);
		mv.addObject("webUpload", webUpload);
		return mv;
	}
	
	@RequestMapping(value = "/myFile/fileDel")
	public String fileDel(@RequestParam int uploadid,
			HttpServletResponse response) throws Exception {
		WebUpload webUpload = webUploadService.getWebUploadByUploadId(uploadid);
		webUploadService.updateWebUploadStatus(webUpload);
		return "redirect:/myFile.html";
	}
	
	@RequestMapping(value = "/myFile/fileDels")
	public String fileDels(@RequestParam String uploadids,
			HttpServletRequest request) {
		String[] uploadid = uploadids.split(",");
		for (int i = 0; i < uploadid.length; i++) {
			WebUpload webUpload = webUploadService
					.getWebUploadByUploadId(Integer.parseInt(uploadid[i]));
			webUploadService.updateWebUploadStatus(webUpload);
		}
		return "redirect:/myFile.html";
	}
	
	@RequestMapping(value="/myFile/fileUpdateInit")
	public ModelAndView fileUpdateInit(ModelAndView mv,@RequestParam int uploadid){
		WebUpload webUpload = webUploadService.getWebUploadByUploadId(uploadid);
		mv.addObject("webUpload", webUpload);
		List<FileType> typelist = fileTypeService.getTypelist(null, "1");
		mv.addObject("typelist", typelist);
		List<String> attachmentIds = getAttachmentIds(webUpload.getUploadName());
		List<Attachment> getAttachmentByIds = webUploadService.getAttachment(attachmentIds);
		mv.addObject("scanFileList", getAttachmentByIds);
		String uptype = webUpload.getType();
		mv.addObject("typeMap", this.getDefaultMap(uptype));
		mv.setViewName("edit");
		return mv;
	}
	
	@RequestMapping(value="/myFile/fileUpdate",method=RequestMethod.POST)
	public ModelAndView fileUpdate(HttpServletRequest request) {
		int uploadid = Integer.parseInt(request.getParameter("uploadid"));
		String selone = request.getParameter("one");
		String seltwo = request.getParameter("two");
		String selthr = request.getParameter("three");
		String title = request.getParameter("title");
		String des = request.getParameter("des");
		String keyword = request.getParameter("keyword");

		WebUpload webUpload = webUploadService.getWebUploadByUploadId(uploadid);

		String typecode = null;
		if (StringUtils.isBlank(selthr) == false)
			typecode = selthr;
		else if (StringUtils.isBlank(seltwo) == false)
			typecode = seltwo;
		else if (StringUtils.isBlank(selone) == false)
			typecode = selone;

		webUpload.setTitle(title);
		webUpload.setDes(des);
		webUpload.setKeyword(keyword);
		webUpload.setType(typecode);
		
		ModelAndView mv = new ModelAndView();
		try {
			webUploadService.updateWebUpload(webUpload);
			mv.addObject("msg","success");
		} catch (Exception e) {
			mv.addObject("msg","failed");
			e.printStackTrace();
		}
		mv.setViewName("save_result");
		return mv;
		//return "redirect:/myFile.html";
	}
	
	@RequestMapping(value="/allFile")
	public ModelAndView allFileList(HttpServletRequest request,
			WebUpload webUpload) {
		String begin = request.getParameter("startTime");
		String end = request.getParameter("endTime");
		this.setDate(webUpload,begin,end);
		
/*		String one = "";
		String two = "";
		String three = "";*/
		String one = request.getParameter("one");
		String two = request.getParameter("two");
		String three = request.getParameter("three");
		String type = null;

		if (!StringUtils.isBlank(one)) {
			if (!StringUtils.isBlank(two)) {
				if (!StringUtils.isBlank(three))
					type = three;
				else
					type = two;
			} else
				type = one;
		}
		webUpload.setType(type);
		ModelAndView mv = new ModelAndView();
		List<FileType> fileTypeList = fileTypeService.getTypelist(null, "1");
		mv.addObject("typelist", fileTypeList);
		mv.addObject("typeMap", this.getDefaultMap(type));
		List<WebUpload> webUploadList = webUploadService
				.listPageWebUpload(webUpload);
		mv.addObject("webUploadList", webUploadList);
		mv.addObject("webUpload", webUpload);
		mv.setViewName("public_info");
		return mv;
	}
	
	@RequestMapping(value="/allFile/query")
	public ModelAndView allFileQuery(ModelAndView mv,@RequestParam int uploadid){
		
		WebUpload webUpload = webUploadService.getWebUploadByUploadId(uploadid);
		//webUploadService.updateWebUploadStatus(webUpload);
		
		//FxuploadfileModel upload =  FxuploadfileModel.dao.findById(uploadid);
		mv.addObject("upload", webUpload);
		
		//User mainuser = User.dao.getByLoginId(upload.getStr("userid"));
		//setAttr("mainuser", mainuser);
		
		//Map<String,Object> typeMap = new HashMap<String,Object>();
		String uptype = webUpload.getType();
		
		mv.addObject("typeMap", this.getDefaultMap(uptype));
		
		//List<MdScanFile> scanFile = MdScanFile.dao.getFileLists(upload.getStr("uploadname")) ;
		
		List<String> attachmentIds = getAttachmentIds(webUpload.getUploadName());
		List<Attachment> getAttachmentByIds = webUploadService.getAttachment(attachmentIds);
		//List<MdScanFile> scanFile = MdScanFile.dao.getFileLists(webUpload.getStr("uploadname")) ;
		mv.addObject("scanFile", getAttachmentByIds);
		
		//setAttr("scanFile", scanFile);
		//render("/allfile/everybady/query.html");
		mv.setViewName("allListDetail");
		return mv;
	}
	
	private void setDate(WebUpload webUpload,String begin,String end){
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date startDate = null;
		Date endDate = null;
		try {
			if (StringUtils.isBlank(begin))
				webUpload.setStart(null);
			else {
				startDate = sdf.parse(begin);
				webUpload.setStart(startDate);
			}
			if (StringUtils.isBlank(end))
				webUpload.setEnd(null);
			else {
				endDate = sdf.parse(end);
				webUpload.setEnd(endDate);
			}
		} catch (ParseException e) {
			e.printStackTrace();
			webUpload.setStart(null);
			webUpload.setEnd(null);
		}
	}
	
	private List<String> getAttachmentIds(String uploadName){
		List<String> list = new ArrayList<String>();
		if(uploadName.indexOf(",")>0){
			String[] filds = uploadName.split(",");
			for(int i=0;i<filds.length;i++){
				list.add(filds[i]);
			}
		}else
			list.add(uploadName);
		return list;
	}
	
	private Map<String, Object> getDefaultMap(String uptype) {
		Map<String, Object> typeMap = new HashMap<String, Object>();
		if (!StringUtils.isBlank(uptype)) {
			typeMap = this.getTypeMap(uptype);
		} else {
			Map<String, String> typeOneMap = new HashMap<String, String>();
			typeOneMap.put("typecode", "");
			typeOneMap.put("typename", "请选择分类");
			typeMap.put("one", typeOneMap);

			Map<String, String> typeTwoMap = new HashMap<String, String>();
			typeTwoMap.put("typecode", "");
			typeTwoMap.put("typename", "请选择分类");
			typeMap.put("two", typeTwoMap);

			Map<String, String> typeThrMap = new HashMap<String, String>();
			typeThrMap.put("typecode", "");
			typeThrMap.put("typename", "请选择分类");
			typeMap.put("thr", typeThrMap);
		}
		return typeMap;
	}
	
	public Map<String, Object> getTypeMap(String uptype) {
		Map<String, Object> typeMap = new HashMap<String, Object>();
		FileType fileType = fileTypeService.getTypeSuper(uptype);
		if (uptype.length() == 4) {
			Map<String, String> typeOneMap = new HashMap<String, String>();
			typeOneMap.put("typecode", fileType.getTypeCode());
			typeOneMap.put("typename", fileType.getTypeName());
			typeMap.put("one", typeOneMap);

			Map<String, String> typeTwoMap = new HashMap<String, String>();
			typeTwoMap.put("typecode", "");
			typeTwoMap.put("typename", "请选择分类");
			typeMap.put("two", typeTwoMap);

			Map<String, String> typeThrMap = new HashMap<String, String>();
			typeThrMap.put("typecode", "");
			typeThrMap.put("typename", "请选择分类");
			typeMap.put("thr", typeThrMap);
		} else if (uptype.length() == 6) {
			Map<String, String> typeTwoMap = new HashMap<String, String>();
			typeTwoMap.put("typecode", fileType.getTypeCode());
			typeTwoMap.put("typename", fileType.getTypeName());
			typeMap.put("two", typeTwoMap);
			FileType fileTypeSuper = fileTypeService.getTypeSuper(fileType
					.getSuperCode());
			Map<String, String> typeOneMap = new HashMap<String, String>();
			typeOneMap.put("typecode", fileTypeSuper.getTypeCode());
			typeOneMap.put("typename", fileTypeSuper.getTypeName());
			typeMap.put("one", typeOneMap);

			Map<String, String> typeThrMap = new HashMap<String, String>();
			typeThrMap.put("typecode", "");
			typeThrMap.put("typename", "请选择分类");
			typeMap.put("thr", typeThrMap);
		} else if (uptype.length() == 8) {
			Map<String, String> typeThrMap = new HashMap<String, String>();
			typeThrMap.put("typecode", fileType.getTypeCode());
			typeThrMap.put("typename", fileType.getTypeName());
			typeMap.put("thr", typeThrMap);

			FileType fileTypeSuper = fileTypeService.getTypeSuper(fileType
					.getSuperCode());
			Map<String, String> typeTwoMap = new HashMap<String, String>();
			typeTwoMap.put("typecode", fileTypeSuper.getTypeCode());
			typeTwoMap.put("typename", fileTypeSuper.getTypeName());
			typeMap.put("two", typeTwoMap);

			FileType fileTypeOne = fileTypeService.getTypeSuper(fileTypeSuper
					.getSuperCode());
			Map<String, String> typeOwoMap = new HashMap<String, String>();
			typeOwoMap.put("typecode", fileTypeOne.getTypeCode());
			typeOwoMap.put("typename", fileTypeOne.getTypeName());
			typeMap.put("one", typeOwoMap);
		}
		return typeMap;
	}
	
	private List<MultipartFile> getMultipartFileList(HttpServletRequest request)
			throws Exception {
		String uploadpath = Config.getProperty("ftpPath.url");
		// 将request变成多部分request
		MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest) request;
		// 获取multiRequest 中所有的文件名
		Iterator<String> iter = multiRequest.getFileNames();
		List<MultipartFile> list = new ArrayList<MultipartFile>();
		while (iter.hasNext()) {
			// 一次遍历所有文件
			MultipartFile file = multiRequest.getFile(iter.next().toString());
			if (file != null) {
				String path = uploadpath + file.getOriginalFilename();
				file.transferTo(new File(path)); // 上传
				list.add(file);
			}
		}
		return list;
	}
	
	private Map<String, String> getParamMap(HttpServletRequest request,String userId,String uploadName){
		String selone = request.getParameter("one");
		String seltwo = request.getParameter("two");
		String selthr = request.getParameter("three");
		String title = request.getParameter("title");
		String des = request.getParameter("des");
		String keyword = request.getParameter("keyword");
		String typecode = null;
		if (StringUtils.isBlank(selthr) == false)
			typecode = selthr;
		else if (StringUtils.isBlank(seltwo) == false)
			typecode = seltwo;
		else if (StringUtils.isBlank(selone) == false)
			typecode = selone;
		Map<String, String> param = new HashMap<String, String>();
		param.put("title", title);
		param.put("des", des);
		param.put("uploadname", uploadName);
		param.put("userid", userId);
		param.put("type", typecode);
		param.put("keyword", keyword);
		return param;
	}
}
