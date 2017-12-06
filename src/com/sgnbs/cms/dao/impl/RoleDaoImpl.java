package com.sgnbs.cms.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.sgnbs.cms.dao.BaseDao;
import com.sgnbs.cms.dao.intf.RoleDao;
import com.sgnbs.cms.entity.Page;
import com.sgnbs.cms.entity.Role;

@Repository
public class RoleDaoImpl extends BaseDao implements RoleDao {

	@Override
	public List<Role> listPageAllRoles(Page page) {
		return this.getSqlSession().selectList("com.sgnbs.cms.dao.intf.RoleDao.listPageAllRoles",page);
	}

	@Override
	public Role getRoleById(int roleId) {
		return this.getSqlSession().selectOne("com.sgnbs.cms.dao.intf.RoleDao.getRoleById",roleId);
	}

	@Override
	public void insertRole(Role role) {
		this.getSqlSession().insert("com.sgnbs.cms.dao.intf.RoleDao.insertRole",role);
	}

	@Override
	public void updateRoleBaseInfo(Role role) {
		this.getSqlSession().update("com.sgnbs.cms.dao.intf.RoleDao.updateRoleBaseInfo",role);
	}

	@Override
	public void deleteRoleById(int roleId) {
		this.getSqlSession().delete("com.sgnbs.cms.dao.intf.RoleDao.deleteRoleById",roleId);
	}

	@Override
	public int getCountByName(Role role) {
		return this.getSqlSession().selectOne("com.sgnbs.cms.dao.intf.RoleDao.getCountByName",role);
	}

	@Override
	public void updateRoleRights(Role role) {
		this.getSqlSession().update("com.sgnbs.cms.dao.intf.RoleDao.updateRoleRights",role);
		
	}

	@Override
	public List<Role> listAllRoles() {
			return this.getSqlSession().selectList("com.sgnbs.cms.dao.intf.RoleDao.listAllRoles");
		}
}
