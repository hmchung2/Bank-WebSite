<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    


<!DOCTYPE html>
<html lang="ko">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>WAndC 은행 로그인</title>
  <meta content="" name="description">
  <meta content="" name="keywords">

  <!-- Favicons -->
  <link href="<%=request.getContextPath()%>/assets/img/favicon.ico" rel="shortcut icon">  
  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="<%=request.getContextPath()%>/assets/vendor/aos/aos.css" rel="stylesheet">
  <%-- <link href="<%=request.getContextPath()%>/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet"> --%>
  <link href="<%=request.getContextPath()%>/assets/vendor/bootstrap/css/bootstrap.css" rel="stylesheet">
  <link href="<%=request.getContextPath()%>/assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="<%=request.getContextPath()%>/assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
  <link href="<%=request.getContextPath()%>/assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
  <link href="<%=request.getContextPath()%>/assets/vendor/remixicon/remixicon.css" rel="stylesheet">
  <link href="<%=request.getContextPath()%>/assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

  <!-- Template Main CSS File -->
  <link href="<%=request.getContextPath()%>/assets/css/style.css" rel="stylesheet"> 

  
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.8/css/all.css">
  
  
  <style>
  body{
    margin-top:20px;
    background:#eee;
}

.profile-header {
    position: relative;
    overflow: hidden
}

