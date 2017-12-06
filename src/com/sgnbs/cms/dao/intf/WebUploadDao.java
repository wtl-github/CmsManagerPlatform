package com.sgnbs.cms.dao.intf;

import java.util.List;
import java.util.Map;

import com.sgnbs.cms.entity.WebUpload;

public interface WebUploadDao {
	

	List<WebUpload> listPageWebUploadByUserID(WebUpload webUpload);	
	
	List<WebUpload> listPageWebUpload(WebUpload webUpload);
	
	void insertWebUpload(Map<String,String> param);
	
	WebUpload getWebUploadByUploadId(int uploadid);
	
	void updateWebUploadStatus(WebUpload webUpload);
	
	void updateWebUpload(WebUpload webUpload);
	
//	List<WebUpload> getOcUserPointRecord(String userid);	
//	List<WebUpload> getOcUserPointRecord(Map<String,String> param);	
	
//	public Page<FxuploadfileModel> getOcUserPointRecord(int pageNum,int pageSize,String userid){
//	return super.paginate(pageNum, pageSize,
//				" select * ",
//				"from fx_uploadfile   "
//				+ "  where userid=? and state=0"
//				+ " order by systime desc "
//				, userid);
//	}
//	
//	public Page<FxuploadfileModel> getOcUserPointRecord(int pageNum,int pageSize,String title,
//			String keyword,String uptype,String begin,String end,String adminname){
//		String  str = null;
//		
//		String sql =" select s.*,q.nickname ";
//		
//		String formsql =" from fx_uploadfile s left join eova_user q on s.userid = q.login_id where  state=0 "; 
//		if(StrUtil.notBlank(title))
//		{
//			formsql += " and s.title like '%"+title+"%' ";
//		}
//		
//		if(StrUtil.notBlank(keyword))
//		{
//			formsql += " and s.keyword like '%"+keyword+"%' ";
//		}
//		
//		if(StrUtil.notBlank(uptype))
//		{
//			formsql += " and s.type like '%"+uptype+"%' ";
//		}
//		
//		if(StrUtil.notBlank(begin))
//		{
//			formsql += " and s.systime >= '"+begin+"' ";
//		}
//		
//		if(StrUtil.notBlank(end))
//		{
//			formsql += " and s.systime <= '"+end+"' ";
//		}
//		
//		if(StrUtil.notBlank(adminname))
//		{
//			List<User> user = User.dao.getByUserId(adminname);
//			if(user.size()>1)
//			{
//				str ="'";
//				for(int i=0;i<user.size();i++)
//				{
//					User userstr = user.get(i);
//					str += userstr.getStr("login_id");
//					str += "','";
//				}
//				str = str.substring(0, str.length()-2);
//			}
//			else
//			{
//				str = "'null'";
//			}
//		}
//		
//		if(StrUtil.notBlank(str))
//		{
//			formsql += " and s.userid in ("+str+") ";
//		}
//		
//		formsql += " order by s.systime desc ";
//		return super.paginate(pageNum, pageSize,
//				sql,formsql);
//		}

}
