package com.spring.ormVO;

import java.sql.Date;

public class CountVO {
	private int project_key;
	private int employee_key;
	private int count;
	
	private Date request_date_upload;
	private Date project_date_start;
	
	public int getProject_key() {
		return project_key;
	}
	public void setProject_key(int project_key) {
		this.project_key = project_key;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public int getEmployee_key() {
		return employee_key;
	}
	public void setEmployee_key(int employee_key) {
		this.employee_key = employee_key;
	}
	public Date getRequest_date_upload() {
		return request_date_upload;
	}
	public void setRequest_date_upload(Date request_date_upload) {
		this.request_date_upload = request_date_upload;
	}
	public Date getProject_date_start() {
		return project_date_start;
	}
	public void setProject_date_start(Date project_date_start) {
		this.project_date_start = project_date_start;
	}
	
}
