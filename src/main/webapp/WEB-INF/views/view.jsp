<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/board.css">
</head>
<body>
	<div class="space_3rem"></div>
	<div class="board_wrap">
		<div class="board_title">
			<!-- <h2>자유게시판</h2> -->
			${r }
		</div>
		<div class="board_list_wrap">
			<c:forEach var="f" items="${msgs}">
				<a class="back_btn" href="javascript:goBack();">&lt; BACK</a>
				<script type="text/javascript">
					$(function() {
						$('#delete_btn').click(function() {
							alert("선택한 정보가 삭제되었습니다.");
						});
					});
				</script>
				<div class="board_list">
					<div class="top">
						<div class="category">카테고리</div>
						<div class="expense">지출</div>
						<div class="income">수입</div>
						<div class="detail">상세내역</div>
						<div class="date">작성일</div>
					</div>
					<div>
						<div class="category">${f.fl_category}</div>
						<div class="expense">${f.fl_expense }</div>
						<div class="income">${f.fl_income }</div>
						<div class="detail">${f.fl_detail}</div>
						<div class="date">${f.fl_date }</div>
					</div>
				</div>
				<div class="btn_grp">
					<a class="up_btn" href="edit.go?fl_no=${f.fl_no }">수정</a> 
					<a class="de_btn" id="delete_btn" href="delete.go?fl_no=${f.fl_no }">삭제</a>

				</div>
			</c:forEach>
		</div>
	</div>
</body>
</html>