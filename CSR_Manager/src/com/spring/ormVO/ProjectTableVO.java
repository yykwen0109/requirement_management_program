package com.spring.ormVO;

import java.sql.Date;

public class ProjectTableVO {
	private int project_Key;
	private String project_State;
	private String project_Company;
	private String project_Name;	
	private int project_Money;
	
	private Date project_Date_Start;
	private Date project_Date_End;
	
	public int getProject_Key() {
		return project_Key;
	}
	public void setProject_Key(int project_Key) {
		this.project_Key = project_Key;
	}
	public String getProject_State() {
		return project_State;
	}
	public void setProject_State(String project_State) {
		this.project_State = project_State;
	}
	public String getProject_Company() {
		return project_Company;
	}
	public void setProject_Company(String project_Company) {
		this.project_Company = project_Company;
	}
	public String getProject_Name() {
		return project_Name;
	}
	public void setProject_Name(String project_Name) {
		this.project_Name = project_Name;
	}
	public int getProject_Money() {
		return project_Money;
	}
	public void setProject_Money(int project_Money) {
		this.project_Money = project_Money;
	}
	public Date getProject_Date_Start() {
		return project_Date_Start;
	}
	public void setProject_Date_Start(Date project_Date_Start) {
		this.project_Date_Start = project_Date_Start;
	}
	public Date getProject_Date_End() {
		return project_Date_End;
	}
	public void setProject_Date_End(Date project_Date_End) {
		this.project_Date_End = project_Date_End;
	}	
}