.profile-header .profile-header-cover {
    background-image: url(https://bootdey.com/img/Content/bg1.jpg);
    background-size: cover;
    background-position: center;
    background-repeat: no-repeat;
    position: absolute;
    left: 0;
    right: 0;
    top: 0;
    bottom: 0
}

.profile-header .profile-header-cover:before {
    content: '';
    position: absolute;
    top: 0;
    left: 0;
    right: 0;
    bottom: 0;
    background: linear-gradient(to bottom, rgba(0, 0, 0, 0) 0, rgba(0, 0, 0, .75) 100%)
}

.profile-header .profile-header-content {
    color: #fff;
    padding: 25px
}

.profile-header-img {
    float: left;
    width: 120px;
    height: 120px;
    overflow: hidden;
    position: relative;
    z-index: 10;
    margin: 0 0 -20px;
    padding: 3px;
    border-radius: 4px;
    background: #fff
}

.profile-header-img img {
    max-width: 100%
}

.profile-header-info h4 {
    font-weight: 500;
    color: #fff
}

.profile-header-img+.profile-header-info {
    margin-left: 140px
}

.profile-header .profile-header-content,
.profile-header .profile-header-tab {
    position: relative
}

.b-minus-1,
.b-minus-10,
.b-minus-2,
.b-minus-3,
.b-minus-4,
.b-minus-5,
.b-minus-6,
.b-minus-7,
.b-minus-8,
.b-minus-9,
.b-plus-1,
.b-plus-10,
.b-plus-2,
.b-plus-3,
.b-plus-4,
.b-plus-5,
.b-plus-6,
.b-plus-7,
.b-plus-8,
.b-plus-9,
.l-minus-1,
.l-minus-2,
.l-minus-3,
.l-minus-4,
.l-minus-5,
.l-minus-6,
.l-minus-7,
.l-minus-8,
.l-minus-9,
.l-plus-1,
.l-plus-10,
.l-plus-2,
.l-plus-3,
.l-plus-4,
.l-plus-5,
.l-plus-6,
.l-plus-7,
.l-plus-8,
.l-plus-9,
.r-minus-1,
.r-minus-10,
.r-minus-2,
.r-minus-3,
.r-minus-4,
.r-minus-5,
.r-minus-6,
.r-minus-7,
.r-minus-8,
.r-minus-9,
.r-plus-1,
.r-plus-10,
.r-plus-2,
.r-plus-3,
.r-plus-4,
.r-plus-5,
.r-plus-6,
.r-plus-7,
.r-plus-8,
.r-plus-9,
.t-minus-1,
.t-minus-10,
.t-minus-2,
.t-minus-3,
.t-minus-4,
.t-minus-5,
.t-minus-6,
.t-minus-7,
.t-minus-8,
.t-minus-9,
.t-plus-1,
.t-plus-10,
.t-plus-2,
.t-plus-3,
.t-plus-4,
.t-plus-5,
.t-plus-6,
.t-plus-7,
.t-plus-8,
.t-plus-9 {
    position: relative!important
}

.profile-header .profile-header-tab {
    background: #fff;
    list-style-type: none;
    margin: -10px 0 0;
    padding: 0 0 0 140px;
    white-space: nowrap;
    border-radius: 0
}

.text-ellipsis,
.text-nowrap {
    white-space: nowrap!important
}

.profile-header .profile-header-tab>li {
    display: inline-block;
    margin: 0
}

.profile-header .profile-header-tab>li>a {
    display: block;
    color: #929ba1;
    line-height: 20px;
    padding: 10px 20px;
    text-decoration: none;
    font-weight: 700;
    font-size: 12px;
    border: none
}

.profile-header .profile-header-tab>li.active>a,
.profile-header .profile-header-tab>li>a.active {
    color: #242a30
}

.profile-content {
    padding: 25px;
    border-radius: 4px
}

.profile-content:after,
.profile-content:before {
    content: '';
    display: table;
    clear: both
}

.profile-content .tab-content,
.profile-content .tab-pane {
    background: 0 0
}

.profile-left {
    width: 200px;
    float: left
}

.profile-right {
    margin-left: 240px;
    padding-right: 20px
}

.profile-image {
    height: 175px;
    line-height: 175px;
    text-align: center;
    font-size: 72px;
    margin-bottom: 10px;
    border: 2px solid #E2E7EB;
    overflow: hidden;
    border-radius: 4px
}

.profile-image img {
    display: block;
    max-width: 100%
}

.profile-highlight {
    padding: 12px 15px;
    background: #FEFDE1;
    border-radius: 4px
}

.profile-highlight h4 {
    margin: 0 0 7px;
    font-size: 12px;
    font-weight: 700
}

.table.table-profile>thead>tr>th {
    border-bottom: none!important
}

.table.table-profile>thead>tr>th h4 {
    font-size: 20px;
    margin-top: 0
}

.table.table-profile>thead>tr>th h4 small {
    display: block;
    font-size: 12px;
    font-weight: 400;
    margin-top: 5px
}

.table.table-profile>tbody>tr>td,
.table.table-profile>thead>tr>th {
    border: none;
    padding-top: 7px;
    padding-bottom: 7px;
    color: #242a30;
    background: 0 0
}

.table.table-profile>tbody>tr>td.field {
    width: 20%;
    text-align: right;
    font-weight: 600;
    color: #2d353c
}

.table.table-profile>tbody>tr.highlight>td {
    border-top: 1px solid #b9c3ca;
    border-bottom: 1px solid #b9c3ca
}

.table.table-profile>tbody>tr.divider>td {
    padding: 0!important;
    height: 10px
}

.profile-section+.profile-section {
    margin-top: 20px;
    padding-top: 20px;
    border-top: 1px solid #b9c3ca
}

.profile-section:after,
.profile-section:before {
    content: '';
    display: table;
    clear: both
}

.profile-section .title {
    font-size: 20px;
    margin: 0 0 15px
}

.profile-section .title small {
    font-weight: 400
}

body.flat-black {
    background: #E7E7E7
}

.flat-black .navbar.navbar-inverse {
    background: #212121
}

.flat-black .navbar.navbar-inverse .navbar-form .form-control {
    background: #4a4a4a;
    border-color: #4a4a4a
}

.flat-black .sidebar,
.flat-black .sidebar-bg {
    background: #3A3A3A
}

.flat-black .page-with-light-sidebar .sidebar,
.flat-black .page-with-light-sidebar .sidebar-bg {
    background: #fff
}

.flat-black .sidebar .nav>li>a {
    color: #b2b2b2
}

.flat-black .sidebar.sidebar-grid .nav>li>a {
    border-bottom: 1px solid #474747;
    border-top: 1px solid #474747
}

.flat-black .sidebar .active .sub-menu>li.active>a,
.flat-black .sidebar .nav>li.active>a,
.flat-black .sidebar .nav>li>a:focus,
.flat-black .sidebar .nav>li>a:hover,
.flat-black .sidebar .sub-menu>li>a:focus,
.flat-black .sidebar .sub-menu>li>a:hover,
.sidebar .nav>li.nav-profile>a {
    color: #fff
}

.flat-black .sidebar .sub-menu>li>a,
.flat-black .sidebar .sub-menu>li>a:before {
    color: #999
}

.flat-black .page-with-light-sidebar .sidebar .active .sub-menu>li.active>a,
.flat-black .page-with-light-sidebar .sidebar .active .sub-menu>li.active>a:focus,
.flat-black .page-with-light-sidebar .sidebar .active .sub-menu>li.active>a:hover,
.flat-black .page-with-light-sidebar .sidebar .nav>li.active>a,
.flat-black .page-with-light-sidebar .sidebar .nav>li.active>a:focus,
.flat-black .page-with-light-sidebar .sidebar .nav>li.active>a:hover {
    color: #000
}

.flat-black .page-sidebar-minified .sidebar .nav>li.has-sub:focus>a,
.flat-black .page-sidebar-minified .sidebar .nav>li.has-sub:hover>a {
    background: #323232
}

.flat-black .page-sidebar-minified .sidebar .nav li.has-sub>.sub-menu,
.flat-black .sidebar .nav>li.active>a,
.flat-black .sidebar .nav>li.active>a:focus,
.flat-black .sidebar .nav>li.active>a:hover,
.flat-black .sidebar .nav>li.nav-profile,
.flat-black .sidebar .sub-menu>li.has-sub>a:before,
.flat-black .sidebar .sub-menu>li:before,
.flat-black .sidebar .sub-menu>li>a:after {
    background: #2A2A2A
}

.flat-black .page-sidebar-minified .sidebar .sub-menu>li:before,
.flat-black .page-sidebar-minified .sidebar .sub-menu>li>a:after {
    background: #3e3e3e
}

.flat-black .sidebar .nav>li.nav-profile .cover.with-shadow:before {
    background: rgba(42, 42, 42, .75)
}

.bg-white {
    background-color: #fff!important;
}
.p-10 {
    padding: 10px!important;
}
.media.media-xs .media-object {
    width: 32px;
}
.m-b-2 {
    margin-bottom: 2px!important;
}
.media>.media-left, .media>.pull-left {
    padding-right: 15px;
}
.media-body, .media-left, .media-right {
    display: table-cell;
    vertical-align: top;
}
select.form-control:not([size]):not([multiple]) {
    height: 34px;
}
.form-control.input-inline {
    display: inline;
    width: auto;
    padding: 0 7px;
}


.timeline {
    list-style-type: none;
    margin: 0;
    padding: 0;
    position: relative
}

.timeline:before {
    content: '';
    position: absolute;
    top: 5px;
    bottom: 5px;
    width: 5px;
    background: #2d353c;
    left: 20%;
    margin-left: -2.5px
}

.timeline>li {
    position: relative;
    min-height: 50px;
    padding: 20px 0
}

.timeline .timeline-time {
    position: absolute;
    left: 0;
    width: 18%;
    text-align: right;
    top: 30px
}

.timeline .timeline-time .date,
.timeline .timeline-time .time {
    display: block;
    font-weight: 600
}

.timeline .timeline-time .date {
    line-height: 16px;
    font-size: 12px
}

.timeline .timeline-time .time {
    line-height: 24px;
    font-size: 20px;
    color: #242a30
}

.timeline .timeline-icon {
    left: 15%;
    position: absolute;
    width: 10%;
    text-align: center;
    top: 40px
}

.timeline .timeline-icon a {
    text-decoration: none;
    width: 20px;
    height: 20px;
    display: inline-block;
    border-radius: 20px;
    background: #d9e0e7;
    line-height: 10px;
    color: #fff;
    font-size: 14px;
    border: 5px solid #2d353c;
    transition: border-color .2s linear
}

.timeline .timeline-body {
    margin-left: 23%;
    margin-right: 17%;
    background: #fff;
    position: relative;
    padding: 20px 25px;
    border-radius: 6px
}

.timeline .timeline-body:before {
    content: '';
    display: block;
    position: absolute;
    border: 10px solid transparent;
    border-right-color: #fff;
    left: -20px;
    top: 20px
}

.timeline .timeline-body>div+div {
    margin-top: 15px
}

.timeline .timeline-body>div+div:last-child {
    margin-bottom: -20px;
    padding-bottom: 20px;
    border-radius: 0 0 6px 6px
}

.timeline-header {
    padding-bottom: 10px;
    border-bottom: 1px solid #e2e7eb;
    line-height: 30px
}

.timeline-header .userimage {
    float: left;
    width: 34px;
    height: 34px;
    border-radius: 40px;
    overflow: hidden;
    margin: -2px 10px -2px 0
}

.timeline-header .username {
    font-size: 16px;
    font-weight: 600
}

.timeline-header .username,
.timeline-header .username a {
    color: #2d353c
}

.timeline img {
    max-width: 100%;
    display: block
}

.timeline-content {
    letter-spacing: .25px;
    line-height: 18px;
    font-size: 13px
}

.timeline-content:after,
.timeline-content:before {
    content: '';
    display: table;
    clear: both
}

.timeline-title {
    margin-top: 0
}

.timeline-footer {
    background: #fff;
    border-top: 1px solid #e2e7ec;
    padding-top: 15px
}

.timeline-footer a:not(.btn) {
    color: #575d63
}

.timeline-footer a:not(.btn):focus,
.timeline-footer a:not(.btn):hover {
    color: #2d353c
}

.timeline-likes {
    color: #6d767f;
    font-weight: 600;
    font-size: 12px
}

.timeline-likes .stats-right {
    float: right
}

.timeline-likes .stats-total {
    display: inline-block;
    line-height: 20px
}

.timeline-likes .stats-icon {
    float: left;
    margin-right: 5px;
    font-size: 9px
}

.timeline-likes .stats-icon+.stats-icon {
    margin-left: -2px
}

.timeline-likes .stats-text {
    line-height: 20px
}

.timeline-likes .stats-text+.stats-text {
    margin-left: 15px
}

.timeline-comment-box {
    background: #f2f3f4;
    margin-left: -25px;
    margin-right: -25px;
    padding: 20px 25px
}

.timeline-comment-box .user {
    float: left;
    width: 34px;
    height: 34px;
    overflow: hidden;
    border-radius: 30px
}

.timeline-comment-box .user img {
    max-width: 100%;
    max-height: 100%
}

.timeline-comment-box .user+.input {
    margin-left: 44px
}

.lead {
    margin-bottom: 20px;
    font-size: 21px;
    font-weight: 300;
    line-height: 1.4;
}

.text-danger, .text-red {
    color: #ff5b57!important;
}

#writeNew {
       top : 20%;
       left : 10%;
       position: fixed;
       z-index: 3000;
}
  
  </style>
  
  <script src="<%=request.getContextPath()%>/assets/js/jquery-3.6.0.min.js"></script>
  <script src="<%=request.getContextPath()%>/assets/js/myFunc.js"></script>
  
  <script src="https://developers.kakao.com/sdk/js/kakao.js"></script> 
 <script src="<%=request.getContextPath()%>/member/kakaoLogin.js"></script>
 
