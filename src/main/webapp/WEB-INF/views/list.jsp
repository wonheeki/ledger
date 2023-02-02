<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/board.css">
<link rel="stylesheet" href="resources/css/style.css">
</head>
<body>
	<div class="space_3rem"></div>
	<div class="board_wrap">
		<div class="board_title">
			<!-- <h2>자유게시판</h2> -->
			${r }
		</div>
		<div class="board_list_wrap">
			<div class="board_list">
				<div class="top">
					<div class="no">번호</div>
					<div class="category">카테고리</div>
					<div class="expense">지출</div>
					<div class="income">수입</div>
					<div class="detail">상세내역</div>
					<div class="date">작성일</div>
				</div>
				<c:forEach var="f" items="${msgs }">
					<div class="list_hover" onclick="location.href ='view.go?fl_no=${f.fl_no}'">
						<div class="no">${f.rn }</div>
						<div class="category"><a href="view.go?fl_no=${f.fl_no }">${f.fl_category}</a></div>
						<div class="expense"><a href="view.go?fl_no=${f.fl_no }">${f.fl_expense }</a></div>
						<div class="income"><a href="view.go?fl_no=${f.fl_no }">${f.fl_income }</a></div>
						<div class="detail"><a href="view.go?fl_no=${f.fl_no }">${f.fl_detail}</a></div>
						<div class="date"><a href="view.go?fl_no=${f.fl_no }">${f.fl_date }</a></div>
					</div>
				</c:forEach>
			</div>
		</div>
		</div>
</body>
</html>