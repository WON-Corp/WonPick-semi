<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=3.0">
    <title>아이디 찾기</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    
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
    }

    .main h4 {
        margin-bottom: 30px;
        text-align: center;
        font-size: 2em;
        color: #333;
        border-bottom: 3px solid #333;
        padding-bottom: 15px;
    }

    fieldset {
        border: none;
        padding: 0;
        margin: 0;
    }

    .input-group {
        margin-bottom: 25px;
        position: relative;
    }

    input[type=text], 
    input[type=email] {
        width: 100%;
        padding: 15px;
        margin: 8px 0;
        border: 2px solid #ccc;
        border-radius: 10px;
        background-color: #f1f1f1;
        color: #333;
        font-family: 'Poppins', sans-serif;
        box-sizing: border-box;
        transition: all 0.3s ease;
    }

    input[type=text]:focus, 
    input[type=email]:focus {
        border-color: #333;
        background-color: #e9ecef;
    }

    input[type=submit] {
        width: 100%;
        background-color: #333;
        color: white;
        padding: 16px 0;
        margin: 8px 0;
        border: none;
        border-radius: 10px;
        cursor: pointer;
        transition: background-color 0.3s ease;
        font-family: 'Poppins', sans-serif;
    }

    input[type=submit]:hover {
        background-color: #555;
    }

    .error {
        font-size: 0.8em;
        color: #ff4d4d;
        position: absolute;
        top: 12px;
        right: 10px;
    }

    .valid {
        font-size: 0.8em;
        color: #2ecc71;
        position: absolute;
        top: 12px;
        right: 10px;
    }
    
    </style>
</head>
<body>
    <div class="main">
        <h4>아이디 찾기</h4>
        <form id="findIdForm" action="/wonpick/member/findId" method="post" onsubmit="return findIdForm();">
            <fieldset>
                <div class="input-group">
                    <input type="text" id="userName" name="userName" placeholder="이름" required> 
                    <span id="msgName" class="error"></span>
                </div>
                <div class="input-group">
                    <input type="email" id="email" name="email" placeholder="이메일 (ex@wonpick.com)" required>
                    <span id="msgEmail" class="error"></span>
                </div>
                <input type="submit" value="아이디 찾기">
            </fieldset>
        </form>
    </div>

    <script>
        function findIdForm() {
            let form = true;

            const userName = document.getElementById("userName");
            const email = document.getElementById("email");
            const nameForm = /^[가-힣]{2,6}$/;
            const emailForm = /([\w\-]+\@[\w\-]+\.[\w\-]+)/;

            // 이름 검사
            if (!nameForm.test(userName.value)) {
                document.getElementById("msgName").textContent = "2~6글자 한글로만 작성하세요.";
                form = false;
            } else {
                document.getElementById("msgName").textContent = "";
            }

            // 이메일 검사
            if (!emailForm.test(email.value)) {
                document.getElementById("msgEmail").textContent = "이메일 형식을 확인하세요.";
                form = false;
            } else {
                document.getElementById("msgEmail").textContent = "";
            }

            return form;
        }
    </script>
</body>
</html>
