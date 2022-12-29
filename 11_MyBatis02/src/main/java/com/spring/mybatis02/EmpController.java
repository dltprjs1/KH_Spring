package com.spring.mybatis02;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.model.DeptDTO;
import com.spring.model.EmpDAO;
import com.spring.model.EmpDTO;

@Controller
public class EmpController {

	@Inject
	private EmpDAO dao;
	
	
	@RequestMapping("emp_list.do")
	public String list(Model model) {
		
		List<EmpDTO> list = this.dao.getEmpList();
		
		model.addAttribute("List", list);
		
		return "emp_list";
	}
	
	
	@RequestMapping("emp_insert.do")
	public String insert(Model model) {
		
		// 담당업무를 조회하는 메서드 호출
		List<String> jobList = this.dao.getJobList();
		
		// 관리자를 조회하는 메서드 호출
		List<EmpDTO> mgrList = this.dao.getMgrList();
		
		// 부서번호를 조회하는 메서드 호출
		List<DeptDTO> deptList = this.dao.getDeptList();
		
		model.addAttribute("JobList", jobList);
		
		model.addAttribute("MgrList", mgrList);
		
		model.addAttribute("DeptList", deptList);
		
		return "emp_insert";
		
	}
	
	
	@RequestMapping("emp_insert_ok.do")
	public void insertOk(EmpDTO dto,
			HttpServletResponse response) throws IOException {
		
		int check = this.dao.insertEmp(dto);
		
		response.setContentType("text/html; charset=UTF-8");
		
		PrintWriter out = response.getWriter();
		
		if(check > 0) {
			out.println("<script>");
			out.println("alert('사원 등록 성공')");
			out.println("location.href='emp_list.do'");
			out.println("</script>");
		}else {
			out.println("<script>");
			out.println("alert('사원 등록 실패~~~')");
			out.println("history.back()");
			out.println("</script>");
		}
			
	}
		

	@RequestMapping("emp_content.do")
	public String cont(@RequestParam("no") int empno,
				Model model) {
		
		EmpDTO dto = this.dao.getEmp(empno);
		
		List<DeptDTO> deptList = this.dao.getDeptList();
		
		model.addAttribute("Cont", dto);
		
		model.addAttribute("DeptList", deptList);
		
		return "emp_content";
		
	}
	
	
	@RequestMapping("emp_modify.do")
	public String update(@RequestParam("no") int empno,
					Model model) {
		
		// 담당업무를 조회하는 메서드 호출
		List<String> jobList = this.dao.getJobList();
		
		// 관리자를 조회하는 메서드 호출
		List<EmpDTO> mgrList = this.dao.getMgrList();
		
		// 부서번호를 조회하는 메서드 호출
		List<DeptDTO> deptList = this.dao.getDeptList();
		
		// 사원번호에 해당하는 상세내역을 조회하는 메서드 호출
		EmpDTO dto = this.dao.getEmp(empno);
		
		
		model.addAttribute("JobList", jobList);
		
		model.addAttribute("MgrList", mgrList);
		
		model.addAttribute("DeptList", deptList);
		
		model.addAttribute("Modify", dto);
		
		return "emp_modify";
		
	}
	
	
	@RequestMapping("emp_modify_ok.do")
	public void updateOk(EmpDTO dto,
			HttpServletResponse response) throws IOException {
		
		int check = this.dao.updateEmp(dto);
		
		response.setContentType("text/html; charset=UTF-8");
		
		PrintWriter out = response.getWriter();
		
		if(check > 0) {
			out.println("<script>");
			out.println("alert('사원 정보 수정 성공!!!')");
			out.println("location.href='emp_content.do?no="+dto.getEmpno()+"'");
			out.println("</script>");
		}else {
			out.println("<script>");
			out.println("alert('사원 정보 수정 실패~~~')");
			out.println("history.back()");
			out.println("</script>");
		}
		
	}
	
	
	@RequestMapping("emp_delete.do")
	public void delete(@RequestParam("no") int empno,
			HttpServletResponse response) throws IOException {
		
		int check = this.dao.deleteEmp(empno);
		
		response.setContentType("text/html; charset=UTF-8");
		
		PrintWriter out = response.getWriter();
		
		if(check > 0) {
			out.println("<script>");
			out.println("alert('사원 삭제 성공!!!')");
			out.println("location.href='emp_list.do'");
			out.println("</script>");
		}else {
			out.println("<script>");
			out.println("alert('사원 삭제 실패~~~')");
			out.println("history.back()");
			out.println("</script>");
		}
		
		
	}
	
	
	
	
	
	
	
}