<%--  		<input type="text" class="form-control rounded-corner replyMsg"
		placeholder="Write a comment...">
	<span class="input-group-btn p-l-10">
	<button onclick="writeReply(${board.no])" class="btn btn-primary f-s-12 rounded-corner" type="button">Comment</button>
	</span --%>

<script>
 // 스크립트 작성은 여기서
 $(document).ready(function(){
	 $('.modal2').fadeOut();
	 $("#myModal").click(function(){
		  $(".modal1").fadeIn();
	  });		  
	  $(".exiting").click(function(){
		  $(".modal").fadeOut();
	  })	
	  
	  $(".exiting2").click(function(){
		  $(".modal2").fadeOut();
	  })	
	  
	  
	 
	 $('.updateReply').trigger("click")

	$('#writeNew').click(function(){
		
		location.href = "<%=request.getContextPath()%>/board/writeNewBoard.do"
		
	})
	
/* 	   <input id="deletePw" type="password">
	
      	<input type="hidden" id="deletingNo"> */
	
	$('#deletingConfirm').click(function(){ 
		$.ajax({
			type: 'post',
			url : "/Bank-Web/DeleteCommentServlet",
			data :{
				board  : $('#deletingNo').val(),
				pw :  $('#deletePw').val(),
			},
			contentType: "application/x-www-form-urlencoded; charset=UTF-8",
			datatype: 'json',
			success : function(data){
				console.log("success")
				console.log(data)
		
				if(data.result == 'fail'  ){
					$("#sendingMyMsg").text(data.msg )
					$("#myModal").trigger("click");		
				}else{
					window.location.reload();
				}
												
			},
			error : function(){			
				console.log("실패")				
			} 						
		}) 				 			
	})
	
 })
 
 
 
 	function writeReply(index){
		
		if('${userVO}' == null  || '${userVO}' == "" ){
		
			$("#sendingMyMsg").html('로그인 사용자만 이용이 가능합니다.')
			$("#myModal").trigger("click");
				
		}else{
			id =   "#index_" +  index
			inputData = id + " input"
			message = $(inputData).val()
			if(message.length == "" ){
				$('#msg_'  +  index).text("최소 한글자 이상 입력 바랍니다.")
			}else{
				$('#msg_'  +  index).text("")

				$.ajax({
						type: 'post',
						url : "/Bank-Web/Board/Reply",
						data :{
							index  : index,
							message :  message,
						},
						contentType: "application/x-www-form-urlencoded;charset=ISO-8859-15",
						datatype: 'json',
						success : function(data){
							console.log("success")					
						},
						error : function(){			
							console.log("실패")				
						} 						
					}) 				 					  
		 		}
				
			}	
		}
	 	
	function deleteComment(index){
		$('#deletingNo').val(index)
		$('.modal2').fadeIn();		
	}
	
	
 	function showReply(index){	   
 		id =   "#index_" +  index
 		$.ajax({
			type: 'POST',
			url : "/Bank-Web/ShowReply",
			data : {
				index:index
			},
			datatype: 'json',
			contentType: "application/x-www-form-urlencoded; charset=UTF-8",
			success : function(result){
			
				var products = $.parseJSON(result);								
				
				var s = '';
				replySection = '#showReply_' + index
				
				$(replySection).empty()
				
				for(var i = 0; i < products.length; i++) {					
					var datetag =$('<div> 날짜 :' +  products[i].regDate  +  '</div>')
					datetag.css("color" , "#3498db")
					var idtag = $('<div> 작성자 : ' + products[i].writer + '<div>' )
					idtag.css("color"  , "#3498db")
					var message = $('<p>' + products[i].message + '</p>')
					$(replySection).append(datetag)
					$(replySection).append(idtag)
					$(replySection).append(message)
					$(replySection).append("<hr></hr>")
				}		
				},error : function(){
				 console.log("아이드 찾기 실패")					
				} 				
		}) 			 		 		
 	}

 /* 	</div>
	<div class="reply timeline-content"
		style="margin-top: 2%;">
		<ul id="showReply_${board.no }">
			
		</ul>
	</div> */
 </script>


