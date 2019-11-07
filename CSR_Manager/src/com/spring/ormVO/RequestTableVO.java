package com.spring.ormVO;

import java.sql.Date;

public class RequestTableVO {
	private int request_Key;
	private int project_Key;
	private String request_Title;
	private String request_Content;
	private String request_Requester_Name;
	
	private Date request_Date_Upload;
	private String request_Work_Classification;
	
	private String request_State;
	private String request_Progress;
	private Date request_Date_End;
	private int request_Work_Time;
	private String request_Content_Detail;
	
	public int getRequest_Key() {
		return request_Key;
	}
	public void setRequest_Key(int request_Key) {
		this.request_Key = request_Key;
	}
	public int getProject_Key() {
		return project_Key;
	}
	public void setProject_Key(int project_Key) {
		this.project_Key = project_Key;
	}
	public String getRequest_Title() {
		return request_Title;
	}
	public void setRequest_Title(String request_Title) {
		this.request_Title = request_Title;
	}
	public String getRequest_Content() {
		return request_Content;
	}
	public void setRequest_Content(String request_Content) {
		this.request_Content = request_Content;
	}
	public String getRequest_Requester_Name() {
		return request_Requester_Name;
	}
	public void setRequest_Requester_Name(String request_Requester_Name) {
		this.request_Requester_Name = request_Requester_Name;
	}
	public Date getRequest_Date_Upload() {
		return request_Date_Upload;
	}
	public void setRequest_Date_Upload(Date request_Date_Upload) {
		this.request_Date_Upload = request_Date_Upload;
	}
	public String getRequest_Work_Classification() {
		return request_Work_Classification;
	}
	public void setRequest_Work_Classification(String request_Work_Classification) {
		this.request_Work_Classification = request_Work_Classification;
	}
	public String getRequest_State() {
		return request_State;
	}
	public void setRequest_State(String request_State) {
		this.request_State = request_State;
	}
	public String getRequest_Progress() {
		return request_Progress;
	}
	public void setRequest_Progress(String request_Progress) {
		this.request_Progress = request_Progress;
	}
	public Date getRequest_Date_End() {
		return request_Date_End;
	}
	public void setRequest_Date_End(Date request_Date_End) {
		this.request_Date_End = request_Date_End;
	}
	public int getRequest_Work_Time() {
		return request_Work_Time;
	}
	public void setRequest_Work_Time(int request_Work_Time) {
		this.request_Work_Time = request_Work_Time;
	}
	public String getRequest_Content_Detail() {
		return request_Content_Detail;
	}
	public void setRequest_Content_Detail(String request_Content_Detail) {
		this.request_Content_Detail = request_Content_Detail;
	}
}
