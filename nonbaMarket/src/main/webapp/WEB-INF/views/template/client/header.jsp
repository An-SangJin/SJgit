<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <!-- Preloader -->

 <script type="text/javascript" src="/resources/include/js/jquery-2.2.4.min.js"></script>
<script type="text/javascript">
	$(function() {
			$.ajax({
				url : "/mainCategori",
				type:"get",
				dataType:"json",
				error : function() {
					alert("시스템 오류 입니다. 관리자에게 문의하세요.");
				},
				success: function(data) {
					var lc_num = new Array();
					$(data).each(function() {
						lc_num = this.lc_num;
						console.log(lc_num);
						var lc_name = this.lc_name;
						var lc_diplay = this.lc_dispaly;
						
						var new_li =$("<li>");
						new_li.attr("data-num",lc_num);
						
						var new_a = $("<a>");
						new_a.attr("href","/product/categori?lc_num="+lc_num);
						new_a.append(lc_name);
						
						var new_ul=$("<ul>");
						console.log("첫번쨰");
						new_ul.addClass("dropdown");
						/* new_ul.attr("id","midDrop"); */
						$("#dropdown").append(new_li.append(new_a).append(new_ul));
					});						
				}
			});
			
			$(document).on("mouseenter","li[data-num]", function() {
				resetMc();
				var lc_num = $(this).attr("data-num");
				var ul = $(this).children(".dropdown");
				console.log(ul);
				$.ajax({
					url : "/mainMcCategori/"+lc_num,
					type:"post",
					dataType:"json",
					ansyc:"false",
					error : function() {
						alert("시스템 오류 입니다. 관리자에게 문의 하세요");
					},
					success : function(data) {
						console.log(data);
						if(data==""){
							var new_li = $("<li>");
							var new_a = $("<a>");
							new_a.attr("href","#");
							new_a.append("상품 준비중");
							
							new_li.append(new_a);
							ul.append(new_li);
						}else{
							$(data).each(function() {
								var mc_num = this.mc_num;
								var lc_num = this.lc_num;
								var mc_name = this.mc_name;
								var mc_display = this.mc_display;
								
								console.log(mc_num);
								var new_li = $("<li>");
								
								var new_a = $("<a>");
								new_a.attr("href","/product/categori?mc_num="+mc_num);
								new_a.append(mc_name);
								
								new_li.append(new_a);
								ul.append(new_li);
							
						});
						}
					}
				});
				
			});
	});
			function resetMc() {
				$("#dropdown").children("li").children(".dropdown").empty();
			}
			/* function mcCategori(lc_num) {
				var def = new $.Deferred();
				$.ajax({
					url : "/mainMcCategori/"+lc_num,
					type:"post",
					dataType:"json",
					error : function() {
						alert("시스템 오류 입니다. 관리자에게 문의 하세요");
					},
					success : function(data) {
						def.resolve(data);
	
					}
				});
				return def.promise();
			} */
