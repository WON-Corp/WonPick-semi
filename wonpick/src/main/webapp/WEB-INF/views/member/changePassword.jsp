<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=3.0">
    <title>비밀번호 찾기</title>
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

    input[type=password] {
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

    input[type=password]:focus {
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
        <h4>비밀번호 변경</h4>
        <form id="findPasswordForm" action="changePassword" method="post" onsubmit="return findPasswordForm();">
            <fieldset>
                <div class="input-group">
                    <input type="password" id="userPwd" name="password" placeholder="비밀번호" required> 
                    <span id="msgPassword" class="error"></span>
                </div>
                <div class="input-group">
                    <input type="password" id="pwdCheck" placeholder="비밀번호 확인" required>
                    <span id="msgPwdCheck" class="error"></span>
                </div>
                <input type="hidden" name="userId" value="${userId}">
                <input type="submit" value="비밀번호 변경">
            </fieldset>
        </form>
    </div>

    <script>
        function findPasswordForm() {

            const pwd = document.getElementById("userPwd").value;
            const pwdCheck = document.getElementById("pwdCheck").value;
            const pwdForm = /^(?=.*[a-zA-Z])((?=.*\d)|(?=.*\W)).{6,20}$/;

            // 비밀번호 유효성 검사
            if (!pwdForm.test(pwd)) {
                document.getElementById("msgPassword").innerHTML = "숫자포함 최소 6자리 이상";
                return false;
            } else {
                document.getElementById("msgPassword").innerHTML = "";
            }

            // 비밀번호 확인 유효성 검사
            if (pwd != pwdCheck) {
                document.getElementById("msgPwdCheck").innerHTML = "비밀번호와 일치하지 않습니다.";
                return false;
            } else {
                document.getElementById("msgPwdCheck").innerHTML = "";
            }

            return confirm("비밀번호를 변경하시겠습니까?");
        }
    </script>
</body>
</html>
