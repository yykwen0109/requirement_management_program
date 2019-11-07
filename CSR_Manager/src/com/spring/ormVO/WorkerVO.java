package com.spring.ormVO;

import java.sql.Date;

public class WorkerVO {
	
	private int worker_key;
	private int request_key;
	private int employee_key;
	private Date start_date;
	private Date end_date;
	private int work_time;
	private int count;
	
	
	public int getWorker_key() {
		return worker_key;
	}
	public void setWorker_key(int worker_key) {
		this.worker_key = worker_key;
	}
	public int getRequest_key() {
		return request_key;
	}
	public void setRequest_key(int request_key) {
		this.request_key = request_key;
	}
	public int getEmployee_key() {
		return employee_key;
	}
	public void setEmployee_key(int employee_key) {
		this.employee_key = employee_key;
	}
	public Date getStart_date() {
		return start_date;
	}
	public void setStart_date(Date start_date) {
		this.start_date = start_date;
	}
	public Date getEnd_date() {
		return end_date;
	}
	public void setEnd_date(Date end_date) {
		this.end_date = end_date;
	}
	public int getWork_time() {
		return work_time;
	}
	public void setWork_time(int work_time) {
		this.work_time = work_time;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	
	
}
