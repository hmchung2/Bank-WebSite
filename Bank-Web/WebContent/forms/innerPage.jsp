
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>	

<!DOCTYPE html>
<html lang="en">

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

  <!-- =======================================================
  * Template Name: Vesperr - v4.3.0
  * Template URL: https://bootstrapmade.com/vesperr-free-bootstrap-template/
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
  
  <script src="<%=request.getContextPath()%>/assets/js/jquery-3.6.0.min.js"></script>
  <script src="<%=request.getContextPath()%>/assets/js/myFunc.js"></script>
</head>

<body>
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
            <li>Inner Page</li>
          </ol>
        </div>

      </div>
    </section><!-- End Breadcrumbs Section -->

    <section class="inner-page">
      <div class="container">
        <p>
          Example inner page template
        </p>
      </div>
    </section>




  </main><!-- End #main -->

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

</html>