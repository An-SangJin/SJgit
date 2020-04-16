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
		
		<!--[if lt IE 9]>
		<script src="/resources/include/js/html5shiv.js"></script>
		<![endif]-->
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
		</style>
		
		
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
				paginative("all","all");
				function paginative(search,keyword){
					container.pagination({
						dataSource : function(done){
							listData(search,keyword).then(function(data){
								done(data);
								$("#noticeCnt").html(data.length);
							});
						},
						callback : function(data, pagination){
							$("#notice_tbody").html("");
							if(data.length!=0){
								$(data).each(function(){
									var n_num = this.n_num;
									var a_num = this.a_num;
									var a_name = this.a_name;
									var n_title = this.n_title;
									var n_content = this.n_content;
									var n_cnt = this.n_cnt;
									var n_regdate = this.n_regdate;
									
									var tr1 = $("<tr>");
									tr1.attr({
										"data-num":n_num,
										"data-text" : n_content
									});
									tr1.addClass("text-center");
									
									var td1 = $("<td>");
									
									var chkBox = $("<input>");
									chkBox.attr({
										"type" : "checkbox",
										"name" : "n_num",
										"value" : n_num
									});
									td1.append(chkBox);
									
									var td2 = $("<td>");
									td2.html(n_num);
									
									var td3 = $("<td>");
									td3.html(a_name);
									td3.attr("data-num",a_num);
									
									var td4 = $("<td>");
									td4.html(n_title);
									
									var td5 = $("<td>");
									td5.html(n_cnt);
									
									var td6 = $("<td>");
									td6.html(n_regdate);
									
									var td7 = $("<td>");
									
									var updateBtn = $("<input>");
									updateBtn.attr({
										"type" : "button",
										"value" : "수정",
										"data-button":"updateBtn"
									})
									updateBtn.addClass("btn btn-primary btn-lg");
									updateBtn.css({
										"font-size" : "1rem",
										"height" : "30px",
										"line-height" : "0"
									});
									if(a_num=="${adminInfo.a_num}"){
										td7.append(updateBtn);										
									}
									else{
										td7.append("X");
									}
									
									var tr2 = $("<tr>");
									tr2.addClass("text-center asd data"+n_num);
									
									var td10 = $("<td>");
									td10.attr("colspan",2);
									td10.html("본문 내용");
									
									var td11 = $("<td>");
									td11.attr("colspan",4);
									n_content = n_content.replace(/(\r)|(\n)|(\r\n)|(\n\r)/g,"<br>");
									td11.html(n_content);
									tr2.append(td10).append(td11);
									
									tr1.append(td1).append(td2).append(td3).append(td4).append(td5).append(td6).append(td7);
									$("#notice_tbody").append(tr1).append(tr2);
								});
							}
							else{
								var tr = $("<tr>");
								tr.attr("data-text","no-data");
								tr.addClass("text-center");
								
								var td =$("<td>");
								td.attr("colspan","6");
								td.html("검색 및 저장된 공지 게시물이 없습니다.");
								
								tr.append(td);
								$("#notice_tbody").append(tr);
							}
						}
					});
					
				}
				
				
				function listData(search,keyword){
					var def = new $.Deferred();
					$.ajax({
						url : "/adminNotice/noticeList",
						type : "post",
						data : "search="+search+"&keyword="+keyword,
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
					if($(this).val() == "all"){
						$("#keyword").datepicker("destroy");
						$("#keyword").attr("disabled","disabled");
					}
					else if($(this).val()=="n_regdate"){
						$("#keyword").removeAttr("disabled");
						$("#keyword").attr("readonly","readonly");
						$("#keyword").datepicker({
							changeMonth : true,
							changeYear : true,
							dateFormat : 'yy-mm-dd'
						});
						$("#keyword").focus();
					}
					else{
						$("#keyword").removeAttr("disabled");
						$("#keyword").removeAttr("readonly");
						$("#keyword").datepicker("destroy");
						$("#keyword").focus();
					}
				});
				
				$("#searchBtn").click(function(){
					if($("#search").val()!="all"){
						if(!chkData("#keyword","검색 단어를 "))return;
						else{
							paginative($("#search").val(),$("#keyword").val());
						}
					}
					else{
						paginative("all","all");
					}
				});
				
				$(document).on("click","#notice_tbody td",function(){
					if($(this).find("input").attr("type")=="checkbox")return;
					else if($(this).find("input").attr("type")=="button")return;
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
				
				$("#delNotice").click(function(){
					
					var data = $(this).parents("form").serialize();
					if(data == ""){
						alert("삭제하실 게시물을 선택해 주세요.");
						return;
					}
					else{
						var bool = 0;
						$("input[name='n_num']").each(function(){
							if($(this).prop("checked")){
								if($(this).parents("tr").find("td").eq(2).attr("data-num")!="${adminInfo.a_num}"){
									$(this).prop("checked",false);
									bool = bool+1;
								
								}
								
								
							}
						});
						if(bool!=0){
							alert("관리자 권한이 없어 삭제를 진행할 수없습니다.");
							return;
						}
						else{
							if(confirm("선택한 게시물을 삭제하시겠습니까?")){
								$.ajax({
									url : "/adminNotice/deleteNotice",
									data : $("#n_form").serialize(),
									type : "post",
									dataType : "text",
									error : function(){
										alert("게시물을 삭제하는데 오류가 발생하였습니다.");
									},
									success : function(result){
										if(result == "SUCCESS"){
											alert("선택한 게시물이 삭제되었습니다.");
											paginative("all","all");
										}
										else if(result == "FAIL"){
											alert("게시물을 삭제하는데 오류가 발생하여 누락된 건이 있습니다.");
											paginative("all","all");
										}
									}
								});
							}
						}
						
					}
				});
				
				$(document).on("click","input[data-button='updateBtn']",function(){
					$("#dialog").find("form").each(function(){
						this.reset();
					});
					$("#dialog input[type='hidden']").val($(this).parents("tr").attr("data-num"));
					
					$("#upTitle").val($(this).parents("tr").find("td").eq(3).html());
					var content = $(this).parents("tr").attr("data-text");
					$("#upContent").val(content);
					$("#dialog").dialog({
						width : "400px",
						modal : true,
						title : "공지사항 정보 수정"
					});
				});
				
				$("#cancel").click(function(){
					$("#dialog").dialog("destroy");
				})
				
				$("#cancel2").click(function(){
					$("#dialog2").dialog("destroy");
				})
				
				$("#upBtn").click(function(){
					if(!chkData("#upTitle","글 제목을 "))return;
					else if(!chkData("#upContent","글 내용을 "))return;
					else{
						$.ajax({
							url : "/adminNotice/updateNotice",
							data : $("#up_form").serialize(),
							dataType : "text",
							type : "post",
							error : function(){
								alert("공지 수정에 문제가 발생하였습니다.");
							},
							success : function(data){
								if(data == "SUCCESS"){
									alert("글수정이 완료되었습니다.");
									$("#dialog").dialog("destroy");
									paginative("all","all");
								}
								else{
									alert("글수정에 오류가 발생하였습니다. 잠시후 다시 시도해주세요.");
								}
							}
							
						});
					}
				});
				
				$("#insertNotice").click(function(){
					$("#insert_form").each(function(){
						this.reset();
					});
					$("#dialog2").dialog({
						width : "400px",
						modal : true,
						title : "공지사항 글 쓰기"
					});
				});
				
				$("#inBtn").click(function(){
					
					if(!chkData("#inTitle","글 제목을"))return;
					else if(!chkData("#inContent","글 내용을 "))return;
					else{
						$.ajax({
							url : "/adminNotice/insertNotice",
							type : "post",
							data : $("#insert_form").serialize(),
							dataType : "text",
							error : function(){
								alert("오류가 발생하였습니다.");
							},
							success : function(data){
								if(data=="SUCCESS"){
									alert("글 작성이 완료되었습니다.");
									$("#dialog2").dialog("destroy");
									paginative("all","all");
								}
								else{
									alert("글 작성에 문제가 발생하였습니다. 잠시후 다시 시도해주세요.");
								}
							}
						});
					}
				});
				
				$("#allCheck").change(function(){
					if($(this).prop("checked")){
						$("#notice_tbody input[type='checkbox']").prop("checked",true);
					}
					else{
						$("#notice_tbody input[type='checkbox']").prop("checked",false);						
					}
				});
			});//최상위종료
		</script>
		</c:if>
	</head>
	<body>
		<div class="container-fluid">
		<h5 class="text-left m-0 font-weight-bold text-primary">공지게시판 관리</h5>
			<hr class="sidebar-divider">
				
		 <br/>
		 
		 
		  <div class="row">
		 <div class="container-fluid text-right">
		 	<select style="width:117px; display: inline-block; float:left; margin-bottom:10px;" id="search" class="form-control" name="keyword">
		 		<option value="all">전체</option>
		 		<option value="n_title">제목</option>
		 		<option value="a_name">관리자명</option>
		 		<option value="n_title">본문</option>
		 		<option value="n_regdate">게시일자</option>
		 	</select>
		 	<input autocomplete="off" type="text" disabled="disabled" name="keyword" id="keyword" class="form-control" style="width:150px; display: inline-block; float: left; margin-left:10px;">
		 	<input style="font-size : 1rem; float: left; margin-left:10px;height:38px;" id="searchBtn" type="button" class="btn btn-primary btn-lg" value="검색">
				<span  class="m-0 font-weight-bold text-default">총</span> 
                  <span id="noticeCnt" class="m-0 font-weight-bold text-danger"></span>
                  <span class="m-0 font-weight-bold text-default">개</span> 
                  </div>
            <div class="col-lg-12">
              <div class="card shadow mb-4">
                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                   <h6 class="m-0 font-weight-bold text-primary">공지게시판 목록</h6>
                  <button type="button" id="excelDownBtn" ><img src="/resources/images/excel.png"></button>
                </div>
                <form id="n_form">
                <div class="card-body">
                	<table class="table table-hover" id="notice_table">
                		<colgroup>
                			<col width=3%>
                			<col width=10%>
                			<col width=22%>
                			<col width=22%>
                			<col width=12%>
                			<col width=21%>
                			<col width="10%">
                		</colgroup>
                		<tr class="text-center">
                			<td><input type="checkbox" id="allCheck"></td>
                			<td>번호</td>
                			<td>담당자명</td>
                			<td>제목</td>
                			<td>조회수</td>
                			<td>게시날짜</td>
                			<td>수정</td>
                		</tr>
                		<tbody id="notice_tbody">
                			
                		</tbody>
                	</table>
                	<div style="text-align: center;">
                		<div id="pagination" style="display: inline-block;">
                			
                		</div>
                		<div style="float: right;">
                			<input style="font-size : 1rem;" id="insertNotice" type="button" class="btn btn-primary btn-lg" value="글쓰기">
                			<input style="font-size : 1rem;" id="delNotice" type="button" class="btn btn-primary btn-lg" value="선택삭제">
                			
                		</div>
                	</div>
                	
              
               	</div>
               </form>
              </div>
              </div>
              </div>
              
              <div id="dialog" style="display: none">
              	<form id="up_form">
              		<input type="hidden" name="n_num">
              		<table class="table table-hover" style="font-size : 14px;">
              			<colgroup>
              				<col width="30%">
              				<col width="70%">
              			</colgroup>
              			<tr>
              				<td style="padding-top : 18px;"><label for="upTitle">글 제목</label></td>
              				<td><input type="text" class="form-control" name="n_title" id="upTitle"></td>
              			</tr>
              			<tr>
              				<td style="padding-top : 18px;"><label for="upContent">글 내용</label></td>
              				<td>
              					<textarea style="resize: none;" rows="4" class="form-control" name="n_content" id="upContent"></textarea>
              				</td>
              			</tr>
              		</table>
              		<div style="text-align: right;">
              			<input type="button" value="수정" id="upBtn" class="btn btn-primary btn-1g" style="font-size:1rem;height: 30px;line-height: 0;">
              			<input type="button" value="취소" id="cancel" class="btn btn-primary btn-1g" style="font-size:1rem;height: 30px;line-height: 0;">
              		</div>
              	</form>
              </div>
              
              
              <div id="dialog2" style="display: none">
              	<form id="insert_form">
              		<input type="hidden" name="a_num" value="${adminInfo.a_num}">
              		<table class="table table-hover" style="font-size : 14px;">
              			<colgroup>
              				<col width="30%">
              				<col width="70%">
              			</colgroup>
              			<tr>
              				<td>작성자명</td>
              				<td>${adminInfo.a_name }</td>
              			</tr>
              			<tr>
              				<td style="padding-top : 18px;"><label for="inTitle">글 제목</label></td>
              				<td><input type="text" class="form-control" name="n_title" id="inTitle"></td>
              			</tr>
              			<tr>
              				<td style="padding-top : 18px;"><label for="inContent">글 내용</label></td>
              				<td>
              					<textarea style="resize: none;" rows="4" class="form-control" name="n_content" id="inContent"></textarea>
              				</td>
              			</tr>
              		</table>
              		<div style="text-align: right;">
              			<input type="button" value="작성" id="inBtn" class="btn btn-primary btn-1g" style="font-size:1rem;height: 30px;line-height: 0;">
              			<input type="button" value="취소" id="cancel2" class="btn btn-primary btn-1g" style="font-size:1rem;height: 30px;line-height: 0;">
              		</div>
              	</form>
              </div>
              
              
           </div>
	</body>
</html>