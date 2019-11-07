package com.spring.ormEx;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.ormDAO.ProjectTableDAO;
import com.spring.ormDAO.RequestTableDAO;
import com.spring.ormDAO.UserDAO;
import com.spring.ormVO.EmployeeVO;
import com.spring.ormVO.ProjectTableVO;
import com.spring.ormVO.RequestTableVO;
import com.spring.util.RandomDateCreate;


/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

	@Autowired
	private SqlSession sqlSession;

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {

		return "redirect:/user_logout";
	}

	/**
	 * YK View
	 *  */
	String    location = "services/";
	@RequestMapping(value="/modul_sidebar", method = RequestMethod.GET) 
	public String modul_sidebar(Model model) { 

		return location + "modul_sidebar"; 
	}

	@RequestMapping(value="/modul_top_navi", method = RequestMethod.GET) 
	public String modul_top_navi(Model model) { 

		return location + "modul_top_navi"; 
	}
	@RequestMapping(value="/modul_footer", method = RequestMethod.GET) 
	public String modul_footer(Model model) { 

		return location + "modul_footer"; 
	}

	@RequestMapping(value="/user_setting", method = RequestMethod.GET) 
	public String user_setting() { 

		return location + "user_setting"; 
	}
	/**
	 * 대시보드
	 * 2019-07-09 SALMON
	 * session check 추가
	 */
	@RequestMapping(value="/user_dashboard", method = RequestMethod.GET) 
	public String user_dashboard(Model model, HttpSession session) { 

		if(session.getAttribute("userKey") == null
				|| session.getAttribute("userId") == null
				|| session.getAttribute("userName") == null
				|| session.getAttribute("userJob") == null) {
			return "redirect:/user_logout";
		}

		RequestTableDAO rtDao = sqlSession.getMapper(RequestTableDAO.class);
		ProjectTableDAO ptDao = sqlSession.getMapper(ProjectTableDAO.class);
		UserDAO userDao = sqlSession.getMapper(UserDAO.class);

		// 유저 Key 값
		String userKey = session.getAttribute("userKey").toString();
		// 진행 n 건 세션갱신
		int userWork = 0;
		userWork = rtDao.count_my_proeceeding_request_number(session.getAttribute("userKey").toString());
		session.setAttribute("userWork", userWork);


		// 달성률
		int myWholeRequestNum = rtDao.count_my_request_number(userKey);
		int myFinishedRequestNum = rtDao.count_my_finished_request_number(userKey);
		double achievementRate = (double) myFinishedRequestNum / (double) myWholeRequestNum;

		ArrayList<RequestTableVO> proceeding_list =  rtDao.proceeding_list();

		List<EmployeeVO> workerList = null;
		long start = System.currentTimeMillis();
		int i=0;
		for(RequestTableVO aRequest : proceeding_list) {
			long inStart = System.currentTimeMillis();
			int requestKey = aRequest.getRequest_Key();
			workerList = rtDao.getWorkerList(aRequest.getRequest_Key());
			model.addAttribute("worker_list_" + requestKey, workerList);
			//System.out.println("worker_list_" + requestKey);
			long inend =System.currentTimeMillis();
			System.out.println(i++ +""+ (inend-inStart)/1000.0);
		}
		long end = System.currentTimeMillis();
		System.out.println((end-start)/1000.0);
		
		model.addAttribute("projectList", ptDao.list());
		model.addAttribute("list", proceeding_list);

		model.addAttribute("full_request_list", rtDao.list());
		model.addAttribute("employee_list", userDao.list());
		// 개수 테이블용
		model.addAttribute("count_request_by_project", rtDao.count_request_by_project());
		model.addAttribute("count_request_by_employee", rtDao.count_request_by_employee());
		model.addAttribute("count_request_by_date", rtDao.count_request_by_date());
		model.addAttribute("count_project_by_date", rtDao.count_project_by_date());

		// 마감 일주일 이하 전체 유지보수 사항
		model.addAttribute("Below_7_Request_List",rtDao.dateDiffBelow7());
		// 마감 일주일 이하 유저별 유지보수 사항
		model.addAttribute("Below_7_Request_List_By_Employee",rtDao.dateDiffBelow7ByEmployee(userKey));
		// 달성률
		model.addAttribute("achievement_rate", Math.round(achievementRate*1000)/10.0);

		return location + "user_dashboard"; 
	}
	/**
	 * 전체 유지보수 요구사항
	 */
	@RequestMapping(value="/CSR_all", method = RequestMethod.GET) 
	public String allCSR(Model model, HttpSession session) { 
		if(session.getAttribute("userKey") == null
				|| session.getAttribute("userId") == null
				|| session.getAttribute("userName") == null
				|| session.getAttribute("userJob") == null 
				|| session.getAttribute("userWork") == null) {
			return "redirect:/user_logout";
		}

		RequestTableDAO rtDao = sqlSession.getMapper(RequestTableDAO.class);
		ProjectTableDAO ptDao = sqlSession.getMapper(ProjectTableDAO.class);

		model.addAttribute("projectList", ptDao.list());
		model.addAttribute("list", rtDao.list());
		
		int userWork = rtDao.count_my_proeceeding_request_number(session.getAttribute("userKey").toString());
		session.setAttribute("userWork", userWork);

		return location + "CSR_all"; 
	}

	/**
	 * 전체 진행중(배정된) 유지보수 요구사항
	 */
	@RequestMapping(value="/CSR_all_proceed", method = RequestMethod.GET) 
	public String CSR_all_proceed(Model model, HttpSession session) { 
		if(session.getAttribute("userKey") == null
				|| session.getAttribute("userId") == null
				|| session.getAttribute("userName") == null
				|| session.getAttribute("userJob") == null 
				|| session.getAttribute("userWork") == null) {
			return "redirect:/user_logout";
		}

		RequestTableDAO rtDao = sqlSession.getMapper(RequestTableDAO.class);
		ProjectTableDAO ptDao = sqlSession.getMapper(ProjectTableDAO.class);

		model.addAttribute("projectList", ptDao.list());
		model.addAttribute("list", rtDao.proceeding_list());

		return location + "CSR_all_proceed"; 
	}

	/**
	 * 전체 완료(배정된) 유지보수 요구사항
	 */
	@RequestMapping(value="/CSR_all_finished", method = RequestMethod.GET) 
	public String CSR_all_finished(Model model, HttpSession session) { 
		if(session.getAttribute("userKey") == null
				|| session.getAttribute("userId") == null
				|| session.getAttribute("userName") == null
				|| session.getAttribute("userJob") == null
				|| session.getAttribute("userWork") == null) {
			return "redirect:/user_logout";
		}

		RequestTableDAO rtDao = sqlSession.getMapper(RequestTableDAO.class);
		ProjectTableDAO ptDao = sqlSession.getMapper(ProjectTableDAO.class);

		model.addAttribute("projectList", ptDao.list());
		model.addAttribute("list", rtDao.clear_list());
		return location + "CSR_all_finished"; 
	}



	/**
	 * 개인 유지보수 요구사항
	 * 2019-07-09 SALMON
	 * session check 추가
	 */

	@RequestMapping(value="/CSR_Individual", method = RequestMethod.GET) 
	public String CSR_Individual(Model model, HttpSession session) { 

		if(session.getAttribute("userKey") == null
				|| session.getAttribute("userId") == null
				|| session.getAttribute("userName") == null
				|| session.getAttribute("userJob") == null) {
			return "redirect:/user_logout";
		}

		RequestTableDAO rtDao = sqlSession.getMapper(RequestTableDAO.class);
		ProjectTableDAO ptDao = sqlSession.getMapper(ProjectTableDAO.class);

		model.addAttribute("projectList", ptDao.list());
		model.addAttribute("list", rtDao.my_list(session.getAttribute("userKey").toString()));

		return location + "CSR_Individual"; 
	}

	/**
	 * My 진행중(배정된) 유지보수 요구사항
	 * 2019-07-09 SALMON
	 * session check 추가
	 */
	@RequestMapping(value="/CSR_Individual_proceed", method = RequestMethod.GET) 
	public String CSR_Individual_proceed(HttpServletRequest req, Model model, HttpSession session) { 
		if(session.getAttribute("userKey") == null
				|| session.getAttribute("userId") == null
				|| session.getAttribute("userName") == null
				|| session.getAttribute("userJob") == null) {
			return "redirect:/user_logout";
		}

		RequestTableDAO rtDao = sqlSession.getMapper(RequestTableDAO.class);
		ProjectTableDAO ptDao = sqlSession.getMapper(ProjectTableDAO.class);

		model.addAttribute("projectList", ptDao.list());
		model.addAttribute("list", rtDao.my_proceeding_list(session.getAttribute("userKey").toString()));



		return location + "CSR_Individual_proceed"; 
	}

	
	/**
	 * My 완료 (배정된) 유지보수 요구사항
	 * 	 * 2019-07-09 SALMON
	 * session check 추가
	 */
	@RequestMapping(value="/CSR_Individual_finished", method = RequestMethod.GET) 
	public String CSR_Individual_finished(HttpServletRequest req, Model model, HttpSession session) {
		if(session.getAttribute("userKey") == null
				|| session.getAttribute("userId") == null
				|| session.getAttribute("userName") == null
				|| session.getAttribute("userJob") == null) {
			return "redirect:/user_logout";
		}
		RequestTableDAO rtDao = sqlSession.getMapper(RequestTableDAO.class);
		ProjectTableDAO ptDao = sqlSession.getMapper(ProjectTableDAO.class);

		model.addAttribute("projectList", ptDao.list());
		model.addAttribute("list", rtDao.my_clear_list(session.getAttribute("userKey").toString()));

		return location + "CSR_Individual_finished"; 
	}


	/**
	 * 새 유지보수 요구사항 등록 폼
	 * 19-07-04 DUSDJ
	 * */
	@RequestMapping(value="/CSR_register", method = RequestMethod.GET) 
	public String CSR_register(HttpServletRequest req, Model model, HttpSession session) { 
		if(session.getAttribute("userKey") == null
				|| session.getAttribute("userId") == null
				|| session.getAttribute("userName") == null
				|| session.getAttribute("userJob") == null
				|| session.getAttribute("userWork") == null) {
			return "redirect:/user_logout";
		}

		ProjectTableDAO ptDao = sqlSession.getMapper(ProjectTableDAO.class);
		UserDAO userDao = sqlSession.getMapper(UserDAO.class);

		model.addAttribute("userList", userDao.list());
		model.addAttribute("list_project", ptDao.list_for_request());

		return location + "CSR_register"; 
	}
	
	/**
	 * 해당 프로젝트 CSR 
	 */
	@RequestMapping(value = "/CSR_By_Project/{key}") //get방식 대신에 스프링에서 지원하는 방식 사용
	public String CSR_By_Project(@PathVariable String key, Model model, HttpSession session){	
		if(session.getAttribute("userKey") == null
				|| session.getAttribute("userId") == null
				|| session.getAttribute("userName") == null
				|| session.getAttribute("userJob") == null
				|| session.getAttribute("userWork") == null) {
			return "redirect:/user_logout";
		}
		
		RequestTableDAO rtDao = sqlSession.getMapper(RequestTableDAO.class);
		
		model.addAttribute("request_list_by_project", rtDao.getRequestByProjectKey(key));
		
		return location + "CSR_By_Project";
	}


	/**
	 * 영근 7/4 전체/진행/완료 프로젝트 페이지 생성
	 */
	@RequestMapping(value="/projects_all", method = RequestMethod.GET) 
	public String projects_all(Model model, HttpSession session) { 
		if(session.getAttribute("userKey") == null
				|| session.getAttribute("userId") == null
				|| session.getAttribute("userName") == null
				|| session.getAttribute("userJob") == null
				|| session.getAttribute("userWork") == null) {
			return "redirect:/user_logout";
		}
		ProjectTableDAO ptDao = sqlSession.getMapper(ProjectTableDAO.class);

		model.addAttribute("list", ptDao.list());

		return location + "projects_all"; 
	}
	@RequestMapping(value="/projects_all_proceed", method = RequestMethod.GET) 
	public String projects_all_proceed(Model model, HttpSession session) { 
		if(session.getAttribute("userKey") == null
				|| session.getAttribute("userId") == null
				|| session.getAttribute("userName") == null
				|| session.getAttribute("userJob") == null
				|| session.getAttribute("userWork") == null) {
			return "redirect:/user_logout";
		}
		ProjectTableDAO ptDao = sqlSession.getMapper(ProjectTableDAO.class);

		model.addAttribute("proceed_list", ptDao.list_proceed());

		return location + "projects_all_proceed"; 
	}
	@RequestMapping(value="/projects_all_finished", method = RequestMethod.GET) 
	public String projects_all_finished(Model model, HttpSession session) { 
		if(session.getAttribute("userKey") == null
				|| session.getAttribute("userId") == null
				|| session.getAttribute("userName") == null
				|| session.getAttribute("userJob") == null
				|| session.getAttribute("userWork") == null) {
			return "redirect:/user_logout";
		}
		ProjectTableDAO ptDao = sqlSession.getMapper(ProjectTableDAO.class);

		model.addAttribute("finished_list", ptDao.list_finished());

		return location + "projects_all_finished"; 
	}

	/**
	 * 프로젝트 신청 현황 - 미확정된 프로젝트 확인
	 * 
	 * */
	@RequestMapping(value="/projects_all_waitng", method = RequestMethod.GET) 
	public String projects_all_waitng(Model model, HttpSession session) { 
		if(session.getAttribute("userKey") == null
				|| session.getAttribute("userId") == null
				|| session.getAttribute("userName") == null
				|| session.getAttribute("userJob") == null
				|| session.getAttribute("userWork") == null) {
			return "redirect:/user_logout";
		}
		ProjectTableDAO ptDao = sqlSession.getMapper(ProjectTableDAO.class);

		model.addAttribute("newlist", ptDao.list_new());

		return location + "projects_all_waitng"; 
	}


	/**
	 * 새 프로젝트 신청 등록 폼
	 */
	@RequestMapping(value="/projects_register", method = RequestMethod.GET) 
	public String require(Model model, HttpSession session) { 
		if(session.getAttribute("userKey") == null
				|| session.getAttribute("userId") == null
				|| session.getAttribute("userName") == null
				|| session.getAttribute("userJob") == null
				|| session.getAttribute("userWork") == null) {
			return "redirect:/user_logout";
		}
		
		return location + "projects_register"; 
	}

	/**
	 * 유저 관리 페이지 - 유저 리스트 출력
	 * 2019-07-09 SALMON
	 * session userJob 체크
	 */
	@RequestMapping(value="/manage_user", method = RequestMethod.GET) 
	public String manage_user(HttpSession session, Model model) {
		if(session.getAttribute("userKey") == null
				|| session.getAttribute("userId") == null
				|| session.getAttribute("userName") == null
				|| session.getAttribute("userJob") == null) {
			return "redirect:/user_logout";
		}
		if(!session.getAttribute("userJob").equals("PRO")) {
			return "redirect:/user_dashboard";
		}

		UserDAO userDao = sqlSession.getMapper(UserDAO.class);
		ArrayList<EmployeeVO> userList = userDao.list();
		model.addAttribute("userList", userList);

		return location + "manage_user"; 
	}

	/**
	 * 유저 관리 페이지 - 유저 추가 폼
	 * 2019-07-09 SALMON
	 * session userJob 체크
	 */
	@RequestMapping(value="/manage_user_register", method = RequestMethod.GET) 
	public String manage_user_register(HttpSession session, Model model) { 
		if(session.getAttribute("userKey") == null
				|| session.getAttribute("userId") == null
				|| session.getAttribute("userName") == null
				|| session.getAttribute("userJob") == null) {
			return "redirect:/user_logout";
		}
		if(!session.getAttribute("userJob").equals("PRO")) {
			return "redirect:/user_dashboard";
		}


		return location + "manage_user_register"; 
	}



	/**
	 * 2019-07-09 SALMON
	 * 로그아웃 session에 JOB 추가
	 */
	@RequestMapping(value="/user_logout", method = RequestMethod.GET) 
	public String user_logout(HttpSession session) { 

		session.removeAttribute("userId");
		session.removeAttribute("userName");
		session.removeAttribute("userKey");
		session.removeAttribute("userJob");
		session.removeAttribute("userWork");

		return location + "user_logout"; 
	}

	/**
	 * 2019-07-09 SALMON
	 * 로그인 session에 JOB 추가
	 * 진행 n건 session에 추가
	 */
	@RequestMapping(value="/login", method = RequestMethod.POST) 
	public String login(HttpServletRequest req, Model model, HttpSession session, RedirectAttributes redirectAttributes) { 

		System.out.println(req.getParameter("user_id"));
		System.out.println(req.getParameter("user_pw"));

		String userId = req.getParameter("user_id");
		String userPw = req.getParameter("user_pw");

		UserDAO userDao = sqlSession.getMapper(UserDAO.class);
		ArrayList<EmployeeVO> a = userDao.search(userId, userPw);
		if(a.size() != 1) {
			redirectAttributes.addFlashAttribute("message", "로그인 실패!");
			return "redirect:/user_logout";
		}	

		int userKey = a.get(0).getEmployee_key();

		session.setAttribute("userId", userId);
		session.setAttribute("userName", a.get(0).getEmployee_name());
		session.setAttribute("userKey", userKey);
		session.setAttribute("userJob", a.get(0).getEmployee_job());

		RequestTableDAO rtDao = sqlSession.getMapper(RequestTableDAO.class);
		int userWork = 0;
		userWork = rtDao.count_my_proeceeding_request_number(session.getAttribute("userKey").toString());

		session.setAttribute("userWork", userWork);

		return "redirect:/user_dashboard"; }


	/**
	 * 유저 관리 페이지 - 유저 추가 폼-> Post
	 * 2019-07-09 SALMON
	 * session userJob 체크
	 */
	@RequestMapping(value="/addUserPost", method = RequestMethod.POST) 
	public String addUserPost(HttpServletRequest req, Model model, HttpSession session, RedirectAttributes redirectAttributes) { 
		if(session.getAttribute("userKey") == null
				|| session.getAttribute("userId") == null
				|| session.getAttribute("userName") == null
				|| session.getAttribute("userJob") == null) {
			return "redirect:/user_logout";
		}
		if(!session.getAttribute("userJob").equals("PRO")) {
			return "redirect:/user_dashboard";
		}

		UserDAO userDao = sqlSession.getMapper(UserDAO.class);
		userDao.addUser(req.getParameter("employee_name"), req.getParameter("employee_job"), req.getParameter("employee_id"), req.getParameter("employee_pw"));

		redirectAttributes.addFlashAttribute("message", "등록되었습니다.");
		return "redirect:/manage_user"; }

	/**
	 * 탐색 기능
	 */
	@RequestMapping("/search")
	public String search(@RequestParam String project_State, @RequestParam String project_Scope, 
			@RequestParam String project_Type, Model model, HttpSession session) {
		if(session.getAttribute("userKey") == null
				|| session.getAttribute("userId") == null
				|| session.getAttribute("userName") == null
				|| session.getAttribute("userJob") == null 
				|| session.getAttribute("userWork") == null) {
			return "redirect:/user_logout";
		}
		ProjectTableDAO ptDao = sqlSession.getMapper(ProjectTableDAO.class);

		model.addAttribute("search_list", ptDao.find_Project(project_State, project_Scope, project_Type));
		System.out.println("project_State" + project_State);
		System.out.println("project_Scope" + project_Scope);
		System.out.println("project_Type" + project_Type);

		return location + "user_search_temp";
	}


	/* post */

	/**
	 * 프로젝트 추가 post
	 */
	@RequestMapping(value="/requirement_post_Add_Project", method = RequestMethod.POST) 
	public String addProject(HttpServletRequest req, Model model, HttpSession session) {
		if(session.getAttribute("userKey") == null
				|| session.getAttribute("userId") == null
				|| session.getAttribute("userName") == null
				|| session.getAttribute("userJob") == null 
				|| session.getAttribute("userWork") == null) {
			return "redirect:/user_logout";
		}
		ProjectTableDAO ptDao = sqlSession.getMapper(ProjectTableDAO.class);

		String dateStart = req.getParameter("project_date_start");
		String dateEnd = req.getParameter("project_date_end");

		Date date_start = null; 
		Date date_end = null;

		if(dateStart.length() != 0) date_start = Date.valueOf(dateStart);
		if(dateEnd.length() != 0) date_end = Date.valueOf(dateEnd);


		ptDao.addProject(req.getParameter("project_state"), req.getParameter("project_company"), req.getParameter("project_name"),
				req.getParameter("project_money"), date_start, date_end);

		return "redirect:/projects_all";
	}

	/**
	 * 유지보수 요구사항 추가 post
	 * 19-07-16
	 * DUSDJ
	 */
	@Transactional
	@RequestMapping(value="/addRequirement", method = RequestMethod.POST) 
	public String addRequirement(HttpServletRequest req, Model model, HttpSession session) {
		if(session.getAttribute("userKey") == null
				|| session.getAttribute("userId") == null
				|| session.getAttribute("userName") == null
				|| session.getAttribute("userJob") == null 
				|| session.getAttribute("userWork") == null) {
			return "redirect:/user_logout";
		}

		RequestTableDAO rtDao = sqlSession.getMapper(RequestTableDAO.class);
		UserDAO userDao = sqlSession.getMapper(UserDAO.class);

		String endDate = req.getParameter("request_Date_End");
		// tt
		Date date_end = null;
		if(endDate.length() != 0) date_end = Date.valueOf(endDate);

		rtDao.addRequest(req.getParameter("project_Key"),
				req.getParameter("request_Title"), 
				req.getParameter("request_Content"),
				req.getParameter("request_Requester_Name"),
				req.getParameter("request_Work_Classification"),
				req.getParameter("request_State"), 
				req.getParameter("request_Progress"),
				date_end,
				req.getParameter("request_Work_Time"), 
				req.getParameter("request_Content_Detail"));

		ArrayList<RequestTableVO> last = rtDao.getLast();

		for(int i=0; i<Integer.parseInt(req.getParameter("numberOfWorker")); i++) {

			Date work_start = null;
			if(req.getParameter("worker" + i + "_date_start") != null && req.getParameter("worker" + i + "_date_start") != "")
				work_start = Date.valueOf(req.getParameter("worker" + i + "_date_start"));
			
			Date work_end = null;
			if(req.getParameter("worker" + i + "_date_end") != null && req.getParameter("worker" + i + "_date_end") != "")
				work_end = Date.valueOf(req.getParameter("worker" + i + "_date_end"));

			userDao.addWorker(last.get(0).getRequest_Key(), 
					Integer.parseInt(req.getParameter("worker" + i + "_key")),
					work_start, work_end,
					Integer.parseInt(req.getParameter("worker" + i + "_workTime")));
		}

		return "redirect:/CSR_all";
	}


	/**
	 * 수정 기능
	 */
	/*
	 * 유지보수 사항 수정 폼
	 */
	@RequestMapping(value = "/updateRequestForm/{key}") //get방식 대신에 스프링에서 지원하는 방식 사용
	public String updateRequestForm(@PathVariable String key, Model model, HttpSession session){	
		if(session.getAttribute("userKey") == null
				|| session.getAttribute("userId") == null
				|| session.getAttribute("userName") == null
				|| session.getAttribute("userJob") == null 
				|| session.getAttribute("userWork") == null) {
			return "redirect:/user_logout";
		}
		RequestTableDAO rtDao = sqlSession.getMapper(RequestTableDAO.class);
		ProjectTableDAO ptDao = sqlSession.getMapper(ProjectTableDAO.class);
		RequestTableVO aRequest = rtDao.getOneRequest(key);
		String projectKey = aRequest.getProject_Key() + "";
		ProjectTableVO aProject = ptDao.getOneProject(projectKey);
		UserDAO userDao = sqlSession.getMapper(UserDAO.class);

		model.addAttribute("userList", userDao.list());
		model.addAttribute("list_project", ptDao.list_for_request());

		model.addAttribute("key", key);
		model.addAttribute("project_key",aProject.getProject_Key());
		model.addAttribute("project_name",aProject.getProject_Name());
		model.addAttribute("title",aRequest.getRequest_Title());
		model.addAttribute("content",aRequest.getRequest_Content());
		model.addAttribute("requester_name",aRequest.getRequest_Requester_Name());
		model.addAttribute("work_classification",aRequest.getRequest_Work_Classification());
		model.addAttribute("state",aRequest.getRequest_State());
		model.addAttribute("progress",aRequest.getRequest_Progress());
		model.addAttribute("date_end",aRequest.getRequest_Date_End());
		model.addAttribute("work_time",aRequest.getRequest_Work_Time());
		model.addAttribute("content_detail",aRequest.getRequest_Content_Detail());

		model.addAttribute("worker_list", userDao.selectWorker(aRequest.getRequest_Key()));

		return location + "request_update_form";
	}

	/*
	 *  유지보수 사항 수정
	 *  */
	@Transactional
	@RequestMapping(value = "/updateRequest/{key}") //get방식 대신에 스프링에서 지원하는 방식 사용
	public String updateRequest(@PathVariable String key, HttpServletRequest req, Model model, HttpSession session){
		if(session.getAttribute("userKey") == null
				|| session.getAttribute("userId") == null
				|| session.getAttribute("userName") == null
				|| session.getAttribute("userJob") == null
				|| session.getAttribute("userWork") == null) {
			return "redirect:/user_logout";
		}
		System.out.println(req.getParameter("request_Call"));

		RequestTableDAO rtDao = sqlSession.getMapper(RequestTableDAO.class);
		UserDAO userDao = sqlSession.getMapper(UserDAO.class);

		String date_end_String = req.getParameter("request_Date_End");

		// 입력된 Date 값 저장
		Date date_end = Date.valueOf(date_end_String);

		rtDao.updateRequest(req.getParameter("project_key"),
				req.getParameter("request_Title"), 
				req.getParameter("request_Content"),
				req.getParameter("request_Requester_Name"),
				req.getParameter("request_Work_Classification"),
				req.getParameter("request_State"), 
				req.getParameter("request_Progress"),
				date_end,
				req.getParameter("request_Work_Time"), 
				req.getParameter("request_Content_Detail"),
				key);

		
		for(int i=0; i<Integer.parseInt(req.getParameter("numberOfWorker")); i++) {

			if(req.getParameter("worker" + i + "_is_deleted").equals("Y")) {
				int worker_key = Integer.parseInt(req.getParameter("worker" + i + "_worker_key"));
				userDao.deleteWorker(worker_key);
			}else {
				Date work_start = null;
				Date work_end = null;
				if(req.getParameter("worker" + i + "_date_start") != null && req.getParameter("worker" + i + "_date_start") != "")
					work_start = Date.valueOf(req.getParameter("worker" + i + "_date_start"));
				
				if(req.getParameter("worker" + i + "_date_end") != null && req.getParameter("worker" + i + "_date_end") != "")
					work_end = Date.valueOf(req.getParameter("worker" + i + "_date_end"));

				userDao.updateWorker(Integer.parseInt(req.getParameter("worker" + i + "_employee_key_select")),
						work_start,
						work_end,
						Integer.parseInt(req.getParameter("worker" + i + "_workTime")),
						Integer.parseInt(req.getParameter("worker" + i + "_worker_key")));
			}
		}
		
		
		//addWorker
		for(int i=0; i<Integer.parseInt(req.getParameter("numberOfWorker_plus")); i++) {

			if(req.getParameter("worker_plus" + i + "_is_deleted").equals("Y")) {
				// 무시하고 넘어간다.
			}else {
			
				Date work_start = null;
				Date work_end = null;
				if(req.getParameter("worker_plus" + i + "_date_start") != null && req.getParameter("worker_plus" + i + "_date_start") != "")
					work_start = Date.valueOf(req.getParameter("worker_plus" + i + "_date_start"));
				
				if(req.getParameter("worker_plus" + i + "_date_end") != null && req.getParameter("worker_plus" + i + "_date_end") != "")
					work_end = Date.valueOf(req.getParameter("worker_plus" + i + "_date_end"));
	
				
				userDao.addWorker(Integer.parseInt(key), 
						Integer.parseInt(req.getParameter("worker_plus" + i + "_key")),
						work_start, work_end,
						Integer.parseInt(req.getParameter("worker_plus" + i + "_workTime")));
			}
		}
		

		return "redirect:/updateRequestForm/"+key;
	}

	/*
	 * 프로젝트 수정 폼
	 */
	@RequestMapping(value = "/updateProjectForm/{key}", method = RequestMethod.GET) //get방식 대신에 스프링에서 지원하는 방식 사용
	public String updateProjectForm(@PathVariable String key, Model model, HttpSession session){		
		if(session.getAttribute("userKey") == null
				|| session.getAttribute("userId") == null
				|| session.getAttribute("userName") == null
				|| session.getAttribute("userJob") == null 
				|| session.getAttribute("userWork") == null) {
			return "redirect:/user_logout";
		}
		ProjectTableDAO ptDao = sqlSession.getMapper(ProjectTableDAO.class);
		ProjectTableVO aProject = ptDao.getOneProject(key);

		model.addAttribute("key",aProject.getProject_Key());
		model.addAttribute("company",aProject.getProject_Company());
		model.addAttribute("end",aProject.getProject_Date_End());
		model.addAttribute("start",aProject.getProject_Date_Start());
		model.addAttribute("money",aProject.getProject_Money());
		model.addAttribute("name",aProject.getProject_Name());
		model.addAttribute("state",aProject.getProject_State());

		return location + "project_update_form";
	}
	/*
	 *  프로젝트 수정
	 *  */
	@RequestMapping(value = "/updateProject/{key}")
	public String updateProject(@PathVariable String key, HttpServletRequest req, Model model, HttpSession session){
		if(session.getAttribute("userKey") == null
				|| session.getAttribute("userId") == null
				|| session.getAttribute("userName") == null
				|| session.getAttribute("userJob") == null
				|| session.getAttribute("userWork") == null) {
			return "redirect:/user_logout";
		}
		ProjectTableDAO ptDao = sqlSession.getMapper(ProjectTableDAO.class);

		String startDate = req.getParameter("project_date_start");
		String endDate = req.getParameter("project_date_end");

		// 입력된 Date 값 저장
		Date date_Start = null;
		Date date_End = null;
		if(startDate.length() != 0) date_Start = Date.valueOf(startDate);
		if(endDate.length() != 0) date_End = Date.valueOf(endDate);


		ptDao.updateProject(req.getParameter("project_state"),
				req.getParameter("project_company"),
				req.getParameter("project_name"),
				req.getParameter("project_money"),
				date_Start,
				date_End,
				Integer.parseInt(key));

		return "redirect:/projects_all";
	}

	/*
	 * 사용자 수정 폼
	 */
	@RequestMapping(value = "/updateUserForm/{key}", method = RequestMethod.GET) //get방식 대신에 스프링에서 지원하는 방식 사용
	public String updateUserForm(@PathVariable String key, Model model, HttpSession session){		
		if(session.getAttribute("userKey") == null
				|| session.getAttribute("userId") == null
				|| session.getAttribute("userName") == null
				|| session.getAttribute("userJob") == null 
				|| session.getAttribute("userWork") == null) {
			return "redirect:/user_logout";
		}
		UserDAO userDao = sqlSession.getMapper(UserDAO.class);
		EmployeeVO aUser= userDao.getOneUser(key);

		model.addAttribute("job",aUser.getEmployee_job());
		model.addAttribute("id",aUser.getEmployee_id());
		model.addAttribute("name",aUser.getEmployee_name());
		model.addAttribute("password",aUser.getEmployee_pw());

		return location + "user_update_form";
	}
	/*
	 *  사용자 수정
	 *  */
	@RequestMapping(value = "/updateUser/{key}", method = RequestMethod.POST)
	public String updateUser(@PathVariable String key, HttpServletRequest req, HttpSession session){
		if(session.getAttribute("userKey") == null
				|| session.getAttribute("userId") == null
				|| session.getAttribute("userName") == null
				|| session.getAttribute("userJob") == null 
				|| session.getAttribute("userWork") == null) {
			return "redirect:/user_logout";
		}

		UserDAO userDao = sqlSession.getMapper(UserDAO.class);

		userDao.updateUser(req.getParameter("employee_name"),
				req.getParameter("employee_job"),
				req.getParameter("employee_id"),
				req.getParameter("employee_pw"),
				Integer.parseInt(key));
		return "redirect:/manage_user";
	}

	/*
	 * 유저 Job 수정
	 */
	/**
	 * 2019-07-09 SALMON
	 * session userJob 체크
	 */
	@RequestMapping(value = "/updateUserJob/{key}", method = RequestMethod.GET) //get방식 대신에 스프링에서 지원하는 방식 사용
	public String updateUserJob(@PathVariable String key, HttpServletRequest req, Model model, HttpSession session){
		if(session.getAttribute("userKey") == null
				|| session.getAttribute("userId") == null
				|| session.getAttribute("userName") == null
				|| session.getAttribute("userJob") == null) {
			return "redirect:/user_logout";
		}
		if(!session.getAttribute("userJob").equals("PRO")) {
			return "redirect:/user_dashboard";
		}

		UserDAO userDao = sqlSession.getMapper(UserDAO.class);

		userDao.updateUserJob(key, req.getParameter("job"));

		return "redirect:/manage_user";
	}

	/*
	 * 유저 비밀번호 수정
	 */
	/**
	 * 2019-07-09 SALMON
	 * session userJob 체크
	 */
	@RequestMapping(value = "/updateUserPassword/{key}", method = RequestMethod.GET) //get방식 대신에 스프링에서 지원하는 방식 사용
	public String updateUserPassword(@PathVariable String key, HttpServletRequest req, Model model, HttpSession session){
		if(session.getAttribute("userKey") == null
				|| session.getAttribute("userId") == null
				|| session.getAttribute("userName") == null
				|| session.getAttribute("userJob") == null) {
			return "redirect:/user_logout";
		}
		if(!session.getAttribute("userJob").equals("PRO")) {
			return "redirect:/user_dashboard";
		}

		UserDAO userDao = sqlSession.getMapper(UserDAO.class);

		userDao.updateUserPassword(key, req.getParameter("password"));

		return "redirect:/manage_user";
	}

	/**
	 * 삭제 기능
	 */
	/*
	 * 프로젝트 삭제
	 */
	@RequestMapping(value = "/deleteProject/{key}", method = RequestMethod.GET) //get방식 대신에 스프링에서 지원하는 방식 사용
	public String deleteProject(@PathVariable String key, HttpSession session){
		if(session.getAttribute("userKey") == null
				|| session.getAttribute("userId") == null
				|| session.getAttribute("userName") == null
				|| session.getAttribute("userJob") == null 
				|| session.getAttribute("userWork") == null) {
			return "redirect:/user_logout";
		}

		ProjectTableDAO ptDao = sqlSession.getMapper(ProjectTableDAO.class);

		ptDao.deleteProject(key);

		return "redirect:/projects_all";
	}

	/*
	 * 유지보수 사항 삭제
	 */
	@RequestMapping(value = "/deleteRequest/{key}", method = RequestMethod.GET) //get방식 대신에 스프링에서 지원하는 방식 사용
	public String deleteRequest(@PathVariable String key, HttpSession session){
		if(session.getAttribute("userKey") == null
				|| session.getAttribute("userId") == null
				|| session.getAttribute("userName") == null
				|| session.getAttribute("userJob") == null 
				|| session.getAttribute("userWork") == null) {
			return "redirect:/user_logout";
		}
		RequestTableDAO rtDao = sqlSession.getMapper(RequestTableDAO.class);

		rtDao.deleteRequest(key);

		return "redirect:/CSR_all";
	}

	/*
	 * 유저 삭제	
	 */
	@RequestMapping(value = "/deleteUser/{key}", method = RequestMethod.GET) //get방식 대신에 스프링에서 지원하는 방식 사용
	public String deleteUser(@PathVariable String key, HttpSession session){
		if(session.getAttribute("userKey") == null
				|| session.getAttribute("userId") == null
				|| session.getAttribute("userName") == null
				|| session.getAttribute("userJob") == null 
				|| session.getAttribute("userWork") == null) {
			return "redirect:/user_logout";
		}
		UserDAO userDao = sqlSession.getMapper(UserDAO.class);

		userDao.deleteUser(key);

		return "redirect:/manage_user";
	}
	
	/*
	 * 작업자 삭제	
	 */
	@RequestMapping(value = "/deleteWorker", method = RequestMethod.POST) //get방식 대신에 스프링에서 지원하는 방식 사용
	public String deleteWorker(HttpSession session, HttpServletRequest req){
		if(session.getAttribute("userKey") == null
				|| session.getAttribute("userId") == null
				|| session.getAttribute("userName") == null
				|| session.getAttribute("userJob") == null 
				|| session.getAttribute("userWork") == null) {
			return "redirect:/user_logout";
		}
		
		System.out.println("numberOfWorker : " + req.getParameter("numberOfWorker"));
		String numberOfWorker = req.getParameter("numberOfWorker");
		
		int worker_key = Integer.parseInt(req.getParameter("worker"+numberOfWorker+"_worker_key"));
		int request_key = Integer.parseInt(req.getParameter("request_key"));
		
		UserDAO userDao = sqlSession.getMapper(UserDAO.class);

		userDao.deleteWorker(worker_key);
		
		return "redirect:/updateRequestForm/"+request_key;
	}


	/**
	 * 임시 데이터 추가
	 */
	/*
	 * 10개 임시 프로젝트 데이터 추가
	 */
	@RequestMapping(value = "/addDummyProject")
	public String addDummyProject() {
		RandomDateCreate randomDateCreate = new RandomDateCreate();
		ProjectTableDAO ptDao = sqlSession.getMapper(ProjectTableDAO.class);
		
		for(int i = 0; i < 68; i++) {
			String projectName = "2019_프로젝트 이름_" + i;
			String projectCompany = "프로젝트 회사_" + i;

			randomDateCreate.setCalendars();
			String date = "2019-" + randomDateCreate.getUserBirthMonth() + "-" + randomDateCreate.getUserBirthDay();
			Date dateSql1 = Date.valueOf(date);
			randomDateCreate.setCalendars();
			String date2 = "2019-" + randomDateCreate.getUserBirthMonth() + "-" + randomDateCreate.getUserBirthDay();
			Date dateSql2 = Date.valueOf(date2);
			if(dateSql1.compareTo(dateSql2) > 0) {
				Date temp = dateSql1;
				dateSql1 = dateSql2;
				dateSql2 = temp;
				System.out.println("called");
			}
			System.out.println("date 1 : " + dateSql1);
			System.out.println("date 2 : " + dateSql2);

			int randomNum = (int) (Math.random() * 3) + 1;
			String state = "";

			if(randomNum == 1) state = "진행중";
			else if(randomNum == 2) state = "대기";
			else state = "완료";

			System.out.println("Process : " + state);

			int money = ((int) (Math.random() * 100) + 1) * 1000;
			System.out.println("Money : " + money);

			System.out.println("프로젝트 데이터 추가됨");

			ptDao.addProject(state, projectCompany, projectName, money + "", dateSql1, dateSql2);
		}

		return "redirect:/user_dashboard";
	}

	/*
	 * 10 개 임시 요구사항 데이터 추가
	 */
	@RequestMapping(value = "/addDummyRequest")
	public String addDummyRequest() {
		RandomDateCreate randomDateCreate = new RandomDateCreate();
		RequestTableDAO rtDao = sqlSession.getMapper(RequestTableDAO.class);
		ProjectTableDAO ptDao = sqlSession.getMapper(ProjectTableDAO.class);
		ArrayList<Integer> projectKeys = ptDao.getProjectKeys();

		for(int i = 0; i < 300; i++) {
			String title = "요구사항_" + i;
			String requester = "요청자";
			String content = "내용 " + i;

			randomDateCreate.setCalendars();
			String date = "2019-" + randomDateCreate.getUserBirthMonth() + "-" + randomDateCreate.getUserBirthDay();
			Date Request_Date_End = Date.valueOf(date);
			System.out.println("date : " + Request_Date_End);

			// Work Classification
			int randomNum = (int) (Math.random() * 3) + 1;
			String Work_Classification = "";

			if(randomNum == 1) Work_Classification = "유지보수";
			else if(randomNum == 2) Work_Classification = "하자보수";
			else Work_Classification = "기타";

			System.out.println("Work Classification : " + Work_Classification);

			// State
			randomNum = (int) (Math.random() * 2) + 1;
			String state = "";

			if(randomNum == 1) state = "진행";
			else state = "완료";

			System.out.println("State : " + state);

			// Progress
			int progress = ((int) (Math.random() * 10 + 1)) * 10;

			System.out.println("Progress : " + progress);

			// WorkTime
			int workTime = ((int) (Math.random() * 12 - 1) + 1);
			System.out.println("WorkTime : " + workTime);

			System.out.println("요구사항 데이터 추가됨");

			// Project Key
			int projectKeyIndex = ((int)(Math.random() * projectKeys.size() - 1) + 1);
			int ptKey = projectKeys.get(projectKeyIndex);

			rtDao.addRequest(ptKey + "", title, content, requester, Work_Classification, state, progress + "", Request_Date_End, workTime + "", "상세정보");
		}

		return "redirect:/user_dashboard";
	}

	/*
	 * 10 개 Worker 데이터 추가
	 */
	@RequestMapping(value = "/addDummyWorker")
	public String addDummyWorker() {
		RequestTableDAO rtDao = sqlSession.getMapper(RequestTableDAO.class);
		UserDAO userDao = sqlSession.getMapper(UserDAO.class);
		RandomDateCreate randomDateCreate = new RandomDateCreate();

		ArrayList<Integer> requestKeys = rtDao.getUnassignedRequestKeys();
		ArrayList<Integer> userKeys = userDao.getEmployeeKeys();


		for(int requestkey : requestKeys) {
			randomDateCreate.setCalendars();
			String date = "2019-" + randomDateCreate.getUserBirthMonth() + "-" + randomDateCreate.getUserBirthDay();
			Date dateSql1 = Date.valueOf(date);
			randomDateCreate.setCalendars();
			String date2 = "2019-" + randomDateCreate.getUserBirthMonth() + "-" + randomDateCreate.getUserBirthDay();
			Date dateSql2 = Date.valueOf(date2);
			if(dateSql1.compareTo(dateSql2) > 0) {
				Date temp = dateSql1;
				dateSql1 = dateSql2;
				dateSql2 = temp;
				System.out.println("called");
			}
			System.out.println("date 1 : " + dateSql1);
			System.out.println("date 2 : " + dateSql2);
			
			
			int number_of_workers = ((int)(Math.random() * 5 - 1) + 1);
			ArrayList<Integer> worker_list = new ArrayList<Integer>();
			
			for(int i=0; i<number_of_workers; i++) {
			
				int EmployeeIndex = ((int) (Math.random() * 12 - 1) + 1);
				while(worker_list.contains(EmployeeIndex)) {
					EmployeeIndex = ((int) (Math.random() * 12 - 1) + 1);
				}
				worker_list.add(EmployeeIndex);
			}	
			
			for(int worker : worker_list) {
				int EmployeeKey = userKeys.get(worker);
				int work_time = ((int) (Math.random() * 12 - 1) + 1);

				userDao.addWorker(requestkey, EmployeeKey, dateSql1, dateSql2, work_time);	
			}
		}

		return "redirect:/user_dashboard";
	}
}



