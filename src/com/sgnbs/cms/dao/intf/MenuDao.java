package com.sgnbs.cms.dao.intf;

import java.util.List;

import com.sgnbs.cms.entity.Menu;

public interface MenuDao {
	List<Menu> listAllParentMenu();
	List<Menu> listSubMenuByParentId(Integer parentId);
	Menu getMenuById(Integer menuId);
	void insertMenu(Menu menu);
	void updateMenu(Menu menu);
	void deleteMenuById(Integer menuId);
	List<Menu> listAllSubMenu();
}
