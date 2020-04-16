<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
		
		<title>오이오이 늦었다구</title>
		
		
		<!--[if lt IE 9]>
		<script src="/resources/include/js/html5shiv.js"></script>
		<![endif]-->
			<!-- Preloader -->
		<link rel="icon" href="/resources/images/core-img/favicon.ico">
		
		<!-- Core Stylesheet -->
		 
		<link rel="stylesheet" href="/resources/include/css/style.css">
	</head>
	<body>
		 <!-- ##### Header Area Start ##### -->
    	<header class="header-area">
			<tiles:insertAttribute name="header"/>
		</header>
		
		<section class="hero-area">
         <!-- ##### Breadcrumb Area Start ##### -->
		    <div class="breadcrumb-area">
		        <!-- Top Breadcrumb Area -->
		        <div class="top-breadcrumb-area bg-img bg-overlay d-flex align-items-center justify-content-center" style="background-image: url(/resources/images/bg-img/24.jpg);">
		            <h2><tiles:getAsString name="title"/></h2>
		        </div>
		    </div>
		    <!-- ##### Breadcrumb Area End ##### -->
	    </section>
	    <!-- ##### Hero Area End ##### -->
		
		<section>
			<jsp:include page="myPage.jsp"/>
			<tiles:insertAttribute name="body"/>
		</section>
		
		<!-- ##### Footer Area Start ##### -->
	    <footer class="footer-area bg-img" style="background-image: url(/resources/images/bg-img/3.jpg);">
	    	<tiles:insertAttribute name="footer"/>
	    </footer>
	    
	    
	    <!-- ##### All Javascript Files ##### -->
	    <!-- jQuery-2.2.4 js -->
	    <script type="text/javascript" src="/resources/include/js/jquery-2.2.4.min.js"></script>
	    <!-- Popper js -->
	    <script type="text/javascript" src="/resources/include/js/popper.min.js"></script>
	    <!-- Bootstrap js -->
	    <script type="text/javascript" src="/resources/include/dist/js/bootstrap.min.js"></script>
	    <!-- All Plugins js -->
	    <script type="text/javascript" src="/resources/include/js/plugins.js"></script>
	    <!-- Active js -->
	    <script type="text/javascript" src="/resources/include/js/active.js"></script>
			
		<script type="text/javascript" src="/resources/include/js/jquery.form.min.js"></script>
		
		<script type="text/javascript" src="/resources/include/js/pagination.min.js"></script>
		
	    
	</body>
</html>