<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
			
			.head_title{
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
			
			.boardContainer{
				padding-top : 100px;
				padding-bottom: 170px;
			}
			
			
			
			#notice_table{
				border-top : 2px solid #522772;
				border-bottom: 2px solid #dcdbde;
			}
			
			#notice_table tr{
				border-bottom: 2px solid #dcdbde;
				
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
			
			#ordersNum{
				font-size : 20px;
				color : #666666;
				font-weight: 700;
				padding : 3px 0px 14px 0px;
			}
			
			.p_name{
				color : #4c4c4c;
				font-size : 12px;
				font-family: 'Noto Sans KR', sans-serif;
				padding : 20px 0px 14px 0px;
			}
			
			.thumb{
				width: 80px;
			}
			
			.detail_info td{
				padding : 14px 0px 14px 0px;
			}
			
			
			
			#notice_table a,#notice_table a:hover,#notice_table a:focus{
				font-size : 16px;
				font-weight: 700;
				color : black;
				font-family: 'Noto Sans KR', sans-serif;
				text-decoration: none !important;
				outline: none;
			}
			
			.price{
				font-size : 14px;
				font-weight: 700;
				color : black;
				font-family: 'Noto Sans KR', sans-serif;
			}
			.amount{
				padding-left : 4px;
				font-size : 12px;
				color:#666;
				font-family: 'Noto Sans KR', sans-serif;
			}
			
			.state{
				text-align: center;
				font-weight: 700;
				color : #5f0080;
				font-family: 'Noto Sans KR', sans-serif;
							
			}
			
			.basket{
				width:100%;
				border : 1px solid #5f0080;
				font-weight: 400;
				font-size : 12px;
				font-family: 'Noto Sans KR', sans-serif;
				background-color: white;
				height : 34px;
				outline: none;
			}
			
			#refund_box{
				padding-top : 30px;
				color : #4c4c4c;
				font-size : 12px;
				font-family: 'Noto Sans KR', sans-serif;
				font-weight: 400;
				text-align: center;
			}
			
			.cancel_on{
				border : 1px solid #5f0080;
				background-color: #5f0080;
				color : white;
				font-size : 14px;
				font-family: 'Noto Sans KR', sans-serif;
				width : 200px;
				height: 48px;
				outline: none;
			}
			
			.cancel_off{
				border: 1px solid #dddfe2;
				background-color: #dddfe1;
				color : white;
				font-size : 14px;
				font-family: 'Noto Sans KR', sans-serif;
				width : 200px;
				height: 48px;
				outline: none;
			}
			
			
			#order_info{
				border-top : 2px solid #5f0080;
				border-bottom : 1px solid #dddfe1;
			}
			
			#order_info tr:first-child td{
				padding-top:20px;
			}
			
			#order_info td:first-child {
				padding : 0px 0px 20px 10px;
				font-family: 'Noto Sans KR' ,sans-serif;
				color : black;
				font-size : 14px;
				font-weight: 400;
			}
			
			#order_info td:last-child {
				padding-bottom: 20px;
				font-family: 'Noto Sans KR' ,sans-serif;
				color : #4c4c4c;
				font-size : 12px;
				font-weight: 400;
			}
		</style>
		
		<!--[if lt IE 9]>
		<script src="/resources/include/js/html5shiv.js"></script>
		<![endif]-->
		<script type="text/javascript" src="/resources/include/js/jquery-3.3.1.min.js"></script>
		<script type="text/javascript" src="/resources/include/js/common.js"></script>
		<script type="text/javascript" src="/resources/include/dist/js/bootstrap.min.js"></script>
		<c:if test="${empty user }">
			<script type="text/javascript">
				$(function(){
					alert("로그인이 필요합니다");
					location.href="/member/login";
				});
			</script>
		</c:if>
		<c:if test="${not empty user }">
		<script type="text/javascript">
			$(function(){
				$(document).on("click",".cancel_on",function(){
					if(confirm("주문을 취소하시겠습니까?")){
						$.ajax({
							url : "/member/cancel",
							type : "post",
							data : "o_num=${ordersInfo.o_num}",
							dataType : "text",
							async : false,
							error : function(){
								alert("주문을 취소하는데 오류가 있습니다. 잠시후 다시 시도해주세요.");	
							},
							success : function(data){
								console.log(data);
								if(data == "성공"){
									alert("주문 취소가 완료되었습니다.\n결제 수단에 따라 3~7일 후 취소금액 확인이 가능합니다.");
									location.href="/member/detail?o_num=${ordersInfo.o_num}";
								}
								
							}
						});
					}
					else{
						console.log("취소");
					}
				});
			});
		</script>
		</c:if>
	</head>
	<body>
		
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
				<h2 class="head_title">마이 페이지</h2>
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
				<div id="board_title"><h2>주문 내역 상세</h2></div>
				<div id="ordersNum">주문번호 ${ordersInfo.o_num}</div>
				<div id="table_section">
					<table id="notice_table">
						<colgroup>
							<col width="30px"/>
							<col width="100px"/>
							<col width="400px"/>
							<col width="160px"/>
							<col width="100px"/>
							<col width="30px"/>
						</colgroup>
						<tbody>
							<c:forEach var="detail" items="${detailInfo}" >
								<c:if test="${empty product_name}">
									<tr>
										<td></td>
										<td colspan="4" class="p_name"><a href="#">${detail.p_name}</a></td>
										<td></td>
									</tr>
									<c:set var="product_name" value="${detail.p_name}"/>
								</c:if>
								<c:if test="${not empty product_name }">
									<c:if test="${product_name != detail.p_name }">
										<tr>
											<td></td>
											<td colspan="4" class="p_name"><a href="#">${detail.p_name}</a></td>
											<td></td>
										</tr>
									</c:if>
								</c:if>								
								<tr class="detail_info">
									<td></td>
									<td>
										<a href="#">
											<img class="thumb" src="/uploadStorage/pImg/${detail.d_img }">
										</a>
									</td>
									<td>
										<div>
											<a href="#">${detail.d_name}</a>
										</div>
										<div style="padding-top : 4px;">
											<span class="price"><fmt:formatNumber value="${detail.d_price }" pattern="#,###,###"/>원</span>
											<span class="amount">${detail.d_amount}개</span>
										</div>
									</td>
									<td class="state">
										${ordersInfo.o_deliver }
									</td>
									<td>
										<input class="basket" type="button" value="장바구니 담기">
									</td>
									<td></td>
								</tr>
							</c:forEach>
						
						
						
						
						
						
						
						
						
						<!-- 
							<tr>
								<td></td>
								<td colspan="4" class="p_name"><a href="#">상품명</a></td>
								<td></td>
							</tr>
							<tr class="detail_info">
								<td></td>
								<td>
									<a href="#">
										<img class="thumb" src="/resources/images/naver.png">
									</a>
								</td>
								<td>
									<div>
										<a href="#">옵션이름</a>
									</div>
									<div style="padding-top : 4px;">
										<span class="price">1000원</span>
										<span class="amount">1개</span>
									</div>
								</td>
								<td class="state">
									배송상태
								</td>
								<td>
									<input class="basket" type="button" value="장바구니 담기">
								</td>
								<td></td>
							</tr> -->
						</tbody>
					</table>
				</div>
				<div id="refund_box">
					<c:choose>
						<c:when test="${ordersInfo.o_deliver == '배송준비중' }">
							<script type="text/javascript">
								$(function(){
									$("#refund_box input[type='button']").addClass("cancel_on");
								});
							</script>
						</c:when>
						<c:otherwise>
							<script type="text/javascript">
								$(function(){
									$("#refund_box input[type='button']").addClass("cancel_off");
								});
							</script>
						</c:otherwise>
					</c:choose> 
					<input type="button" value="전체 상품 주문 취소">
					<p style="padding-top: 19px; margin : 0; font-size : 12px;">직접 주문 취소는 '배송준비중' 상태일 경우에만 가능합니다.</p>
				</div>
				<div>
					<h2 class="head_title">주문 정보</h2>
					<table id="order_info">
						<colgroup>
							<col width="209px">
							<col width="611px">
						</colgroup>
						<tr>
							<td>주문번호</td>
							<td>${ordersInfo.o_num }</td>
						</tr>
						<tr>
							<td>주문자</td>
							<td>${ordersInfo.o_name }</td>
						</tr>
						<tr>
							<td>주문자 핸드폰</td>
							<td>${ordersInfo.o_phone }</td>
						</tr>
						<tr>
							<td>주문자 주소</td>
							<td>${ordersInfo.o_address }</td>
						</tr>
						<tr>
							<td>결제일시</td>
							<td>${ordersInfo.o_regdate }</td>
						</tr>
						<tr>
							<td>주문 처리상태</td>
							<td>${ordersInfo.o_deliver }</td>
						</tr>
					</table>
				</div>
			</div>
			
		</div>
	</body>
</html>