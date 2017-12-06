package com.sgnbs.cms.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.sgnbs.cms.dao.BaseDao;
import com.sgnbs.cms.dao.intf.AttachmentDAO;
import com.sgnbs.cms.entity.Attachment;

@Repository
public class AttachmentDAOImpl  extends BaseDao  implements AttachmentDAO {

	@Override
	public Attachment getAttachmentById(String attId) {
		return this.getSqlSession().selectOne("com.sgnbs.cms.dao.intf.AttachmentDAO.getAttachmentById", attId);
	}

	@Override
	public List<Attachment> getAttachmentByIds(List<String> attachmentIds) {
		return this.getSqlSession().selectList("com.sgnbs.cms.dao.intf.AttachmentDAO.getAttachmentByIds",
				attachmentIds);
	}

	@Override
	public int insertAttachment(Attachment attachment) {
		this.getSqlSession().insert("com.sgnbs.cms.dao.intf.AttachmentDAO.insertAttachment", attachment);
		return attachment.getId();
	}
}
