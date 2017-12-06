package com.sgnbs.cms.dao;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.support.SqlSessionDaoSupport;

public class BaseDao extends SqlSessionDaoSupport{

	@Resource(name = "sqlSessionFactory")
	public void setMySessionFactory(SqlSessionFactory sessionFactory) {
		super.setSqlSessionFactory(sessionFactory);
	}
}
