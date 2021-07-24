
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>	
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script> 
<%-- <script src="<%=request.getContextPath()%>/member/kakaoLogin.js"></script> --%>
<script>
	function kakao_log(){
		kakao_init()
		kakaoLogout() 
	}
	function kakao_init(){
		Kakao.init('608658f5fcb61e9c594a600e980688e0');	
	}
	//카카오로그아웃  
	function kakaoLogout() {
	    if (Kakao.Auth.getAccessToken()) {
	      Kakao.API.request({
	        url: '/v1/user/unlink',
	        success: function (response) {
	        	console.log(response)
	        },
	        fail: function (error) {
	          console.log(error)
	        },
	      })
	      Kakao.Auth.setAccessToken(undefined)
	    }
	 }
</script>


  <div class="container d-flex align-items-center justify-content-between">

      <div class="logo">
        <a href="<%=request.getContextPath()%>/index.jsp"><img id="homeLogo" src="<%=request.getContextPath()%>/assets/img/logo.png" alt="" style="padding: 5%;"></a>
      </div>

      <nav id="navbar" class="navbar">
        <ul>
          <li class="dropdown"><a href="#"><span>Drop Down</span> <i class="bi bi-chevron-down"></i></a>
            <ul>
              <li><a href="#">Drop Down 1</a></li>
              <li class="dropdown"><a href="#"><span>Deep Drop Down</span> <i class="bi bi-chevron-right"></i></a>
                <ul>
                  <li><a href="#">Deep Drop Down 1</a></li>
                  <li><a href="#">Deep Drop Down 2</a></li>
                  <li><a href="#">Deep Drop Down 3</a></li>
                  <li><a href="#">Deep Drop Down 4</a></li>
                  <li><a href="#">Deep Drop Down 5</a></li>
                </ul>
              </li>
              <li><a href="#">Drop Down 2</a></li>
              <li><a href="#">Drop Down 3</a></li>
              <li><a href="#">Drop Down 4</a></li>
            </ul>
          </li>
          
          <li><a class="nav-link scrollto active" href="#hero">Home</a></li>
          <li><a class="nav-link scrollto" href="#about">About</a></li>
          <li><a class="nav-link scrollto" href="<%=request.getContextPath() %>/total/viewTotal.do"> 통합계좌</a></li>
          <li><a class="nav-link scrollto " href="<%=request.getContextPath() %>/bank/viewAccount.do">계좌 조회</a></li>
          <li><a class="nav-link scrollto" href="<%=request.getContextPath() %>/bank/createAccount.do">WC 계좌 개설</a></li>        
          <c:if test="${ empty userVO }">
          	<li><a class="nav-link scrollto" href="<%=request.getContextPath() %>/member/signcontract.do">회원가입</a></li>
          	<li><a class="nav-link scrollto" href="<%=request.getContextPath() %>/member/signin.do">로그인</a></li>
          </c:if>
          <c:if test="${ not empty userVO }">
          	<c:if test="${ userVO.user_type eq '2'}">
          		<li><a id="my-log-out" onclick="kakao_log()" class="nav-link scrollto" href="<%=request.getContextPath() %>/member/signout.do">KAKAO 로그아웃</a></li>
          	</c:if>         	
         	<c:if test="${ userVO.user_type ne '2' }" >         	
          		<li><a id="my-log-out" class="nav-link scrollto" href="<%=request.getContextPath() %>/member/signout.do">WC 로그아웃</a></li>
          	</c:if>          	
             <li style="color:#3498db"><a class="nav-link scrollto" href="#">${userVO.name } 님 환영합니다.</a></li>          	          
          </c:if>          

          <li><a class="getstarted scrollto" href="#about">시작하기</a></li>
        </ul>
        <i class="bi bi-list mobile-nav-toggle"></i>
      </nav><!-- .navbar -->

    </div>