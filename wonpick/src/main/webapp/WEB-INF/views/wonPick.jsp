<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- 폰트 링크 -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link
        href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900&display=swap"
        rel="stylesheet">

    <!-- 아이콘 링크 -->
    <script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
    <script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>

    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">

    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

    <!-- Popper JS -->
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>

    <!-- Latest compiled JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

    <title>WonPick</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Poppins', sans-serif;
            scroll-behavior: smooth;
        }

        body {
            display: flex;
            height: 100vh;
            overflow-y: auto;
        }

        /*navigation 스타일 시작*/
        .navigation {
            position: fixed;
            width: 75px;
            background-color: #fff;
            padding: 20px;
            transition: width 0.5s;
            border-right: 1px solid #ddd;
            z-index: 99;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100%;
            min-height: 800px;
        }

        .navigation.open {
            width: 250px;
            min-height: 800px;
        }

        .navigation .menuToggle {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 60px;
            border-bottom: 1px solid rgba(0, 0, 0, 0.25);
            cursor: pointer;
            display: flex;
            align-items: center;
            justify-content: flex-start;
            padding: 0 23px;
            box-sizing: border-box;
        }

        .navigation .menuToggle::before {
            content: '';
            position: absolute;
            width: 30px;
            height: 2px;
            background-color: #333;
            transform: translateY(-8px);
            transition: all 0.5s;
        }

        .navigation.open .menuToggle::before {
            transform: translateY(0px) rotate(45deg);
        }

        .navigation .menuToggle::after {
            content: '';
            position: absolute;
            width: 30px;
            height: 2px;
            background-color: #333;
            transform: translateY(8px);
            transition: all 0.5s;
            box-shadow: 0 -8px 0 #333;
        }

        .navigation.open .menuToggle::after {
            transform: translateY(0px) rotate(-45deg);
            box-shadow: 0 0 0 #333;
        }

        .navigation .logo {
            width: 55px;
            height: 55px;
            border-radius: 50%;
            transition: all 0.5s ease-in-out;
        }

        .navigation .logo-text {
            font-size: 14px;
            /* 텍스트 크기 조정 */
            color: #333;
            text-align: center;
            font-family: "Ubuntu", sans-serif;
            font-style: italic;
        }

        /* 네비게이션이 열릴 때 로고와 텍스트 표시 */
        .navigation .logo-container {
            display: flex;
            flex-direction: column;
            align-items: center;
            opacity: 0;
            visibility: hidden;
            transition: opacity 1s ease-in,
        }

        .navigation.open .logo {
            width: 80px;
            height: auto;
        }

        .navigation.open .logo-container {
            opacity: 1;
            visibility: visible;
            margin-left: 60px;
            margin-bottom: 100px;
            transition-delay: 0.3s;
            /* 로고와 텍스트 표시 0.3 초 딜레이 */
        }

        .navigation ul {
            display: flex;
            flex-direction: column;
            margin-top: 10px;
            gap: 10px;
            width: 100%;
        }

        .navigation ul li {
            list-style: none;
            position: relative;
            width: 100%;
            padding: 0 5px;
            transition: all 0.4s;
        }

        .navigation ul li.active {
            transform: translateX(30px);
        }

        .navigation ul li a {
            position: relative;
            display: flex;
            align-items: center;
            justify-content: flex-start;
            text-align: center;
            text-decoration: none;
        }

        .navigation ul li a .icon {
            position: relative;
            display: block;
            width: 55px;
            height: 55px;
            line-height: 55px;
            transition: all .4s;
            border-radius: 10px;
            font-size: 30px;
            color: #222;
        }

        /* navigation의 텍스트를 가렸다가 */
        .navigation ul li a .text {
            position: relative;
            padding: 0 px;
            display: flex;
            align-items: center;
            color: #333;
            opacity: 0;
            visibility: hidden;
            transition: 0.4s;
        }

        /* navigation의 텍스트 보이게 함 */
        .navigation.open ul li a .text {
            opacity: 1;
            visibility: visible;
        }

        .content {
            flex: 1;
            margin-left: 120px;
            margin-right: 330px;
            padding: 20px;
            transition: margin-left 0.4s, margin-right 0.4s;
        }

        /* nav가 열릴 때 좌우 여백도 같이 줄어들음 */
        .navigation.open~.content {
            margin-left: 250px;
        }

        /* 푸터 영역 */
        .footer {
            position: absolute;
            bottom: 20px;
            left: 10px;
            opacity: 0;
            transition: opacity 1s ease-in;
            font-size: 12px;
            color: #666;
        }

        /* navigation이 열렸을 때 푸터가 보이게 함 */
        .navigation.open .footer {
            opacity: 1;
            visibility: visible;
        }


        /* 헤더 시작*/
        header {
            padding: 20px 0;
            display: flex;
            justify-content: center;
        }

        .stories {
            display: flex;

            gap: 15px;
            overflow-x: auto;
            padding: 20px 0;
            padding-left: 30px;
        }

        .story {
            display: flex;

            flex-direction: column;
            align-items: center;
            width: 70px;
            text-align: center;
        }

        .story img {
            width: 60px;
            height: 60px;
            border-radius: 50%;
            border: 2px solid #356060;
            /* ToDo - 그라데이션 입혀서 새 스토리 확인 */
            object-fit: cover;
        }

        .story span {
            margin-top: 5px;
            font-size: 12px;
            color: #333;
        }

        .feed {
            background-color: #fff;

            padding: 10px;
            margin-top: 20px;
            padding: 0 10%;
            display: flex;
            justify-content: center;
        }

        .post {
            background-color: #fff;

            padding: 20px 100px;
            margin-bottom: 15px;
            border-radius: 5px;
            box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);
            max-width: 750px;
        }

        .post-header {
            display: flex;
            align-items: center;
            justify-content: space-between;
        }

        .post-profile-img {
            width: 40px;
            height: 40px;
            border-radius: 50%;
        }

        .post-info h3 {
            margin: 0;

            font-size: 14px;
            font-weight: bold;

        }

        .post-time {
            font-size: 12px;

            color: #888;
        }

        .post-options {
            font-size: 20px;

            cursor: pointer;
        }

        .post-image {
            width: 100%;
            margin-top: 15px;
            border-radius: 10px;
        }

        .post-content {
            margin-top: 10px;

        }

        .post-actions ion-icon {
            font-size: 20px;

            margin-right: 10px;
            cursor: pointer;
        }

        .view-comments {
            color: #888;

            font-size: 12px;
            cursor: pointer;
        }

        /* my profile 창 */
        .myprofile {
            width: 300px;
            height: 129px;
            box-sizing: border-box;
            position: fixed;
            right: 0;
            top: 0;
            border-left: 1px solid #ddd;
            border-bottom: 1px solid #ddd;
            overflow: hidden;
            
        }

        .myprofile h4{
            margin-top: 10px;
            margin-left: 10px;
            margin-bottom: 5px;
        }

        .myprofile img {
            width: 60px;
            height: 60px;
            border-radius: 50%;
            background-color: #ddd;
            margin: 10px 15px;
            object-fit: cover;
        }

        .myprofile .myname {
            position: absolute;
            top: 65px;

        }
        
        .logout {
            cursor: pointer;
            font-size: x-small;
            color: #aaa;
            margin-top: 0px;
        }
        /* my profile 창 끝 */

        /* 오른쪽 WM창 */

        .sidebar-message {
            width: 300px;
            background-color: #fff;
            max-height: 1000px;
            padding: 10px 15px;
            box-sizing: border-box;
            position: fixed;
            right: 0;
            /* Todo --수정 */
            top: 130px;
            bottom: 0;
            border-left: 1px solid #ddd;
            overflow-y: auto;
        }

        .sidebar-message h3 {
            margin-bottom: 15px;

            font-size: 16px;
            font-weight: bold;
            color: #333;
        }

        .message-list {
            list-style: none;

            padding: 0;
            margin: 0;
        }

        .message-list li {
            display: flex;

            align-items: center;
            padding: 8px 5px;
            border-bottom: 1px solid #ddd;
            cursor: pointer;
        }

        .message-list li:hover {
            background-color: #f0f0f0;

            transition: 0.4s ease-in-out;
        }

        .message-list img {
            width: 50px;

            height: 50px;
            border-radius: 50%;
            margin-right: 10px;
            object-fit: cover;
        }

        .message-list .message-info {
            display: flex;

            flex-direction: column;
            justify-content: center;
        }

        .message-list .message-info .name {
            font-weight: bold;

            color: #333;
        }

        .message-list .message-info .message-text {
            font-size: 14px;

            color: #888;
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;
        }

        .message-list .message-info .time {
            font-size: 11px;

            color: #aaa;
            margin-top: 2px;
        }

        /* 오른쪽 WM창 끝 */

        /* 더보기 팝업 메뉴 */

        .more-popup {
            position: absolute;
            display: none;
            bottom: 50px;
            left: 170px;
            transform: translateX(-50%);
            width: 200px;
            background-color: #fff;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 8px;           
            z-index: 100;
        }

        .more-popup.active {
            display: block;

        }

        .more-popup ul {
            list-style: none;

            padding: 0;
            margin: 0;
        }

        .more-popup ul li {
            padding: 10px;
            cursor: pointer;
            display: flex;
            align-items: center;
        }

        .more-popup ul li:hover {
            background-color: #f0f0f0;
        }

        .more-popup ul li ion-icon {
            margin-right: 10px;
        }

        .more-popup button {
            width: 100%;
            border: none;
            background-color: #fff;
        }

        @media all and (min-width:0px) and (max-width:1100px) {
            .sidebar-message {
                display: none;
            }

            .myprofile {
                display: none;
            }
        }
    </style>
