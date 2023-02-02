$(function() {
	checkValid();
	/*checkValid2();*/
});

function checkValid() {
	let date = document.writeForm.fl_date;
	let category = document.writeForm.fl_category;
	let expense = document.writeForm.fl_expense;
	let income = document.writeForm.fl_income;
	let detail = document.writeForm.fl_detail;


	/*if (isEmpty(date)) {
		alert("날짜를 선택하세요.");
		date.value = "";
		date.focus();
		return false;
	}*/
	if (isEmpty(category)) {
		alert("항목을 선택하세요.");
		category.value = "";
		category.focus();
		return false;
	}
	
	if (isEmpty(expense)) {
		alert("지출비용을 입력하세요.");
		expense.value = 0;
		expense.focus();
		return false;
	}
	
	if (isEmpty(income)) {
		alert("수입비용을 입력하세요.");
		income.value = 0;
		income.focus();
		return false;
	}
	
/*	if ((expense == 0) && (income == 0)) {
		alert("비용을 입력하세요.");
		income.value = 0;
		expense.value = 0;
		return false;
	}*/
	if (isEmpty(detail)) {
		alert("상세내역을 입력하세요.");
		detail.value = "-";
		detail.focus();
		return false;
	}

	return true;
}


/*function checkValid2() {
	let date = document.editForm.fl_date;
	let category = document.editForm.fl_category;
	let expense = document.editForm.fl_expense;
	let income = document.editForm.fl_income;
	let detail = document.editForm.fl_detail;

	// ID
	if (isEmpty(date)) {
		alert("날짜를 선택하세요.");
		date.value = "";
		date.focus();
		return false;
	}
	// PW
	if (isEmpty(category)||(category=="카테고리를 입력하세요")) {
		alert("항목을 선택하세요.");
		category.value = "";
		category.focus();
		return false;
	}
	
	if (isEmpty(expense)) {
		alert("지출비용을 입력하세요.");
		expense.value = 0;
		expense.focus();
		return false;
	}
	
	if (isEmpty(income)) {
		alert("수입비용을 입력하세요.");
		income.value = 0;
		income.focus();
		return false;
	}
	
	if ((expense ==0)||(income ==0)) {
		alert("비용을 입력하세요.");
		income.value = 0;
		expense.value=0;
		return false;
	}
	if (isEmpty(detail)) {
		alert("상세내역을 입력하세요.");
		detail.value = "-";
		detail.focus();
		return false;
	}

	return true;
}*/