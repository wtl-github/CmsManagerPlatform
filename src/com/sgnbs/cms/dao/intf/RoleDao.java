package com.sgnbs.cms.dao.intf;

import java.util.List;

import com.sgnbs.cms.entity.Page;
import com.sgnbs.cms.entity.Role;

public interface RoleDao {
	List<Role> listPageAllRoles(Page page);
	List<Role> listAllRoles();
	Role getRoleById(int roleId);
	void insertRole(Role role);
	void updateRoleBaseInfo(Role role);
	void deleteRoleById(int roleId);
	int getCountByName(Role role);
	void updateRoleRights(Role role);
}
