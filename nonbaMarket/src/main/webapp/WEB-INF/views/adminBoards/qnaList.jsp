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
				paginative("all");
				function paginative(q_category){
					container.pagination({
						dataSource : function(done){
							listData(q_category).then(function(data){
								done(data);
								$("#qnaCnt").html(data.length);
							});
						},
						callback : function(data, pagination){
							$("#qna_tbody").html("");
							if(data.length!=0){
								$(data).each(function(){
									var q_num = this.q_num;
									var m_num = this.f_category;
									var m_id = this.m_id;
									var o_num = this.o_num;
									var q_category = this.q_category;
									var q_title = this.q_title;
									var q_email = this.q_email;
									var q_phone = this.q_phone;
									var q_content = this.q_content;
									var q_attimg = this.q_attimg;
									var q_emailsend = this.q_emailsend;
									var q_smssend = this.q_smssend;
									var q_state = this.q_state;
				
									var tr1 = $("<tr>");
									tr1.attr({
										"data-num" : q_num,
										"data-text" : q_content
									});
									tr1.addClass("text-center");
									
									var td1 = $("<td>");
									
									var chkBox = $("<input>");
									chkBox.attr({
										"type" : "checkbox",
										"name" : "q_num",
										"value" : q_num
									});
									td1.append(chkBox);
									
									var td2 = $("<td>");
									td2.html(q_num);
									
									var td22 = $("<td>");
									td22.html(m_id);
									
									var td3 = $("<td>");
									if(o_num==0){
										td3.html("X");
									}
									else{
										td3.html(o_num);
									}
									
									var td4 = $("<td>");
									td4.html(q_category);
									
									var td5 = $("<td>");
									td5.html(q_title);
									
									var td6 = $("<td>");
									td6.html(q_email);
									
									var td7 = $("<td>");
									td7.html(q_phone);
									
									var td8 = $("<td>");
									td8.html(q_state);
									
									var td9 = $("<td>");
									td9.attr("data-text",q_emailsend+q_smssend);
									var updateBtn = $("<input>");
									updateBtn.attr({
										"type" : "button",
										"value" : "처리",
										"data-button":"updateBtn"
									})
									updateBtn.addClass("btn btn-primary btn-lg");
									updateBtn.css({
										"font-size" : "1rem",
										"height" : "30px",
										"line-height" : "0"
									});
									if(q_state=="X"){
										td9.append(updateBtn);									
									}
									else{
										td9.append("완료");
									}
									var tr2 = $("<tr>");
									tr2.addClass("text-center asd data"+q_num);
									
									var td10 = $("<td>");
									td10.attr("colspan",4);
									td10.html("본문 내용");
									
									var td11 = $("<td>");
									td11.attr("colspan", 6);
									var div = $("<div>");
									div.addClass("text-center");
									q_content = q_content.replace(/(\r)|(\n)|(\r\n)|(\n\r)/g,"<br>");
									
									var img = $("<img>");
									if(q_attimg !=null){
										img.attr({
											"src" : q_attimg
										})
									}
									div.append(img).append(q_content);
									//div.html(q_content);
									td11.append(div);
									
									tr2.append(td10).append(td11);
									
									tr1.append(td1).append(td2).append(td22).append(td3).append(td4).append(td5).append(td6).append(td7).append(td8).append(td9);
									
									$("#qna_tbody").append(tr1).append(tr2);
								});
							}
						}
					})
				}
				
				function listData(q_category){
					var def = new $.Deferred();
					$.ajax({
						url : "/adminQna/qnaList",
						type : "post",
						data : "q_category="+q_category,
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
				
				$("#q_category").change(function(){
					paginative($(this).val());
				});
				
				$(document).on("click","#qna_tbody td",function(){
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
				
				$("#delQna").click(function(){
					var data = $("#q_form").serialize();
					
					if(data == ""){
						alert("삭제하실 게시물을 선택해 주세요.");
						return;
					}
					else{
						var bool = 0;
						$("input[name='q_num']").each(function(){
							if($(this).prop("checked")){
								if($(this).parents("tr").find("td").eq(8).html()!="O"){
									$(this).prop("checked",false);
									bool = bool+1;
								}
							}
						});
						
						if(bool!=0){
							alert("처리되지 않은 문의는 삭제하실수 없습니다.");
							return;
						}
						else{
							if(confirm("선택한 게시물을 삭제하시겠습니까?")){
								$.ajax({
									url : "/adminQna/deleteQna",
									data : $("#q_form").serialize(),
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
								});
							}
						}
						
					}
				});
				
				$(document).on("click","input[data-button='updateBtn']",function(){
					$("#dialog").find("form").each(function(){
						this.reset();
					});
					$("#dialog input[name='q_num']").val($(this).parents("tr").attr("data-num"));
					$("#dialog input[name='q_content']").val($(this).parents("tr").attr("data-text"));
					$("#dialog input[name='q_category']").val($(this).parents("tr").find("td").eq(4).html());
					$("#dialog input[name='q_title']").val($(this).parents("tr").find("td").eq(5).html())
					if($(this).parents("td").attr("data-text")=="OO"){
						$("#dialog input[name='q_emailsend']").val("O");
						$("#dialog input[name='q_smssend']").val("O");
						$("#qna_send").html("이메일, 휴대폰");
					}
					else if($(this).parents("td").attr("data-text")=="OX"){
						$("#dialog input[name='q_emailsend']").val("O");
						$("#dialog input[name='q_smssend']").val("X");
						$("#qna_send").html("이메일");
					}
					else if($(this).parents("td").attr("data-text")=="XO"){
						$("#dialog input[name='q_emailsend']").val("X");
						$("#dialog input[name='q_smssend']").val("O");						
						$("#qna_send").html("휴대폰");
					}
					
					$("#qna_num").html($(this).parents("tr").attr("data-num"));
					
					$("#dialog").dialog({
						width : "400px",
						modal : true,
						title : "자주하는 질문 정보 수정"
					});
				});
				
				$("#cancel").click(function(){
					$("#dialog").dialog("destroy");
				});
				
				$("#upBtn").click(function(){
					if(!chkData("#sendTitle","답글 제목을 "))return;
					else if(!chkData("#sendContent","답글 본문을 "))return;
					else{
						$.ajax({
							url : "/adminQna/replyProcess",
							data : $("#send_form").serialize(),
							dataType : "text",
							error : function(){
								alert("답변 처리를 진행 중 문제가 발생하였습니다. 잠시 후 다시 시도해주세요.");
							},
							success : function(data){
								if(data == "SUCCESS"){
									alert("답변 처리가 완료되었습니다.");
									$("#dialog").dialog("destroy");
									paginative("all");
								}
								else{
									alert("답변 처리중 오류가 발생하였습니다. 잠시 후 다시 시도해주세요.");
								}
							}
						});
					}
				});
				
				$("#allCheck").change(function(){
					if($(this).prop("checked")){
						$("#qna_tbody input[type='checkbox']").prop("checked",true);
					}
					else{
						$("#qna_tbody input[type='checkbox']").prop("checked",false);						
					}
				});
			});//최상위 종료
		</script>
		</c:if>
	</head>
	<body>
		<div class="container-fluid">
		<h5 class="text-left m-0 font-weight-bold text-primary">1:1문의 관리</h5>
			<hr class="sidebar-divider">
				
		 <br/>
		 
		  <div class="row">
		 <div class="container-fluid text-right">
		 	<select class="form-control" style="width:117px; display: inline-block;float: left; margin-bottom: 10px" id="q_category" name="q_category">
		 		<option value="all">전체</option>
		 		<option value="배송지연">배송지연</option>
		 		<option value="반품문의">반품문의</option>
		 		<option value="A/S문의">A/S문의</option>
		 		<option value="환불문의">환불문의</option>
		 		<option value="주문결제">주문결제</option>
		 		<option value="회원정보">회원정보</option>
		 		<option value="취소문의">취소문의</option>
		 		<option value="교환문의">교환문의</option>
		 		<option value="기타문의">기타문의</option>
		 	</select>
				<span  class="m-0 font-weight-bold text-default">총</span> 
                  <span id="qnaCnt" class="m-0 font-weight-bold text-danger"></span>
                  <span class="m-0 font-weight-bold text-default">개</span> 
                  </div>
            <div class="col-lg-12">
              <div class="card shadow mb-4">
                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                   <h6 class="m-0 font-weight-bold text-primary">1:1문의게시판 목록</h6>
                  <button type="button" id="excelDownBtn" ><img src="/resources/images/excel.png"></button>
                </div>
                <form id="q_form">
                <div class="card-body">
                	<table class="table table-hover" id="qna_table">
                		<colgroup>
                			<col width=3%>
                			<col width=7%>
                			<col width=10%>
                			<col width=10%>
                			<col width=15%>
                			<col width=15%>
                			<col width=15%>
                			<col width=10%>
                			<col width=7%>
                			<col width=8%>
                		</colgroup>
                		<tr class="text-center">
                			<td><input type="checkbox" id="allCheck"></td>
                			<td>번호</td>
                			<td>회원아이디</td>
                			<td>주문번호</td>
                			<td>카테고리</td>
                			<td>제목</td>
                			<td>이메일</td>
                			<td>휴대전화</td>
                			<td>답변상태</td>
                			<td>답변처리</td>
                		</tr>
                		<tbody id="qna_tbody">
                			
                		</tbody>
                	</table>
                	<div style="text-align: center;">
                		<div id="pagination" style="display: inline-block;">
                			
                		</div>
                		<div style="float: right;">
                			<input style="font-size : 1rem;" id="delQna" type="button" class="btn btn-primary btn-lg" value="선택삭제">
                		</div>
                	</div>
                	
              
               	</div>
               </form>
              </div>
              </div>
              </div>
              
              <div id="dialog" style="display: none">
              	<form id="send_form">
              		<input type="hidden" name="q_num">
              		<input type="hidden" name="q_content">
              		<input type="hidden" name="q_category">
              		<input type="hidden" name="q_title">
              		<input type="hidden" name="q_emailsend">
              		<input type="hidden" name="q_smssend">
              		<table class="table table-hover" style="font-size : 14px;">
              			<colgroup>
              				<col width="30%">
              				<col width="70%">
              			</colgroup>
              			<tr>
              				<td>문의글 번호</td>
              				<td id="qna_num"></td>
              			</tr>
              			<tr>
              				<td>전송 여부</td>
              				<td id="qna_send"></td>
              			</tr>
              			<tr>
              				<td style="padding-top : 18px"><label for="sendTitle">답글 제목</label></td>
              				<td><input type="text" class="form-control" name="sendTitle" id="sendTitle"></td>
              			</tr>
              			<tr>
              				<td style="padding-top: 18px;"><label for="sendContent">답글 본문</label></td>
              				<td>
              					<textarea style="resize: none;" rows="5" class="form-control" name="sendContent" id="sendContent"></textarea>
              				</td>
              			</tr>
              		</table>
              		<div style="text-align: right;">
           				<input type="button" value="전송" id="upBtn" class="btn btn-primary btn-1g" style="font-size:1rem;height: 30px;line-height: 0;">
           				<input type="button" value="취소" id="cancel" class="btn btn-primary btn-1g" style="font-size:1rem;height: 30px;line-height: 0;">
           			</div>
              	</form>
              </div>
              
              
           </div>
	</body>
</html>