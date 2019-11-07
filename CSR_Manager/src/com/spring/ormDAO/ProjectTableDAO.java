package com.spring.ormDAO;

import java.sql.Date;
import java.util.ArrayList;
import com.spring.ormVO.ProjectTableVO;

public interface ProjectTableDAO {

	public ArrayList<ProjectTableVO> list();
	public ArrayList<ProjectTableVO> list_new();
	public ArrayList<ProjectTableVO> list_proceed();
	public ArrayList<ProjectTableVO> list_finished();
	
	/* 요구사항 등록시 프로젝트(state != 대기) 키, 네임 select */
	public ArrayList<ProjectTableVO> list_for_request();
	
	// 해당 Key 프로젝트 가져오기
	public ProjectTableVO getOneProject(String Project_Key);
	
	// Find Project
   public ArrayList<ProjectTableVO> find_Project(String project_State, String project_Scope, String project_Type);
	
	public void addProject(String project_State, String project_Company, String project_Name, String project_money, Date project_date_start, Date project_date_end);
	
	/* 프로젝트 분류없음 생성을 위한 */
	public ArrayList<ProjectTableVO> getLastProject();
	
	/* 프로젝트 삭제 기능 */
	public void deleteProject(String id);
	
	/* 프로젝트 수정 기능 */
	public void updateProject(String project_State, String project_Company, String project_Name,
			String project_Money, Date date_Start, Date date_End, int key);
	
	public ArrayList<Integer> getProjectKeys();
}
