<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/login.css">
<meta charset="UTF-8">
<title>로그인</title>
</head>
<body>
    <div id="con">
    <div id="login">
    <div id="login_form"><!--로그인 폼-->
     <form action="loginSystem.jsp">
    <form>
        <h3 class="login" style="letter-spacing:-1px;">CoCoMo</h3>

		
        <hr>
         
        <label>
        <!-- <span>ID</span> -->
        <p style="text-align: left; font-size:12px; color:#666">Username</p>
        <input type="text" name="id" placeholder="아이디를 입력" class="size">
        <!-- <input type="submit" value="확인"> -->
        <p></p>
        </label>

        <label>
        <!-- <span>PW</span> -->
        <p style="text-align: left; font-size:12px; color:#666">Password </p>
        <input type="password" name="password" placeholder="비밀번호를 입력" class="size">
        <!-- <input type="submit" value="확인"> -->
        </label>
		
        <p>
            <input type="submit" value="Sign in" class="btn">
        </p>
        </form>
    </form>
    <hr>
    <p class="find">
        <span><a href="id.jsp">아이디 찾기</a></span>
        <span><a href="Password.jsp">비밀번호 찾기</a></span>
        <span><a href="join membership.jsp" >회원가입</a></span>
    </p>
    </div>
    <div>
    </div><!--con-->


</body>
</html>