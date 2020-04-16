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
			
			#point_head{
				text-align: center;
				font-family: 'Noto Sans KR', sans-serif;
				width: 100%;
				margin-top : 30px;
				margin-bottom : 25px;
			}
			
			#point_head td{
				padding : 30px 0px;
				border-top : 1px solid #ddd;
				border-bottom : 1px solid #ddd;
			}
			
			#point_head td:first-child {
				border-left: 1px solid #ddd;
			}
			
			#point_head td:nth-child(2),#point_head td:nth-child(4){
				border-right : 1px solid #ddd;
				padding-left: 25px;
				font-weight: 700;
				color : #5f0080;
			}
			
			#point_head td:nth-child(1),#point_head td:nth-child(3){
				font-weight: 400;
			}
			
			#point_content th{
				border-top : 2px solid #5f0080;
			}
			
			#point_content th, #point_content td{
				text-align: center;
				padding : 15px 0px;
				font-family: 'Noto Sans KR', sans-serif;
				border-bottom: 1px solid #ddd;
			}
			
			.noData{
				padding : 50px 0px !important;
			}
			
			#pagination{
				display: inline-block;
				margin : 20px 0px;
			}
			
			#d{
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
						$.getJSON("/point/pointList?m_num=${user.m_num}",function(data){
							done(data);
						}).fail(function(){
							alert("목록을 불러오는데 실패하였습니다. 잠시 후에 다시 시도해주세요.");
						});
					},
					callback : function(data,pagination){
						$(".point_cell").html("");
						if(data.length!=0){
							$.each(data,function(index,item){
								var ps_num = this.ps_num;
								var ps_type = this.ps_type;
								var ps_content = this.ps_content;
								var ps_regdate = this.ps_regdate;
								var ps_valid = this.ps_valid;
								var ps_point = this.ps_point;
								
								var tr = $("<tr>");
								tr.attr("data-num",ps_num);
								
								var td1 = $("<td>");
								td1.attr("data-text",ps_type);
								td1.html(ps_type);
								
								var td2 = $("<td>");
								td2.attr("data-text",ps_content);
								td2.html(ps_content);
								
								var td3 = $("<td>");
								td3.attr("data-text",ps_regdate);
								td3.html(ps_regdate);
								
								var td4 = $("<td>");
								if(ps_type == "차감"){
									td4.attr("data-text","X");
								}
								else{
									td4.attr("data-text",ps_valid);
									td4.html(ps_valid);
								}
								
								var td5 = $("<td>");
								td5.attr("data-num",ps_point);
								if(ps_type == "차감"){
									td5.html("-"+ps_point+"원");
								}
								else if(ps_type=="적립"){
									td5.html("+"+ps_point+"원");
								}
								
								tr.append(td1).append(td2).append(td3).append(td4).append(td5);
								$(".point_cell").append(tr);
							});
						}
						else{
							var tr = $("<tr>");
							var td = $("<td>");
							td.attr("colspan",5);
							td.addClass("noData");
							td.html("적립금 내역이 존재하지 않습니다.");
							tr.append(td);
							$(".point_cell").append(tr);
						}
					}
				});
				
			});//최상위 종료
			
			
			function listData(){
				
				$.getJSON("/point/pointList?m_num=${m_num}",function(data){
					$(".point_cell").html("");
					console.log(data.length);
					if(data.length != 0 ){
						$(data).each(function(){
							var ps_num = this.ps_num;
							var ps_type = this.ps_type;
							var ps_content = this.ps_content;
							var ps_regdate = this.ps_regdate;
							var ps_valid = this.ps_valid;
							var ps_point = this.ps_point;
							
							var tr = $("<tr>");
							tr.attr("data-num",ps_num);
							
							var td1 = $("<td>");
							td1.attr("data-text",ps_type);
							td1.html(ps_type);
							
							var td2 = $("<td>");
							td2.attr("data-text",ps_content);
							td2.html(ps_content);
							
							var td3 = $("<td>");
							td3.attr("data-text",ps_regdate);
							td3.html(ps_regdate);
							
							var td4 = $("<td>");
							if(ps_type == "차감"){
								td4.attr("data-text","X");
							}
							else{
								td4.attr("data-text",ps_valid);
								td4.html(ps_valid);
							}
							
							var td5 = $("<td>");
							td5.attr("data-num",ps_point);
							if(ps_type == "차감"){
								td5.html("-"+ps_point+"원");
							}
							else if(ps_type=="적립"){
								td5.html("+"+ps_point+"원");
							}
							
							tr.append(td1).append(td2).append(td3).append(td4).append(td5);
							$(".point_cell").append(tr);
						});
					}
					else{
						var tr = $("<tr>");
						var td = $("<td>");
						td.attr("colspan",5);
						td.addClass("noData");
						td.html("적립금 내역이 존재하지 않습니다.");
						tr.append(td);
						$(".point_cell").append(tr);
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
				<div id="board_title"><h2>적립금<span>보유하고 계신 적립금의 내역을 한 눈에 확인 하실 수 있습니다.</span></h2></div>		
				
				<table id="point_head">
					<colgroup>
						<col width="25%">
						<col width="25%">
						<col width="25%">
						<col width="25%">
					</colgroup>
					<tr>
						<td>현재 적립금</td>
						<td><span class="sum_point">${userPointInfo.sum_point}</span> 원</td>
						<td>소멸예정 적립금</td>
						<td><span class="lapse_point">${userPointInfo.lapse_point}</span> 원</td>
					</tr>
				</table>
				
				<table id="point_content">
					<colgroup>
						<col width="120px">
						<col width="316px">
						<col width="122px">
						<col width="122px">
						<col width="140px">
					</colgroup>
					<tr>
						<th>종류</th>
						<th>내용</th>
						<th>적립일자</th>
						<th>유효기간</th>
						<th>금액</th>
					</tr>
					<tbody class="point_cell">
						
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