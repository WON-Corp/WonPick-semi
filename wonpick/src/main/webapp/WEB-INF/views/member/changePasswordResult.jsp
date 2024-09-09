<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=3.0">
    <title>비밀번호 찾기 결과</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <style>
    body {
        font-family: 'Poppins', sans-serif;
        background-color: #f8f9fa;
        margin: 0;
        padding: 0;
        color: #333;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
    }

    .main {
        width: 100%;
        max-width: 600px;
        background-color: #ffffff;
        padding: 40px;
        box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
        border-radius: 15px;
        text-align: center;
    }

    .main h4 {
        margin-bottom: 30px;
        font-size: 2em;
        color: #333;
        border-bottom: 3px solid #333;
        padding-bottom: 15px;
    }

    .main p {
        font-size: 1.2em;
        margin-bottom: 20px;
        color: #333;
    }

    .main a {
        display: inline-block;
        padding: 10px 20px;
        background-color: #333;
        color: white;
        border-radius: 5px;
        text-decoration: none;
        transition: background-color 0.3s ease;
    }

    .main a:hover {
        background-color: #555;
    }
    </style>
</head>
<body>
    <div class="main">
        <h4>비밀번호 찾기 결과</h4>
<% 
	    String result = (String) session.getAttribute("result"); 
	        out.println(result);
        session.removeAttribute("result");
%>
        <br><br>
        <a href="/wonpick">로그인 페이지로 이동</a>
    </div>
</body>
</html>
