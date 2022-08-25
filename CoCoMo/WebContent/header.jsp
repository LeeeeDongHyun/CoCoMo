<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css">
<!-- material icon -->
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<!-- jquery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- bootstrap -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<!-- joinForm icons -->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.8/css/all.css">
<!-- swiper-wrapper script -->
<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.css">
<link rel="stylesheet"
	href="https://unpkg.com/swiper/swiper-bundle.min.css">
<script src="https://unpkg.com/swiper/swiper-bundle.js"></script>
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
<!-- kakao script -->
<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
<!-- summernote css/js -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css"	rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
<!-- sweetAlert2 -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<!-- Iamport -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<!-- End of Script -->
<link rel="stylesheet" href="css/style-header.css">
<title>CoCoMo</title>
</head>

<body>
	<header>
		<div id="header-first">
			        <a href="Product?cmd=Main" id="logo">
            <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQrnRG3tc4YnOFvP3cQBWISSK8QItfkhEgRFA&usqp=CAU" height="60">
        </a>
			<form id="headerSearchForm" method="POST"
				action="<%=request.getContextPath()%>/product?cmd=search">
				<button class="headerSearchForm-btn">
					<i class="tiny material-icons">search</i>
				</button>
				<input name="keyword" placeholder="상품명 또는 브랜드명으로 검색"
					class="headerSearchForm-input" />
			</form>
			<% 
			String re = (String)session.getAttribute("state");
			%>
			<c:set var="menu" value="re" scope="session"/>
			<c:choose>
				<c:when test="${sessionScope.customer ne null}">
					<div id="header-main-menu">
						<c:if test="${sessionScope.principal.auth eq 'admin' }">
							<a href="<%=request.getContextPath()%>/product?cmd=insertPage"
								class="header-sub-menu">상품등록</a>
							<a href="#" class="header-sub-menu">상품수정</a>
						</c:if>
						<a href="jjim.jsp" class="header-sub-menu">찜</a> 
							<a href="<%=request.getContextPath()%>/cart?cmd=cartList" class="header-sub-menu">장바구니</a>
						<a href="MyPage.jsp" class="header-sub-menu">정보수정</a>
						<a href="logoutSystem.jsp" class="header-sub-menu">로그아웃</a>
					</div>
				</c:when>
				<c:otherwise>
					<div id="header-main-menu">
						<a href="<%=request.getContextPath()%>/login.jsp"
							class="header-sub-menu">로그인</a> <a
							href="<%=request.getContextPath()%>/join membership.jsp"
							class="header-sub-menu">회원가입</a>
					</div>
				</c:otherwise>
			</c:choose>
		</div>
		<!-- Start of Dropdown -->
	
			</div>
		</div>
		<!-- End of Dropdown -->
	</header>