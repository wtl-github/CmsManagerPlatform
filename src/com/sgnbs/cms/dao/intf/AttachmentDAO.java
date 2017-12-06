package com.sgnbs.cms.dao.intf;

import java.util.List;

import com.sgnbs.cms.entity.Attachment;

public interface AttachmentDAO {

	/**
	 * 新增附件
	 */
	public int insertAttachment(Attachment attachment);

	/**
	 * 根据ID查附件
	 */
	public Attachment getAttachmentById(String attId);

	/**
	 * 查询附件含多个
	 */
	public List<Attachment> getAttachmentByIds(List<String> attachmentIds);
}
