package com.situ.layoa.role.service.impl;

import java.io.Serializable;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.situ.layoa.role.dao.RoleDao;
import com.situ.layoa.role.domain.Role;
import com.situ.layoa.role.service.RoleService;
@Service
public class RoleServiceImpl implements Serializable, RoleService {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Autowired
	private RoleDao roleDao;
	
	@Override
	public Long add(Role role) {
		/* String code=Math.random().toString(36).substr(0,2); */
		Integer a=(int)(Math.random()*1000000);
		role.setRoleCode(a.toString());
		return roleDao.add(role);
	}

	@Override
	public Integer findByRoleName(String roleName) {
		Integer result=0;
		Role role=roleDao.findByRoleName(roleName);
		if(role!=null) {
			result=1;
		}
		return result;
	}

}
