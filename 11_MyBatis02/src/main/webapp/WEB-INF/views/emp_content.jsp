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
	   <c:set var="dto" value="${Cont }" />
	   <hr width="50%" color="red">
	      <h3>EMP 테이블 ${dto.getEname() } 사원 상세 정보 페이지</h3>
	   <hr width="50%" color="red">
	   <br>
	   
	   <table border="1" cellspacing="0" width="400">
	      <tr>
	         <th>사원 No.</th>
	         <td> ${dto.getEmpno() } </td>
	      </tr>
	      
	      <tr>
	         <th>사원 이름</th>
	         <td> ${dto.getEname() } </td>
	      </tr>
	      
	      <tr>
	         <th>담당 업무</th>
	         <td> ${dto.getJob() } </td>
	      </tr>
	      
	      <tr>
	         <th>관리자 No.</th>
	         <td> ${dto.getMgr() } </td>
	      </tr>
	      
	      <tr>
	         <th>사원 급여</th>
	         <td> ${dto.getSal() } </td>
	      </tr>
	      
	      <tr>
	         <th>사원 보너스</th>
	         <td> ${dto.getComm() } </td>
	         
	      </tr>
	      
	      <tr>
	         <th>부서 No.</th>
	         
	         <c:set var="dlist" value="${DeptList }" />
	            <c:forEach items="${dlist }" var="ddto">
	               <c:if test="${dto.getDeptno() == ddto.getDeptno() }">
	                  <td> ${ddto.getDeptno() } [${ddto.getDname() }] </td>
	               </c:if>
	            </c:forEach>
	      </tr>
	      
	      <tr>
	         <th>입사일자</th>
	         <td> ${dto.getHiredate() } </td>
	      </tr>
	      
	      <c:if test="${empty dto }">
	         <tr>
	            <td colspan="2" align="center">
	               <h3>조회된 사원 정보가 없습니다.....</h3>
	            </td>
	         </tr>
	      </c:if>
	      
	      <tr>
	         <td colspan="2" align="center">
	            <input type="button" value="사원수정"
	               onclick="location.href='emp_modify.do?no=${dto.getEmpno() }'">
	      
	            <input type="button" value="사원삭제"
	               onclick="if(confirm('정말로 사원을 삭제하시겠습니까?')) {
	                             location.href='emp_delete.do?no=${dto.getEmpno() }'
	                        } else { return; }">
	      
	            <input type="button" value="전체사원"
	               onclick="location.href='emp_list.do'">
	         </td>
	      </tr>
	   </table>
	
	</div>
</body>
</html>