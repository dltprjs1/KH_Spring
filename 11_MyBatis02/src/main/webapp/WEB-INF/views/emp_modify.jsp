<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<div align="center">
	   <c:set var="dto" value="${Modify }" />
	   <hr width="50%" color="gray">
	      <h3>EMP 테이블 ${dto.getEname() } 사원 정보 수정 폼 페이지</h3>
	   <hr width="50%" color="gray">
	   <br>
	   
	   <form method="post" 
	      action="<%=request.getContextPath() %>/emp_modify_ok.do">
	   
	      <c:set var="jlist" value="${JobList }" />
	      <c:set var="mlist" value="${MgrList }" />
	      <c:set var="dlist" value="${DeptList }" />
	      
	      <table border="1" cellspacing="0" width="400">
	         <tr>
	            <th>사원 No.</th>
	            <td> 
	               <input name="empno"
	                         value="${dto.getEmpno() }" readonly>
	            </td>
	         </tr>
	         
	         <tr>
	            <th>사원 이름</th>
	            <td> 
	               <input name="ename"
	                         value="${dto.getEname() }" readonly>
	            </td>
	         </tr>
	         
	         <tr>
	            <th>담당업무</th>
	            <td>
	               <select name="job">
	                  <c:if test="${empty jlist }">
	                     <option value="">:::담당업무 없음:::</option>
	                  </c:if>
	                
	                  <c:if test="${!empty jlist }">
	                     <c:forEach items="${jlist }" var="str">
	                        <c:if test="${dto.getJob() == str }">
	                           <option value="${str }" selected>${str }</option>
	                        </c:if>
	                        
	                        <c:if test="${dto.getJob() != str }">
	                           <option value="${str }">${str }</option>
	                        </c:if>
	                     </c:forEach> 
	                  </c:if>
	               </select>
	         
	            </td>
	         </tr>
	         
	         <tr>
	            <th>관리자 No.</th>
	            <td>
	               <select name="mgr">
	                  <c:if test="${empty mlist }">
	                     <option value="">:::관리자 없음:::</option>
	                  </c:if>
	                
	                  <c:if test="${!empty mlist }">
	                     <c:forEach items="${mlist }" var="mdto">
	                        <c:if test="${dto.getMgr() == mdto.getEmpno() }">
	                           <option value="${mdto.getEmpno() }" selected>
	                               ${mdto.getEname() } [${mdto.getEmpno() }]</option>
	                        </c:if>
	                        
	                        <c:if test="${dto.getMgr() != mdto.getEmpno() }">
	                           <option value="${mdto.getEmpno() }">
	                               ${mdto.getEname() } [${mdto.getEmpno() }]</option>
	                        </c:if>
	                     </c:forEach>
	                  </c:if>
	               </select>
	         
	            </td>
	         </tr>
	         
	         <tr>
	            <th>사원 급여</th>
	            <td> 
	               <input name="sal"
	                         value="${dto.getSal() }">
	            </td>
	         </tr>
	         
	         <tr>
	            <th>사원 보너스</th>
	            <td> 
	               <input name="comm"
	                         value="${dto.getComm() }">
	            </td>
	         </tr>
	         
	         <tr>
	            <th>부서 No.</th>
	            <td>
	               <select name="deptno">
	                  <c:if test="${empty dlist }">
	                     <option value="">:::부서번호 없음:::</option>
	                  </c:if>
	                
	                  <c:if test="${!empty dlist }">
	                     <c:forEach items="${dlist }" var="ddto">
	                        <c:if test="${dto.getDeptno() == ddto.getDeptno() }">
	                           <option value="${ddto.getDeptno() }" selected>
	                               ${ddto.getDname() } [${ddto.getDeptno() }]</option>
	                        </c:if>
	                        
	                        <c:if test="${dto.getDeptno() != ddto.getDeptno() }">
	                           <option value="${ddto.getDeptno() }">
	                               ${ddto.getDname() } [${ddto.getDeptno() }]</option>
	                        </c:if>
	                     </c:forEach>
	                  </c:if>
	               </select>
	            </td>
	         </tr>
	         
	         <tr>
	            <td colspan="2" align="center">
	               <input type="submit" value="사원수정">&nbsp;&nbsp;
	               <input type="reset" value="다시작성">
	            </td>
	         </tr>
	      </table>
	   
	   </form>
	</div>
</body>
</html>