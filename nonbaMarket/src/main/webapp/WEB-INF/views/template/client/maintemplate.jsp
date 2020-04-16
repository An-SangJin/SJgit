<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<!-- html4 : 파일의 인코딩 방식 지정 -->
      	<!--<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />-->

		<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
      	<!-- 브라우저의 호환성 보기 모드를 막고, 해당 브라우저에서 지원하는 가장 최신 버전의 방식으로 HTML 보여주도록 설정.-->
      
     	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
      	<!--viewport : 화면에 보이는 영역을 제어하는 기술. width는 device-width로 설정(브라우저 너비를 장치 너비에 맞추어 표시). initial-scale는 초기비율(보이는 영역과 웹 페이지를 맞춤). user-scalable는 사용자가 화면축소를 하지 못하도록 설정.-->
         
      	<!-- 모바일 웹 페이지 설정 - 이미지 경로 위치는 각자 변경 -->
      	<!-- <link rel="stylesheet" type="text/css" href="/resources/include/dist/css/bootstrap.min.css">
     	<link rel="stylesheet" type="text/css" href="/resources/include/dist/css/bootstrap-theme.css"> -->
     	<!-- 모바일 웹 페이지 설정 끝
		<title>Insert title here</title>
      	<!--[if lt IE 9]>
      	<script src="../js/html5shiv.js"></script>
      	<![endif]-->
      	<!-- Preloader -->
 <link rel="icon" href="/resources/images/core-img/favicon.ico">
  <link href="https://fonts.googleapis.com/css?family=Do+Hyeon&display=swap" rel="stylesheet"> 
  <!-- Core Stylesheet -->
 
 <link rel="stylesheet" href="/resources/include/css/style.css">
 
 
  <style type="text/css">
	.salePrice{
		text-decoration: line-through;
		color: #cfcfcf;
	}
	.saleNum{
		float:rigth;
		font-size: 30px;
		color: red;
	}
	.saleImg{
		width: 40px;
		height: 40px;
		float: right;
	}
	
