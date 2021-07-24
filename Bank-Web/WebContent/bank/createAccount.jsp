<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html lang="ko">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>WAndC 계좌 개설</title>
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
  <link href="<%=request.getContextPath()%>/assets/css/createAccount.css" rel="stylesheet">  
  <!-- Template Main CSS File -->
  <link href="<%=request.getContextPath()%>/assets/css/style.css" rel="stylesheet">   
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.8/css/all.css">
  <script src="<%=request.getContextPath()%>/assets/js/jquery-3.6.0.min.js"></script>
  <script src="<%=request.getContextPath()%>/assets/js/myFunc.js"></script>  
  <script src="https://developers.kakao.com/sdk/js/kakao.js"></script> 
  <script src="<%=request.getContextPath()%>/member/kakaoLogin.js"></script>
 <%--  <script src="<%=request.getContextPath()%>/assets/js/createAccount.js"></script> --%>

<script>
	var current_fs, next_fs, previous_fs; //fieldsets
	var opacity;

	$(document).ready(function() {
		var current_fs, next_fs, previous_fs; //fieldsets
		var opacity;

		$(".next").click(function() {

			current_fs = $(this).parent();
			next_fs = $(this).parent().next();

			//Add Class Active
			$("#progressbar li").eq($("fieldset").index(next_fs)).addClass("active");

			//show the next fieldset
			next_fs.show();
			//hide the current fieldset with style
			current_fs.animate({ opacity: 0 }, {
				step: function(now) {
					// for making fielset appear animation
					opacity = 1 - now;

					current_fs.css({
						'display': 'none',
						'position': 'relative'
					});
					next_fs.css({ 'opacity': opacity });
				},
				duration: 600
			});
		});
						

		$(".previous").click(function() {

			current_fs = $(this).parent();
			previous_fs = $(this).parent().prev();

			//Remove class active
			$("#progressbar li").eq($("fieldset").index(current_fs)).removeClass("active");

			//show the previous fieldset
			previous_fs.show();

			//hide the current fieldset with style
			current_fs.animate({ opacity: 0 }, {
				step: function(now) {
					// for making fielset appear animation
					opacity = 1 - now;

					current_fs.css({
						'display': 'none',
						'position': 'relative'
					});
					previous_fs.css({ 'opacity': opacity });
				},
				duration: 600
			});
		});

		$('.radio-group .radio').click(function() {
			$(this).parent().find('.radio').removeClass('selected');
			$(this).addClass('selected');
		});

		$(".submit").click(function() {
			return false;
		})						
	})
