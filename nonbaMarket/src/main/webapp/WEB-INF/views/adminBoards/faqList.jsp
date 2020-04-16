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
				paginative("all");
				function paginative(f_category){
					container.pagination({
						dataSource : function(done){
							listData(f_category).then(function(data){
								done(data);
								$("#faqCnt").html(data.length);
							});
						},
						callback : function(data, pagination){
							$("#faq_tbody").html("");
							if(data.length!=0){
								$(data).each(function(){
									var f_num = this.f_num;
									var f_category = this.f_category;
									var f_title = this.f_title;
									var f_content = this.f_content;
									
									var tr1 = $("<tr>");
									tr1.attr({
										"data-num" : f_num,
										"data-text" : f_content
									});
									tr1.addClass("text-center");
									
									var td1 = $("<td>");
									
									var chkBox = $("<input>");
									chkBox.attr({
										"type" : "checkbox",
										"name" : "f_num",
										"value" : f_num
									});
									td1.append(chkBox);
									
									var td2 = $("<td>");
									td2.html(f_num);
									
									var td3 = $("<td>");
									td3.html(f_category);
									
									var td4 = $("<td>");
									td4.html(f_title);
									
									var td5 = $("<td>");
									
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
									td5.append(updateBtn);
									
									var tr2 = $("<tr>");
									tr2.addClass("text-center asd data"+f_num);
									
									var td6 = $("<td>");
									td6.attr("colspan",2);
									td6.html("본문 내용");
									
									var td7 = $("<td>");
									td7.attr("colspan", 3);
									f_content = f_content.replace(/(\r)|(\n)|(\r\n)|(\n\r)/g,"<br>");
									td7.html(f_content);
									tr2.append(td6).append(td7);
									
									tr1.append(td1).append(td2).append(td3).append(td4).append(td5);
									
									$("#faq_tbody").append(tr1).append(tr2);
								});
							}
						}
					})
				}
				
				function listData(f_category){
					var def = new $.Deferred();
					$.ajax({
						url : "/adminFaq/faqList",
						type : "post",
						data : "f_category="+f_category,
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
				
				$("#f_category").change(function(){
					paginative($(this).val());
				});
				
				$(document).on("click","#faq_tbody td",function(){
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
				
				$("#delFaq").click(function(){
					var data = $("#f_form").serialize();
					if(data == ""){
						alert("삭제하실 게시물을 선택해 주세요.");
					}
					else{
						if(confirm("선택한 게시물을 삭제하시겠습니까?")){
							$.ajax({
								url : "/adminFaq/deleteFaq",
								data : $("#f_form").serialize(),
								type : "post",
								dataType : "text",
								error : function(){
									alert("게시물을 삭제하는데 오류가 발생하였습니다.");
								},
								success : function(result){
									if(result == "SUCCESS"){
										alert("선택한 게시물이 삭제되었습니다.");
										paginative("all");
									}
									else if(result == "FAIL"){
										alert("게시물을 삭제하는데 오류가 발생하여 누락된 건이 있습니다.");
										paginative("all");
									}
								}
							})
						}
						
					}
				});
				
				$(document).on("click","input[data-button='updateBtn']",function(){
					$("#dialog").find("form").each(function(){
						this.reset();
					});
					$("#dialog input[type='hidden']").val($(this).parents("tr").attr("data-num"));
					$("#up_category").val($(this).parents("tr").find("td").eq(2).html());
					
					$("#upTitle").val($(this).parents("tr").find("td").eq(3).html());
					var content = $(this).parents("tr").attr("data-text");
					$("#upContent").val(content);
					$("#dialog").dialog({
						width : "400px",
						modal : true,
						title : "자주하는 질문 정보 수정"
					});
				});
				
				$("#cancel").click(function(){
					$("#dialog").dialog("destroy");
				});
				
				$("#cancel2").click(function(){
					$("#dialog2").dialog("destroy");
				});
				
				$("#upBtn").click(function(){
					if($("#up_category").val()=="all"){
						alert("카테고리를 선택해주세요.");
						return;
					}
					else if(!chkData("#upTitle","글 제목을 "))return;
					else if(!chkData("#upContent","글 내용을 "))return;
					else{
						$.ajax({
							url : "/adminFaq/updateFaq",
							data : $("#up_form").serialize(),
							dataType : "text",
							type : "post",
							error : function(){
								alert("자주 묻는 질문 수정에 문제가 발생하였습니다.");
							},
							success : function(data){
								if(data == "SUCCESS"){
									alert("글수정이 완료되었습니다.");
									$("#dialog").dialog("destroy");
									paginative("all");
								}
								else{
									alert("글수정에 오류가 발생하였습니다. 잠시후 다시 시도해주세요.");
								}
							}
							
						});
					}
				});
				
				$("#insertFaq").click(function(){
					$("#insert_form").each(function(){
						this.reset();
					});
					$("#dialog2").dialog({
						width : "400px",
						modal : true,
						title : "자주 묻는 질문 글 쓰기"
					});
				});
				
				$("#inBtn").click(function(){
					if($("#in_category").val()=="all"){
						alert("카테고리를 선택해주세요.");
						return;
					}
					else if(!chkData("#inTitle","글 제목을"))return;
					else if(!chkData("#inContent","글 내용을 "))return;
					else{
						$.ajax({
							url : "/adminFaq/insertFaq",
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
						$("#faq_tbody input[type='checkbox']").prop("checked",true);
					}
					else{
						$("#faq_tbody input[type='checkbox']").prop("checked",false);						
					}
				});
			});//최상위 종료
		</script>
		</c:if>
	</head>
	<body>
		<div class="container-fluid">
		<h5 class="text-left m-0 font-weight-bold text-primary">자주하는 질문 관리</h5>
			<hr class="sidebar-divider">
				
		 <br/>
		 
		 
		  <div class="row">
		 <div class="container-fluid text-right">
		 	<select class="form-control" style="width:117px; display: inline-block;float: left; margin-bottom: 10px" id="f_category" name="f_category">
		 		<option value="all">전체</option>
		 		<option value="회원문의">회원문의</option>
		 		<option value="주문/결제">주문/결제</option>
		 		<option value="교환/반품">교환/반품</option>
		 		<option value="배송문의">배송문의</option>
		 		<option value="쿠폰/적립">쿠폰/적립</option>
		 		<option value="서비스이용">서비스이용</option>
		 	</select>
				<span  class="m-0 font-weight-bold text-default">총</span> 
                  <span id="faqCnt" class="m-0 font-weight-bold text-danger"></span>
                  <span class="m-0 font-weight-bold text-default">개</span> 
                  </div>
            <div class="col-lg-12">
              <div class="card shadow mb-4">
                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                  <h6 class="m-0 font-weight-bold text-primary">자주하는 질문 목록</h6> 
                  <button type="button" id="excelDownBtn" ><img src="/resources/images/excel.png"></button>
                </div>
                <form id="f_form">
                <div class="card-body">
                	<table class="table table-hover" id="faq_table">
                		<colgroup>
                			<col width=3%>
                			<col width=7%>
                			<col width=20%>
                			<col width=18%>
                			<col width=15%>
                		</colgroup>
                		<tr class="text-center">
                			<td><input type="checkbox" id="allCheck"></td>
                			<td>번호</td>
                			<td>카테고리</td>
                			<td>제목</td>
                			<td>수정</td>
                		</tr>
                		<tbody id="faq_tbody">
                			
                		</tbody>
                	</table>
                	<div style="text-align: center;">
                		<div id="pagination" style="display: inline-block;">
                			
                		</div>
                		<div style="float: right;">
                			<input style="font-size : 1rem;" id="insertFaq" type="button" class="btn btn-primary btn-lg" value="글쓰기">
                			<input style="font-size : 1rem;" type="button" id="delFaq" class="btn btn-primary btn-lg" value="삭제">
                		</div>
                	</div>
                	
              
               	</div>
               </form>
              </div>
              </div>
              </div>
              
              <div id="dialog" style="display: none">
              	<form id="up_form">
              		<input type="hidden" name="f_num">
              		<table class="table table-hover" style="font-size : 14px;">
              			<colgroup>
              				<col width="30%">
              				<col width="70%">
              			</colgroup>
              			<tr>
              				<td style="vertical-align: middle;">카테고리</td>
              				<td>
              					<select class="form-control" style="width:117px;display: inline-block;float: left;" id="up_category" name="f_category">
							 		<option value="all">선택하세요</option>
							 		<option value="회원문의">회원문의</option>
							 		<option value="주문/결제">주문/결제</option>
							 		<option value="교환/반품">교환/반품</option>
							 		<option value="배송문의">배송문의</option>
							 		<option value="쿠폰/적립">쿠폰/적립</option>
							 		<option value="서비스이용">서비스이용</option>
							 	</select>
              				</td>
              			</tr>
              			<tr>
              				<td style="padding-top : 18px;"><label for="upTitle">글 제목</label></td>
              				<td><input type="text" class="form-control" name="f_title" id="upTitle"></td>
              			</tr>
              			<tr>
              				<td style="padding-top : 18px;"><label for="upContent">글 내용</label></td>
              				<td>
              					<textarea style="resize: none;" rows="4" class="form-control" name="f_content" id="upContent"></textarea>
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
              		
              		<table class="table table-hover" style="font-size : 14px;">
              			<colgroup>
              				<col width="30%">
              				<col width="70%">
              			</colgroup>
              			<tr>
              				<td style="vertical-align: middle;">카테고리</td>
              				<td>
              					<select class="form-control" style="width:117px;display: inline-block;float: left;" id="in_category" name="f_category">
							 		<option value="all">선택하세요</option>
							 		<option value="회원문의">회원문의</option>
							 		<option value="주문/결제">주문/결제</option>
							 		<option value="교환/반품">교환/반품</option>
							 		<option value="배송문의">배송문의</option>
							 		<option value="쿠폰/적립">쿠폰/적립</option>
							 		<option value="서비스이용">서비스이용</option>
							 	</select>
              				</td>
              			</tr>
              			<tr>
              				<td style="padding-top : 18px;"><label for="inTitle">글 제목</label></td>
              				<td><input type="text" class="form-control" name="f_title" id="inTitle"></td>
              			</tr>
              			<tr>
              				<td style="padding-top : 18px;"><label for="inContent">글 내용</label></td>
              				<td>
              					<textarea style="resize: none;" rows="4" class="form-control" name="f_content" id="inContent"></textarea>
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