package com.spring.ormDAO;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import com.spring.ormVO.CountVO;
import com.spring.ormVO.EmployeeVO;
import com.spring.ormVO.RequestTableVO;

public interface RequestTableDAO {
	// 전체 유지보수 사항 현황 
	public ArrayList<RequestTableVO> list();

	// 미배정 유지보수 사항 현황
	public ArrayList<RequestTableVO> new_list();

	// 진행중 유지보수 사항 현황
	public ArrayList<RequestTableVO> proceeding_list();

	// 완료 유지보수 사항 현황
	public ArrayList<RequestTableVO> clear_list();

	// My 유지보수 사항 현황
	public ArrayList<RequestTableVO> my_list(String key);

	// My 진행중 유지보수 사항 현황
	public ArrayList<RequestTableVO> my_proceeding_list(String Employee_Key);

	// My 완료 유지보수 사항 현황
	public ArrayList<RequestTableVO> my_clear_list(String Employee_Key);
	
	// 해당 Key 값 유지보수 사항
	public RequestTableVO getOneRequest(String Employee_Key);


	// 프로젝트별 요구사항의 개수 가져오기 
	public ArrayList<CountVO> count_request_by_project();
	// 직원별 요구사항의 개수 가져오기 
	public ArrayList<CountVO> count_request_by_employee();
	// 날짜당일별 요구사항 개수 가져오기
	public ArrayList<CountVO> count_request_by_date();
	// 날짜당일별 프로젝트 개수 가져오기
	public ArrayList<CountVO> count_project_by_date();
	
	// 해당 직원의 진행 요구사항 개수 가져오기
	public int count_my_proeceeding_request_number(String Employee_Key);
	// 해당 직원의 전체 요구사항 개수 가져오기
	public int count_my_request_number(String Employee_Key);
	// 해당 직원이 완료한 요구사항 개수 가져오기
	public int count_my_finished_request_number(String Employee_Key);

	/* 마지막 추가된 CSR
	 * 19-07-04 DUSDJ
	 *  */
	public ArrayList<RequestTableVO> getLast();

	/* 새 유지보수 요구사항 등록 */
	public void addRequest(String project_Key, String request_Title, String request_Content, 
			String request_Requester_Name, String request_Work_Classification, 
			String request_State, String request_Progress, Date request_Date_End, 
			String request_Work_Time, String request_Content_Detail);

	/* 담당자 배정 */
	public void assignMember(String employee_key, String request_key);
	
	/* 담당자 배정 */
	public void RequirementFinished(String request_Key);

	/* 유지보수 요구사항 삭제*/
	public void deleteRequest(String request_key);

	/* Employee list */
	public ArrayList<EmployeeVO> employee_list();

	public void updateRequest(String project_Key, String request_Title, 
			String request_Content, String request_Requester_Name,
			String request_Work_Classification, String request_State, 
			String request_Progress, Date request_Date_End, 
			String request_Work_Time, String request_Content_Detail, String request_key);
	
	/* 전체 마감 7일전 요구사항 */
	public ArrayList<RequestTableVO> dateDiffBelow7();
	/* 사원별 마감 7일전 요구사항 */
	public ArrayList<RequestTableVO> dateDiffBelow7ByEmployee(String key);

	/* 해당 유지보수에 대한 작업중인 유저 리스트 */ 
	public ArrayList<EmployeeVO> getWorkerList(int request_Key);
	
	public ArrayList<Integer> getUnassignedRequestKeys();

	public Object getRequestByProjectKey(String key);
	
}



