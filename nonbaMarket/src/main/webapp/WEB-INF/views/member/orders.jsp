<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
		
		<title>오이오이 늦었다구</title>
		
		<link rel="shortcut icon" href="/resources/images/icon.png" />
		<link rel="apple-touch-icon" href="/resources/images/icon.png" />
		
		<link rel="stylesheet" type="text/css" href="/resources/include/dist/css/bootstrap.min.css">
		<link rel="stylesheet" type="text/css" href="/resources/include/dist/css/bootstrap-theme.min.css">
		<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
		<style type="text/css">
			#sub_menu{
				width : 200px;
				float: left;
				display: inline-block;
				margin-left: 45px;
			}
			
			#board_notice{
				width : 820px;
				float : right;
				display: inline-block;
			}
			
			#head_title{
				font-family: 'Noto Sans KR', sans-serif;
				padding: 0 0 30px 2px;
				font-size : 28px;
				margin : 0;
			}
			
			#menubar{
				border : 1px solid #dcdbde;
				border-bottom : 0;
			}
			
			.subMenu_sort,.subMenu_sort:hover,.subMenu_sort:focus{
				text-decoration: none !important;
				display: block !important;
				padding : 16px 0px 16px 19px !important;
				font-size: 12px !important;
				font-family: 'Noto Sans KR', sans-serif !important;
				color : #666666 !important;
				background: url(/resources/images/boards.png) 170px no-repeat;
				background-color : white !important;
				outline: none;
			}
			
			.subMenu_sort:hover{
				background: url(/resources/images/boardsHover.png) 170px no-repeat;
				color : #7c3fcc !important;
				background-color : #f7f7f7 !important;
			}
			
			
			
			#menu_sort > li{
				border-bottom : 1px solid #dcdbde;
			}
			
			#board_title{
				padding : 5px 0px 24px 0px;
			}
			
			#board_title >h2{
				font-size : 24px;
				font-family: 'Noto Sans KR', sans-serif;
				color : #333333;
				margin : 0;
				padding : 0;
			}
			
			#board_title >h2 > span{
				font-size :12px;
			}
			
			.boardContainer{
				padding-top : 100px;
				padding-bottom: 170px;
			}
			
			.ac{
				font-size : 12px;
				font-family: 'Noto Sans KR', sans-serif;
				padding : 20px 0px;
				color : #4c4c4c;
			}
			
		
			
			.ac,.emptyColumn{
				text-align: center;
				font-family: 'Noto Sans KR', sans-serif;
			}
			
			.emptyColumn{
				padding: 50px 0px;
			}
			
			
			
			.adad{
				text-align: left;
			}
			
			#a{
				background: url(/resources/images/boardsHover.png) 170px no-repeat;
				color : #7c3fcc !important;
				background-color : #f7f7f7 !important;
			}
			
			#notice_list{
				border-top : 2px solid #522772;
				padding-top :10px;
			}
			
			#select_year{
				font-size : 12px;
				font-family: 'Noto Sans KR', sans-serif;
				color : #333333;
				padding : 7px 30px 7px 8px;
				float : right;
			}
			
			#select_year:focus{
				outline: none;
			}
			
			.order_regdate{
				padding-top:20px;
				color:#666666;
				font-size : 16px;
				font-family: 'Noto Sans KR', sans-serif;
				font-weight: 700;
			}
			
			.order_goods{
				margin-top:10px;
				padding : 0px 20px;
				border: 1px solid #dddfe1;
			}
			
			.goods_name, .goods_name:hover, .goods_name:focus{
				border-bottom: 1px solid #dddfe1 !important;
				padding : 20px 0px 13px 0px !important;
				
			}
			
			.goods_name > a,.goods_name > a:hover,.goods_name > a:focus{
				display: block;
				font-family: 'Noto Sans KR', sans-serif;
				font-weight: 700 !important;
				outline: none !important;
				text-decoration: none !important;
				color : black !important;
				background: url(https://res.kurly.com/pc/ico/1806/ico_arrow_10x15.png) 750px no-repeat;
			}
			
			.order_info{
				padding : 14px 0px 20px 0px;
				display: inline-block;		
				width: 100%;
			}
			
			.thumb{
				width:60px;
				float : left;
				margin-right: 20px;
				min-height: 70px;
			}
			
			.disc li span:first-child {
				padding-right : 15px;
				font-size : 12px;
				font-family: 'Noto Sans KR', sans-serif;
			}
			
			.disc li span:last-child {
				font-size : 14px;
				font-family: 'Noto Sans KR', sans-serif;
				font-weight: 700;
			}
			.disc li{
				padding-top : 6px;
			}
			
			.no-goods{
				height: 200px; line-height: 200px;
				font-family: 'Noto Sans KR', sans-serif;
				font-weight: 400;
				font-size: 20px;
				color : #666666;
			}
		</style>
		
		<!--[if lt IE 9]>
		<script src="/resources/include/js/html5shiv.js"></script>
		<![endif]-->
		<script type="text/javascript" src="/resources/include/js/jquery-3.3.1.min.js"></script>
		<script type="text/javascript" src="/resources/include/js/common.js"></script>
		<script type="text/javascript" src="/resources/include/dist/js/bootstrap.min.js"></script>
		<script type="text/javascript">
			$(function(){
				/* var date = new Date();
				var year1 = $("<option>");
				year1.attr("value",date.getFullYear());
				year1.html(date.getFullYear());
				
				var year2 = $("<option>");
				year2.attr("value",date.getFullYear()-1);
				year2.html(date.getFullYear()-1);
				
				var year3 = $("<option>");
				year3.attr("value",date.getFullYear()-2);
				year3.html(date.getFullYear()-2);
				
				$("#select_year").append(year1);
				$("#select_year").append(year2);
				$("#select_year").append(year3); */
				
				$(document).on("click",".goods_name > a",function(){
					location.href="/member/detail?o_num="+$(this).attr("data-num");
				});
				
				
			});
			
		</script>
	</head>
	<body>
		<c:if test="${empty user }">
			<script type="text/javascript">
				$(function(){
					alert("로그인이 필요합니다");
					location.href="/member/login";
				});
			</script>
		</c:if>
		<div class="boardContainer container">
		
			<%-- <div class="row">
				<div class="col-md-6">
					<div>등급 : ${'등급'}등급/${'이름' }님</div>
					<div>혜택  : ${'혜택혜택혜택' }</div>
				</div>
				<div class="col-md-3">
					<div><h2>적립금</h2></div>
					<div><a href="#">${'적립금'} 원</a></div>
					<div><a href="#">소멸예저 ${'얼마냐' }원</a></div>
					
				</div>
				<div class="col-md-3">
					<div><h2>쿠폰</h2></div>
					<div><a href="#">${'가진 쿠폰개수' }개</a></div>
				</div>
			</div> --%>
			
			
			
			<div id="sub_menu">
				<h2 id="head_title">마이 페이지</h2>
				<div id="menubar">
					<ul id="menu_sort">
						<li><a href="/member/orders" id="a" class="subMenu_sort">주문내역</a></li>
						<li><a href="/member/bookmark" id="b" class="subMenu_sort">자주사는것</a></li>
						<li><a href="/member/review" id="c" class="subMenu_sort">상품후기</a></li>
						<li><a href="/member/point" id="d" class="subMenu_sort">적립금</a></li>
						<li><a href="/member/coupon" id="e" class="subMenu_sort">쿠폰</a></li>
						<li><a href="/member/myInfo" id="f" class="subMenu_sort">개인정보 수정</a></li>
					</ul>
				</div>
			</div>
			
			<div id="board_notice">
				<div id="board_title"><h2>주문 내역 <span>지난 3년간 주문 내역 조회가 가능합니다</span>
					<!-- <select id="select_year">
						<option>전체기간</option>
					</select> -->
					
					</h2>
				</div>
				<div id="table_section">
					<ul id="notice_list">
						<c:choose>
							<c:when test="${not empty ordersInfo}">
								<c:forEach var="orders" items="${ordersInfo }">
									<li>
										<div class="order_regdate">${orders.o_regdate}</div>
										<div class="order_goods">
											<div class="goods_name">
												<a href="#" data-num="${orders.o_num}">${orders.d_name}
													<c:if test="${orders.d_cnt > 1 }">
														외 ${orders.d_cnt-1 }건
													</c:if>
												</a>
											</div>
											<div class="order_info">
												<div class="thumb"><img src="/uploadStorage/pImg/${orders.d_img}"></div>
												<div class="disc">
													<ul>
														<li><span>주문번호</span><span>${orders.o_num }</span></li>
														<li><span>결제금액</span><span>${orders.o_allprice }</span></li>
														<li><span>주문상태</span><span>${orders.o_deliver }</span></li>
													</ul>
												</div>
											</div>
										</div>
									</li>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<li>
									<div class="no-goods text-center">
										주문하신 상품이 없습니다.
									</div>
								</li>
							</c:otherwise>
						</c:choose>
						<!-- <li>
							<div class="order_regdate">2020.03.21 (13시 21분)</div>
							<div class="order_goods">
								<div class="goods_name">
									<a href="#">상품 이름 들어갈곳</a>
								</div>
								<div class="order_info">
									<div class="thumb"><img src="/resources/images/naver.png"></div>
									<div class="disc">
										<ul>
											<li><span>주문번호</span><span>21312312312</span></li>
											<li><span>결제금액</span><span></span></li>
											<li><span>주문상태</span><span></span></li>
										</ul>
									</div>
								</div>
							</div>
						</li> -->
						
						<!-- <li>
							<div class="no-goods text-center">
								주문하신 상품이 없다
							</div>
						</li> -->
						
					</ul>
				</div>
			</div>
			
		</div>
	</body>
</html>