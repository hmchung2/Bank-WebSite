
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>	


  <div class="container d-flex align-items-center justify-content-between">

      <div class="logo">
        <a href="<%=request.getContextPath()%>/index.jsp"><img id="homeLogo" src="<%=request.getContextPath()%>/assets/img/logo.png" alt="" style="padding: 5%;"></a>
      </div>

      <nav id="navbar" class="navbar">
        <ul>
          <li><a class="nav-link scrollto active" href="#hero">Home</a></li>
          <li><a class="nav-link scrollto" href="#about">About</a></li>
          <li><a class="nav-link scrollto" href="#services">Services</a></li>
          <li><a class="nav-link scrollto " href="#portfolio">Portfolio</a></li>
          <li><a class="nav-link scrollto" href="#team">Team</a></li>
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
          <c:if test="${ empty userVO }">
          	<li><a class="nav-link scrollto" href="<%=request.getContextPath() %>/member/signcontract.do">회원가입</a></li>
          	<li><a class="nav-link scrollto" href="<%=request.getContextPath() %>/member/signin.do">로그인</a></li>
          </c:if>
          <c:if test="${ not empty userVO }">
          	<li><strong style="color:#3498db">&nbsp; ${userVO.name } 님 환영합니다.</strong></li>
          </c:if>
          
          
          <li><a class="getstarted scrollto" href="#about">시작하기</a></li>
        </ul>
        <i class="bi bi-list mobile-nav-toggle"></i>
      </nav><!-- .navbar -->

    </div>