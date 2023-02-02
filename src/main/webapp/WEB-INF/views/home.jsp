<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<html>
<head>
<title>Home</title>
<link rel="icon" href="resources/img/android-icon-144x144.png">
</head>
<body>
	<script>
		result = []
	</script>
	<c:forEach var="f" items="${ledgers }">
		<script>
			var c = "<c:out value='${f.fl_category}'/>";
			var d = "<c:out value='${f.fl_date}'/>";
			result.push({
				"title" : c,
				"start" : d
			});
		</script>
	</c:forEach>
	<script type="text/javascript">
		document.addEventListener('DOMContentLoaded', function() {

			var calendarEl = document.getElementById('calendar');

			var calendar = new FullCalendar.Calendar(calendarEl, {
				/* initialDate : '2023-01-10', */
				editable : true,
				selectable : true,
				businessHours : true,
				/* async: false, */
				dayMaxEvents : true, // allow "more" link when too many events
				events : result
			/* [{
			title : 'Dinner',
			start : '2020-09-12T20:00:00'
			}, {
			title : 'Birthday Party',
			start : '2020-09-13T07:00:00'
			} ] */
			});

			calendar.render();
		});
	</script>
	<div class="wrapper">
		<div class="background_wrap">
			<div class="background">
				<img src="resources/img/background.jpg">
			</div>
			<div class="ledgerForm">
				<form action="write.go" method="post" name="writeForm" onsubmit="return checkValid();">
					<input name="token" value="${token }" type="hidden">
					<div class="fl_tbl">
						<div class="fl_th">날짜</div>
						<div class="fl_td">
							<!-- <input type="text" class="fl_input" id="fl_date"
								name="fl_date" placeholder="ex) 2023-01-01"> -->
							<input type="date" id="fl_date" name="fl_date"
								class="fl_calendar" min="2000-01-01" max="2100-12-31">
						</div>
					</div>
					<div class="fl_tbl">
						<div class="fl_th">항목</div>
						<div class="fl_td">
							<select class="fl_select" name="fl_category" id="fl_category">
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
					</div>
					<div class="fl_tbl" id="tbl_expense">
						<div class="fl_th">지출</div>
						<div class="fl_td">
							<input type="text" class="fl_input" name="fl_expense"
								id="fl_expense" value="0">
						</div>
					</div>
					<div class="fl_tbl" id="tbl_income">
						<div class="fl_th">수입</div>
						<div class="fl_td">
							<input class="fl_input" type="text" name="fl_income"
								id="fl_income" value="0">
						</div>
					</div>
					<div class="fl_tbl">
						<div class="fl_th">상세내역</div>
						<div class="fl_td">
							<input type="text" class="fl_input" name="fl_detail"
								id="fl_detail" value="-">
						</div>
					</div>
					<input id="cancel" class="main_btn" type="reset" value="취소">
					<button id="confirm" class="main_btn">확인</button>
				</form>
			</div>
			<div class="result">
				<div class="result_point">
					이번 달에는 <br>돈을 이렇게 썼어요
				</div>
				<div class="in">
					이번 달 수입
					<div class="in_point">${monthIncome }</div>
				</div>
				<div class="out">
					이번 달 지출
					<div class="out_point">${monthExpense }</div>
				</div>
				<div class="total">
					잔여 금액
					<div class="re_point">${total }</div>
				</div>
				<div class="ledger_list">
					<a href="list.go">가계부 내역 보기</a>
				</div>
			</div>

		</div>



		<h1>${r }</h1>
		<%-- <c:choose>
			<c:when test="${r =='성공'}">
				<script type="text/javascript">
					$(function() {
						$('#confirm').click(function() {
							alert("입력 성공!");
							location.href="home.go";
						});
					});
				</script>
			</c:when>
			<c:when test="${r =='실패' }">
				<script type="text/javascript">
					$(function() {
						$('#confirm').click(function() {
							alert("입력 실패!");
							location.href="home.go";
						});
					});
				</script>
			</c:when>
		</c:choose> --%>
		<div id="calendar"></div>

	</div>
</body>
</html>
