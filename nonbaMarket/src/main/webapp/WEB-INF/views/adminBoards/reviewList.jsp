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
		<style type="text/css">
			.asd{
				display: none;
			}
			
			.asd td{
				padding-top : 50px;
				padding-bottom : 50px;
			}
			
			.ui-dialog{
				position: fixed !important;
				top:30% !important;
				left:35% !important;
			}
			
			.form-control[readonly]{
				background-color: white !important;
			}
		</style>
		<!--[if lt IE 9]>
		<script src="/resources/include/js/html5shiv.js"></script>
		<![endif]-->
		
		<link rel="stylesheet" type="text/css" href="/resources/include/css/pagination.css">
		<script type="text/javascript" src="/resources/include/js/pagination.min.js"></script>
		<script type="text/javascript" src="/resources/include/js/common.js"></script>
		<c:if test="${empty adminInfo }">
			<script type="text/javascript">
				$(function(){
					alert("로그인이 필요한 작업입니다.");
					location.href="/adminLogin/loginForm";
				});
			</script>
		</c:if>
		<c:if test="${not empty adminInfo }">
		<script type="text/javascript">
			$(function(){
				var container = $("#pagination");
				paginative("all","all","","");
				function paginative(search,keyword,startDate,endDate){
					container.pagination({
						dataSource : function(done){
							listData(search,keyword,startDate,endDate).then(function(data){
								done(data);
								$("#reviewCnt").html(data.length);
							});
						},
						callback : function(data, pagination){
							$("#review_tbody").html("");
							if(data.length!=0){
								$(data).each(function(){
									var re_num = this.re_num;
									var m_num = this.m_num;
									var m_name = this.m_name;
									var m_id = this.m_id;
									var p_num = this.p_num;
									var p_name = this.p_name;
									var re_title = this.re_title;
									var re_content = this.re_content;
									var re_regdate = this.re_regdate;
									var re_img = this.re_img;
									var re_cnt = this.re_cnt;
									
									var tr1 = $("<tr>");
									tr1.attr({
										"data-num" : re_num,
										"data-text" : re_content
									});
									tr1.addClass("text-center");
									
									var td1 = $("<td>");
									
									var chkBox = $("<input>");
									chkBox.attr({
										"type" : "checkbox",
										"name" : "re_num",
										"value" : re_num
									});
									td1.append(chkBox);
									
									var td2 = $("<td>");
									td2.html(re_num);
									
									var td3 = $("<td>");
									td3.html(m_name);
									td3.attr("data-num",m_num);
									
									var td4 = $("<td>");
									td4.html(m_id);
									td4.attr("data-num",m_num);
									
									var td5 = $("<td>");
									td5.html(p_name);
									td5.attr("data-num",p_num);
									
									var td6 = $("<td>");
									td6.html(re_title);
									
									var td7 = $("<td>");
									td7.html(re_regdate);
									
									var td8 = $("<td>");
									td8.html(re_cnt);
									
									var tr2 = $("<tr>");
									tr2.addClass("text-center asd data"+re_num);
									
									var td9 = $("<td>");
									td9.attr("colspan",3);
									td9.html("본문 내용");
									
									var td10 = $("<td>");
									td10.attr("colspan",5);
									re_content = re_content.replace(/(\r)|(\n)|(\r\n)|(\n\r)/g,"<br>");
									td10.html(re_content);
									tr2.append(td9).append(td10);
									
									tr1.append(td1).append(td2).append(td3).append(td4).append(td5).append(td6).append(td7).append(td8)
									$("#review_tbody").append(tr1).append(tr2);
									
								});
							}
							else{
								var tr = $("<tr>");
								tr.attr("data-text","no-data");
								tr.addClass("text-center");
								
								var td =$("<td>");
								td.attr("colspan",8);
								td.html("검색 및 저장된 후기 게시물이 없습니다.");
								
								tr.append(td);
								$("#review_tbody").append(tr);
							}
						}
					});
					
				}
				
				
				function listData(search,keyword,startDate,endDate){
					var def = new $.Deferred();
					$.ajax({
						url : "/adminReview/reviewList",
						type : "post",
						data : "search="+search+"&keyword="+keyword+"&startDate="+startDate+"&endDate="+endDate,
						dataType : "json",
						error : function(){
							alert("게시판 정보를 불러오는데 문제가 생겼습니다.");
						},
						success : function(data){
							def.resolve(data);
							console.log(data);
						}
					});
					return def.promise();
				}
				
				$("#search").change(function(){
					$("#keyword").val("");
					$("#startDate").val("");
					$("#endDate").val("");
					if($(this).val() == "all"){
						$("#keyword").attr("disabled","disabled");
						$("#keyword").css("display", "inline-block");
						
						$("#startDate").css("display","none");
						$("#endDate").css("display","none");
						
					}
					else if($(this).val()=="re_regdate"){
						$("#keyword").css("display","none");
						$("#startDate").datepicker({
							changeMonth : true,
							changeYear : true,
							dateFormat : 'yy-mm-dd'
						});
						$("#endDate").datepicker({
							changeMonth : true,
							changeYear : true,
							dateFormat : 'yy-mm-dd'
						});
						$("#startDate").css("display","inline-block");
						$("#endDate").css("display","inline-block");
						$("#startDate").focus();
					}
					else{
						$("#keyword").removeAttr("disabled");
						$("#keyword").removeAttr("readonly");
						
						$("#keyword").css("display", "inline-block");
						
						$("#startDate").css("display","none");
						$("#endDate").css("display","none");
						$("#keyword").focus();
					}
				});
				
				$("#searchBtn").click(function(){
					if($("#keyword").css("display")!="none"){
						if($("#search").val()!="all"){
							if(!chkData("#keyword","검색 단어를 "))return;
							else{
								paginative($("#search").val(),$("#keyword").val(),$("#startDate").val(),$("#endDate").val());
							}
						}
						else{
							paginative("all","all","","");
						}
					}
					else{
						if(!chkData("#startDate","시작 날짜를"))return;
						else if(!chkData("#endDate","끝 날짜를"))return;
						else{
							paginative($("#search").val(),$("#keyword").val(),$("#startDate").val(),$("#endDate").val());							
						}
						
					}
				});
				
				$(document).on("click","#review_tbody td",function(){
					if($(this).find("input").attr("type")=="checkbox")return;
					else{
						var datanum = ".data"+$(this).parents("tr").attr("data-num");

						if($(datanum).css("display")=="none"){
							$(".asd").css("display","none");
							$(datanum).css("display","table-row");							
						}
						else{
							$(datanum).css("display","none");
						}
					}
				});
				
				$("#delReview").click(function(){
					var data = $("#r_form").serialize();
					if(data == ""){
						alert("삭제하실 게시물을 선택해 주세요.");
						return;
					}
					else{
						if(confirm("선택한 게시물을 삭제하시겠습니까?")){
							$.ajax({
								url : "/adminReview/deleteReview",
								data : $("#r_form").serialize(),
								type : "post",
								dataType : "text",
								error : function(){
									alert("게시물을 삭제하는데 오류가 발생하였습니다.");
								},
								success : function(result){
									if(result == "SUCCESS"){
										alert("선택한 게시물이 삭제되었습니다.");
										paginative("all","all","","");
									}
									else if(result == "FAIL"){
										alert("게시물을 삭제하는데 오류가 발생하여 누락된 건이 있습니다.");
										paginative("all","all","","");
									}
								}
							});
						}
					}
				});
				
				$("#allCheck").change(function(){
					if($(this).prop("checked")){
						$("#review_tbody input[type='checkbox']").prop("checked",true);
					}
					else{
						$("#review_tbody input[type='checkbox']").prop("checked",false);						
					}
				});
			});//최상위 종료
		</script>
		</c:if>
	</head>
	<body>
		<div class="container-fluid">
		<h5 class="text-left m-0 font-weight-bold text-primary">후기게시판 관리</h5>
			<hr class="sidebar-divider">
				
		 <br/>
		 
		 
		  <div class="row">
		 <div class="container-fluid text-right">
			 <select style="width:117px; display: inline-block; float:left; margin-bottom:10px;" id="search" class="form-control" name="search">
			 		<option value="all">전체</option>
			 		<option value="m_name">회원명</option>
			 		<option value="re_title">제목</option>
			 		<option value="re_content">본문</option>
			 		<option value="re_regdate">게시일자</option>
			 	</select>

		 	<input autocomplete="off" type="text" readonly="readonly" name="startDate" id="startDate" class="form-control" style="display : none;width:150px;  float: left; margin-left:10px;">
		 	<input autocomplete="off" type="text" readonly="readonly" name="endDate" id="endDate" class="form-control" style="display : none;width:150px; float: left; margin-left:10px;">
		 	<input autocomplete="off" type="text" disabled="disabled" name="keyword" id="keyword" class="form-control" style="width:150px; display: inline-block; float: left; margin-left:10px;">
		 	
		 	<input style="font-size : 1rem; float: left; margin-left:10px;height:38px;" id="searchBtn" type="button" class="btn btn-primary btn-lg" value="검색">
		 
		 
				<span  class="m-0 font-weight-bold text-default">총</span> 
                  <span id="reviewCnt" class="m-0 font-weight-bold text-danger"></span>
                  <span class="m-0 font-weight-bold text-default">개</span> 
                  </div>
            <div class="col-lg-12">
              <div class="card shadow mb-4">
                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                  <h6 class="m-0 font-weight-bold text-primary">후기게시판 목록</h6>
                  <button type="button" id="excelDownBtn" ><img src="/resources/images/excel.png"></button>
                </div>
                <form id="r_form">
                <div class="card-body">
                	<table class="table table-hover" id="review_table">
                		<colgroup>
                			<col width=3%>
                			<col width=7%>
                			<col width=20%>
                			<col width=18%>
                			<col width=15%>
                			<col width=18%>
                			<col width=11%>
                			<col width=7%>
                		</colgroup>
                		<tr class="text-center">
                			<td><input type="checkbox" id="allCheck"></td>
                			<td>글번호</td>
                			<td>회원명</td>
                			<td>회원아이디</td>
                			<td>상품명</td>
                			<td>제목</td>
                			<td>등록일자</td>
                			<td>조회수</td>
                		</tr>
                		<tbody id="review_tbody">
                			
                		</tbody>
                	</table>
                	<div style="text-align: center;">
                		<div id="pagination" style="display: inline-block;">
                			
                		</div>
                		<div style="float: right;">
                			<input style="font-size : 1rem;" id="delReview" type="button" class="btn btn-primary btn-lg" value="삭제">
                		</div>
                	</div>
                	
              
               	</div>
               </form>
              </div>
              </div>
              </div>
              
              
              
              
           </div>
	</body>
</html>