</head>

<body>

    <%
	String contextPath = request.getContextPath();
	
	String alertMsg = (String)session.getAttribute("alertMsg");
    %>

	<% if (alertMsg != null) {%>
		<script>
			alert("<%= alertMsg%>");
		</script>
		<% session.removeAttribute("alertMsg"); %>
	<% } %>


    
    <div class="navigation">
        <div class="menuToggle"></div>

        <!-- navigation 아이콘은 https://ionic.io/ionicons 사이트 접속 후 사용함!! -->
        <ul>
            <!--  로고 및 텍스트 -->
            <li class="list">
                <a href="Main.html">
                    <div class="logo-container">
                        <img src="resources/img/logo.jpg" alt="WonPick 로고" class="logo">
                        <p class="logo-text">WonPick</p>
                    </div>
                </a>
                <!-- list 로고 끝 -->
            </li>
            <li class="list">
                <a href="Main.html">
                    <span class="icon">
                        <ion-icon name="home-outline"></ion-icon>
                    </span>
                    <span class="text">홈</span>
                </a>
            </li>
            <li class="list">
                <a href="#">
                    <span class="icon">
                        <ion-icon name="search-outline"></ion-icon>
                    </span>
                    <span class="text">검색</span>
                </a>
            </li>
            <li class="list">
                <a href="#">
                    <span class="icon">
                        <ion-icon name="caret-forward-circle-outline"></ion-icon>
                    </span>
                    <span class="text">릴스</span>
                </a>
            </li>
            <li class="list">
                <a href="#">
                    <span class="icon">
                        <ion-icon name="chatbubble-outline"></ion-icon>
                    </span>
                    <span class="text">메시지</span>
                </a>
            </li>
            <li class="list">
                <a href="#">
                    <span class="icon">
                        <ion-icon name="heart-outline"></ion-icon>
                    </span>
                    <span class="text">알림</span>
                </a>
            </li>
            <li class="list">
                <a href="#">
                    <span class="icon">
                        <ion-icon name="color-wand-outline"></ion-icon>
                    </span>
                    <span class="text">만들기</span>
                </a>
            </li>

            <li class="list">
                <a href="#" id="more-btn">
                    <span class="icon">
                        <ion-icon name="add-circle-outline"></ion-icon>
                    </span>
                    <span class="text">더보기</span>
                </a>
            </li>
        </ul>

        <div class="footer">
            <p>© 2024 WonPick. All Rights Reserved.</p>
        </div>
    </div>

    <div class="more-popup" id="more-popup">
        <ul>
            <li><ion-icon name="settings-outline"></ion-icon> 설정</li>
            <li><ion-icon name="images-outline"></ion-icon> 내 활동</li>
            <li><ion-icon name="moon-outline"></ion-icon> 모드 전환</li>
            <button type="button" id="errorPost" data-toggle="modal" data-target="#errorPostModal">
                <li><ion-icon name="warning-outline"></ion-icon>문제 신고</li>
            </button>
            <button type="button" onclick="userLogout()">
                <li><ion-icon name="log-out-outline"></ion-icon> 로그아웃</li>
            </button>
        </ul>
    </div>
    <!-- 문제신고 페이지 모달 -->
    <div class="modal fade" id="errorPostModal" tabindex="-1" aria-labelledby="errorPostModalLabel" aria-hidden="true">
        <div class="modal-dialog">
          <div class="modal-content">
           <!-- 모달 헤더 부분 -->
            <div class="modal-header">
              <img src="#" alt="" style="border-radius: 15px; width: 45px;">
              <h2 class="modal-title fs-5" id="errorPostModalLabel">&nbsp;문제신고</h2>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">&times;</button>
            </div>
            <!-- 모달 바디 부분 -->
            <div class="modal-body">
              <form action="errorPost" method="post">    <!-- 폼태그 액션속성 수정 필요-->
                <div class="mb-3">
                  <label for="errorPostContent" class="col-form-label">내용 </label>
                  <textarea type="password" class="form-control" id="errorPostContent" name="errorPostContent" placeholder="최대한 자세히 입력해주세요..." required></textarea>
                  <input type="hidden" name="userId" value="${ loginUser.userId }">
                </div>

               <button class="btn btn-danger">신고 보내기</button>
               <button type="button" class="btn btn-primary">파일 추가</button>
              </form>
            </div>
          </div>
        </div>
      </div>

      <!-- 문제신고 확인 페이지 모달 -->
    <div class="modal fade" id="errorPostListModal" tabindex="-1" aria-labelledby="errorPostListModalLabel" aria-hidden="true">
        <div class="modal-dialog">
          <div class="modal-content">
           <!-- 모달 헤더 부분 -->
            <div class="modal-header">
              <img src="#" alt="" style="border-radius: 15px; width: 45px;">
              <h2 class="modal-title fs-5" id="errorPostListModalLabel">&nbsp;문제신고목록</h2>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">&times;</button>
            </div>
            <!-- 모달 바디 부분 -->
            <div class="modal-body">
              <form action="errorPost" method="post">    <!-- 폼태그 액션속성 수정 필요-->
                <table class="table table-striped">
                    <thead class="thead-dark">
                        <tr>
                            <th>No.</th>
                            <th>작성자</th>
                            <th>작성일</th>
                            <th>내용</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>1</td>
                            <td>keydown</td>
                            <td>2024-08-01</td>
                            <td>내용 삽입....이거길어지면 어디까지 길어질수 있는지 봐야하넨</td>
                        </tr>                             
                    </tbody>
                </table>
              </form>
            </div>
          </div>
        </div>
      </div>

    <!-- .navigation script 시작 -->
    <script>
        //  토글메뉴 클릭할 때 
        const menuToggle = document.querySelector('.menuToggle');
        const navigation = document.querySelector('.navigation');
        const moreBtn = document.getElementById('more-btn');
        const morePopup = document.getElementById('more-popup');

        menuToggle.onclick = function () {
            navigation.classList.toggle('open');
        }

        moreBtn.onclick = function (e) {
            e.preventDefault();
            morePopup.classList.toggle('active');
        }

        // 페이지 외부 클릭 시 팝업 닫기
        window.onclick = function (event) {
            if (!event.target.matches('#more-btn, #more-btn *')) {
                if (morePopup.classList.contains('active')) {
                    morePopup.classList.remove('active');
                }
            }
        }
        // <!-- .navigation script 끝~~ -->

        function errorPost() {
            return false;
        }
    </script>

    <div class="content">
        <header>
            <!-- 프로필 스토리 섹션 -->
            <div class="stories">
                <div class="story">
                    <img src="resources/img/profile01.png" onerror="src='resources/img/logo.jpg'">
                    <span>아이유</span>
                </div>
                <div class="story">
                    <img src="resources/img/profile02.jpg" onerror="src='resources/img/logo.jpg'">
                    <span>username2</span>
                </div>
                <div class="story">
                    <img src="resources/img/profile03.jpg" onerror="src='resources/img/logo.jpg'">
                    <span>username3</span>
                </div>
                <div class="story">
                    <img src="resources/img/profile04.jpg" onerror="src='resources/img/logo.jpg'">
                    <span>username4</span>
                </div>
                <div class="story">
                    <img src="resources/img/profile05.jpg" onerror="src='resources/img/logo.jpg'">
                    <span>username5</span>
                </div>
                <div class="story">
                    <img src="resources/img/profile06.jpg" onerror="src='resources/img/logo.jpg'">
                    <span>username6</span>
                </div>
                <div class="story">
                    <img src="resources/img/profile07.jpg" onerror="src='resources/img/logo.jpg'">
                    <span>username7</span>
                </div>
                <div class="story">
                    <img src="resources/img/profile08.jpg" onerror="src='resources/img/logo.jpg'">
                    <span>username8</span>
                </div>
                <!-- 필요에 따라 더 많은 프로필 추가 !! -->
            </div>
        </header>

        <div class="feed">
            <!-- 게시물 -->
            <div class="post">
                <div class="post-header">
                    <div class="post-info">
                        <h3>SMTOWN</h3>
                        <span class="post-time">20시간 전</span>
                    </div>
                    <ion-icon name="ellipsis-horizontal-outline" class="post-options"></ion-icon>
                </div>
                <img src="resources/img/feed01.jpg" alt="게시물 이미지" class="post-image">
                <div class="post-content">
                    <div class="post-actions">
                        <ion-icon name="heart-outline"></ion-icon>
                        <ion-icon name="chatbubble-outline"></ion-icon>
                        <ion-icon name="share-social-outline"></ion-icon>
                    </div>
                    <p><strong>SMTOWN</strong> aespa 에스파 ‘Hot Mess’ MV Teaser - Behind Film Image...</p>
                </div>
                <div class="post-comments">
                    <p>imnotningning 이번 뮤비도 너무 기대중!...더보기</p>
                    <p class="view-comments">댓글 520개 모두 보기</p>
                </div>
            </div>
        </div>

        <!-- 추가할 게시물 작성 가능합니당 -->
    </div>
    </div>

    <!-- 내 프로필 -->
    <div class="myprofile">
        <h4>내 프로필</h4>
        <div class="myprofile2">
        <img src="resources/img/logo.jpg" onerror="src='resources/img/logo.jpg'">
        <span class="myname">${ loginUser.nickName }</span>
        </div>
    </div>
    <script>
        function userLogout() {
            location.href = "member/logout";
        }
    </script>


    <div class="sidebar-message">
        <h3>메시지</h3>
        <ul class="message-list">
            <li>
                <img src="resources/img/profile01.png" onerror="src='resources/img/logo.jpg'">
                <div class="message-info">
                    <span class="name">이지은</span>
                    <span class="message-text">얏호</span>
                    <span class="time">1분</span>
                </div>
            </li>
            <li>
                <img src="resources/img/profile02.jpg" onerror="src='resources/img/logo.jpg'">
                <div class="message-info">
                    <span class="name">유지민</span>
                    <span class="message-text">저녁 뭐먹지?</span>
                    <span class="time">20분</span>
                </div>
            </li>
            <li>
                <img src="resources/img/profile03.jpg" onerror="src='resources/img/logo.jpg'">
                <div class="message-info">
                    <span class="name">김민정</span>
                    <span class="message-text">3분 전에 활동</span>
                    <span class="time"></span>
                </div>
            </li>
            <!-- 메시지 목록 표시됨 -->

            <!-- 문제신고 목록 버튼 및 스크립트 여기서부터 -->
            <li><button type="button" id="errorPostList" data-toggle="modal" data-target="#errorPostListModal">
                급한대로 잠깐 여기다가 만들었습니다. 추후 꼭 수정</button></li>
            <script>
                $(function(){
                    // 비동기식 통신
                    $.ajax({
                        url: '/wonpick/errorPostList.do',
                        type: 'post', // 기본값
                        data: { data: data }, 
                        success: function(result) {
                            // 통신 성공 시 실행될 함수. 결과(응답데이터)가 result변수에 담겨져 있을 것임!
                            console.log("통신성공!");
                            console.log(result);

                            $("#result1").text(result);
                        },
                        error: function(error) {
                            // 통신 실패 시 실행될 함수. 오류 결과가 error변수에 담겨져 있을 것임.
                            console.log("통신 실패!");
                            console.log(error);
                        },
                        complete: function() {
                            // 통신 성공여부 상관없이 실행될 함수
                            console.log("통신 성공 여부 상관없이 실행!");
                        }
                    });
                })
            </script>

    </div>
</body>

</html>