</script>
<script>


	$(document).ready(function() {
		if ($('#max_condition').checked) {
				$('#condition_range').removeAttr('disabled');
		} else if (!$('#max_condition') .checked) {
			$('#condition_range').attr('disabled', 'disabled');
		}

		$('#next01').click(function() {

			let msg = ""
			let result = false
			var registNoRule = /\d{6}-\d{7}/;
			if (!registNoRule.test($('#user_ssn').val())) {
				msg = "주민번호는 xxxxxx-xxxxxxx 방식으로 작성 해야 합니다."
			} else if ('${ userVO.ssn }' != $('#user_ssn').val()) {
				msg = '사용자 주민번호가 일치하지 않습니다.'
			} else if ('${ userVO.pwd }' != $('#user_pwd').val()) {
				msg = '사용자 비밀번호가 일치하지 않습니다.'
			} else {
				result = true
			}
			if (result) {
				$('#hidden01').trigger("click")
			} else {
				alert(msg)
			}
		})

		$("#max_condition").change(function() {
			if (this.checked) {
				$('#condition_range').removeAttr('disabled');
			} else if (!this.checked) {
				$('#condition_range').attr('disabled', 'disabled');
			}
		});

		$('#next02').click(function() {
			result = false
			let msg = ""
			if($("#account_nick" ).val().length < 3  ){
				msg="계좌 별칭을 최소 3글자 이상 작성 바랍니다."
			}else if ($("#account_pwd").val().length < 5) {
				msg = "계좌 비밀번호는 최소 5자리 이상 필요합니다."
			} else if ($("#account_pwd").val() != $('#caccount_pwd').val()) {
				msg = "계좌 비밀번호를 정확히 재입력 되어 있지 않습니다."
			} else {
				result = true
			}

			if (result) {
				$('#hidden02').trigger("click")
			} else {
				alert(msg)
			}
		})
				
		$('#confirm_btn').click(function(){
			let msg = ""
			var result = true
			$('#pay-card input').each(function(){
				if($(this).val() == "" ){
					msg = "정보를 다 입력해야 합니다."
					result = false
					return false
				}
			})			
			if(!result){
				alert(msg)
				return false;
			}
		
			var today = new Date();

			if( !  /^\d{1,4}$/.test($('#exp_year').val() )  ) {
				msg = "만료연도는 '(2025)' 방식으로 작성 으로 작성 해야 합니다."
				result = false
			}
			else if(parseInt(today.getFullYear() ) > parseInt( $('#exp_year').val() )  ){
				msg = "만료연도는 현재 시간보다 이전 입니다."
				result = false								
			}else if( ! /^\d+$/.test($('#init_balance').val() ) ){
				msg = "초기 입금액은 숫자로만 작성 되어야 합니다.."
				result = false
			}else if( ! /^\d+$/.test($('#card_number').val() ) ){
					msg = "초기 입금액은 숫자로만 작성 되어야 합니다.."
					result = false
			}
			if(result){				
				$.ajax({
					type: 'get',
					url : "/Bank-Web/bank/CreateAccountProcess",
					data : {
						nickName :  $('#account_nick').val(),
						maxOpt: $('#max_condition').is(':checked'),
						maxVal : $('#condition_range').val(),
						openOpt : $('#open_opt').is(':checked'),						
						accountPwd : $('#account_pwd').val(),
						initBal : $('#init_balance').val()
					},
					datatype: 'json',
					success : callback, 
					error: function(){
						alert("실패")
					}
				})			
			}else{
				alert(msg)
			}		
		}) 		
	})
		

	function callback(data){
		console.log(data)
		data2 = JSON.parse(data)
		msg = ""
		msg +="계좌번호 : " + data2.accNum + "<br>"
		let maxOption = (data2["maxOpt"] == "T") ? '사용' : '사용 안함'		
		msg += "이체 최대 한도량 옵션 : "  + maxOption +  "<br>" 
		let openOption = (data2["openOpt"] == "T") ? '사용' : '사용 안함' 
		msg +="오픈뱅킹 옵션 : "  + openOption  + "<br>"
		msg +="현재 잔액 : " + data2["accBalance"] 
		
		console.log(msg)
		$("#accNum").html(msg)
		
/* 		$("#accNum").html("계좌 번호 : " +  data["accNum"] )
		let maxOption = (data["maxOpt"] == "T") ? '사용' : '사용 안함';		
		$("#maxOpt").html("이체 최대 한도량 옵션 : "  + maxOption )
		let openOption = (data["openOpt"] == "T") ? '사용' : '사용 안함'
		$("#openOpt").html("이체 최대 한도량 옵션 : "  + openOption )
		$("#bal").html("현재 잔액 : " + data["accBalance"] )	 */
		$('#final_btn').trigger("click")
	}
	
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
						<li>WC 계좌 개설</li>
					</ol>
				</div>
			</div>
		</section>
		<section class="inner-page">
			<div class="container">
				<!-- MultiStep Form -->
				<div class="container-fluid" id="grad1">
					<div class="row justify-content-center mt-0">
						<div
							class="col-11 col-sm-9 col-md-7 col-lg-6 text-center p-0 mt-3 mb-2">
							<div class="card px-0 pt-4 pb-0 mt-3 mb-3">
								<h2>
									<strong>계좌 개설 하기</strong>
								</h2>
								<p>다음 절차를 통해 계좌를 생성하세요</p>
								<div class="row">
									<div class="col-md-12 mx-0">
										<form id="msform">
											<!-- progressbar -->
											<ul id="progressbar">
												<li class="active" id="account"><strong>인증</strong></li>
												<li id="personal"><strong>계좌정보 생성</strong></li>
												<li id="payment"><strong>초기 입금</strong></li>
												<li id="confirm"><strong>완료</strong></li>
											</ul>
											<!-- fieldsets -->
											<fieldset>
												<div class="form-card">
													<h2 class="fs-title">인증</h2>
													<input type="password" name="user_pw" id="user_pwd"
														placeholder="사용자 비밀번호" /> <input type="password"
														name="user_ssn" id="user_ssn"
														placeholder="사용자 주민번호 xxxxxx-xxxxxxx 식으로 작성"
														pattern="\d{6}-\d{7}" />
												</div>
												<input id="next01" type="button" name="next"
													class="action-button" value="Next Step" /> <input
													id="hidden01" type="button" name="next"
													class="next action-button" value="Next Step" hidden="true" />
											</fieldset>
											<fieldset>
												<div class="form-card">
													<h2 class="fs-title">계좌 정보 생성</h2>
													<input id="account_nick" type="text" name="fname"
														placeholder="계좌 별칭" /> <input type="password"
														name="account_pwd" id="account_pwd"
														placeholder="계좌 비밀번호 입력" /> <input type="password"
														name="caccount_pwd" id="caccount_pwd"
														placeholder="계좌 비밀번호 확인" />

													<div class="form-check form-switch" style="width: 50%;">
														<label class="form-check-label"
															for="flexSwitchCheckChecked">오픈뱅킹 등록 여부</label> <input
															class="form-check-input" type="checkbox" id="open_opt">
													</div>

													<div class="form-check form-switch" style="width: 50%;">
														<label class="form-check-label"
															for="flexSwitchCheckChecked">이체 최대 금액 설정 여부</label> <input
															id="max_condition" style="margin-bottom: 20px;"
															class="form-check-input" type="checkbox"> <span
															style="float: left; left: 0px; margin: 0px">이체 최대
															금액 량</span> <input id="condition_range" step="1000000"
															style="margin: 5px;" type="range" value="1000000"
															min="1000000" max="100000000"
															oninput="this.nextElementSibling.value = this.value">
														<output>1000000</output>
														원
													</div>
												</div>
												<input id="hidden02-prev" type="button" name="previous"
													class="previous action-button-previous" value="Previous" />


												<input id="next02" type="button" name="next"
													class="action-button" value="Next Step" /> <input
													id="hidden02" type="button" name="next"
													class="next action-button" value="Next Step" hidden="true" />
											</fieldset>
											<fieldset>
												<div class="form-card" id="pay-card">
													<h2 class="fs-title">초기 입금</h2>
													<div class="radio-group">
														<div class='radio' data-value="credit">
															<img src="https://i.imgur.com/XzOzVHZ.jpg" width="200px"
																height="100px">
														</div>
														<div class='radio' data-value="paypal">
															<img src="https://i.imgur.com/jXjwZlj.jpg" width="200px"
																height="100px">
														</div>
														<br>
													</div>
													<label class="pay">카드 주인 이름*</label> <input type="text"
														name="holdername" placeholder="" />
													<div class="row">
														<div class="col-9">
															<label class="pay">카드번호*</label> <input type="text"
																id="card_number" name="cardno" placeholder="" />
														</div>
														<div class="col-3">
															<label class="pay">CVC*</label> <input type="password"
																name="cvcpwd" placeholder="***" />
														</div>
													</div>
													<div class="row">
														<div class="col-3">
															<label class="pay">카드 만료일</label>
														</div>
														<div class="col-9">
															<select id="exp_month" class="list-dt" id="month"
																name="expmonth">
																<option selected>월</option>
																<option>01월</option>
																<option>02월</option>
																<option>03월</option>
																<option>04월</option>
																<option>05월</option>
																<option>06월</option>
																<option>07월</option>
																<option>08월</option>
																<option>09월</option>
																<option>10월</option>
																<option>11월</option>
																<option>12월</option>
															</select> <input type="text" name="exp_year" id="exp_year"
																style="width: 30%;" placeholder="연도" pattern="[0-9]">
														</div>
													</div>
													<label style="width: 100%; margin-top: 20px; float: left;"
														class="pay">초기 입금 금액</label> <input type="text"
														pattern="[0-9]" name="init_balance" id="init_balance"
														placeholder="숫자로만 작성 (원)"
														style="border-color: black; width: 50%; border-style: solid; border-width: thin;" />
													<span style="width: 20%; top: 20%; font-size: 20px;">₩</span>
												</div>
												<input type="button" name="previous"
													class="previous action-button-previous" value="Previous" />

												<input id="confirm_btn" type="button" name="make_payment"
													class="action-button" value="Confirm" /> <input
													id="final_btn" type="button" name="make_payment"
													class="next action-button" value="Confirm" hidden="true" />


											</fieldset>
											<fieldset>
												<div class="form-card">
													<h2 class="fs-title text-center">Success !</h2>
													<br> <br>
													<div class="row justify-content-center">
														<div class="col-3">
															<img
																src="https://img.icons8.com/color/96/000000/ok--v2.png"
																class="fit-image">
														</div>
													</div>
													<br> <br>
													<div class="row justify-content-center">
														<div class="col-7 text-center">
															<h5>계좌 생성 완료</h5>
															<h5>계좌 정보</h5>
															<strong id="accNum"></strong><br>
														</div>
													</div>
												</div>
											</fieldset>
										</form>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>

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