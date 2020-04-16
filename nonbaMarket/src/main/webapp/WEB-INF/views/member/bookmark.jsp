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
			
			#notice_table{
				border-bottom : 1px solid #ddd;
				border-top : 2px solid #522772;
			}
			
			td.ac ,.emptyColumn{
				border-top : 1px solid #e9e9e9;
			}
			
			.ac,.emptyColumn{
				text-align: center;
				font-family: 'Noto Sans KR', sans-serif;
			}
			
			.emptyColumn{
				padding: 50px 0px;
			}
			
			
			#notice_table td{
				font-weight: 700;
				color: #4c4c4c;
				padding-top : 20px;
				padding-bottom : 20px;
				font-family: 'Noto Sans KR' ,sans-serif;
				border-top: 1px solid #ddd;
			}
			
			.adad{
				text-align: left;
			}
			
			#b{
				background: url(/resources/images/boardsHover.png) 170px no-repeat;
				color : #7c3fcc !important;
				background-color : #f7f7f7 !important;
			}
			
			input[type='checkbox']{
				display: none;
			}
		
			.chkBox{
				padding-left : 20px;
				width:10px;
				cursor : pointer;
				height: 20px;
				background: url(/resources/images/nocheck.png) left no-repeat;
				margin : 0;
				background-size: 17px;
			}
			
			.addBasket{
				width:100px;
				display: block;
				height: 27px;
				border: 1px solid #5f0080;
    			background-color: #795b8f;
    			color : white;
    			margin : 0 auto;
    			font-weight: 400;
    			outline: none;
			}
			
			.delBMK{
				width:100px;
				display: block;
				height: 27px;
				border: 1px solid #5f0080;
    			background-color: #fff;
    			color: #5f0080;
    			margin : 5px auto 0px auto;
    			font-weight: 400;
    			outline : none;
			}
			
			.option_title{
				margin:0;
				color : #5f0080;
				font-size : 12px;
				font-family: 'Noto Sans KR' , sans-serif;
				font-weight: 700;
			}
			
			.option_info{
				margin : 0;
				color : #4c4c4c;
				font-size : 12px;
				font-family: 'Noto Sans KR' , sans-serif;
				font-weight: 400;
			}
			
			.p_name,.p_name:hover,.p_name:focus{
				outline: none;
				text-decoration: none;
				color : #4c4c4c;
				font-size : 16px;
				font-family: 'Noto Sans KR' , sans-serif;
				font-weight: 700;
			}
			
			.p_price{
				color : #4c4c4c;
				font-size : 12px;
				font-family: 'Noto Sans KR' , sans-serif;
				font-weight: 400;
			}
			
			.delChkBMK{
				float: right;
				border: 1px solid #5f0080;
			    background-color: #fff;
			    color: #5f0080;
			    width: 150px;
			    height: 42px;
			    font-size: 13px;
			    line-height: 40px;
			    text-align: center;
			    font-family: 'Noto Sans KR', sans-serif;
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
				$("input[type='checkbox']").change(function(){
					if($(this).prop("checked")){
						$(this).parents(".chkBox").css({"background":"url(/resources/images/checked.png) left no-repeat","background-size" : "17px"});
					}
					else{
						$(this).parents(".chkBox").css({"background":"url(/resources/images/nocheck.png) left no-repeat","background-size" : "17px"})						
					}
				});
				
				$(".all_check").change(function(){
					if($(this).prop("checked")){
						$(".sub_check").prop("checked",true);
						$(".chkBox").css({"background":"url(/resources/images/checked.png) left no-repeat","background-size" : "17px"});
					}
					else{
						$(".chkBox").css({"background":"url(/resources/images/nocheck.png) left no-repeat","background-size" : "17px"});
						$(".sub_check").prop("checked",false);						
					}
				});
				
				
				
				$(".addBasket").click(function(){
					console.log($(this).parents("form").serialize());
					$.ajax({
						url : "/basket/addBasket",
						type : "post",
						data : $(this).parents("form").serialize(),
						dataType : "text",
						error : function(){
							alert("장바구니에 등록하는데 문제가 생겼습니다. 잠시 후 다시 시도해주세요.");
						},
						success : function(data){
							if(data == "SUCCESS"){
								alert("장바구니에 등록되었습니다.");								
							}
							else{
								alert("오류가 발생하여 장바구니에 담기지 않았습니다. 잠시후 다시 시도해주세요.");
							}
						}
					});
				});
				
				$(".delBMK").click(function(){
					if(confirm("삭제하시겠습니까?")){
						$.ajax({
							url : "/bookmark/delBMK",
							type : "post",
							data : "bm_num="+$(this).parents("tr").attr("data-num"),
							dataType : "text",
							async : false,
							error : function(){
								alert("자주 사는 것 삭제하는데 문제가 생겼습니다. 잠시 후 다시 시도해주세요.")
							},
							success : function(data){
								console.log(data);
								if(data = "SUCCESS"){
									alert("삭제되었습니다.");
									location.href="/member/bookmark";
								}
								else{
									alert("시스템 오류입니다. 관리자에게 문의하세요.");
								}
							}
						});																						
					}
				});
				
				$(".delChkBMK").click(function(){
					$("#bm_numBox").html("");
					$(".sub_check").each(function(){
						if($(this).prop("checked")){
							var input = $("<input>");
							input.attr({
								"type" : "hidden",
								"name" : "bm_num",
								"value" : $(this).val()
							});
							$("#bm_numBox").append(input);
						}
					});
					console.log($("#bm_numBox").serialize());
					if($("#bm_numBox").serialize()==""){
						alert("삭제하실 리스트를 선택해주세요");
						return;
					}
					else{
						if(confirm("삭제하시겠습니까?")){
							$.ajax({
								url : "/bookmark/delChkBMK",
								type : "post",
								data : $("#bm_numBox").serialize(),
								dataType : "text",
								async : false,
								error : function(){
									alert("자주 사는 것 삭제하는데 문제가 생겼습니다. 잠시 후 다시 시도해주세요.")
								},
								success : function(data){
									console.log(data);
									if(data = "SUCCESS"){
										alert("삭제되었습니다.");
										location.href="/member/bookmark";
									}
									else{
										alert("시스템 오류입니다. 관리자에게 문의하세요.");
									}
								}
							});																						
						}
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
				<div id="board_title"><h2>자주 사는 것</h2></div>
				<div id="table_section">
					<form id="bm_numBox">
					
					</form>
					<table id="notice_table">
						<colgroup>
							<col width="40px">
							<col width="150px">
							<col width="465px">
							<col width="165px">
						</colgroup>
						<tr>
							<td><label class="chkBox"><input type="checkbox" class="all_check"></label></td>
							<td></td>
							<td class="text-center">상품정보</td>
							<td class="text-center">선택</td>
						</tr>
						<c:choose>
							<c:when test="${not empty bMKList }">
								<c:forEach var="bookmark" items="${bMKList}">
									<tr data-num="${bookmark.bm_num}">
										<td><label class="chkBox"><input type="checkbox" name="bm_num" value="${bookmark.bm_num}" class="sub_check"></label></td>
										<td>
											<a href="#">
												<img width="90px" src="/uploadStorage/pImg/${bookmark.p_img }">
											</a>
										</td>
										<td>
											<div style="padding-bottom: 23px;">
												<a class="p_name" href="#">${bookmark.p_name}</a>
											</div>
											<div class="p_price">
												${bookmark.p_price}
											</div>
											<c:if test="${bookmark.op_num != 0}">
												<p class="option_title">※ 패키지 구성품</p>
												<p class="option_info">${bookmark.op_name}/1개/${bookmark.op_price}</p>
											</c:if>
										</td>
										<td>
											
											<div>
												<form>
													<input type="hidden" name="bm_num" value="${bookmark.bm_num}">
													<input type="hidden" name="p_num" value="${bookmark.p_num}">
													<input type="hidden" name="p_price" value="${bookmark.p_price }">
													<input type="hidden" name="op_num" value="${bookmark.op_num}">
													<input type="hidden" name="op_price" value="${bookmark.op_price}">
													<input type="hidden" name="m_num" value="${bookmark.m_num }">
													<input class="addBasket" type="button" value="장바구니담기">
												</form>
												<input class="delBMK" type="button" value="삭제">
											</div>
										</td>
									</tr>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<tr>
									<td colspan="4">
										<div class="text-center" style="padding : 50px 0px; font-size:13px; color: #757575; font-family: 'Noto Sans KR',sans-serif; font-weight: 400;">
											자주 사는 상품 내역이 없습니다.
										</div>
									</td>
								</tr>
							</c:otherwise>
						</c:choose>
					</table>
					<div style="padding-top :39px;">
						<input class="delChkBMK" type="button" value="자주 사는 것 비우기">
					</div>
					
				</div>
				
			</div>
			
		</div>
	</body>
</html>