</head>

<body>

	<!-- ======= Header ======= -->
	<header id="header" class="fixed-top d-flex align-items-center">
		<jsp:include page="/include/header.jsp" />
	</header>



	<main id="main">
		<!-- ======= Breadcrumbs Section ======= -->
		<section class="breadcrumbs">
			<div class="container">
				<div class="d-flex justify-content-between align-items-center">
					<h2>Wells & Clarify</h2>
					<ol>
						<li><a href="<%=request.getContextPath()%>">홈</a></li>
						<li>게시판</li>
					</ol>
				</div>
			</div>
		</section>
		
	
		<section class="inner-page">
			<c:if test="${ not empty userVO }">

				<div id="writeNew">
					<button type="button" class="btn btn-primary btn-lg">글 쓰기</button>
				</div>
			</c:if>
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<div id="content" class="content content-full-width">
							<!-- begin profile -->
							<div class="profile"></div>
							<!-- end profile -->
							<!-- begin profile-content -->
							<div class="profile-content">
								<!-- begin tab-content -->
								<div class="tab-content p-0">
									<!-- begin #profile-post tab -->
									<div class="tab-pane fade active show" id="profile-post">
										<!-- begin timeline -->
										<ul class="timeline">
											<c:forEach items="${ list }" var="board" varStatus="loop">
												<li id="index_${board.no }">
													<!-- begin timeline-time -->
													<div class="timeline-time">
														<span class="date">날짜</span> <span class="time">${board.regDate }</span>
													</div> <!-- end timeline-time --> <!-- begin timeline-icon -->
													<div class="timeline-icon">
														<a href="javascript:;">&nbsp;</a>
													</div> <!-- end timeline-icon --> <!-- begin timeline-body -->
													<div class="timeline-body">
														<div class="timeline-header">
															<span class="userimage"><img
																src="https://bootdey.com/img/Content/avatar/avatar3.png"
																alt=""></span> <span class="username"><a
																href="javascript:;">${board.writer } </a> <small></small></span> <span
																class="pull-right text-muted">${board.title }</span>
														</div>
														<div class="timeline-content">
														<button onclick="deleteComment(${board.no})" style="float:right;" type="button" class="btn-close" aria-label="Close">
														</button>
															<h2>${board.title }</h2>
															<p>${board.message}</p>
														</div>
														<div class="timeline-likes">
															<div class="stats-right">
																 <span
																	class="stats-text">${board.viewCnt } like</span>
															</div>
															<div class="stats">
																<span class="fa-stack fa-fw stats-icon"> <i
																	class="fa fa-circle fa-stack-2x text-danger"></i> <i
																	class="fa fa-heart fa-stack-1x fa-inverse t-plus-1"></i>
																</span> <span class="fa-stack fa-fw stats-icon"> <i
																	class="fa fa-circle fa-stack-2x text-primary"></i> <i
																	class="fa fa-thumbs-up fa-stack-1x fa-inverse"></i>
																</span> <span class="stats-total">${board.viewCnt }</span>
															</div>
														</div>
														<div class="timeline-footer">
															<a href="javascript:;"
																class="m-r-15 text-inverse-lighter"><i
																class="fa fa-thumbs-up fa-fw fa-lg m-r-3"></i> Like</a> <a
																href="javascript:;" class="m-r-15 text-inverse-lighter"><i
																class="fa fa-comments fa-fw fa-lg m-r-3"></i> Comment</a>
														</div>
														<div class="reply timeline-content"
															style="margin-top: 2%;">
															<ul id="showReply_${board.no }">
																
															</ul>
														</div>
														<div class="timeline-comment-box">
													
														
														<div class="user">
																<img
																	src="https://bootdey.com/img/Content/avatar/avatar3.png">
															</div>
															<div class="input">
																<form action="">
																	<div class="input-group">
																		<input type="text" class="form-control rounded-corner replyMsg"
																			placeholder="Write a comment...">
																		<span class="input-group-btn p-l-10">
																		<button onclick="writeReply(${board.no})"  class="btn btn-primary f-s-12 rounded-corner" type="button">댓글</button>
																		
																		<button onclick="showReply(${board.no})"  class="btn btn-primary f-s-12 rounded-corner updateReply" type="button">조회</button>
																		
																		</span>
																	</div>
																</form>
															</div>
													<h6 style="color:red; margin-top:2%" id="msg_${board.no }"  ></h6>
															
														</div>
													</div> <!-- end timeline-body -->
												</li>
											</c:forEach>


										</ul>
										<div style="margin:0px auto;"></div>
	<c:forEach items="${ pageList }" var="page" varStatus="loop">
		<div style="width: 5%; float:left" >
			<a href="<%=request.getContextPath() %>/board/viewBoard.do?page=${page}">${page} </a>
		</div>	
	
	</c:forEach>
										
										
										<!-- end timeline -->
									</div>
									<!-- end #profile-post tab -->
								</div>
								<!-- end tab-content -->
							</div>
							<!-- end profile-content -->
						</div>
					</div>
				</div>
			</div>
		</section>

	
		<button id="myModal" hidden="true">모달창</button>
		<div class="modal1 modal" tabindex="-1" role="dialog">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title">Wells & Clarify</h5>
						<button type="button" class="close exiting" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>


					<div class="modal-body">
						<img src="<%=request.getContextPath()%>/assets/img/illustration-6.svg"
							style="width: 250px; height: 200px;">
						<p id="sendingMyMsg" style="font-size: 30px"></p>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-primary exiting">닫기</button>
					</div>
				</div>
			</div>
		</div>
		
		<div class="modal2 modal" tabindex="-1" role="dialog">
		  <div class="modal-dialog" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title">댓글 삭제</h5>
		        <button type="button" class="close exiting2" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
		      <div class="modal-body">
		      	비밀번호 : 
		        <input id="deletePw" type="password">
		      </div>
		      <div class="modal-footer">
		      	<input type="hidden" id="deletingNo">
		        <button type="button" class="btn btn-secondary exiting2" data-dismiss="modal">취소</button>
		        <button type="button" class="btn btn-primary exiting2" id="deletingConfirm">삭제</button>
		      </div>
		    </div>
		  </div>
		</div>
				






	</main>
  <footer id="footer">
  	<jsp:include page="/include/footer.jsp" />
  </footer>
  
    <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

  <!-- Vendor JS Files -->
  <script src="<%=request.getContextPath()%>/assets/vendor/aos/aos.js"></script>
  <script src="<%=request.getContextPath()%>/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="<%=request.getContextPath()%>/assets/vendor/glightbox/js/glightbox.min.js"></script>
  <script src="<%=request.getContextPath()%>/assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
  <script src="<%=request.getContextPath()%>/assets/vendor/php-email-form/validate.js"></script>
  <script src="<%=request.getContextPath()%>/assets/vendor/purecounter/purecounter.js"></script>
  <script src="<%=request.getContextPath()%>/assets/vendor/swiper/swiper-bundle.min.js"></script> 	
  <!-- Template Main JS File -->
  <script src="<%=request.getContextPath()%>/assets/js/main.js"></script>
  	<script src="<%=request.getContextPath()%>/assets/js/myFunc.js"></script>

</body>