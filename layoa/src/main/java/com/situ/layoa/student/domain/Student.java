package com.situ.layoa.student.domain;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

public class Student implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private String stuName;
	private Integer Sex;
	private Integer stuAge;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date stuBirth;
	private List<String> like;
	public String getStuName() {
		return stuName;
	}
	public void setStuName(String stuName) {
		this.stuName = stuName;
	}
	public Integer getSex() {
		return Sex;
	}
	public void setSex(Integer sex) {
		Sex = sex;
	}
	public Integer getStuAge() {
		return stuAge;
	}
	public void setStuAge(Integer stuAge) {
		this.stuAge = stuAge;
	}
	public Date getStuBirth() {
		return stuBirth;
	}
	public void setStuBirth(Date stuBirth) {
		this.stuBirth = stuBirth;
	}
	
	
	@Override
	public String toString() {
		return "Student [stuName=" + stuName + ", Sex=" + Sex + ", stuAge=" + stuAge + ", stuBirth=" + stuBirth + "]";
	}
	public List<String> getLike() {
		return like;
	}
	public void setLike(List<String> like) {
		this.like = like;
	}
}
