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
	   <hr width="50%" color="marmoon">
	      <h3>MEMBER10 테이블 검색 리스트 페이지</h3>
	   <hr width="50%" color="marmoon">
	   <br>
	   
	   <table border="1" cellspacing="0" width="450">
	      <tr>
	         <th>회원 No.</th> <th>회원 이름</th>
	         <th>회원 직업</th> <th>회원 등록일</th>
	      </tr>
	      
	      <c:set var="list" value="${Search }" />
	      <c:if test="${!empty list }">
	         <c:forEach items="${list }" var="dto">
	            <tr>
	               <td> ${dto.getNum() } </td>
	               <td> ${dto.getMemname() } </td>
	               <td> ${dto.getJob() } </td>
	               <td> ${dto.getRegdate().substring(0, 10) } </td>
	            </tr>
	         </c:forEach>
	      </c:if>
	      
	      <c:if test="${empty list }">
	         <tr>
	            <td colspan="4" align="center">
	               <h3>검색된 회원 목록이 없습니다.....</h3>
	            </td>
	         </tr>
	      </c:if>
	      
	      <tr>
	         <td colspan="4" align="center">
	            <input type="button" value="회원목록"
	               onclick="location.href='member_list.do'">
	         </td>
	      </tr>
	   </table>
	
	</div>

</body>
</html>