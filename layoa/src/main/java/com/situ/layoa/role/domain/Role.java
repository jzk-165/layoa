package com.situ.layoa.role.domain;

import java.io.Serializable;

import org.apache.ibatis.type.Alias;
@Alias("Role")
public class Role implements Serializable {

	private static final long serialVersionUID = 1L;
	
	private Long rowId;
	private String roleCode;//角色编号
	private String roleName;//角色名称#要求唯一
	private String roleKind;//角色类型#1超级角；0普通角色
	private String roleInfo;//角色简介
	public String getRoleCode() {
		return roleCode;
	}
	public void setRoleCode(String roleCode) {
		this.roleCode = roleCode;
	}
	public String getRoleName() {
		return roleName;
	}
	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}
	public String getRoleKind() {
		return roleKind;
	}
	public void setRoleKind(String roleKind) {
		this.roleKind = roleKind;
	}
	public String getRoleInfo() {
		return roleInfo;
	}
	public void setRoleInfo(String roleInfo) {
		this.roleInfo = roleInfo;
	}
	public Long getRowId() {
		return rowId;
	}
	public void setRowId(Long rowId) {
		this.rowId = rowId;
	}
	

}
