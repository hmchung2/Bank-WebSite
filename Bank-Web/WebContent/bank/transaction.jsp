<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>WAndC 계좌이체</title>
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

<style>
.loader {
  border: 16px solid #f3f3f3; /* Light grey */
  border-top: 16px solid #3498db; /* Blue */
  border-radius: 50%;
  width: 120px;
  height: 120px;
  animation: spin 2s linear infinite;
}

@keyframes spin {
  0% { transform: rotate(0deg); }
  100% { transform: rotate(360deg); }
}
</style>

<script>
//listButtons
//<button id="confirmAmount" style="display:inline; width:20%; background-color:white; border-color:#3498db; border-style: dashed; color:#3498db"  hidden="true">확인</button>  		
 $(document).ready(function(){
	 let accPwdValid= false
	 let sendingAmount = false
	 let receiver = false
	 let jobfinshed = false
	 
	 let fromPreBalance = '${fromAcc.accBalance}'
	 let toPreBalance = 0
	 
	 $('#loading-motion').hide()
	 $('#goback').hide()
	 $('#sendEmail').hide()
	 
	 console.log('${fromAcc}')
 	 $("#pwdValid").click(function(){ 		
 		if ($('#accPwdVal').val() != '${fromAcc.accPwd}'){
 			 $('#leftMsg').html("비밀번호가 일치 하지 않습니다.")
 			 $('#leftMsg').show()
 		}else{
 			accPwdValid = true;
 			$('#leftMsg').html("")
 	 		// ajax 로 인증  -------------->  		
 	 		// 인증 하고 나면 ->>>
 	 		$(this).hide();
 	 		$("#confirmAmount").removeAttr('hidden');
 	 		$("#accPwdVal").hide();
 	 		$("#sendAmount").removeAttr('hidden');
 	 		$("#pwdIcon").hide();
 	 		$("#moneyIcon").removeAttr("hidden");
 	 		var txt = $("<div></div>").text("계좌인증 완료"); 	 		
 	 		txt.css("color", "green")
 	 		txt.css("font-size" , "15px")
 	 		txt.css("display","inline") 		 	 	
 	 		var doneIcon = $("<i></i>")
 	 		doneIcon.addClass("far fa-check-circle")
 	 		doneIcon.css("font-size" , "30px")
 	 		txt.append(doneIcon)	
 	 		$("#leftButtons").append(txt)
 		}	
 	})
 	if('${freePass}' != null && '${freePass}'  == 'true' ){
 		accPwdValid = true;
 		$('#pwdValid').hide()
 		$("#confirmAmount").removeAttr('hidden');
 		$("#accPwdVal").hide();
 		$("#sendAmount").removeAttr('hidden');
 		$("#pwdIcon").hide();
 		$("#moneyIcon").removeAttr("hidden");
 		var txt = $("<div></div>").text("계좌인증 완료"); 	 		
 		txt.css("color", "green")
 		txt.css("font-size" , "15px")
 		txt.css("display","inline") 		 	 	
 		var doneIcon = $("<i></i>")
 		doneIcon.addClass("far fa-check-circle")
 		doneIcon.css("font-size" , "30px")
 		txt.append(doneIcon)	
 		$("#leftButtons").append(txt)	
 	}
 	
 	 	
 	
 	let toggleState = 1
 	$('#confirmAmount').click(function(){
		 if(toggleState == 1){
			 if(! /^\d+$/.test($('#sendAmount').val() )){
		 			$('#leftMsg').html("숫자로만 금랙을 작성해주세요")
		 			$('#leftMsg').show(); 			
		 		}else if( '${fromAcc.maxOpt}' == 'T' &&  parseInt($('#sendAmount').val()) > parseInt('${fromAcc.maxVal}') ){
		 			$('#leftMsg').html("한도량을 초과 하셨습니다.")
		 			$('#leftMsg').show(); 		 			
		 		}else if( parseInt($('#sendAmount').val()) >   parseInt('${fromAcc.accBalance}')  ){
		 			$('#leftMsg').html("한도량을 초과 하셨습니다.")
		 			$('#leftMsg').show(); 		 			
		 		}			 
			 else{
		 			$('#leftMsg').hide();
		 			$(this).html("변경")
		 			sendingAmount = true;
		 			toggleState = 2
		 			$(this).css("border-color" , "red")
		 			$("#sendAmount").prop("readonly", true);
		 		}
		 }else if(toggleState == 2){
			   $("#sendAmount").prop("readonly", false)
			   sendingAmount = false
			   $(this).html("확인")
			   $(this).css("border-color" , "#3498db")
			   toggleState = 1			   
		 } 		 		
 	})
 	
    let toggle2 = 1            
    $('#toConfirm').click(function(){
 		if(toggle2 == 1){
 			if( ! /^\d+$/.test($('#toAccNum').val() ) ){
 				$('#rightMsg').html("계좌번호는 숫자로만 입력 해야 합니다.")
						
 			}else if($('#toAccNum').val().length < 5  ){
 				$('#rightMsg').html("계좌번호가 너무 짧습니다.")
 			}
 			else{			 				
 				$.ajax({
 					type: 'post',
 					url : "/Bank-Web/bank/findAccount",
 					data :{
 						bankName: $('#toBank').val(),
 						accNum :  $('#toAccNum').val(),
 					},
 					contentType: "application/x-www-form-urlencoded;charset=ISO-8859-15",
 					datatype: 'json',
 					success : function(data){
 						data = JSON.parse(data)
 						if(data.result == "false"){
 							$('#rightMsg').html("계좌를 찾을수 없습니다.")
 						}else{
 							
 							toggle2 = 2
 							$('#rightMsg').html("")
 							receiver = true 							
 							$("#toAccNum").prop("readonly", true);
 							$('#toBank').prop('disabled', true);
 			 				$("#toConfirm").text("변경");
 			 				$("#toConfirm").css("border-color" , "red")
 			 				$("#toConfirm").css("color" , "red")
 			 				toPreBalance  = data.accBalance
 			 					
 			 					
 			 				getUserInfo(data.id, $('#toBank').val())		 				
 						}					
 					},
 					error : function(){
 	 				
 	 					console.log("실패")
 	 					
 	 				} 			
 					
 				}) 				 				
 			}
 		}else if(toggle2 == 2){ 
 			receiver = false
 			$('#rightName').html("")
 			$("#toAccNum").prop("readonly", false);
			$('#toBank').prop('disabled', false);
			toggle2 = 1
			$("#toConfirm").text("확인");
			$("#toConfirm").css("border-color" , "#3498db")
			$("#toConfirm").css("color" , "#3498db")
 		}				
 	})
/*  	$('#sendEmail').click(function() {
 		$.ajax({
				type: 'post',
				url : "/Bank-Web//SendEmailServlet",
				data : {
					processed : "true"
				},
				contentType: "application/x-www-form-urlencoded;charset=ISO-8859-15",
				datatype: 'json',
				success : function(data){
					$("#middleMsg").append("<div>이메일 보내기 완료</div>") 		 					
				},
				error : function(){
					$("#middleMsg").append("<div>문제가 발생 했습니다.</div>") 	 					
				} 				
			}) 	
 		
 	}) */
 		

 	
 	
 	
 	$("#send").click(function(){

 		if(jobfinshed != true){
 			let fromAccNum = '${fromAcc.accNum }' 		
 		 		let toAccNum = $("#toAccNum").val()		
 		 		let toBankName = $("#toBank").val()
 		 		let amount = $("#sendAmount").val()
 		 		let fromBankName = '${fromBankName}'
 		 		let result = false
 		 		if(accPwdValid == false ){
 		 			$("#middleMsg").html("출금 하는 계좌의 인증이 필요 합니다.")
 		 			$("#middleMsg").show()
 		 		} else if(sendingAmount == false){
 		 			$("#middleMsg").html("금액을 작성 하고 확인 버튼을 눌러주세요")
					$("#middleMsg").show()
 		 		}else if(receiver == false){
 		 			$("#middleMsg").html("보내는 계좌 확인 필요 합니다.")
					$("#middleMsg").show()
 		 		}else{
 		 			$("#middleMsg").html("")
 		 			result = true
 		 		}
 		 		if(result){
 		 			 $('#loading-motion').show() 		 			 
 		 			$.ajax({
 		 				type: 'post',
 		 				url : "/Bank-Web/bank/transactionProcess",
 		 				data : {
 		 					fromAccNum : fromAccNum,
 		 					toAccNum : toAccNum,
 		 					toBankName : toBankName,
 		 					fromBankName : fromBankName,
 		 					amount : amount,
 		 					fromPreBalance : fromPreBalance,
 		 					toPreBalance : toPreBalance
 		 				},
 		 				contentType: "application/x-www-form-urlencoded;charset=ISO-8859-15",
 		 				datatype: 'json',
 		 				success : function(data){
 		 					data = JSON.parse(data)
 		 				 	if(data.result == "false"){	 		
 		 				 		$("#middleMsg").html("계좌 이체중 문제가 발생 했습니다.") 	 		
 		 				 	}else{
 		 				 		jobfinshed = true
 		 				 		
 		 				 		$("#middleMsg").html("계좌이체 성공")
 		 				 		$('#middleMsg').css("color" , "green");	
 		 				 		updateBal()
 		 				 		$('#send').hide()
 		 	 		 			$('#goback').show()
 		 	 		 			$('#currentBal').css("color" , "red");
 		 				 		$('#toConfirm').hide()
								$('#loading-motion').hide()
								//$('#sendEmail').show()
								sendMessage()
								
 		 				 	} 		 					
 		 				},
 		 				error : function(){
 		 					$("#middleMsg").html("계좌 이체중 문제가 발생 했습니다.") 					
 		 				} 				
 		 			}) 		 			
 		 		} 			
 		}
 	
 	})	 
 })
 
 	function getUserInfo(userId, bankName){
 		$.ajax({
				type: 'post',
				url : "/Bank-Web/bank/UserInfo",
				data : {
					userId : userId,
					bankName : bankName,
				},
				datatype: 'json',
				success : function(data){
					data = JSON.parse(data)					
					$('#rightName').html("<h3> 받는분 : " + data.name  + "</h3>" )										
				},
				error : function(){
					console.log("아이드 찾기 실패")					
				} 				
		}) 			 		
 	}
 	
 	function updateBal(){
 		bankName = '${fromBankName}'
 		accNum = '${fromAcc.accNum}'
 			$.ajax({
				type: 'post',
				url : "/Bank-Web/bank/findAccount",
				data :{
					bankName: bankName,
					accNum :  accNum,
				},
				contentType: "application/x-www-form-urlencoded;charset=ISO-8859-15",
				datatype: 'json',
				success : function(data){
					data = JSON.parse(data)
					if(data.result == "false"){
						$('#leftMsg').html("잔액 업데이트중 문제 발생. 새로고침 필요.")
						$('#leftMsg').show()
					}else{
						fromPreBalance = data.accBalance
						$('#leftMsg').hide()				
						$('#currentBal').html("<sup>잔액</sup>"+  data.accBalance + " ₩<span></span>")	
					}					
				},
				error : function(){				
					console.log("실패")			
				} 					
			}) 				 				
 	}
 
 	function sendMessage(){ 
 		fromAccNum = '${fromAcc.accNum }'
 		toAccNum = $("#toAccNum").val();
		phone = '${userVO.phone}'		
 		toBankName = $("#toBank").val();
 		amount = $("#sendAmount").val();
 		fromBankName = '${fromBankName}'
 			$.ajax({
	 				type: 'post',
	 				url : "/Bank-Web/SendTextMsgServlet",
	 				data : {
	 					phone : phone,
	 					fromAccNum : fromAccNum,
	 					toAccNum : toAccNum,
	 					toBankName : toBankName,
	 					fromBankName : fromBankName,
	 					amount : amount,
	 				},
	 				contentType: "application/x-www-form-urlencoded;charset=ISO-8859-15",
	 				datatype: 'json',
	 				success : function(data){
	 					data = JSON.parse(data)
	 					console.log(data) 		 					
	 				},
	 				error : function(){
	 					console.log("fail")  					
	 				} 				
	 			}) 	
	
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
						<li><a href="<%=request.getContextPath() %>">홈</a></li>
						<li><a href="<%=request.getContextPath() %>">계좌조회</a></li>
						<li>계좌이체</li>
					</ol>
				</div>
			</div>
		</section>
		    <section id="pricing" class="pricing">
      <div class="container">

        <div class="section-title">
          <h2>계좌 이체</h2>
          <p>계좌 비밀번호 확인 -> 금액 입력 -> 보내는 계좌 번호 확인 -> 보내기 순으로 진행주세요</p>
        </div>

        <div class="row">

 
	 <%-- alert('${fromAcc.accNum}') --%>

          <div class="col-lg-4 col-md-6 mt-4 mt-md-0">
            <div class="box recommended" data-aos="zoom-in" data-aos-delay="100">
           	<c:choose>
            	<c:when test="${fromBankName eq '700' }">
            		<h6>WC 은행</h6>
            	</c:when>
            	<c:when test="${fromBankName eq '600' }">
            		<h6>본성 은행</h6>
            	</c:when>
           		<c:when test="${fromBankName eq '500' }">
            		<h6>민영 은행</h6>
            	</c:when>
          	 	<c:when test="${fromBankName eq '400' }">
            		<h6>민기; 은행</h6>
            	</c:when>            	
            </c:choose>
              <h3>별칭 : ${fromAcc.nick }</h3>
              <h4 id="currentBal"><sup>잔액</sup>${fromAcc.accBalance} ₩<span></span></h4>
              <ul id="leftInfo" style="margin-bottom:0px;">
              	<li> 계좌 주인 : ${userVO.name } </li>
              	<li> 계좌 번호 : ${fromAcc.accNum } </li>
                <li> 계좌 개설일 : ${fromAcc.regDate } </li>
                <li> 오픈뱅킹 사용 여부 : ${fromAcc.openOpt } </li>
                <li> 이체 한도량 사용 여부 : ${fromAcc.maxOpt } </li>
                <c:if test="${fromAcc.maxOpt eq 'T' }">
                	<li>이체 한도량 : ${fromAcc.maxVal } </li>
                </c:if>
                  <c:if test="${fromAcc.maxOpt eq 'F' }">
                	<li class="na">이체 한도량 :  </li>
                </c:if>
                
               	<li id="listButtons">
               		<label id=>
               			<i id="pwdIcon" class="ri-secure-payment-fill"></i>
               			<i id="moneyIcon" class="ri-bank-card-fill" hidden="true"></i>
               		</label>               		 
               			<input style="width:50%;  display:inline;" id="accPwdVal" class="form-control" type="password" placeholder="계좌비밀번호"> 
               			<input style="width:50%;  display:inline;" id="sendAmount" class="form-control" type="text" placeholder="거래량 ₩" hidden="true">
               			<button id="confirmAmount" style="display:inline; width:20%; background-color:white; border-color:#3498db; border-style: dashed; color:#3498db"  hidden="true">확인</button>  		
               	</li>               	               
              </ul>
              <div class="btn-wrap" id="leftButtons" style="padding-top:0px;">
              	<a  href="<%=request.getContextPath() %>/bank/viewAccount.do" class="btn-buy" id="backToView"  style="background-color:red; border-color:red;">다른 계좌</a>
                <a class="btn-buy" id="pwdValid" >인증</a>             
              </div>
				<div id="leftMsg" style="color:red; font-size:17px;"> </div>
            </div>
          </div>
					<div class="col-lg-4 col-md-6 mt-4 mt-lg-0">
						<div class="box" data-aos="zoom-in" data-aos-delay="100"
							style="margin-top: 35%;">
							<div class="btn-wrap">
								<div id="middleMsg" style="color: red; font-size: 17px;"></div>
								<a href="#" class="btn-buy" id="send"> 보내기</a>
								<a  href="<%=request.getContextPath() %>/bank/viewAccount.do" class="btn-buy" id="goback" style="background-color:red; color:white; "> 돌아가기</a>
							</div>
						</div>
						 <div id="loading-motion" style="margin:0px auto;" class="loader"></div>
					</div>
								         

					<div class="col-lg-4 col-md-6 mt-4 mt-lg-0">
            <div class="box" data-aos="zoom-in-left" data-aos-delay="200">
              <h3>받는 사람</h3>
           <%--   <h4><sup>잔액</sup>${fromAcc.accBalance} ₩<span></span></h4> --%>             
              <!-- <h4><sup>잔액</sup> - ₩ <span></span></h4> -->

			<ul>
                <li>은행 : &nbsp;<select style="border-color:#3498db; background-color:white; color:#5faee3;" id="toBank">
					<option value="700" selected>WC 은행</option>
					<option value="600">세진저축은행</option>
					<option value="800">MG구마을금고</option>
					<option value="900">TVA</option>
				</select></li>
	            	              
                   	<li>
               		<label>
               			<i id="pwdIcon" class="ri-secure-payment-fill"></i>
               		</label> 
               			<input id="toAccNum" style="width:50%;  display:inline;" id="accPwdVal" class="form-control" type="text" placeholder="보내는 계좌 번호">               			 
               		</li>
               		<li>&nbsp;</li>
               		<li>&nbsp;</li>
    				<li>&nbsp;</li>
                <li id="rightName"></li>	
              </ul>             
              <div class="btn-wrap">
                <a id="toConfirm" class="btn-buy">확인</a>
              </div>
              <div id="rightMsg" style="color:red; font-size:17px;">
            </div>
          </div>
        </div>
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

</body>