</style>
	</head>
	<body style="font-family: 'Do Hyeon', sans-serif;">
		 <!-- ##### Header Area Start ##### -->
    	<header class="header-area">
			<tiles:insertAttribute name="header"/>
		</header>
		
		<section class="hero-area">
        <div class="hero-post-slides owl-carousel">

            <!-- Single Hero Post -->
            <div class="single-hero-post bg-overlay">
                <!-- Post Image -->
                <div class="slide-img bg-img" style="background-image: url(/resources/images/bg-img/1.jpg);"></div>
                <div class="container h-100">
                    <div class="row h-100 align-items-center">
                        <div class="col-12">
                            <!-- Post Content -->
                            <div class="hero-slides-content text-center">
                                <h2>이번주 특가 세일!!!!!!!!!!!세일 상품 아주 많아요. 궁금하시면 아래 버튼 클릭</h2>
                                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur pellentesque ante nec ipsum iaculis, ac iaculis ipsum porttitor. Vivamus cursus nisl lectus, id mattis nisl lobortis eu. Duis diam augue, dapibus ut dolor at, mattis maximus dolor.</p>
                                <div class="welcome-btn-group">
                                    <a href="/product/bestProduct" class="btn alazea-btn mr-30">베스트 상품 보러가기</a>
                                    <a href="/product/newProduct" class="btn alazea-btn active">신상품 보러 가기</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Single Hero Post -->
            <div class="single-hero-post bg-overlay">
                <!-- Post Image -->
                <div class="slide-img bg-img" style="background-image: url(/resources/images/bg-img/2.jpg);"></div>
                <div class="container h-100">
                    <div class="row h-100 align-items-center">
                        <div class="col-12">
                            <!-- Post Content -->
                            <div class="hero-slides-content text-center">
                                <h2>Plants exist in the weather and light rays that surround them</h2>
                                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur pellentesque ante nec ipsum iaculis, ac iaculis ipsum porttitor. Vivamus cursus nisl lectus, id mattis nisl lobortis eu. Duis diam augue, dapibus ut dolor at, mattis maximus dolor.</p>
                                <div class="welcome-btn-group">
                                	<a href="/product/bestProduct" class="btn alazea-btn mr-30">베스트 상품 보러가기</a>
                                    <a href="/product/newProduct" class="btn alazea-btn active">신상품 보러 가기</a> 
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </section>
    <!-- ##### Hero Area End ##### -->

    <!-- ##### Portfolio Area Start ##### -->
    <section class="alazea-portfolio-area section-padding-100-0">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <!-- Section Heading -->
                    <div class="section-heading text-center">
                        <h2>카테고리</h2>
                    </div>
                </div>
            </div>
        </div>

        <div class="container-fluid">
            <div class="row">
                <div class="col-12">
                    <div class="alazea-portfolio-filter">
                        <div class="portfolio-filter">
                            <button class="btn active" data-filter="*">모두</button>
                            <button class="btn" data-filter=".vegetable">채소</button>
                            <button class="btn" data-filter=".fruit">과일/견과/쌀</button>
                            <button class="btn" data-filter=".fisheries">수산/해산/건어물</button>
                            <button class="btn" data-filter=".meat">정육/계란</button><br/><br/>
                            <button class="btn" data-filter=".soup">국/반찬/메인요리</button>
                            <button class="btn" data-filter=".salad">샐러드/간편식</button>
                            <button class="btn" data-filter=".wool">면/양념/오일</button>
                            <button class="btn" data-filter=".beverage">음료/우유/떡/간식</button>
                            <button class="btn" data-filter=".bakery">베이커리/치즈/델리</button><br/><br/>
                            <button class="btn" data-filter=".healthFood">건강식품</button>
                            <button class="btn" data-filter=".kitchen">주방용품</button>
                            <button class="btn" data-filter=".house">가전제품</button>
                            <button class="btn" data-filter=".pet">반려동물</button>
                     
                        </div>
                    </div>
                </div>
            </div>

            <div class="row alazea-portfolio">

                <!-- Single Portfolio Area -->
                <div class="col-12 col-sm-6 col-lg-3 single_portfolio_item vegetable wow fadeInUp" data-wow-delay="100ms">
                    <!-- Portfolio Thumbnail -->
                    <div class="portfolio-thumbnail bg-img" style="background-image: url(/resources/images/vegetable.jpg);"></div>
                    <!-- Portfolio Hover Text -->
                    <div class="portfolio-hover-overlay">
                        <a href="/product/categori?lc_num=100" class="portfolio-img d-flex align-items-center justify-content-center" title="Portfolio 1">
                            <div class="port-hover-text">
                                <h3>채소</h3>
                                <h5>recommend</h5>
                            </div>
                        </a>
                    </div>
                </div>

                <!-- Single Portfolio Area -->
                <div class="col-12 col-sm-6 col-lg-3 single_portfolio_item fruit wow fadeInUp" data-wow-delay="200ms">
                    <!-- Portfolio Thumbnail -->
                    <div class="portfolio-thumbnail bg-img" style="background-image: url(/resources/images/fruit.jpg);"></div>
                    <!-- Portfolio Hover Text -->
                    <div class="portfolio-hover-overlay">
                        <a href="#" class="portfolio-img d-flex align-items-center justify-content-center" title="Portfolio 2">
                            <div class="port-hover-text">
                                <h3>과일/견과/쌀</h3>
                                <h5>recommend</h5>
                            </div>
                        </a>
                    </div>
                </div>

                <!-- Single Portfolio Area -->
                <div class="col-12 col-sm-6 col-lg-3 single_portfolio_item fruit wow fadeInUp" data-wow-delay="300ms">
                    <!-- Portfolio Thumbnail -->
                    <div class="portfolio-thumbnail bg-img" style="background-image: url(/resources/images/rusrhk.jpg);"></div>
                    <!-- Portfolio Hover Text -->
                    <div class="portfolio-hover-overlay">
                        <a href="#" class="portfolio-img d-flex align-items-center justify-content-center" title="Portfolio 3">
                            <div class="port-hover-text">
                                <h3>과일/견과/쌀</h3>
                                <h5>recommend</h5>
                            </div>
                        </a>
                    </div>
                </div>
