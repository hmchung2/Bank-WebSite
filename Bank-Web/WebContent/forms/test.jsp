<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


    
<!doctype html>
<html lang="ko">
<head>


<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script src="testing.js"></script>

<script>
window.onload = function(){
/* 	kakaoLogin()
	alert(result)
	alert(result)
	alert(result)
	alert(result) */
}
</script>



</head>
<body>
	<ul>
	<li onclick="kakaoLogin();">
      <a href="javascript:void(0)">
          <span>카카오 로그인</span>
      </a>
	</li>
	<li onclick="kakaoLogout();">
      <a href="javascript:void(0)">
          <span>카카오 로그아웃</span>
      </a>
	</li>
</ul>

</body>
