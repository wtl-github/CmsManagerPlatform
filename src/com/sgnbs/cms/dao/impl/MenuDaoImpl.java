package com.sgnbs.cms.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.sgnbs.cms.dao.BaseDao;
import com.sgnbs.cms.dao.intf.MenuDao;
import com.sgnbs.cms.entity.Menu;

@Repository
public class MenuDaoImpl extends BaseDao implements MenuDao {

	@Override
	public List<Menu> listAllParentMenu() {
		return this.getSqlSession().selectList("com.sgnbs.cms.dao.intf.MenuDao.listAllParentMenu");
	}

	@Override
	public List<Menu> listSubMenuByParentId(Integer parentId) {
		return this.getSqlSession().selectList("com.sgnbs.cms.dao.intf.MenuDao.listSubMenuByParentId",parentId);
	}

	@Override
	public Menu getMenuById(Integer menuId) {
		return this.getSqlSession().selectOne("com.sgnbs.cms.dao.intf.MenuDao.getMenuById",menuId);
	}

	@Override
	public void insertMenu(Menu menu) {
		this.getSqlSession().insert("com.sgnbs.cms.dao.intf.MenuDao.insertMenu",menu);
	}

	@Override
	public void updateMenu(Menu menu) {
		this.getSqlSession().update("com.sgnbs.cms.dao.intf.MenuDao.updateMenu",menu);
	}

	@Override
	public void deleteMenuById(Integer menuId) {
		this.getSqlSession().delete("com.sgnbs.cms.dao.intf.MenuDao.deleteMenuById",menuId);
	}

	@Override
	public List<Menu> listAllSubMenu() {
		return this.getSqlSession().selectList("com.sgnbs.cms.dao.intf.MenuDao.listAllSubMenu");
	}

}
