<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Financial ledger</title>
<link rel="icon" href="resources/img/android-icon-144x144.png">
<script type="text/javascript" src="resources/js/jQuery.js"></script>
<script type="text/javascript" src="resources/js/main.js"></script>
<script type="text/javascript" src="resources/js/KiValidChecker.js"></script>
<script type="text/javascript" src="resources/js/validCheck.js"></script>
<script type="text/javascript" src="resources/js/index.global.js"></script>
<link rel="stylesheet" href="resources/css/style.css">
</head>
<body>
	
	<div class="nav">
		<a href="home.go" class="logo"> 
			<!-- <img src="resources/img/calendar.png" alt="" width="30"
				height="24">  -->Financial Ledger
		</a>
	</div>
	<div id="load">
    	<img src="resources/img/loading.gif" alt="loading">
	</div>
	<div class="space_5rem"></div>
	<jsp:include page="${cp }" />
</body>
</html>