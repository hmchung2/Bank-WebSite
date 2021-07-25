<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>       
<!DOCTYPE html>
<html lang="ko">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>WAndC 계좌 조회</title>
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
  
  <script src="<%=request.getContextPath()%>/assets/js/jquery-3.6.0.min.js"></script>
  <script src="<%=request.getContextPath()%>/assets/js/myFunc.js"></script>
  
  <script src="https://developers.kakao.com/sdk/js/kakao.js"></script> 
 <script src="<%=request.getContextPath()%>/member/kakaoLogin.js"></script>
 
 <script>
 // 스크립트 작성은 여기서
 
 $(document).ready(function() {
	 console.log('${list}')
	 let prevMsg = '${previous_msg}'
	 if('${previous_msg}' != null && '${previous_msg}' !=""){
		 if(prevMsg == "true" ){
			 $('#prevMsg').css("color" , "green")
			 $('#prevMsg').html("계좌 등록이 완료 되었습니다.")
		 }else{
			 $('#prevMsg').css("color" , "red")
			 $('#prevMsg').html(prevMsg)
		 }
		 $('#prevMsg').removeAttr("hidden");
	
		 
	 }
	 
	 
	 $('#bankSelect').change(function() {
			$("#bankSelect option:selected").each(function() {
				if ($(this).val() == '1') { //직접입력일 경우 
					$("#bankName").val(''); //값 초기화 
					$("#bankName").attr("disabled", false); //활성화 
				} else { //직접입력이 아닐경우 
					$("#bankName").val($(this).text()); //선택값 입력 
					$("#bankName").attr("disabled", true); //비활성화 
				}
			});
		});
	 
	 $('#registerButton').click(function(){
		$('#registerSubmit').trigger("click")
	 })	 
 })
 
 </script>
 
 
</head>

<body>
	<!-- ======= Header ======= -->
	<header id="header" class="fixed-top d-flex align-items-center">
		<jsp:include page="/include/header.jsp" />
	</header>
	<main id="main">

<%-- 			<c:forEach items="${ list }" var="board" varStatus="loop">
				<tr 
					<c:if test="${ loop.index mod 2 ne 0 }"> class="odd" 
					</c:if>>
					<td>${ board.no }</td>
					<td>
						 <a href="<%=request.getContextPath() %>/board/detail.do?no=${ board.no }">
						<a href="#" onclick="doAction()">
						<a href="javascript:doAction(${ board.no })">
							<c:out value="${ board.title }" />
						</a>
					</td>
					<td>${ board.writer }</td>
					<td>${ board.regDate }</td>
				</tr>
			</c:forEach>
 --%>
		<!-- ======= Breadcrumbs Section ======= -->
		<section class="breadcrumbs">
			<div class="container">

				<div class="d-flex justify-content-between align-items-center">
					<h2>Wells & Clarify</h2>
					<ol>
						<li><a href="<%=request.getContextPath() %>">홈</a></li>
						<li>계좌조회</li>
					</ol>
				</div>
			</div>
		</section>
		
		
		    <!-- ======= Pricing Section ======= -->
    <section id="pricing" class="pricing">
      <div class="container">

        <div class="section-title">
          <h2>${userVO.name }님의 ${totalNick }계정</h2>

          <p>이체 기능 및 이체 역사 조회</p>      
        </div>							
				<div class="row">
					<!-- ======= One Section ======= -->
					<div class="col-lg-4 col-md-6 mt-4 mt-md-0">
					
						<div class="box recommended" data-aos="zoom-in"
							data-aos-delay="100">
							<h3>새로운 계좌 등록</h3>
							<form method="post" action="<%=request.getContextPath() %>/total/registerAccount.do">
									<div class="input-group-prepend" style="left: 20px; margin-top:20px;">
										<i class="fa fa-envelope"></i> <input type="text"
											name="bankName" id="bankName" style="width: 30%;" disabled
											value="WC"> 
											<select
											style="width: 20%; margin-right: 0px" name="bankSelect"
											id="bankSelect">
											<option value="700" selected>WC</option>
											<option value="600">세진저축은행</option>
											<option value="800">MG구마을금고</option>
											<option value="900">TVA</option>
										</select>
									</div>
									<div class="input-group-prepend" style="left: 20px; margin-top:10px;">
										<i class="fa fa-id-card"></i> <input name="accNum" placeholder="계좌번호" type="text">
									</div>
									<div class="input-group-prepend" style="left: 20px; margin-top:10px;">
										<i class="fa fa-lock"></i> <input name="accPwd" placeholder="계좌 비밀번호" type="text">
									</div>
									
								<input type="hidden" name="totalId" value="${totalId }">
								<input type="hidden" name="totalNick" value="${totalNick }">
								<button type="submit" hidden="true" id="registerSubmit">등록</button>
							</form>

							<div class="btn-wrap">
								<a href="#" class="btn-buy">돌아가기</a> 
								<button id="registerButton" style="background-color: red; border-color: red;"
									class="btn-buy">등록하기</button>
								<h3 id="prevMsg" hidden="true"></h3>
									 
							</div>
						</div>
						
					</div>

<%-- href="<%=request.getContextPath() %>/bank/transaction.do?accNum=${ account.accNum }&fromBankName=700"
 --%>
				<c:forEach items="${ list }" var="account" varStatus="loop">
						<div class="col-lg-4 col-md-6 mt-4 mt-md-0">
							<div class="box recommended" data-aos="zoom-in" data-aos-delay="100">				
								<h4>
									<sup>
									<c:choose>
						           	<c:when test="${account.bankName eq '700' }">
						           		WC 은행
						           	</c:when>
						           	<c:when test="${account.bankName eq '600' }">
						           		세진저축은행
						           	</c:when>
						          		<c:when test="${account.bankName eq '800' }">
						           			MG구마을금고
						           	</c:when>
						         	 	<c:when test="${account.bankName eq '800' }">
						           			TVA
						           	</c:when>            	
						           </c:choose>
									</sup><span></span>
								</h4>
								<ul>
									<li>계좌 번호 : ${account.accNum }</li>
									<li>계좌 개설일 : ${account.regDate }</li>
								</ul>
								<div class="btn-wrap">
									<a href="#" class="btn-buy">이체 조회</a> <a
										href="<%=request.getContextPath() %>/bank/TotalTransaction.do?accNum=${ account.accNum }&fromBankName=${account.bankName }"
										style="background-color: red; border-color: red;"
										class="btn-buy">이체 하기</a>
								</div>
							</div>
						</div>
					</c:forEach> 
				</div>
			</div>
    </section><!-- End Pricing Section -->
		
		
		
		
		
		
		
		
		
		
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

</body>l>