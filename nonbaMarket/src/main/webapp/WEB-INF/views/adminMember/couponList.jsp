<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
			#c_expire.form-control[readonly]{
				background-color: white !important;
			}
			
			#c_expire.form-control:disabled{
				background-color: #eaecf4 !important;
			}
			
			.ui-dialog{
				position: fixed !important;
				top:30% !important;
				left:35% !important;
			}
			
			#ICoupon_tbody td{
				vertical-align: middle;
			}
			
			#myTitle span{
				cursor: pointer;
			}
		</style>
		
		<link rel="stylesheet" type="text/css" href="/resources/include/css/pagination.css">
		<script type="text/javascript" src="/resources/include/js/pagination.min.js"></script>
		<script type="text/javascript" src="/resources/include/js/common.js"></script>
		<!--[if lt IE 9]>
		<script src="/resources/include/js/html5shiv.js"></script>
		<![endif]-->
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
			var data;
			$(function(){
				$("#chkPercent").change(function(){
					if($("#chkPercent").prop("checked")){
						$("#c_percent1").attr("disabled","disabled");
						$("#c_percent2").attr("disabled","disabled");
					}
					else{
						$("#c_percent1").removeAttr("disabled");
						$("#c_percent2").removeAttr("disabled");
					}
				});
				
				$("#chkExpire").change(function(){
					if($(this).prop("checked")){
						$("#c_expire").attr("disabled","disabled");
						$("#dateBtn").attr("disabled","disabled");
					}
					else{
						$("#c_expire").removeAttr("disabled");
						$("#dateBtn").removeAttr("disabled");
					}
				});
			
				
				$("#c_expire").datepicker({
					changeMonth : true,
					changeYear : true,
					dateFormat : 'yy-mm-dd',
					minDate : -0
				});	
				
				$("#i_c_expire").datepicker({
					changeMonth : true,
					changeYear : true,
					dateFormat : 'yy-mm-dd',
					minDate : -0
				});
				
				$("#dateBtn").click(function(){
					$("#c_expire").focus();
				});
				
				$("#dateBtn2").click(function(){
					$("#i_c_expire").focus();
				});
				
				$("#c_percent1").keyup(function(){
					$("#c_percent1").val($("#c_percent1").val().replace(/[^0-9]/g,""));
				});
				
				$("#c_percent2").keyup(function(){
					$("#c_percent2").val($("#c_percent2").val().replace(/[^0-9]/g,""));
				});
				
				
				var container = $("#pagination");
				
				$("#searchBtn").click(function(){					
					
					if(!$("#chkPercent").prop("checked")){
						if($("#c_percent1").val() >100){
							alert("혜택(%)의 범위는 0~100 사이의 숫자만 작성할 수 있습니다.");
							$("#c_percent1").focus();
							return;
						}
						
						if($("#c_percent2").val() > 100){
							alert("혜택(%)의 범위는 0~100 사이의 숫자만 작성할 수 있습니다.");
							$("#c_percent2").focus();
							return;
						}
						
						
						if(!chkData("#c_percent1","혜택(%)의 시작값을"))return;
						else if(!chkData("#c_percent2","혜택(%)의 끝값을"))return;
						else if($("#c_percent2").val() < $("#c_percent1").val()){
							alert("혜택(%)의 시작 값은 끝나는 값보다 클 수없습니다.");
							$("#c_percent1").focus();
							return;
						}
					}
					
					if(!$("#chkExpire").prop("checked")){
						if($("#c_expire").val()==""){
							if(confirm("유효기간의 날짜를 선택하면 전체 기간으로 검색됩니다. 진행하시겠습니까?")){
								container.pagination({
									dataSource : function(done){
										listData().then(function(data){
											done(data);
											$("#couponCnt").html(data.length);
										});
									},
									callback : function(data, pagination){
										$("#coupon_tbody").html("");
										if(data.length!=0){
											$(data).each(function(){
												var c_num = this.c_num;
												var c_name = this.c_name;
												var c_func = this.c_func;
												var c_percent = this.c_percent;
												var c_expire = this.c_expire;
												var a_name = this.a_name;
												
												var tr = $("<tr>");
												tr.attr("data-num",c_num);
												tr.addClass("text-center");
												
												var td7 = $("<td>");
												
												var chkBox = $("<input>");
												chkBox.attr({
													"type" : "checkbox",
													"name" : "c_num",
													"value" : c_num
												});
												
												td7.append(chkBox);
												
												var td6 = $("<td>");
												td6.html(c_num);
												
												var td1 = $("<td>");
												td1.html(c_name);
												
												var td2 = $("<td>");
												td2.html(c_func);
												
												var td3 = $("<td>");
												td3.html(c_percent+"%");
												
												var td4 = $("<td>");
												td4.html(c_expire);
												
												var td5 = $("<td>");
												td5.html(a_name);
												
												tr.append(td7).append(td6).append(td1).append(td2).append(td3).append(td4).append(td5);
												$("#coupon_tbody").append(tr);
											});
										}
										else{
											var tr = $("<tr>");
											tr.attr("data-text","no-data");
											tr.addClass("text-center");
											
											var td = $("<td>");
											td.attr("colspan","6");
											td.html("검색 및 저장된 쿠폰이 없습니다.");
											
											tr.append(td);
											$("#coupon_tbody").append(tr);
										}
									}
								});
							}
							else{
								$("#c_expire").focus();
								return;
							}
						}
					}
					else{
						container.pagination({
							dataSource : function(done){
								listData().then(function(data){
									done(data);
									$("#couponCnt").html(data.length);
								});
							},
							callback : function(data, pagination){
								$("#coupon_tbody").html("");
								if(data.length!=0){
									$(data).each(function(){
										var c_num = this.c_num;
										var c_name = this.c_name;
										var c_func = this.c_func;
										var c_percent = this.c_percent;
										var c_expire = this.c_expire;
										var a_name = this.a_name;
										
										var tr = $("<tr>");
										tr.attr("data-num",c_num);
										tr.addClass("text-center");
										
										var td7 = $("<td>");
										
										var chkBox = $("<input>");
										chkBox.attr({
											"type" : "checkbox",
											"name" : "c_num",
											"value" : c_num
										});
										
										td7.append(chkBox);
										
										var td6 = $("<td>");
										td6.html(c_num);
										
										var td1 = $("<td>");
										td1.html(c_name);
										
										var td2 = $("<td>");
										td2.html(c_func);
										
										var td3 = $("<td>");
										td3.html(c_percent+"%");
										
										var td4 = $("<td>");
										td4.html(c_expire);
										
										var td5 = $("<td>");
										td5.html(a_name);
										
										tr.append(td7).append(td6).append(td1).append(td2).append(td3).append(td4).append(td5);
										$("#coupon_tbody").append(tr);
									});
								}
								else{
									var tr = $("<tr>");
									tr.attr("data-text","no-data");
									tr.addClass("text-center");
									
									var td = $("<td>");
									td.attr("colspan","6");
									td.html("검색 및 저장된 쿠폰이 없습니다.");
									
									tr.append(td);
									$("#coupon_tbody").append(tr);
								}
							}
						});
					}
				});
				var container = $("#pagination");
				container.pagination({
					dataSource : function(done){
						listData().then(function(data){
							done(data);
							$("#couponCnt").html(data.length);
						});
					},
					callback : function(data, pagination){
						$("#coupon_tbody").html("");
						if(data.length!=0){
							$(data).each(function(){
								var c_num = this.c_num;
								var c_name = this.c_name;
								var c_func = this.c_func;
								var c_percent = this.c_percent;
								var c_expire = this.c_expire;
								var a_name = this.a_name;
								
								var tr = $("<tr>");
								tr.attr("data-num",c_num);
								tr.addClass("text-center");
								
								var td7 = $("<td>");
								
								var chkBox = $("<input>");
								chkBox.attr({
									"type" : "checkbox",
									"name" : "c_num",
									"value" : c_num
								});
								
								td7.append(chkBox);
								
								var td6 = $("<td>");
								td6.html(c_num);
								
								var td1 = $("<td>");
								td1.html(c_name);
								
								var td2 = $("<td>");
								td2.html(c_func);
								
								var td3 = $("<td>");
								td3.html(c_percent+"%");
								
								var td4 = $("<td>");
								td4.html(c_expire);
								
								var td5 = $("<td>");
								td5.html(a_name);
								
								tr.append(td7).append(td6).append(td1).append(td2).append(td3).append(td4).append(td5);
								$("#coupon_tbody").append(tr);
							});
						}
						else{
							var tr = $("<tr>");
							tr.attr("data-text","no-data");
							tr.addClass("text-center");
							
							var td = $("<td>");
							td.attr("colspan","7");
							td.html("검색 및 저장된 쿠폰이 없습니다.");
							
							tr.append(td);
							$("#coupon_tbody").append(tr);
						}
					}
				});
				
				function listData(){
					var def = new $.Deferred();
					$.ajax({
						url : "/adminCoupon/couponList",
						type : "post",
						data : $("#c_searchForm").serialize(),
						dataType : "json",
						error : function(){
							alert("쿠폰 리스트를 불러오는데 문제가 발생하였습니다. 잠시후 다시 시도해주세요.");
						},
						success : function(data){
							def.resolve(data);
							
						}
					});
					return def.promise();
				}
				
				var pagination2 = $("#pagination2");
					
				$(document).on("click","#coupon_tbody td",function(){
					if($(this).find("input").attr("type")=="checkbox"){
						
						return;
					}
					else if($(this).parents("tr").attr("data-num")){
						var c_num = $(this).parents("tr").attr("data-num");
						pagination2.pagination({
							dataSource : function(done){
								$.getJSON("/AdminIssue_coupon/issue_couponList?c_num="+c_num,function(data){
									done(data);									
								}).fail(function(){
									alert("발급된 쿠폰정보를 불러오는데 오류가 있습니다. 잠시 후 다시 시도해주세요.");
								});
							},
							pageSize : 5,
							callback : function(data, pagination){
 								$("#ICoupon_tbody").html("");
								$("#ICoupon_tbody").attr("data-num",c_num); 
								if(data.length!=0){
									$(data).each(function(){
										var i_num = this.i_num;
										var m_num= this.m_num;
										var m_name = this.m_name;
										var m_id = this.m_id;
										var i_regdate = this.i_regdate;
										var c_expire = this.c_expire;
										var i_state = this.i_state;
										
										var tr = $("<tr>");
										tr.addClass("text-center");
										tr.attr("data-num",i_num); 
										
										var td1 = $("<td>");
										td1.html(i_num);
										
										var td2 = $("<td>");
										td2.html(m_name);
										
										var td3 = $("<td>");
										td3.html(m_id);
										
										var td4 = $("<td>");
										td4.html(i_regdate+"~"+c_expire);
										td4.attr("data-text",c_expire);
										
										var td5 = $("<td>");
										if(i_state == "X"){
											td5.html("미사용");
										}
										else{
											td5.html("사용완료");
										}
										
										var td6 = $("<td>");
										
										var delBtn = $("<input>");
										delBtn.addClass("btn btn-info btn-lg");
										delBtn.attr({
											"type" : "button",
											"value" : "삭제",
											"data-button" : "delConfirm"
										});
										td6.append(delBtn);
										
										tr.append(td1).append(td2).append(td3).append(td4).append(td5).append(td6);
										$("#ICoupon_tbody").append(tr);
									});
								}
								else{
									$("#ICoupon_tbody").html("");
									var tr = $("<tr>");
									tr.addClass("text-center");
									var td = $("<td>");
									td.attr("colspan",6);
									td.html("이 쿠폰은 아직 발급되지 않았습니다.");
									tr.append(td);
									$("#ICoupon_tbody").append(tr);
								}
							}
						});
						$("#dialog").dialog({
							width : "750px",
							modal : true,
							title : "발급 쿠폰 정보"
						});
					}
					
					
				});//ㅅㅂ
				$(document).on("click","#ICoupon_tbody input[data-button='delConfirm']",function(){
					var expireDay = $(this).parents("tr").find("td").eq(3).attr("data-text");
					
					var i_num = $(this).parents("tr").attr("data-num");
					var c_num = $("#ICoupon_tbody").attr("data-num");
					var date1 = new Date();
					var date2 = new Date(expireDay);
					console.log(date1.getTime());
					console.log(date2.getTime());
					console.log("12312312");
					if(confirm("삭제하시겠습니까?")){
						if(date1.getTime() < date2.getTime()){
							alert("유효기간이 지나지 않은 발급쿠폰은 삭제할 수없습니다.");
						}
						else{
							$.ajax({
								url : "/AdminIssue_coupon/deleteIssue_coupon",
								data : "i_num="+i_num,
								dateType : "text",
								type : "post",
								error : function(){
									alert("쿠폰 삭제하는데 문제가 생겼습니다. 잠시후 다시 시도해주세요.");
								},
								success : function(data){
									console.log(data);
									if(data=="SUCCESS"){
										alert("삭제되었습니다.");
										pagination2.pagination({
											dataSource : function(done){
												$.getJSON("/AdminIssue_coupon/issue_couponList?c_num="+c_num,function(data){
													done(data);									
												}).fail(function(){
													alert("발급된 쿠폰정보를 불러오는데 오류가 있습니다. 잠시 후 다시 시도해주세요.");
												});
											},
											pageSize : 5,
											callback : function(data, pagination){
												$("#ICoupon_tbody").html("");
												$("#ICoupon_tbody").attr("data-num",c_num);
												if(data.length!=0){
													$(data).each(function(){
														var i_num = this.i_num;
														var m_num= this.m_num;
														var m_name = this.m_name;
														var m_id = this.m_id;
														var i_regdate = this.i_regdate;
														var c_expire = this.c_expire;
														var i_state = this.i_state;
														
														var tr = $("<tr>");
														tr.addClass("text-center");
														tr.attr("data-num",i_num); 
														
														var td1 = $("<td>");
														td1.html(i_num);
														
														var td2 = $("<td>");
														td2.html(m_name);
														
														var td3 = $("<td>");
														td3.html(m_id);
														
														var td4 = $("<td>");
														td4.html(i_regdate+"~"+c_expire);
														td4.attr("data-text",c_expire);
														
														var td5 = $("<td>");
														if(i_state == "X"){
															td5.html("미사용");
														}
														else{
															td5.html("사용완료");
														}
														
														var td6 = $("<td>");
														
														var delBtn = $("<input>");
														delBtn.addClass("btn btn-info btn-lg");
														delBtn.attr({
															"type" : "button",
															"value" : "삭제"
														});
														td6.append(delBtn);
														
														tr.append(td1).append(td2).append(td3).append(td4).append(td5).append(td6);
														$("#ICoupon_tbody").append(tr);
													});
												}
												else{
													$("#ICoupon_tbody").html("");
													var tr = $("<tr>");
													tr.addClass("text-center");
													var td = $("<td>");
													td.attr("colspan",6);
													td.html("이 쿠폰은 아직 발급되지 않았습니다.");
													tr.append(td);
													$("#ICoupon_tbody").append(tr);
												}
											}
										});
									}
									else{
										alert("쿠폰 삭제하는데 문제가 생겼습니다. 잠시후 다시 시도해주세요.");
									}
								}
							});
						}
					} 
					
					
				});
				
				$("#allCheck").change(function(){
					if($(this).prop("checked")){
						$("#coupon_tbody input[type='checkbox']").prop("checked",true);
					}
					else{
						$("#coupon_tbody input[type='checkbox']").prop("checked",false);						
					}
				});
				
				$("#delCoupon").click(function(){
					console.log($(this).parents("form").serialize());
					if($(this).parents("form").serialize()==""){
						alert("삭제하실 쿠폰을 선택해주세요.");
						return;
					}
					
					if(confirm("유효기간이 지나지 않은 쿠폰을 삭제시 문제가 발생 할 수있습니다. 삭제하시겠습니까?")){
						$.ajax({
							url : "/adminCoupon/deleteCoupon",
							data : $(this).parents("form").serialize(),
							dataType : "text",
							type : "post",
							error : function(){
								alert("오류")
							},
							success : function(data){
								if(data = "SUCCESS"){
									alert("삭제가 성공적으로 완료되었습니다.");
									container.pagination({
										dataSource : function(done){
											listData().then(function(data){
												done(data);
												$("#couponCnt").html(data.length);
											});
										},
										callback : function(data, pagination){
											$("#coupon_tbody").html("");
											if(data.length!=0){
												$(data).each(function(){
													var c_num = this.c_num;
													var c_name = this.c_name;
													var c_func = this.c_func;
													var c_percent = this.c_percent;
													var c_expire = this.c_expire;
													var a_name = this.a_name;
													
													var tr = $("<tr>");
													tr.attr("data-num",c_num);
													tr.addClass("text-center");
													
													var td7 = $("<td>");
													
													var chkBox = $("<input>");
													chkBox.attr({
														"type" : "checkbox",
														"name" : "c_num",
														"value" : c_num
													});
													
													td7.append(chkBox);
													
													var td6 = $("<td>");
													td6.html(c_num);
													
													var td1 = $("<td>");
													td1.html(c_name);
													
													var td2 = $("<td>");
													td2.html(c_func);
													
													var td3 = $("<td>");
													td3.html(c_percent+"%");
													
													var td4 = $("<td>");
													td4.html(c_expire);
													
													var td5 = $("<td>");
													td5.html(a_name);
													
													tr.append(td7).append(td6).append(td1).append(td2).append(td3).append(td4).append(td5);
													$("#coupon_tbody").append(tr);
												});
											}
											else{
												var tr = $("<tr>");
												tr.attr("data-text","no-data");
												tr.addClass("text-center");
												
												var td = $("<td>");
												td.attr("colspan","6");
												td.html("검색 및 저장된 쿠폰이 없습니다.");
												
												tr.append(td);
												$("#coupon_tbody").append(tr);
											}
										}
									});
								}
							}
						});
						
					}
				});
				
				$("#addCoupon").click(function(){
					var cnt = 0;
					var chkCnum;
					$(this).parents("form").find("input[name='c_num']").each(function(){
						if($(this).prop("checked")){
							cnt = cnt + 1;
							chkCnum = $(this).val();
						}
					});
					console.log("cnt : "+cnt);
					if($(this).parents("form").serialize()==""){
						alert("배포하실 쿠폰을 선택해 주세요.");
						return;
					}
					else if(cnt!=1){
						alert("한개의 쿠폰씩 배포가 가능합니다.");
						return;
					}
					else{
						$("#dialog2").dialog({
							modal : true,
							title : "쿠폰 배포"
						});
						$("#dialog2").find("input[name='c_num']").val(chkCnum);
					}
				});
				
				$("#baepo").click(function(){
					if($("#grade").val()=="0"){
						alert("등급을 선택해주세요.");
					}
					else{
						$.ajax({
							url : "/AdminIssue_coupon/insertIssue_coupon",
							type : "post",
							data : "c_num="+$("#dialog2").find("input[name='c_num']").val()+"&g_num="+$("#grade").find("option:selected").val(),
							dataType : "text",
							error : function(){
								alert("쿠폰 배포하는데 오류가 발생하였습니다.");
							},
							success : function(data){
								if(data=="SUCCESS"){
									alert("쿠폰발급이 완료되었습니다.");
									$("#dialog2").dialog("destroy");
								}
								else{
									alert("쿠폰발급에 오류가 발생하였습니다.");
								}
							}
						})
					}
				});
				
				$("#couponSearch").click(function(){
					$("#card-body1").css("display","block");
					$("#card-body2").css("display","none");
					$("#insertBtn").css("display","none");
					$("#searchBtn").css("display","inline-block");
				});
				
				$("#couponCreate").click(function(){
					$("#card-body1").css("display","none");
					$("#card-body2").css("display","block");
					$("#searchBtn").css("display","none");
					$("#insertBtn").css("display","inline-block");
				});
				
				$("#c_percent").keyup(function(){
					$("#c_percent").val($("#c_percent").val().replace(/[^0-9]/g,""));
				});
				
				$("#insertBtn").click(function(){
					
					if(!chkData("#i_c_name","쿠폰명을"))return;
					else if(!chkData("#c_percent","혜택(%)를"))return;
					else if(!chkData("#i_c_expire","유효기간을"))return;
					else if($("#c_percent")>100){
						alert("혜택(%)는 100이상의 숫자가 될수 없습니다.");
						return;
					}
					else if($("#i_a_num").val()=="선택하세요."){
						alert("관리자를 선택해주세요.");
						return;
					}
					else{
						$.ajax({
							url : "/adminCoupon/insertCoupon",
							data : $("#c_insertForm").serialize(),
							type : "post",
							dataType : "text",
							error : function(){
								alert("쿠폰 생성하는데 문제가 발생했습니다. 잠시후 다시 시도해 주세요.");
							},
							success : function(data){
								if(data=="SUCCESS"){
									$("#i_c_name").val("");
									$("#i_c_expire").val("");
									$("#i_a_name").val("선택하세요.");
									$("#c_percent").val("");
									alert("쿠폰생성이 성공적으로 완료되었습니다.");
									container.pagination({
										dataSource : function(done){
											listData().then(function(data){
												done(data);
												$("#couponCnt").html(data.length);
											});
										},
										callback : function(data, pagination){
											$("#coupon_tbody").html("");
											if(data.length!=0){
												$(data).each(function(){
													var c_num = this.c_num;
													var c_name = this.c_name;
													var c_func = this.c_func;
													var c_percent = this.c_percent;
													var c_expire = this.c_expire;
													var a_name = this.a_name;
													
													var tr = $("<tr>");
													tr.attr("data-num",c_num);
													tr.addClass("text-center");
													
													var td7 = $("<td>");
													
													var chkBox = $("<input>");
													chkBox.attr({
														"type" : "checkbox",
														"name" : "c_num",
														"value" : c_num
													});
													
													td7.append(chkBox);
													
													var td6 = $("<td>");
													td6.html(c_num);
													
													var td1 = $("<td>");
													td1.html(c_name);
													
													var td2 = $("<td>");
													td2.html(c_func);
													
													var td3 = $("<td>");
													td3.html(c_percent+"%");
													
													var td4 = $("<td>");
													td4.html(c_expire);
													
													var td5 = $("<td>");
													td5.html(a_name);
													
													tr.append(td7).append(td6).append(td1).append(td2).append(td3).append(td4).append(td5);
													$("#coupon_tbody").append(tr);
												});
											}
											else{
												var tr = $("<tr>");
												tr.attr("data-text","no-data");
												tr.addClass("text-center");
												
												var td = $("<td>");
												td.attr("colspan","6");
												td.html("검색 및 저장된 쿠폰이 없습니다.");
												
												tr.append(td);
												$("#coupon_tbody").append(tr);
											}
										}
									});
								}
								else{
									alert("쿠폰을 생성하는데 문제가 발생되었습니다.");
								}
							}
						});
					}
				});
				
				$("#reset").click(function(){
					if($("#card-body1").css("display")=="none"){
						$("#c_insertForm").each(function(){
							this.reset();
						});
					}
					else{
						$("#c_searchForm").each(function(){
							this.reset();
						});
						$("#c_percent1").attr("disabled","disabled");
						$("#c_percent2").attr("disabled","disabled");
						$("#c_expire").attr("disabled","disabled");
						$("#dateBtn").attr("disabled","disabled");
					}
				});
				
			});//최상위종료
			
		</script>
		</c:if>
	</head>
	<body>
		<div class="container-fluid">
		<h5 class="text-left m-0 font-weight-bold text-primary">쿠폰 관리</h5>
			<hr class="sidebar-divider">
				<div class="row">
            <div class="col-lg-12">
              <div class="card shadow mb-4">
                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                  <h6 id="myTitle" class="m-0 font-weight-bold text-primary"><span id="couponSearch">쿠폰 조회</span><span id="couponCreate" style="margin-left:30px;">쿠폰 생성</span></h6>                 
                </div>
                <!-- Card Body -->
                <div class="card-body" id="card-body1">
                <form class="form-inline" id="c_searchForm">
                
				  <table class="table table-hover" >
				  <colgroup>
				  
				  </colgroup>
				  	<tr>
				  		<td><h6 class="m-0 font-weight-bold text-default" style="padding:7%" >쿠폰 이름</h6></td>
				  		<td><input type="text" class="form-control" id="c_name" name="c_name">
				  		</td>
				  		
				  		<td class="text-left" colspan="2" >
					    
				  		</td>
				  	</tr>
				  	<tr>
				  		<td><h6 class="m-0 font-weight-bold text-default" style="padding:7%" >쿠폰 기능</h6></td>
				  		<td class="text-left"  >
					    	<select id="c_func" class="form-control" name="c_func">
					    		<option value="전체">전체</option>
					    		<option value="할인">할인 쿠폰</option>
					    		<option value="적립">적립 쿠폰</option>
					    	</select>
				  		</td>
				  		<td>
				  			<h6 class="m-0 font-weight-bold text-default" style="display: inline; padding-right: 30px;">혜택(%)</h6>
				  			<input type="text" name="c_percent1" maxlength="3" class="form-control" id="c_percent1" disabled="disabled">
				  			<span style="position: relative; left:-30px;">%</span>~&nbsp;&nbsp;&nbsp;
				  			<input type="text" name="c_percent2" maxlength="3" class="form-control" id="c_percent2" disabled="disabled">
				  			<span style="position: relative; left:-30px;">%</span>
				  			<label style="display: inline;font-weight: 700;font-size:1rem;font-family: Nunito,-apple-system,BlinkMacSystemFont;"><input checked="checked" type="checkbox" id="chkPercent" name="c_percent" value="100000"> 전체검색</label>
				  		</td>
				  		
				  	</tr>
				  	
				  	
				  	<tr>
				  	<td ><h6 class="m-0 font-weight-bold text-default" style="padding:6%" >유효기간</h6></td>
				  		<td colspan="2" >
     					 <input type="text" disabled="disabled" placeholder="XXXX-XX-XX" id="c_expire" name="c_expire" readonly="readonly" aria-label="Last name" class="form-control">
     					 <button disabled="disabled" type="button" id="dateBtn" class="btn btn-outline-secondary docs-datepicker-trigger" >
               			 <i class="fa fa-calendar"  aria-hidden="true"></i>
             			 </button>
             			 <label style="display: inline;font-weight: 700;font-size:1rem;font-family: Nunito,-apple-system,BlinkMacSystemFont;margin-left:15px;"><input checked="checked" type="checkbox" id="chkExpire" name="c_expire" value="all"> 전체검색</label>
				  		</td>
				  	</tr> 
				  	<tr>
				  		<td><h6 class="m-0 font-weight-bold text-default" style="padding:7%" >관리자명</h6></td>
				  		<td class="text-left" colspan="3" >
					    	<select id="a_num" class="form-control" name="a_num">
					    		<option value="0">전체</option>
					    		<c:if test="${not empty list }">
					    			<c:forEach var="admin" items="${list }">
					    				<option value="${admin.a_num }">${admin.a_name}</option>
					    			</c:forEach>
					    		</c:if>
					    	</select>
				  		</td>
				  	</tr>
				  	
				  </table>
				  </form>
				  </div>
				  
				  
                <div class="card-body" id="card-body2" style="display: none;">
                <form class="form-inline" id="c_insertForm" >
                
				  <table class="table table-hover" >
				  <colgroup>
				  
				  </colgroup>
				  	<tr>
				  		<td><h6 class="m-0 font-weight-bold text-default" style="padding:7%" >쿠폰 이름</h6></td>
				  		<td><input type="text" class="form-control" id="i_c_name" name="c_name">
				  		</td>
				  		
				  		<td class="text-left" colspan="2" >
					    
				  		</td>
				  	</tr>
				  	<tr>
				  		<td><h6 class="m-0 font-weight-bold text-default" style="padding:7%" >쿠폰 기능</h6></td>
				  		<td class="text-left"  >
					    	<select id="i_c_func" class="form-control" name="c_func">
					    		<option value="할인">할인 쿠폰</option>
					    		<option value="적립">적립 쿠폰</option>
					    	</select>
				  		</td>
				  		<td>
				  			<h6 class="m-0 font-weight-bold text-default" style="display: inline; padding-right: 30px;">혜택(%)</h6>
				  			<input type="text" name="c_percent" maxlength="3" class="form-control" id="c_percent">
				  			<span style="position: relative; left:-30px;">%</span>
				  			
				  		</td>
				  		
				  	</tr>
				  	
				  	
				  	<tr>
				  	<td ><h6 class="m-0 font-weight-bold text-default" style="padding:6%" >유효기간</h6></td>
				  		<td colspan="2" >
     					 <input type="text" placeholder="YYYY-MM-DD" style="background-color: white;" readonly="readonly" id="i_c_expire" name="c_expire" aria-label="Last name" class="form-control">
     					 <button type="button" id="dateBtn2" class="btn btn-outline-secondary docs-datepicker-trigger" >
               			 <i class="fa fa-calendar"  aria-hidden="true"></i>
             			 </button>
             			 
				  		</td>
				  	</tr> 
				  	<tr>
				  		<td><h6 class="m-0 font-weight-bold text-default" style="padding:7%" >관리자명</h6></td>
				  		<td class="text-left" colspan="3" >
					    	<select id="i_a_num" class="form-control" name="a_num">
					    		<option value="${adminInfo.a_num }">${adminInfo.a_name}</option>
					    	</select>
				  		</td>
				  	</tr>
				  	
				  </table>
				  </form>
				  </div>
				 </div>
			 </div>
			 <div class="container text-center">
			 <button type="button" id="searchBtn" class="btn btn-primary btn-lg">검색</button>
			 <button type="button" id="insertBtn" style="display:none;" class="btn btn-primary btn-lg">생성</button>
			 <button type="button" id="reset" class="btn btn-primary btn-lg">초기화</button>
			 </div>
		 </div>
		 <br/>
		 
		 
		  <div class="row">
		 <div class="container-fluid text-right">
				<span  class="m-0 font-weight-bold text-default">총</span> 
                  <span id="couponCnt" class="m-0 font-weight-bold text-danger"></span>
                  <span class="m-0 font-weight-bold text-default">개</span> 
                  </div>
            <div class="col-lg-12">
              <div class="card shadow mb-4">
                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                  <h6 class="m-0 font-weight-bold text-primary">쿠폰 목록</h6>
                  <button type="button" id="excelDownBtn" ><img src="/resources/images/excel.png"></button>
                </div>
                <form>
                <div class="card-body">
                	<table class="table table-hover" id="coupon_table">
                		<colgroup>
                			<col width=3%>
                			<col width=7%>
                			<col width=20%>
                			<col width=18%>
                			<col width=15%>
                			<col width=18%>
                			<col width=18%>
                		</colgroup>
                		<tr class="text-center">
                			<td><input type="checkbox" id="allCheck"></td>
                			<td>쿠폰번호</td>
                			<td>쿠폰명</td>
                			<td>기능</td>
                			<td>할인/적립률</td>
                			<td>유효기간</td>
                			<td>관리자명</td>
                		</tr>
                		<tbody id="coupon_tbody">
                			
                		</tbody>
                	</table>
                	<div style="text-align: center;">
                		<div id="pagination" style="display: inline-block;">
                			
                		</div>
                		<div style="float: right;">
                			<input style="font-size : 1rem;" id="delCoupon" type="button" class="btn btn-primary btn-lg" value="선택삭제">
                			<input style="font-size : 1rem;" type="button" id="addCoupon" class="btn btn-primary btn-lg" value="배포">
                		</div>
                	</div>
                	
              
               	</div>
               </form>
              </div>
              </div>
              </div>
              
              <div id="dialog" style="display: none;">
				<table class="table table-hover" style="font-size: 14px;">
					<colgroup>
						<col width="10%">
						<col width="15%">
						<col width="15%">
						<col width="25%">
						<col width="20%">
						<col width="15%">
					</colgroup>
					<tr class="text-center">
						<td>번호</td>
						<td>회원이름</td>
						<td>회원아이디</td>
						<td>쿠폰 사용기간</td>
						<td>쿠폰 사용여부</td>
						<td>삭제</td>
					</tr>
					<tbody id="ICoupon_tbody">
						
					</tbody>
				</table>
				<div style="text-align: center;">
                		<div id="pagination2" style="display: inline-block;">
                			
                		</div>
                		
                	</div>
		      </div>
              <div id="dialog2" style="display: none">
              	<select id="grade" name="g_num" class="form-control" style="height: 42px; display:inline-block; width:auto;">
              		<option value="0">선택하세요.</option>
              		<option value="1">브론즈</option>
              		<option value="2">실버</option>
              		<option value="3">골드</option>
              		<option value="4">플레티넘</option>
              		<option value="5">다이아</option>
              		<option value="6">챌린져</option>
              	</select>
              	<input style="font-size : 1rem;" type="button" id="baepo" class="btn btn-primary btn-lg" value="배포">
              	<input type="hidden" name="c_num">
              </div>
              
           </div>
	</body>
</html>