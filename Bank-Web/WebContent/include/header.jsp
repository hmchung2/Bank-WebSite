
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

          <li><a class="nav-link active" href="<%=request.getContextPath() %>/index.jsp">Home</a></li>
          <li><a class="nav-link" href="<%=request.getContextPath() %>/board/viewBoard.do" >게시판</a></li>
          <li><a class="nav-link" href="<%=request.getContextPath() %>/total/viewTotal.do"> 통합계좌</a></li>
          <li><a class="nav-link" href="<%=request.getContextPath() %>/bank/viewAccount.do">계좌 조회</a></li>
          <li><a class="nav-link" href="<%=request.getContextPath() %>/bank/createAccount.do">WC 계좌 개설</a></li>        
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