package com.sgnbs.cms.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sgnbs.cms.dao.intf.RoleDao;
import com.sgnbs.cms.entity.Page;
import com.sgnbs.cms.entity.Role;
import com.sgnbs.cms.service.intf.RoleService;

@Service
public class RoleServiceImpl implements RoleService{

	@Autowired
	private RoleDao roleDao;
	
	public List<Role> listPageAllRoles(Page page) {
		return roleDao.listPageAllRoles(page);
	}

	public void deleteRoleById(int roleId) {
		roleDao.deleteRoleById(roleId);
	}

	public Role getRoleById(int roleId) {
		return roleDao.getRoleById(roleId);
	}

	public boolean insertRole(Role role) {
		if(roleDao.getCountByName(role)>0)
			return false;
		else{
			roleDao.insertRole(role);
			return true;
		}
	}

	public boolean updateRoleBaseInfo(Role role) {
		if(roleDao.getCountByName(role)>0)
			return false;
		else{
			roleDao.updateRoleBaseInfo(role);
			return true;
		}
	}
	
	public void updateRoleRights(Role role) {
		roleDao.updateRoleRights(role);
	}

	@Override
	public List<Role> listAllRoles() {
		return roleDao.listAllRoles();
	}

}
