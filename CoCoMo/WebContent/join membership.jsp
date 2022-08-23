<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
  <link rel="stylesheet" href="css/join membership.css">
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>
    <div id="con">
    <div id="login">
    <div id="login_form"><!--로그인 폼-->
    <form method="post" action="joinSystem.jsp">
        <h3 class="login" style="letter-spacing:-1px;">CoCoMo</h3>

        <!-- <p>
            <input type="submit" value="Sign in with Google" class="btn" style="background-color:#217Af0">
        </p> 구글로 로그인-->

        <hr>

        <!-- <span>ID</span> -->
        <label>
        <p style="text-align: left; font-size:12px; color:#666">ID</p>
        <input type="text" placeholder="아이디" class="size" name="id" required>
        <p></p>
        </label><!--아이디-->
        <label>
        <p style="text-align: left; font-size:12px; color:#666">username</p>
        <input type="text" placeholder="이름" class="size" name="name" required>
        <p></p>
        </label><!--이름-->

        <label>
        <!-- <span>PW</span> -->
        <p style="text-align: left; font-size:12px; color:#666">Password </p>
        <input type="password" placeholder="비밀번호" class="size" name="password" required>
        </label><!--비밀번호-->

        <label>
            <!-- <span>PW</span> -->
            <p style="text-align: left; font-size:12px; color:#666"> </p>
            <input type="password" placeholder="비밀번호 확인" class="size" name="password2" required>
        </label><!--비밀번호 확인-->
      
      <label>
      <p style="text-align: left; font-size:12px; color:#666">Address</p>
        <input type="text" placeholder="주소" class="size" name="address" required>
        <p></p>
        </label><!--주소-->

         <label>
                <!-- <span>PW</span> -->
            <p style="text-align: left; font-size:12px; color:#666">E-mail</p>
                <input type="text" placeholder="이메일" class="size" name="email" required>
        </label> <!--이메일--> 
      
        <label>
            <!-- <span>PW</span> -->
        <p style="text-align: left; font-size:12px; color:#666">Mobile Phone</p>
            <select class="size num1">
                <option value="1" selected>SKT</option>
                <option value="2" selected>KT</option>
                <option value="3" selected>LG</option>
            </select>
            <input placeholder="-빼고 숫자만 입력"  class="size num2" name="number" required>
         </label> <!--전화번호-->
 


    <br>
        <p>
            <input type="submit" value="Create Acoout" class="btn">
            
        </p>
    </form>

    <hr>
    <p class="find">
        <span><a href="login.jsp" >메인 페이지로 이동</a></span>
    </p>
    </div>
    <div>
    </div><!--con-->

</body>
</html>