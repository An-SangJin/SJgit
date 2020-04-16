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
								$("#p_inqCnt").html(data.length);
							});
						},
						callback : function(data, pagination){
							$("#p_inq_tbody").html("");
							if(data.length!=0){
								$(data).each(function(){
									var pi_num = this.pi_num;
									var m_num = this.m_num;
									var m_name = this.m_name;
									var m_id = this.m_id;
									var p_num = this.p_num;
									var p_name = this.p_name;
									var pi_title = this.pi_title;
									var pi_content = this.pi_content;
									var pi_regdate = this.pi_regdate;
									var pi_emailsend = this.pi_emailsend;
									var pi_smssend = this.pi_smssend;
									var pi_secret = this.pi_secret;
									var pi_state = this.pi_state;
									
									var tr1 = $("<tr>");
									tr1.attr({
										"data-num" : pi_num,
										"data-text" : pi_content
									});
									tr1.addClass("text-center");
									
									var td1 = $("<td>");
									
									var chkBox = $("<input>");
									chkBox.attr({
										"type" : "checkbox",
										"name" : "pi_num",
										"value" : pi_num
									});
									td1.append(chkBox);
									
									var td2 = $("<td>");
									td2.html(pi_num);
									
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
									td6.html(pi_title);
									
									var td7 = $("<td>");
									td7.html(pi_regdate);
									
									var td8 = $("<td>");
									td8.html(pi_secret);
									
									var td9 = $("<td>");
									td9.attr("data-text",pi_emailsend+pi_smssend);
									
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
									
									var confirmBtn = $("<input>");
									confirmBtn.attr({
										"type" : "button",
										"value" : "완료",
										"data-button" : "confirmBtn"
									});
									confirmBtn.addClass("btn btn-primary btn-lg");
									confirmBtn.css({
										"font-size" : "1rem",
										"height" : "30px",
										"line-height" : "0"
									});
									
									if(pi_state=="X"){
										td9.append(updateBtn);
									}
									else{
										td9.append(confirmBtn);										
									}
									
									
									
									var tr2 = $("<tr>");
									tr2.addClass("text-center asd data"+pi_num);
									
									var td10 = $("<td>");
									td10.attr("colspan",3);
									td10.html("본문 내용");
									
									var td11 = $("<td>");
									td11.attr("colspan",6);
									pi_content = pi_content.replace(/(\r)|(\n)|(\r\n)|(\n\r)/g,"<br>");
									td11.html(pi_content);
									
									tr2.append(td10).append(td11);
									
									tr1.append(td1).append(td2).append(td3).append(td4).append(td5).append(td6).append(td7).append(td8).append(td9);
									$("#p_inq_tbody").append(tr1).append(tr2);
									
								});
							}
							else{
								var tr = $("<tr>");
								tr.attr("data-text","no-data");
								tr.addClass("text-center");
								
								var td =$("<td>");
								td.attr("colspan",9);
								td.html("검색 및 저장된 상품 문의 게시물이 없습니다.");
								
								tr.append(td);
								$("#p_inq_tbody").append(tr);
							}
						}
					});
					
				}
				
				
				function listData(search,keyword,startDate,endDate){
					var def = new $.Deferred();
					$.ajax({
						url : "/adminProduct_inq/product_inqList",
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
				
				$(document).on("click","#p_inq_tbody td",function(){
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
				
				$("#delP_inq").click(function(){
					var data = $("#p_inq_form").serialize();
					if(data == ""){
						alert("삭제하실 게시물을 선택해 주세요.");
						return;
					}
					else{
						var bool = 0;
						
						$("input[name='pi_num']").each(function(){
							if($(this).prop("checked")){
								if($(this).parents("tr").find("td").eq(8).find("input").attr("data-button")=="updateBtn"){
									$(this).prop("checked",false);
									bool = bool +1;
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
									url : "/adminProduct_inq/deleteProduct_inq",
									data : $("#p_inq_form").serialize(),
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
						
					}
				});
				
				$("#allCheck").change(function(){
					if($(this).prop("checked")){
						$("#p_inq_tbody input[type='checkbox']").prop("checked",true);
					}
					else{
						$("#p_inq_tbody input[type='checkbox']").prop("checked",false);						
					}
				});
				
				$(document).on("click","input[data-button='updateBtn']",function(){
					$("#dialog").find("form").each(function(){
						this.reset();
					});
					$("#dialog input[name='pi_num']").val($(this).parents("tr").attr("data-num"));
					$("#dialog input[name='m_num']").val($(this).parents("tr").find("td").eq(2).attr("data-num"));
					$("#dialog input[name='pi_content']").val($(this).parents("tr").attr("data-text"));
					$("#dialog input[name='pi_title']").val($(this).parents("tr").find("td").eq(5).html());
					$("#dialog input[name='p_num']").val($(this).parents("tr").find("td").eq(4).attr("data-num"));
					$("#dialog input[name='pi_secret']").val($(this).parents("tr").find("td").eq(7).html());
					
					$("#p_inq_num").html($(this).parents("tr").attr("data-num"));
					
					if($(this).parents("td").attr("data-text")=="OO"){
						$("#dialog input[name='pi_emailsend']").val("O");
						$("#dialog input[name='pi_smssend']").val("O");
						$("#p_inq_send").html("이메일, 휴대폰");
					}
					else if($(this).parents("td").attr("data-text")=="OX"){
						$("#dialog input[name='pi_emailsend']").val("O");
						$("#dialog input[name='pi_smssend']").val("X");
						$("#p_inq_send").html("이메일");
					}
					else if($(this).parents("td").attr("data-text")=="XO"){
						$("#dialog input[name='pi_emailsend']").val("X");
						$("#dialog input[name='pi_smssend']").val("O");						
						$("#p_inq_send").html("휴대폰");
					}
					
					$("#dialog").dialog({
						width : "400px",
						modal : true,
						title : "상품 문의 답변 작성"
					});
				});
				
				$("#cancel").click(function(){
					$("#dialog").dialog("destroy");
				});
				
				$("#cancel2").click(function(){
					$("#dialog2").dialog("destroy");
				});
				
				$("#upBtn").click(function(){
					if(!chkData("#sendTitle","답글 제목을 "))return;
					else if(!chkData("#sendContent","답글 본문을 "))return;
					else{
						$.ajax({
							url : "/adminProduct_inq/replyProcess",
							data : $("#send_form").serialize(),
							dataType : "text",
							error : function(){
								alert("답변 처리를 진행 중 문제가 발생하였습니다. 잠시 후 다시 시도해주세요.");
							},
							success : function(data){
								if(data == "SUCCESS"){
									alert("답변 처리가 완료되었습니다.");
									$("#dialog").dialog("destroy");
									paginative("all","all","","");
								}
								else{
									alert("답변 처리중 오류가 발생하였습니다. 잠시 후 다시 시도해주세요.");
								}
							}
						});
					}
				});
				
				$(document).on("click","input[data-button='confirmBtn']",function(){
					$("#inq_num").html($(this).parents("tr").attr("data-num"));
					if($(this).parents("td").attr("data-text")=="OO"){
						$("#inq_send").html("이메일, 휴대폰")
					}
					else if($(this).parents("td").attr("data-text")=="OX"){
						$("#inq_send").html("이메일");
					}
					else if($(this).parents("td").attr("data-text")=="XO"){
						$("#inq_send").html("휴대폰");
					}
					$.ajax({
						url : "/adminProduct_inq/replyLookup",
						data : "pi_num="+$(this).parents("tr").attr("data-num"),
						dataType : "json",
						type : "post",
						error : function(){
							alert("답글 정보를 가져오는데 오류가 발생하였습니다.");
						},
						success : function(data){
							console.log(data);
							
							$("#inq_re_title").html(data.pi_title);
							$("#inq_re_content").html(data.pi_content);
						}
					});
					
					$("#dialog2").dialog({
						width : "400px",
						modal : true,
						title : "상품 문의 답변"
					});
				});
				
			});//최상위 종료
		</script>
		</c:if>
	</head>
	<body>
		<div class="container-fluid">
		<h5 class="text-left m-0 font-weight-bold text-primary">상품 문의 게시판 관리</h5>
			<hr class="sidebar-divider">
				
		 <br/>
		 
		 
		  <div class="row">
		 <div class="container-fluid text-right">
		 		<select style="width:117px; display: inline-block; float:left; margin-bottom:10px;" id="search" class="form-control" name="search">
			 		<option value="all">전체</option>
			 		<option value="m_name">회원명</option>
			 		<option value="pi_title">제목</option>
			 		<option value="re_content">본문</option>
			 		<option value="re_regdate">게시일자</option>
			 		<option value="p_name">상품명</option>
			 	</select>

		 	<input autocomplete="off" type="text" readonly="readonly" name="startDate" id="startDate" class="form-control" style="display : none;width:150px;  float: left; margin-left:10px;">
		 	<input autocomplete="off" type="text" readonly="readonly" name="endDate" id="endDate" class="form-control" style="display : none;width:150px; float: left; margin-left:10px;">
		 	<input autocomplete="off" type="text" disabled="disabled" name="keyword" id="keyword" class="form-control" style="width:150px; display: inline-block; float: left; margin-left:10px;">
		 	
		 	<input style="font-size : 1rem; float: left; margin-left:10px;height:38px;" id="searchBtn" type="button" class="btn btn-primary btn-lg" value="검색">
		 
				<span  class="m-0 font-weight-bold text-default">총</span> 
                  <span id="p_inqCnt" class="m-0 font-weight-bold text-danger"></span>
                  <span class="m-0 font-weight-bold text-default">개</span> 
                  </div>
            <div class="col-lg-12">
              <div class="card shadow mb-4">
                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                <h6 class="m-0 font-weight-bold text-primary">상품 문의 게시판 목록</h6> 
                  <button type="button" id="excelDownBtn" ><img src="/resources/images/excel.png"></button>
                </div>
                <form id="p_inq_form">
                <div class="card-body">
                	<table class="table table-hover" id="p_inq_table">
                		<colgroup>
                			<col width=3%>
                			<col width=7%>
                			<col width=10%>
                			<col width=15%>
                			<col width=15%>
                			<col width=15%>
                			<col width=10%>
                			<col width=10%>
                			<col width=15%>
                		</colgroup>
                		<tr class="text-center">
                			<td><input type="checkbox" id="allCheck"></td>
                			<td>번호</td>
                			<td>회원명</td>
                			<td>회원ID</td>
                			<td>상품명</td>
                			<td>글 제목</td>
                			<td>등록일자</td>
                			<td>비밀글여부</td>
                			<td>답글처리</td>
                		</tr>
                		<tbody id="p_inq_tbody">
                			
                		</tbody>
                	</table>
                	<div style="text-align: center;">
                		<div id="pagination" style="display: inline-block;">
                			
                		</div>
                		<div style="float: right;">
                			<input style="font-size : 1rem;" id="delP_inq" type="button" class="btn btn-primary btn-lg" value="삭제">
                		</div>
                	</div>
                	
              
               	</div>
               </form>
              </div>
              </div>
              </div>
              
              <div id="dialog" style="display: none">
              	<form id="send_form">
              		<input type="hidden" name="pi_num">
              		<input type="hidden" name="m_num">
              		<input type="hidden" name="pi_content">
              		<input type="hidden" name="pi_title">
              		<input type="hidden" name="pi_emailsend">
              		<input type="hidden" name="pi_smssend">
              		
              		<input type="hidden" name="p_num">
              		<input type="hidden" name="pi_secret">
              		<table class="table table-hover" style="font-size : 14px;">
              			<colgroup>
              				<col width="30%">
              				<col width="70%">
              			</colgroup>
              			<tr>
              				<td>문의글 번호</td>
              				<td id="p_inq_num"></td>
              			</tr>
              			<tr>
              				<td>전송 여부</td>
              				<td id="p_inq_send"></td>
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
              
              <div id="dialog2" style="display:none;">
              	<table class="table table-hover" style="font-size : 14px;">
              		<colgroup>
              			<col width="30%">
              			<col width="70%">
              		</colgroup>
              		<tr>
              			<td>본글 번호</td>
              			<td id="inq_num"></td>
              		</tr>
              		<tr>
              			<td>전송 여부</td>
              			<td id="inq_send"></td>
              		</tr>
              		<tr>
              			<td>답글 제목</td>
              			<td id="inq_re_title"></td>
              		</tr>
              		<tr>
              			<td>답글 본문</td>
              			<td id="inq_re_content"></td>
              		</tr>
              	</table>
              	<div style="text-align: right;">
       				<input type="button" value="닫기" id="cancel2" class="btn btn-primary btn-1g" style="font-size:1rem;height: 30px;line-height: 0;">
           		</div>
              </div>
              
              
              
           </div>
	</body>
</html>