<!-- 여기까지 -->
                <!-- Single Portfolio Area -->
                <div class="col-12 col-sm-6 col-lg-3 single_portfolio_item fruit wow fadeInUp" data-wow-delay="400ms">
                    <!-- Portfolio Thumbnail -->
                    <div class="portfolio-thumbnail bg-img" style="background-image: url(/resources/images/sal.jpg);"></div>
                    <!-- Portfolio Hover Text -->
                    <div class="portfolio-hover-overlay">
                        <a href="#" class="portfolio-img d-flex align-items-center justify-content-center" title="Portfolio 4">
                            <div class="port-hover-text">
                               <h3>과일/견과/쌀</h3>
                                <h5>recommend</h5>
                            </div>
                        </a>
                    </div>
                </div>

                <!-- Single Portfolio Area -->
                <div class="col-12 col-sm-6 col-lg-3 single_portfolio_item fisheries wow fadeInUp" data-wow-delay="100ms">
                    <!-- Portfolio Thumbnail -->
                    <div class="portfolio-thumbnail bg-img" style="background-image: url(/resources/images/tntks.jpg);"></div>
                    <!-- Portfolio Hover Text -->
                    <div class="portfolio-hover-overlay">
                        <a href="#" class="portfolio-img d-flex align-items-center justify-content-center" title="Portfolio 5">
                            <div class="port-hover-text">
                               <h3>수산/해산/건어물</h3>
                                <h5>recommend</h5>
                            </div>
                        </a>
                    </div>
                </div>

                <!-- Single Portfolio Area -->
                <div class="col-12 col-sm-6 col-lg-3 single_portfolio_item meat wow fadeInUp" data-wow-delay="200ms">
                    <!-- Portfolio Thumbnail -->
                    <div class="portfolio-thumbnail bg-img" style="background-image: url(/resources/images/wjddbr.jpg);"></div>
                    <!-- Portfolio Hover Text -->
                    <div class="portfolio-hover-overlay">
                        <a href="#" class="portfolio-img d-flex align-items-center justify-content-center" title="Portfolio 6">
                            <div class="port-hover-text">
                               <h3>정육/계란</h3>
                                <h5>recommend</h5>
                            </div>
                        </a>
                    </div>
                </div>

                <!-- Single Portfolio Area -->
                <div class="col-12 col-lg-6 single_portfolio_item soup wow fadeInUp" data-wow-delay="300ms">
                    <!-- Portfolio Thumbnail -->
                    <div class="portfolio-thumbnail bg-img" style="background-image: url(/resources/images/rnr.jpg);"></div>
                    <!-- Portfolio Hover Text -->
                    <div class="portfolio-hover-overlay">
                        <a href="#" class="portfolio-img d-flex align-items-center justify-content-center" title="Portfolio 7">
                            <div class="port-hover-text">
                               <h3>국/반찬/메인요리</h3>
                                <h5>recommend</h5>
                            </div>
                        </a>
                    </div>
                </div>
                 <div class="col-12 col-lg-6 single_portfolio_item soup wow fadeInUp" data-wow-delay="300ms">
                    <!-- Portfolio Thumbnail -->
                    <div class="portfolio-thumbnail bg-img" style="background-image: url(/resources/images/qkscks.jpg);"></div>
                    <!-- Portfolio Hover Text -->
                    <div class="portfolio-hover-overlay">
                        <a href="#" class="portfolio-img d-flex align-items-center justify-content-center" title="Portfolio 7">
                            <div class="port-hover-text">
                               <h3>국/반찬/메인요리</h3>
                                <h5>recommend</h5>
                            </div>
                        </a>
                    </div>
                </div>
                 <div class="col-12 col-lg-6 single_portfolio_item salad wow fadeInUp" data-wow-delay="300ms">
                    <!-- Portfolio Thumbnail -->
                    <div class="portfolio-thumbnail bg-img" style="background-image: url(/resources/images/toffjem.jpg);"></div>
                    <!-- Portfolio Hover Text -->
                    <div class="portfolio-hover-overlay">
                        <a href="#" class="portfolio-img d-flex align-items-center justify-content-center" title="Portfolio 7">
                            <div class="port-hover-text">
                               <h3>샐러드/간편식</h3>
                                <h5>recommend</h5>
                            </div>
                        </a>
                    </div>
                </div>
                 <div class="col-12 col-lg-6 single_portfolio_item wool wow fadeInUp" data-wow-delay="300ms">
                    <!-- Portfolio Thumbnail -->
                    <div class="portfolio-thumbnail bg-img" style="background-image: url(/resources/images/aus.jpg);"></div>
                    <!-- Portfolio Hover Text -->
                    <div class="portfolio-hover-overlay">
                        <a href="#" class="portfolio-img d-flex align-items-center justify-content-center" title="Portfolio 7">
                            <div class="port-hover-text">
                               <h3>면/양념/오일</h3>
                                <h5>recommend</h5>
                            </div>
                        </a>
                    </div>
                </div>
				<div class="col-12 col-lg-6 single_portfolio_item wool wow fadeInUp" data-wow-delay="300ms">
                    <!-- Portfolio Thumbnail -->
                    <div class="portfolio-thumbnail bg-img" style="background-image: url(/resources/images/dhdlf.jpg);"></div>
                    <!-- Portfolio Hover Text -->
                    <div class="portfolio-hover-overlay">
                        <a href="#" class="portfolio-img d-flex align-items-center justify-content-center" title="Portfolio 7">
                            <div class="port-hover-text">
                               <h3>면/양념/오일</h3>
                                <h5>recommend</h5>
                            </div>
                        </a>
                    </div>
                </div>
                <div class="col-12 col-lg-6 single_portfolio_item beverage wow fadeInUp" data-wow-delay="300ms">
                    <!-- Portfolio Thumbnail -->
                    <div class="portfolio-thumbnail bg-img" style="background-image: url(/resources/images/dmafy.jpg);"></div>
                    <!-- Portfolio Hover Text -->
                    <div class="portfolio-hover-overlay">
                        <a href="#" class="portfolio-img d-flex align-items-center justify-content-center" title="Portfolio 7">
                            <div class="port-hover-text">
                               <h3>음료/우유/떡/간식</h3>
                                <h5>recommend</h5>
                            </div>
                        </a>
                    </div>
                </div>
                <div class="col-12 col-lg-6 single_portfolio_item bakery wow fadeInUp" data-wow-delay="300ms">
                    <!-- Portfolio Thumbnail -->
                    <div class="portfolio-thumbnail bg-img" style="background-image: url(/resources/images/qpdlzjfl.jpg);"></div>
                    <!-- Portfolio Hover Text -->
                    <div class="portfolio-hover-overlay">
                        <a href="#" class="portfolio-img d-flex align-items-center justify-content-center" title="Portfolio 7">
                            <div class="port-hover-text">
                               <h3>베이커리/치즈/델리</h3>
                                <h5>recommend</h5>
                            </div>
                        </a>
                    </div>
                </div>
                <div class="col-12 col-lg-6 single_portfolio_item healthFood wow fadeInUp" data-wow-delay="300ms">
                    <!-- Portfolio Thumbnail -->
                    <div class="portfolio-thumbnail bg-img" style="background-image: url(/resources/images/rjsrkd.jpg);"></div>
                    <!-- Portfolio Hover Text -->
                    <div class="portfolio-hover-overlay">
                        <a href="#" class="portfolio-img d-flex align-items-center justify-content-center" title="Portfolio 7">
                            <div class="port-hover-text">
                               <h3>건강식품</h3>
                                <h5>recommend</h5>
                            </div>
                        </a>
                    </div>
                </div>
                <div class="col-12 col-lg-6 single_portfolio_item kitchen wow fadeInUp" data-wow-delay="300ms">
                    <!-- Portfolio Thumbnail -->
                    <div class="portfolio-thumbnail bg-img" style="background-image: url(/resources/images/wnqkd.jpg);"></div>
                    <!-- Portfolio Hover Text -->
                    <div class="portfolio-hover-overlay">
                        <a href="#" class="portfolio-img d-flex align-items-center justify-content-center" title="Portfolio 7">
                            <div class="port-hover-text">
                               <h3>주방용품</h3>
                                <h5>recommend</h5>
                            </div>
                        </a>
                    </div>
                </div>
                <div class="col-12 col-lg-6 single_portfolio_item house wow fadeInUp" data-wow-delay="300ms">
                    <!-- Portfolio Thumbnail -->
                    <div class="portfolio-thumbnail bg-img" style="background-image: url(/resources/images/rkwjs.jpg);"></div>
                    <!-- Portfolio Hover Text -->
                    <div class="portfolio-hover-overlay">
                        <a href="#" class="portfolio-img d-flex align-items-center justify-content-center" title="Portfolio 7">
                            <div class="port-hover-text">
                               <h3>가전제품</h3>
                                <h5>recommend</h5>
                            </div>
                        </a>
                    </div>
                </div>
                <div class="col-12 col-lg-6 single_portfolio_item pet wow fadeInUp" data-wow-delay="300ms">
                    <!-- Portfolio Thumbnail -->
                    <div class="portfolio-thumbnail bg-img" style="background-image: url(/resources/images/bisong.jpg);"></div>
                    <!-- Portfolio Hover Text -->
                    <div class="portfolio-hover-overlay">
                        <a href="#" class="portfolio-img d-flex align-items-center justify-content-center" title="Portfolio 7">
                            <div class="port-hover-text">
                               <h3>반려동물</h3>
                                <h5>recommend</h5>
                            </div>
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- ##### Portfolio Area End ##### -->

    <!-- ##### Product Area Start ##### -->
    <section class="new-arrivals-products-area bg-gray section-padding-100">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <!-- Section Heading -->
                    <div class="section-heading text-center">
                        <h2>신상품</h2>
                        <p>NEW ARRIBALS</p>
                    </div>
                </div>
            </div>

            <div class="row">

                <!-- Single Product Area -->
                <c:forEach var="p_list" items="${list}">
                <div class="col-12 col-sm-6 col-lg-3">
                    <div class="single-product-area mb-50 wow fadeInUp" data-wow-delay="100ms">
                        <!-- Product Image -->
                        <div class="product-img">
                            <a href="/product/productDetail?p_num=${p_list.p_num}"><img style="width: 255px; height: 255px;" src="/uploadStorage/pImg/${p_list.p_img}" alt=""></a>
                        
                        </div>
                        <!-- Product Info -->
                        <div class="product-info mt-15 text-center">
                            <c:choose>
                            	<c:when test="${p_list.p_sale!=0 }">
                            		<a href="#">
                               			<span>${p_list.p_name }</span>
                            		</a>
                            		<img class="saleImg" alt="sale" src="/resources/images/sale.png"/><span class="saleNum">${p_list.p_sale}%</span>
                          
                            		<h5 class="totalPrice">>${Integer(p_list.p_price*(100-p_list.p_sale)/100)}원</h5><h6 class="salePrice">${p_list.p_price}원</h6>                           		
                           		</c:when>
                           		<c:otherwise>
                           			<a href="#">
                               			<span>${p_list.p_name }</span>
                            		</a>
                           			<h6>${p_list.p_price}원</h6>
                           		</c:otherwise>
                        	</c:choose>
                        </div>
                    </div>
                </div>
				</c:forEach>
                <div class="col-12 text-center">
                    <a href="/product/newProduct" class="btn alazea-btn">View All</a>
                </div>

            </div>
        </div>
    </section>
    <!-- ##### Product Area End ##### -->

    <!-- ##### Subscribe Area Start ##### -->
    <section class="subscribe-newsletter-area" style="background-image: url(/resources/images/bg-img/subscribe.png);">
        <div class="container">
            <div class="row align-items-center justify-content-between">
                <div class="col-12 col-lg-5">
                    <!-- Section Heading -->
                    <div class="section-heading mb-0">
                        <h2>Join the Newsletter</h2>
                        <p>Subscribe to our newsletter and get 10% off your first purchase</p>
                    </div>
                </div>
                <div class="col-12 col-lg-6">
                    <div class="subscribe-form">
                        <form action="#" method="get">
                            <input type="email" name="subscribe-email" id="subscribeEmail" placeholder="Enter your email">
                            <button type="submit" class="btn alazea-btn">SUBSCRIBE</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <!-- Subscribe Side Thumbnail -->
        <div class="subscribe-side-thumb wow fadeInUp" data-wow-delay="500ms">
            <img class="first-img" src="/resources/images/core-img/leaf.png" alt="">
        </div>
    </section>
    <!-- ##### Subscribe Area End ##### -->
		<!-- ##### Footer Area Start ##### -->
    <footer class="footer-area bg-img" style="background-image: url(/resources/images/bg-img/3.jpg);">
    	<tiles:insertAttribute name="footer"/>
    </footer>
    
    <!-- ##### All Javascript Files ##### -->
    <!-- jQuery-2.2.4 js -->
    <script src="/resources/include/js/jquery-2.2.4.min.js"></script>
    <!-- Popper js -->
    <script src="/resources/include/js/popper.min.js"></script>
    <!-- Bootstrap js -->
   <script type="text/javascript" src="/resources/include/dist/js/bootstrap.min.js"></script>
    <!-- All Plugins js -->
    <script src="/resources/include/js/plugins.js"></script>
    <!-- Active js -->
    <script src="/resources/include/js/active.js"></script>
    <script type="text/javascript" src="/resources/include/js/jquery.form.min.js"></script>
	</body>
</html>