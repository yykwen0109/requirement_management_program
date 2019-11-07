package com.spring.ormDAO;

import java.sql.Date;
import java.util.ArrayList;

import com.spring.ormVO.EmployeeVO;
import com.spring.ormVO.RequestTableVO;
import com.spring.ormVO.WorkerVO;

public interface UserDAO {

	/* 전체 유저 목록 */
	public ArrayList<EmployeeVO> list();
	
	/* 전체 유저 키 값 가져오기 */
	public ArrayList<Integer> getEmployeeKeys();
	
	/* 유저 로그인 용 id, pw 검색 */
	public ArrayList<EmployeeVO> search(String userId, String userPw);
	
	/* 해당 Key 유저 정보 가져오기 */
	public EmployeeVO getOneUser(String key);
	
	public void addUser(String employee_name, String employee_job, String employee_id, String employee_pw);

	/* 해당 Key 유저 삭제 */
	public void deleteUser(String key);

	/* Job 수정 */
	public void updateUserJob(String key, String job);

	/* 패스워드 수정 */
	public void updateUserPassword(String key, String password);
	
	/* 해당 Key 유저 정보 수정 */
	public void updateUser(String name, String job, String id, String pw, int key);
	
	/* 
	 * 2019-07-04 DUSDJ
	 * CSR 신청시 작업자 등록 
	 * */
	public void addWorker(int request_key, int employee_key, Date date_start, Date date_end, int workTime);
	
	/* 
	 * 2019-07-16 DUSDJ
	 * CSR 수정시 작업자 삭제
	 * */
	public void deleteWorker(int worker_key);
	
	/* 
	 * 2019-07-12 DUSDJ
	 * 
	 * CSR 수정시 작업자 목록 가져오기 
	 * */
	public ArrayList<WorkerVO> selectWorker(int request_key);
	
	public void updateWorker(int employee_key, Date date_start, Date date_end, int workTime, int worker_key);
	
}
