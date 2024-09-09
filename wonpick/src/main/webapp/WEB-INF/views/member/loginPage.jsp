<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>WonPick 로그인</title>
<style>
div {
	box-sizing: border-box;
}

body {
	background-color: rgb(35, 59, 59);
}

/** 전체를 감싸는 div 영역 */
.wrap {
	width: 800px;
	height: 800px;
	min-height: 500px;
	margin: auto;
	margin-top: 30px;
	text-align: center;
	background-color: #fff;
}

#header {
	height: 40%;
}

#footer {
	height: 10%;
	font-size: small;
	color: gray;
}

#login {
	height: 40%;
	line-height: 80px;
	position: relative;
	padding-top: 30px;
}

#findUser {
	height: 10%;
	padding-top: 5px;
	border-top: 2px solid gray;
	margin-left: 30px;
	margin-right: 30px;
}

#login>div {
	height: 100%;
	float: left;
}

#userId, #password {
	width: 60%;
	height: 40px;
	font-size: large;
	padding-left: 20px;
}

input[type=submit] {
	margin-top: 40px;
	height: 50px;
	width: 40%;
	border: none;
	background-color: rgba(140, 214, 214, 0.973);
	color: #fff;
	font-size: larger;
	font-weight: 900;
}

input[type=submit]:hover {
	background-color: rgba(24, 53, 53, 0.973);
	cursor: pointer;
	transition: all 0.4s;
}

img {
	padding-top: 20px;
}

a {
	text-decoration: none;
	color: rgb(69, 20, 116);
}

a:hover {
	color: red;
}
</style>
</head>
<body>
	<%
	String alertMsg = (String) session.getAttribute("alertMsg");
	%>
	<%
	if (alertMsg != null) {
	%>
	<script>
			alert("<%=alertMsg%>");
		</script>
	<%
	session.removeAttribute("alertMsg");
	%>
	<%
	}
	%>

	<form action="<%= request.getContextPath() %>/member/login" method="post">
		<div class="wrap">
			<div id="header">
				<img src="resources/img/logo.jpg" alt=""
					style="border-radius: 15px;"> <br>
				<h1>
					<em>WonPick</em>
				</h1>
			</div>
			<div id="login">
				<input type="text" id="userId" name="userId" placeholder="아이디">
				<br> <input type="password" id="password" name="password"
					placeholder="비밀번호"> <br> <input type="submit"
					value="로 그 인"> <br>

			</div>
			<div id="findUser">
				<a href="member/findIdForm">아이디</a> / <a
					href="member/changePwdUserForm">비밀번호 찾기</a>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href="<%= request.getContextPath() %>/member/join">회원가입</a>
			</div>
			<div id="footer">&copy; W.O.N Corp.</div>
		</div>
	</form>
</body>
</html>