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
		<link rel="stylesheet" type="text/css" href="/resources/include/css/pagination.css">
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
			
			#board_title span{
			    padding-left: 8px;
    			font-size: 12px;
    			font-family: 'Noto Sans KR',sans-serif;
			    font-weight: 400;
			}
			
			.boardContainer{
				padding-top : 100px;
				padding-bottom: 170px;
			}
			
			#coupon_content th{
				border-top : 2px solid #5f0080;
			}
			
			#coupon_content th, #coupon_content td{
				text-align: center;
				padding : 15px 0px;
				font-family: 'Noto Sans KR', sans-serif;
				border-bottom: 1px solid #ddd;
			}
			
			#coupon_content th:first-child, #coupon_content td:first-child{
				text-align: left;
				padding-left: 15px;
			}
			
			.noData{
				padding : 50px 0px !important;
				text-align: center !important;
				color: #666666;
			}
			
			#pagination{
				display: inline-block;
				margin : 20px 0px;
			}
			
			#e{
				background: url(/resources/images/boardsHover.png) 170px no-repeat;
				color : #7c3fcc !important;
				background-color : #f7f7f7 !important;
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
				var container = $("#pagination");
				
				container.pagination({
					dataSource : function(done){
						$.getJSON("/issue_coupon/couponList?m_num=${user.m_num}",function(data){
							done(data);
						}).fail(function(){
							alert("목록을 불러오는데 실패하였습니다. 잠시 후에 다시 시도해주세요.");
						});
					},
					callback : function(data, pagination){
						$(".coupon_cell").html("");
						var cnt = 0;
						if(data.length!=0){
							$.each(data, function(index,item){
								var i_num = this.i_num;
								var c_num = this.c_num;
								var c_name = this.c_name;
								var c_func = this.c_func;
								var c_percent = this.c_percent;
								var i_regdate = this.i_regdate;
								var c_expire = this.c_expire;
								var i_state = this.i_state;
								
								var tr = $("<tr>");
								tr.attr("data-num",i_num);
								
								var td1 = $("<td>");
								td1.attr("data-num",c_num)
								td1.attr("data-text",c_name);
								td1.html(c_name);
								
								var td2 = $("<td>");
								td2.attr("data-text",c_func);
								td2.html(c_func);
								
								var td3 = $("<td>");
								td3.attr("data-text",c_percent);
								td3.html(c_percent);
								
								var td4 = $("<td>");
								td4.attr("data-text",i_regdate);
								td4.html(i_regdate);
								
								var td5 = $("<td>");
								td5.attr("data-text",c_expire);
								td5.html(c_expire);
								
								var td6 = $("<td>");
								td6.attr("data-text",i_state);
								if(i_state=="O"){
									td6.html("사용완료");
								}
								else if(i_state=="X"){
									td6.html("미사용");
									cnt = cnt+1;
								}
								
								
								tr.append(td1).append(td2).append(td3).append(td4).append(td5).append(td6);
								$(".coupon_cell").append(tr);
							});
							$("#board_title span").html("사용가능 쿠폰 : "+cnt+"장");
						}
						else{
							var tr = $("<tr>");
							var td = $("<td>");
							td.attr("colspan",6);
							td.addClass("noData");
							td.html("주문쿠폰이 없습니다.");
							tr.append(td);
							$(".coupon_cell").append(tr);
							$("#board_title span").html("사용가능 쿠폰 : 0장")
						}
					}
				});
			});
			
			function listData(){
				$.getJSON("/issue_coupon/couponList?m_num=${user.m_num}",function(data){
					$(".coupon_cell").html("");
					console.log(data.length);
					if(data.length != 0 ){
						var cnt = 0;
						$(data).each(function(){
							var i_num = this.i_num;
							var c_num = this.c_num;
							var c_name = this.c_name;
							var c_func = this.c_func;
							var c_percent = this.c_percent;
							var i_regdate = this.i_regdate;
							var c_expire = this.c_expire;
							var i_state = this.i_state;
							
							var tr = $("<tr>");
							tr.attr("data-num",i_num);
							
							var td1 = $("<td>");
							td1.attr("data-num",c_num)
							td1.attr("data-text",c_name);
							td1.html(c_name);
							
							var td2 = $("<td>");
							td2.attr("data-text",c_func);
							td2.html(c_func);
							
							var td3 = $("<td>");
							td3.attr("data-text",c_percent);
							td3.html(c_percent);
							
							var td4 = $("<td>");
							td4.attr("data-text",i_regdate);
							td4.html(i_regdate);
							
							var td5 = $("<td>");
							td5.attr("data-text",c_expire);
							td5.html(c_expire);
							
							var td6 = $("<td>");
							td6.attr("data-text",i_state);
							if(i_state=="O"){
								td6.html("사용완료");
							}
							else if(i_state=="X"){
								td6.html("미사용");
								cnt = cnt+1;
							}
							
							
							tr.append(td1).append(td2).append(td3).append(td4).append(td5).append(td6);
							$(".coupon_cell").append(tr);
						});
						$("#board_title span").html("사용가능 쿠폰 : "+cnt+"장")
					}
					else{
						var tr = $("<tr>");
						var td = $("<td>");
						td.attr("colspan",6);
						td.addClass("noData");
						td.html("주문쿠폰이 없습니다.");
						tr.append(td);
						$(".coupon_cell").append(tr);
					}
				}).fail(function(){
					alert("목록을 불러오는데 실패하였습니다. 잠시 후에 다시 시도해주세요.");
				});
			}
			
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
				<div id="board_title"><h2>쿠폰<span>사용가능쿠폰 : </span></h2></div>
				<table id="coupon_content">
					<colgroup>
						<col width="282px">
						<col width="58px">
						<col width="101px">
						<col width="139px">
						<col width="139px">
						<col width="101px">
					</colgroup>
					<tr>
						<th>쿠폰명</th>
						<th>기능</th>
						<th>할인/적립</th>
						<th>등록일자</th>
						<th>유효기간</th>
						<th>사용여부</th>
					</tr>
					<tbody class="coupon_cell">
						
					</tbody>
				</table>
				<div style="text-align: center;">
					<div id="pagination">
				
					</div>
				</div>
			</div>
			
		</div>
	</body>
</html>