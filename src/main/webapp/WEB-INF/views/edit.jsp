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
				<a class="back_btn" href="javascript:goBack();">&lt; BACK</a>
				<div class="board_list">
					<div class="top_ed">
						<div class="ed_category">카테고리</div>
						<div class="ed_expense">지출</div>
						<div class="ed_income">수입</div>
						<div class="ed_detail">상세내역</div>
						<div class="ed_date">작성일</div>
					</div>
					<c:forEach var="f" items="${msgs}">
						<form action="update.go?fl_no=${f.fl_no }" method="POST" >
							<div class="up_wrap">
								<input name="fl_no" id="fl_no" value="${f.fl_no }" type="hidden">
								<div class="ed_category">
									<select class="ed_select" name="fl_category" id="fl_category">
										<option value="-">카테고리를 선택하세요</option>
										<optgroup label="수입">
											<option value="월급">월급</option>
											<option value="용돈">용돈</option>
											<option value="(수입)기타">기타</option>
										</optgroup>
										<optgroup label="지출">
											<option value="식비">식비</option>
											<option value="생활비">생활비</option>
											<option value="공과금">공과금</option>
											<option value="경조사비">경조사비</option>
											<option value="여행비">여행비</option>
											<option value="교육비">교육비</option>
											<option value="교통비">교통비</option>
											<option value="여가">여가</option>
											<option value="쇼핑">쇼핑</option>
											<option value="의료">의료</option>
											<option value="(지출)기타">기타</option>
										</optgroup>
									</select>

								</div>
								<div class="ed_expense">
									<input type="text" value="${f.fl_expense}" name="fl_expense">
								</div>
								<div class="ed_income">
									<input type="text" value="${f.fl_income }" name="fl_income">
								</div>
								<div class="ed_detail">
									<input type="text" value="${f.fl_detail }" name="fl_detail">
								</div>
								<div class="ed_date">
									<input type="date" name="fl_date" value="${f.fl_date }"
										class="ed_calendar" min="2000-01-01" max="2100-12-31">
								</div>
							</div>
							<div class="btn_grp">
								<button class="up_btn" id="update">확인</button>
								<input class="de_btn" type="reset" value="취소">

							</div>
						</form>
					</c:forEach>
				</div>
			</div>
	</div>
</body>
</html>