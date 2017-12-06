package com.sgnbs.cms.service.intf;

import java.util.List;

import com.sgnbs.cms.entity.Page;
import com.sgnbs.cms.entity.Role;

public interface RoleService {
	List<Role> listPageAllRoles(Page page);
	List<Role> listAllRoles();
	Role getRoleById(int roleId);
	boolean insertRole(Role role);
	boolean updateRoleBaseInfo(Role role);
	void deleteRoleById(int roleId);
	void updateRoleRights(Role role);
}