</script>
	<div class="preloader d-flex align-items-center justify-content-center">
        <div class="preloader-circle"></div>
        <div class="preloader-img">
            <img src="/resources/images/core-img/leaf.png" alt="">
        </div>
    </div>
        <!-- ***** Top Header Area ***** -->
        <div class="top-header-area">
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <div class="top-header-content d-flex align-items-center justify-content-between">
                            <!-- Top Header Content -->
                            <div class="top-header-meta">
                            </div>

                            <!-- Top Header Content -->
                            <div class="top-header-meta d-flex">
                                <!-- Language Dropdown -->
                                
                                <c:if test="${empty user }">
	                                <!-- Login -->
	                                <div class="login">
	                                    <a href="/member/signup"><span>회원가입</span></a>
	                                </div>
                                	<!-- Login -->
	                                <div class="login">
	                                    <a href="/member/login"><i class="fa fa-user" aria-hidden="true"></i> <span>로그인</span></a>
	                                </div>
                                </c:if>
                                
                                <c:if test="${not empty user }">
	                                <!-- Login -->
	                                <div class="logout">
	                                	<a href="/member/logout"><i class="fa fa-user" aria-hidden="true"></i> 로그아웃</a>
	                                </div>                                
	                                
	                                <div class="language-dropdown">
                                    <div class="dropdown">
                                        <button style="padding-top:3px; color:white;" class="btn btn-secondary dropdown-toggle mr-30" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">마이페이지</button>
                                        <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                            <a class="dropdown-item" href="/member/myPage">주문내역</a>
                                            <a class="dropdown-item" href="/member/bookmark">자주사는것</a>
                                            <a class="dropdown-item" href="/member/review">상품후기</a>
                                            <a class="dropdown-item" href="/member/point">적립금</a>
                                            <a class="dropdown-item" href="/member/coupon">쿠폰</a>
                                            <a class="dropdown-item" href="/member/myInfo">개인 정보 수정</a>
                                        </div>
                                    </div>
                                </div>
                                </c:if>
                                
                                
                                
                                <div class="language-dropdown">
                                    <div class="dropdown">
                                        <button style="padding-top:3px; color:white;" class="btn btn-secondary dropdown-toggle mr-30" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">고객센터</button>
                                        <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                            <a class="dropdown-item" href="/notice/noticeList">공지사항</a>
                                            <a class="dropdown-item" href="/faq/faqList">자주하는 질문</a>
                                            <a class="dropdown-item" href="/qna/qnaList">1:1 문의</a>
                                            <a class="dropdown-item" href="/review/reviewList">상품후기</a>
                                            <a class="dropdown-item" href="/inq/product-inqList">상품문의</a>
                                        </div>
                                    </div>
                                </div>
                                
                                
                                 <!-- Cart -->
                                <div class="cart">
                                    <a href="/basket/basketForm"><i class="fa fa-shopping-cart" aria-hidden="true"></i> <span>장바구니 </span></a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- ***** Navbar Area ***** -->
        <div class="alazea-main-menu">
            <div class="classy-nav-container breakpoint-off">
                <div class="container">
                    <!-- Menu -->
                    <nav class="classy-navbar justify-content-between" id="alazeaNav">

                        <!-- Nav Brand -->
                        <a href="/" class="nav-brand"><img style="width: 98px; height: 50px;" src="/resources/images/nonba.png" alt=""></a>

                        <!-- Navbar Toggler -->
                        <div class="classy-navbar-toggler">
                            <span class="navbarToggler"><span></span><span></span><span></span></span>
                        </div>

                        <!-- Menu -->
                        <div class="classy-menu">

                            <!-- Close Button -->
                            <div class="classycloseIcon">
                                <div class="cross-wrap"><span class="top"></span><span class="bottom"></span></div>
                            </div>

                            <!-- Navbar Start -->
                            <div class="classynav">
                                <ul>
                                    <li><a href="/">메인화면</a></li>
                               
                                    <li><a href="#">상품 카테고리</a>
                                        <ul class="dropdown" id="dropdown"> 
                                          
                                                         
                                        </ul>
                                    </li>
                                    <li><a href="/product/newProduct">신상품</a></li>
                                    <li><a href="/product/bestProduct">베스트</a></li>
                                    <li><a href="/product/saleProduct">알뜰쇼핑</a></li>
                                </ul>

                                <!-- Search Icon -->
                                <div id="searchIcon">
                                    <i class="fa fa-search" aria-hidden="true"></i>
                                </div>

                            </div>
                            <!-- Navbar End -->
                        </div>
                    </nav>

                    <!-- Search Form -->
                    <div class="search-form">
                        <form action="#" method="get">
                            <input type="search" name="search" id="search" placeholder="Type keywords &amp; press enter...">
                            <button type="submit" class="d-none"></button>
                        </form>
                        <!-- Close Icon -->
                        <div class="closeIcon"><i class="fa fa-times" aria-hidden="true"></i></div>
                    </div>
                </div>
            </div>
        </div>

    <!-- ##### Header Area End ##### -->

