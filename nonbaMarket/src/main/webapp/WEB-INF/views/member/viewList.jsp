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
			
			#c{
				background: url(/resources/images/boardsHover.png) 170px no-repeat;
				color : #7c3fcc !important;
				background-color : #f7f7f7 !important;
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
			
			.tab_menu{
				padding-top : 30px;
			}
			
			.tab_menu > li{
				float: left;
			    width: 410px;
			    height: 50px;
			    background-color: #fff;
			    font-family: 'Noto Sans';
			    font-weight: 400;
			    
			}
			
			.tab_menu > li > a{
				display: block;
			    overflow: hidden;
			    width: 100%;
			    height: 100%;
			    border: 1px solid #dddfe1;
			    font-size: 14px;
			    color: #666;
			    line-height: 44px;
			    text-align: center;
			    text-decoration: none;
			    outline: none;
			}
			
			.tab_menu .on a{
				border-bottom: 2px solid #5f0080;
			    font-weight: 700;
			    color: #5f0080;
			}
			
			#board_notice td{
				padding: 20px 0px;
				border-bottom: 2px solid #ddd;
			}
			
			.p_name{
				padding-bottom : 23px;
				font-size: 16px;
			    line-height: 15px;
			    font-family : 'Noto Sans KR', sans-serif;
			    font-weight: 700;
			}
			
			.op_name{
			    font-family : 'Noto Sans KR', sans-serif;
				font-size: 12px;
			    font-weight: 700;
    			color: #5f0080;
    			padding-bottom: 15px;
			}
			
			.op_name span{
				color : #4c4c4c;
				font-size : 12px;
				font-weight: 400;
			}
			
			.d_price{
			    font-family: 'Noto Sans';
   				font-weight: 400;
   				color : #4c4c4c;
   				font-size : 12px;
			}
			
			.o_regdate{
				padding-top : 5px;
				font-family: 'Noto Sans';
   				font-weight: 400;
   				color : #888888;
   				font-size : 12px;
			}
			
			.no-data{
				padding : 60px 0px !important;
				text-align: center;
				font-size: 13px;
			    color: #757575;
			    text-align: center;
			    font-weight: 400;
			    font-family: 'Noto Sans KR', sans-serif;
			}
			
			.insertReviewBtn{
				display: block;
			    width: 90%;
			    height: 35px;
			    margin: 0 auto;
			    line-height: 27px;
			    border: 1px solid #5f0080;
			    background-color: #795b8f;
			    color: #fff;
			    font-family: 'Noto Sans';
   				font-weight: 400;
   				font-size : 16px;
   				outline: none;
			}
			
			.myReview{
				padding : 20px 20px 20px 40px;
				border-bottom: 1px solid #eee;
				display: table;
				width : 100%;
			}
			
			
			
			.myReview span{
				display : table-cell;
				text-align : right;
				vertical-align : middle;
				color : #333333;
				font-size : 16px;
				font-family: 'Noto Sans KR', sans-serif;
				font-weight: 400;
			}
			
			.myReview_img{
				margin-right:20px;
			}
			
			.reviewUpBtn{
				border-right: 2px solid #4c4c4c;
				
			}
			
			.reviewUpBtn, .reviewDelBtn{
				border : 0;
				background-color: white;
				outline : none;
			}
			
			.product_name,.product_name:hover,.product_name:focus{
				outline: none;
				color : #333333;
				font-size : 18px;
				font-family: 'Noto Sans KR', sans-serif;
				font-weight: 700;
				text-decoration: none;
			}
			
			.grade_gray{
				background: url(/resources/images/star_gray.png) left no-repeat;
				background-size: 16px;
			}
			
			.grade_yellow{
				background: url(/resources/images/star_yellow.png) left no-repeat;
				background-size: 16px;
			}
			
			.grade{
				display: inline-block;
				width:16px;
				height: 16px;
				margin-right : 2px;
			}
			
			.myReviewContents{
				padding : 20px 0px 20px 30px;
				border-bottom: 2px solid #eee;
			}
			
			.myReview_title{
				color : #333333;
				font-size : 18px;
				font-family: 'Noto Sans KR', sans-serif;
				font-weight: 400;
				margin-bottom: 10px;
			}
			
			.re_date{
				color : #888888;
				font-family: 'Noto Sans KR', sans-serif;
			}
			
			.re_content{
				padding-top : 20px;
				color : #4c4c4c;
				font-size : 16px;
				font-family: 'Noto Sans KR', sans-serif;
				font-weight: 400;
			}
			
			#reviewAfterList{
				margin-top:40px;
			}
			
			.ask-layer-wrapper{
			    position: fixed;
			    width: 100%;
			    height: 100%;
			    top: 0;
			    left: 0;
			}
			
			.ask-alert-window{
				position: absolute;
			    z-index: 9999;
			    background-color: #fff;
			    top: 0;
			    bottom: 0;
			    right: 0;
			    left: 0;
			    margin: auto;
		        width: 600px;
		        height: 615px;
			}
			
			.ask-alert-wrapper{
			    position: relative;
    			margin: 25px;
			}
			
			.ask-alert-header{
				font-size: 14px;
			    font-weight: bold;
			    letter-spacing: -0.025em;
			    color: #5f0080;
			    padding-bottom: 20px;
			    border-bottom: 1px solid #b2b2b2;
			    margin-bottom: 25px;
			}
			
			.ask-alert-content{
				display: table;
			    width: 100%;
		        border-bottom: 1px solid #b2b2b2;
		        padding-bottom: 20px;
			}
			
		/* 	.ask-alert-message{
			    height: 60px;
			    display: table-cell;
			    vertical-align: middle;
			    font-size: 13px;
			    line-height: 1.5;
			    text-align: center;
			    width: 100%;
			} */
			
			.ask-alert-close-button{
				width: 20px;
			    height: 20px;
			    background-image: url(https://res.kurly.com/pc/etc/old/images/common/icon-close-button.png);
			    text-indent: -9999px;
			    position: absolute;
			    right: 0;
			    top: 0;
			    background-color: transparent;
			    border: 0;
			    background-repeat: no-repeat;
			    outline: none;
			}
			
			.ask-alert-footer{
				text-align: center;
			    background-color: #f5f5f5;
			    padding: 30px 0;
			}
			
			.styled-button.__active{
			    background-color: #5f0080;
   				color: #fff;
			}
			
			.ask-alert-footer .styled-button{
			    font-size: 13px;
			    width: 150px;
			    height: 45px;
			    line-height: 45px;
			    display: inline-block;
			    border: 1px solid #5f0080;
			    text-align: center;
       			outline: none;
			}
			
			.ask-layer-background{
				display: block;
			    width: 100%;
			    height: 100%;
			    background-color: #000;
			    position: absolute;
			    left: 0;
			    top: 0;
			    opacity: .5;
			}
			
			.review_modal{
				display: inline-block;
				padding-left: 15px;
				vertical-align: top;
			}
			
		
			.gpaBtn{
				border : none;
				background: white;
				font-size : 0px;
				width : 34px;
				height: 34px;
				background: url(/resources/images/star_gray.png) left no-repeat;
				background-size: 34px;
				outline: none;
				vertical-align: middle;
			}
			
			.gpaBtnClick{
				background: url(/resources/images/star_yellow.png) left no-repeat;
				background-size : 34px;
			}
			
			#review_table td:first-child{
				font-family: 'Noto Sans KR', sans-serif;
				font-size : 20px;
				font-weight: 500;
				color: #333333;
			}
			
			#review_table td{
				padding: 10px 0px;
				border-bottom: 1px solid #b2b2b2;
			}
			
			textarea{
				resize: none;
			}
		</style>
		
		<!--[if lt IE 9]>
		<script src="/resources/include/js/html5shiv.js"></script>
		<![endif]-->
		<script type="text/javascript" src="/resources/include/js/jquery-3.3.1.min.js"></script>
		<script type="text/javascript" src="/resources/include/js/jquery.form.min.js"></script>
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
			var btnKind="";
			$(function(){
				
				reviewBeforeList();
				$(".tab_menu a").click(function(){
					$(".tab_menu li").removeClass("on");
					$(this).parents("li").addClass("on");
					$(this).parents("li").attr("data-value");
					if($(this).parents("li").attr("data-value")=="before"){
						$("#reviewAfterList").find("ul").html("");
						$("#reviewBeforeList").find("tbody").html("");
						reviewBeforeList();
					}
					else if($(this).parents("li").attr("data-value")=="after"){
						$("#reviewAfterList").find("ul").html("");
						$("#reviewBeforeList").find("tbody").html("");
						reviewAfterList();
					}
					else{
						alert("시스템 오류입니다. 관리자에게 문의해 주세요.");
					}
				});
				
				$(".gpaBtn").click(function(){
					var gpaVal = $(this).val();
					$("input[name='gpa']").val(gpaVal);
					$(".gpaBtn").each(function(){
						if($(this).val()<= gpaVal){
							$(this).addClass("gpaBtnClick");
						}
						else{
							$(this).removeClass("gpaBtnClick");
						}
					});
				});
				
				$("input[type='file']").change(function(){
					console.log($(this).val());
					
					if($(this).val()!=""){
						var file = $(this).val().split('.').pop().toLowerCase();
						console.log(file);
						if(file!="png"&&file!="jpg"&&file!="gif"){
							alert("이미지 파일만 올릴 수있습니다.");
							if (/(MSIE|Trident)/.test(navigator.userAgent)) {
							    // ie 일때 input[type=file] init.
							    $(this).replaceWith( $(this).clone(true) );
							} else {
							    // other browser 일때 input[type=file] init.
							    $(this).val("");
							}

						}
					}
				});
				
				$(document).on("click",".insertReviewBtn",function(){
					$("#reviewBtn").html("작성완료");
					$("#reviewBtn").attr("data-button","insertBtn");
					$(".ask-alert-header").html("구매후기 작성");
					
					$(".ask-layer-wrapper").css("display","block");
					var product_img = $(this).parents("tr").find("img").attr("src");
					var product_name = $(this).parents("tr").find(".p_name").html();
					var product_price = $(this).parents("tr").find(".d_price").html();
					var product_regdate = $(this).parents("tr").find(".o_regdate").html();
					var product_num = $(this).parents("tr").attr("data-num");
					
					$("#review_form input[name='d_num']").val($(this).attr("data-num"));
					
					
					
					$(".ask-layer-wrapper #product_img").attr("src",product_img);
					$(".ask-layer-wrapper .p_name").html(product_name);
					$(".ask-layer-wrapper .d_price").html(product_price);
					$(".ask-layer-wrapper .o_regdate").html(product_regdate);
					$("#serialNum").removeAttr("name");
					$("#serialNum").attr("name","p_num");
					$("#serialNum").val(product_num);
				});
				
				$(document).on("click",".reviewUpBtn",function(){
					$("#reviewBtn").html("수정하기");
					$("#reviewBtn").attr("data-button","updateBtn");
					$(".ask-alert-header").html("구매후기 수정");
					
					$(".ask-layer-wrapper").css("display","block");
					var product_img = $(this).parents("li").find(".myReview_img").attr("src");
					var product_name = $(this).parents("li").find(".product_name").html();
					var product_price = $(this).parents("li").find(".product_name").attr("data-num");
					var review_regdate = $(this).parents("li").find(".re_date").html();
					$(".ask-layer-wrapper #product_img").attr("src",product_img);
					$(".ask-layer-wrapper .p_name").html(product_name);
					$(".ask-layer-wrapper .d_price").html(product_price.toLocaleString()+"원");
					$(".ask-layer-wrapper .o_regdate").html(review_regdate);
					$("#serialNum").removeAttr("name");
					$("#serialNum").attr("name","re_num");
					$("#serialNum").val($(this).parents("li").attr("data-num"));
					
					var re_title = $(this).parents("li").find(".myReview_title").html();
					var re_gpa = $(this).parents("li").find(".myReviewContents").attr("data-num");
					var re_content = $(this).parents("li").find(".re_content").html().replace(/(<br>|<br\/>|<br \/>)/g, '\r\n');
					
					$("input[name='gpa']").val(re_gpa);
					$(".gpaBtn").each(function(index){
						if(index+1 <= re_gpa){
							$(this).addClass("gpaBtnClick");
						}
						
					});
					$("input[name='re_title']").val(re_title);
					$("textarea[name='re_content']").val(re_content);
				});
				
				$("#reviewBtn").click(function(){
					if($(this).attr("data-button")=="insertBtn"){
						if($("input[name='gpa']").val()==0){
							alert("별점을 선택해주세요");
							return;
						}
						else if(!chkData("input[name='re_title']","제목을"))return;
						else if(!chkData("textarea[name='re_content']","후기 본문을"))return;
						else{
							console.log($("#review_form").serialize());
							$("#review_form").ajaxForm({
								url : "/review/reviewInsert",
								type : "post",
								enctype : "multipart/form-data",
								dataType : "text",
								error : function(){
									alert("시스템 오류입니다. 관리자에게 문의해 주세요");
								},
								success : function(data){
									console.log(data);
									if(data=="성공"){
										alert("상품후기가 등록되었습니다.");
										$(".afterCnt").attr("data-num",Number($(".afterCnt").attr("data-num"))+1);
										$(".afterCnt").html("("+$(".afterCnt").attr("data-num")+")");
										
										$(".beforeCnt").attr("data-num",Number($(".beforeCnt").attr("data-num"))-1);
										$(".beforeCnt").html("("+$(".beforeCnt").attr("data-num")+")");
										
										$("#review_form")[0].reset();
										$(".ask-layer-wrapper").css("display","none");
										$("input[name='gpa']").val(0);
										$("input[name='p_num']").removeAttr("value");
										$(".gpaBtn").each(function(){
											$(this).removeClass("gpaBtnClick");
										});
										$("#reviewAfterList").find("ul").html("");
										$("#reviewBeforeList").find("tbody").html("");
										reviewBeforeList();
										$("#a4.info").html
									}
									else{
										alert("시스템 오류입니다. 관리자에게 문의해 주세요");										
									}
								}
							});
							$("#review_form").submit();
						}
					}
					else if($(this).attr("data-button")=="updateBtn"){
						if($("input[name='gpa']").val()==0){
							alert("별점을 선택해주세요");
							return;
						}
						else if(!chkData("input[name='re_title']","제목을"))return;
						else if(!chkData("textarea[name='re_content']","후기 본문을"))return;
						else{
							console.log($("#review_form").serialize());
							$("#review_form").ajaxForm({
								url : "/review/reviewUpdate",
								type : "post",
								enctype : "multipart/form-data",
								dataType : "text",
								error : function(){
									alert("시스템 오류입니다. 관리자에게 문의해 주세요");
								},
								success : function(data){
									console.log(data);
									if(data=="성공"){
										alert("상품후기가 수정되었습니다.");
										$(".afterCnt").attr("data-num",Number($(".afterCnt").attr("data-num"))+1);
										$(".afterCnt").html("("+$(".afterCnt").attr("data-num")+")");
										
										$(".beforeCnt").attr("data-num",Number($(".beforeCnt").attr("data-num"))+1);
										$(".beforeCnt").html("("+$(".beforeCnt").attr("data-num")+")");
										
										$("#review_form")[0].reset();
										$(".ask-layer-wrapper").css("display","none");
										$("input[name='gpa']").val(0);
										$("input[name='p_num']").removeAttr("value");
										$(".gpaBtn").each(function(){
											$(this).removeClass("gpaBtnClick");
										});
										$("#reviewAfterList").find("ul").html("");
										$("#reviewBeforeList").find("tbody").html("");
										reviewAfterList();
										
									}
									else{
										alert("시스템 오류입니다. 관리자에게 문의해 주세요");										
									}
								}
							});
							$("#review_form").submit();
						}
					}
				});
				
				$("#reviewCancel").click(function(){
					$("#review_form")[0].reset();
					$(".ask-layer-wrapper").css("display","none");
					$("input[name='gpa']").val(0);
					$("#serialNum").removeAttr("value");
					$("#serialNum").removeAttr("name");
					$(".gpaBtn").each(function(){
						$(this).removeClass("gpaBtnClick");
					});
				});
				
				$(document).on("click",".reviewDelBtn",function(){
					if(confirm("삭제 시 복구나 재등록이 불가능합니다.\n정말 삭제하시겠습니까?")){
						var re_num = $(this).parents("li").attr("data-num");
						$.ajax({
							url : "/review/reviewDelete",
							type : "post",
							data : "re_num="+re_num,
							dataType : "text",
							error : function(){
								alert("후기를 삭제하는데 문제가 생겼습니다. 관리자에게 문의하고나 잠시 후 다시 시도해주세요.");
							},
							success : function(data){
								console.log(data);
								if(data=="성공"){
									alert("상품후기가 성공적으로 삭제되었습니다.")
									$(".afterCnt").attr("data-num",Number($(".afterCnt").attr("data-num"))-1);
									$(".afterCnt").html("("+$(".afterCnt").attr("data-num")+")");
									$("#reviewAfterList").find("ul").html("");
									$("#reviewBeforeList").find("tbody").html("");
									reviewAfterList();
								}
								else if(data=="실패"){
									alert("후기를 삭제하는데 문제가 생겼습니다. 관리자에게 문의하고나 잠시 후 다시 시도해주세요.");
								}
							}
						});
					}
					else{
						console.log("뀨");
					}
				});
				
				
			});//최상위 종료
			
			function reviewBeforeList(){
				$.getJSON("/detail/reviewBeforeList?m_num=${user.m_num}",function(data){
					beforeCnt = data.length;
					if(data.length == 0){
						var tr = $("<tr>");
						var td = $("<td>");
						td.addClass("no-data");
						td.attr("colspan","4");
						td.html("작성가능 후기 내역이 없습니다.");
						$("#reviewBeforeList").find("tbody").append(tr.append(td));
					}
					else{
						$(data).each(function(){
							var d_num = this.d_num;
							var p_num = this.p_num;
							var p_name = this.p_name
							var op_num = this.op_num;
							var op_name = this.op_name;
							var d_price = this.d_price;
							var d_img = this.d_img;
							var o_regdate = this.o_regdate;
							
							var tr = $("<tr>");
							tr.attr("data-num",p_num);
							
							var td1 = $("<td>");
							var td2 = $("<td>");
							var img=$("<img>");
							img.attr({
								"width":"90px",
								"src": "/uploadStorage/pImg/"+d_img
							});
							td2.append(img);
							
							var td3 = $("<td>");
							var div_p_name = $("<div>");
							div_p_name.addClass("p_name");
							div_p_name.html(p_name);
							var div_op_name = $("<div>");
							if(op_num!=0){
								div_op_name.addClass("op_name");
								div_op_name.html("※ 패키지 구성품  <span>"+op_name+"</span>");
								div_op_name.attr("data-num",op_num);
							}
							var div_d_price = $("<div>");
							div_d_price.addClass("d_price");
							div_d_price.html(d_price.toLocaleString()+"원");
							
							var div_o_regdate = $("<div>");
							div_o_regdate.addClass("o_regdate");
							div_o_regdate.html(o_regdate);
							td3.append(div_p_name).append(div_op_name).append(div_d_price).append(div_o_regdate);
							
							var td4 = $("<td>");
							var input = $("<input>");
							input.addClass("insertReviewBtn");
							input.attr({
								"type" : "button",
								"value" : "구매후기 쓰기",
								"data-num" : d_num
							});
							td4.append(input);
							tr.append(td1).append(td2).append(td3).append(td4);
							$("#reviewBeforeList").find("tbody").append(tr);
						});
						
					}
				}).fail(function(){
					alert("목록을 불러오는데 실패하였습니다. 잠시후에 다시 시도해주세요.");
				});
				
				
				
				
				
			}
			
			function reviewAfterList(){
				
				console.log(123);
				$.getJSON("/review/reviewAfterList?m_num=${user.m_num}",function(data){
					afterCnt = data.length;
					if(data.length==0){
						var li = $("<li>");
						var div = $("<div>");
						div.addClass("no-data");
						div.html("작성한 후기가 없습니다.");
						li.append(div);
						$("#reviewAfterList").find("ul").append(li);
					}
					else{
						$(data).each(function(){
							var re_num = this.re_num;
							var p_num = this.p_num;
							var p_img = this.p_img;
							var p_price = this.p_price;
							var p_name = this.p_name;
							var re_title = this.re_title;
							var re_content = this.re_content;
							var gpa = this.gpa;
							var re_regdate = this.re_regdate;
							var re_img = this.re_img;
							
							
							var li = $("<li>");
							li.attr("data-num",re_num);
							
							var myReview = $("<div>");
							myReview.addClass("myReview");
							
							var myReview_img = $("<img>");
							myReview_img.addClass("myReview_img");
							myReview_img.attr({
								"width" : "40px",
								"src" : "/uploadStorage/pImg/"+p_img
							});
							
							var product_name = $("<a>");
							product_name.addClass("product_name");
							product_name.attr({
								"href":"#",
								"data-num":p_price
							});
							product_name.html(p_name);
							
							var span = $("<span>");
							
							var btn1 = $("<input>");
							btn1.addClass("reviewUpBtn");
							btn1.attr({
								"type" : "button",
								"value" : "수정"
							});
							
							var btn2 = $("<input>");
							btn2.addClass("reviewDelBtn");
							btn2.attr({
								"type" : "button",
								"value" : "삭제"
							});
							
							span.append(btn1).append(" | ").append(btn2);
							myReview.append(myReview_img).append(product_name).append(span);
							
							var myReviewContents = $("<div>");
							myReviewContents.addClass("myReviewContents");
							myReviewContents.attr("data-num",gpa);
							
							var myReview_title = $("<div>");
							myReview_title.addClass("myReview_title");
							myReview_title.html(re_title);
							
							var span1 = $("<span>");
							var span2 = $("<span>");
							var span3 = $("<span>");
							var span4 = $("<span>");
							var span5 = $("<span>");
							span1.addClass("grade");
							span2.addClass("grade");
							span3.addClass("grade");
							span4.addClass("grade");
							span5.addClass("grade");
							
							var span6 = $("<span>");
							span6.addClass("re_date");
							span6.css("vertical-align","top");
							span6.html(re_regdate);
							
							var div_re_content = $("<div>");
							div_re_content.addClass("re_content");
							div_re_content.html(re_content);
							
							var div_re_img = $("<img>");
							if(re_img!=null){
								div_re_img.attr({
									"src" : "/uploadStorage/review/"+re_img
								});
								div_re_img.css("display","block");
							}
							div_re_img.addClass("re_img");
							
							myReviewContents.append(myReview_title).append(span1).append(span2).append(span3).append(span4).append(span5).append(span6).append(div_re_img).append(div_re_content);
							
							myReviewContents.find(".grade").each(function(index){
								if(index+1 <= gpa){
									$(this).addClass("grade_yellow");
								}
								else{
									$(this).addClass("grade_gray");
								}
							});
							
							li.append(myReview).append(myReviewContents);
							$("#reviewAfterList").find("ul").append(li);
						});
					}
				}).fail(function(){
					alert("목록을 불러오는데 실패하였습니다. 잠시후에 다시 시도해주세요.");
				});
				
			}
		</script>
		</c:if>
	</head>
	<body>
		
	
		<%-- 모달시작 --%>
		<div class="ask-layer-wrapper" style="z-index: 10016; display: none;">
		  <div class="ask-alert-window ask-alert-type-message">
		    <div class="ask-alert-wrapper">
		      <div class="ask-alert-header"></div>
		      <div class="ask-alert-content">
		      
		      	<div>
		      		<div style="display: inline-block;">
		      			<img src="" id="product_img" style="width:100px; height:100px;">
		      		</div>
		      		<div class="review_modal">
		      			<div class="p_name">
		      				
		      			</div>
		      			<div class="d_price">
		      				
		      			</div>
		      			<div class="o_regdate">
		      				
		      			</div>
		      		</div>	
		      	</div>
		      </div>
		       <div class="reviewForm">
			        <form id="review_form">
			        	<input type="hidden" id="serialNum">
			        	<input type="hidden" name="d_num">
			        	<input type="hidden" name="m_num" value="${user.m_num}">
			        	<table id="review_table" style="width : 100%;">
			        		<colgroup>
			        			<col width="15%">
			        			<col width="85%">
			        		</colgroup>
			        		<tr>
			        			<td>별점</td>
			        			<td>
			        				<input type="hidden" name="gpa" value="0">
			        				<input type="button" class="gpaBtn" value="1">
			        				<input type="button" class="gpaBtn" value="2">
			        				<input type="button" class="gpaBtn" value="3">
			        				<input type="button" class="gpaBtn" value="4">
			        				<input type="button" class="gpaBtn" value="5">
			        			</td>
			        		</tr>
			        		<tr>
			        			<td>제목</td>
			        			<td><input type="text" name="re_title" class="form-control"></td>
			        		</tr>
			        		<tr>
			        			<td>구매후기</td>
			        			<td><textarea rows="4" class="form-control" name="re_content"></textarea></td>
			        		</tr>
			        		<tr>
			        			<td>사진 첨부</td>
			        			<td><input type="file" accept="image/*" id="file" name="file"/></td>
			        		</tr>
			        	</table>
			        </form>
			    </div>
		      <button class="ask-alert-close-button">이 메세지를 닫기</button>   
		    </div>
		    <div class="ask-alert-footer">
		      <button type="button" id="reviewBtn" class="styled-button __active">확인</button>
		      <button type="button" id="reviewCancel" class="styled-button __active">취소</button>
		    </div>
		  </div>
		  <div class="ask-layer-background"></div>
		</div>
		<%-- 모달끝 --%>
		
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
				<div id="board_title"><h2>상품후기</h2></div>
				<div id="reviewView">
					<ul class="tab_menu">
						<li class="on" data-value="before">
							<a href="#">작성가능 후기 <span class="beforeCnt" data-num="${cnt.cnt_x }">(${cnt.cnt_x})</span></a>
						</li>
						<li class data-value="after">
							<a href="#">작성완료 후기 <span class="afterCnt" data-num="${cnt.cnt_o}">(${cnt.cnt_o})</span></a>
						</li>
					</ul>
				</div>
				<div id="reviewBeforeList">
					<table>
						<colgroup>
							<col width="40px">
							<col width="150px">
							<col width="465px">
							<col width="165px">
						</colgroup>
						<tbody>
						<!-- <tr>
							<td></td>
							<td><img width="90px" src="/resources/images/naver.png"></td>
							<td>
								<div class="p_name">
									상품이름자리	
								</div>
								<div class="op_name">
									※ 패키지 구성품  <span>옵션명</span>
								</div>
								<div class="d_price">
									가격자리
								</div>
								<div class="o_regdate">
									구매날짜
								</div>
							</td>
							<td>
								<input class="insertReviewBtn" type="button" value="구매후기 쓰기">
							</td>
						</tr>
						<tr>
							<td class="no-data" colspan="4">
								작성가능 후기 내역이 없습니다.
							</td>
						</tr> -->
						</tbody>
					</table>
				</div>
				<div id="reviewAfterList">
					<ul>
						<!-- <li>
							<div class="myReview">
								<img class="myReview_img" width="40px" src="/resources/images/naver.png">
								<a class="product_name" href="#">상품 이름들어갈자리</a>
								
								<span>
									<input class="reviewUpBtn" type="button" value="수정">
									|
									<input class="reviewDelBtn" type="button" value="삭제">
								</span>
							</div>
							<div class="myReviewContents">
								<div class="myReview_title">타이틀 자리</div>
								<span class="grade grade_gray"></span><span class="grade grade_gray"></span><span class="grade grade_gray"></span><span class="grade grade_gray"></span><span class="grade grade_gray"></span>
								 <span class="re_date" style="vertical-align: top;">2020.02.02</span>
								 <div class="re_content">
								 	콘텐츠 자리
								 </div>
							</div>
						</li> -->
					</ul>
				</div>
			</div>
			
		</div>
	</body>
</html>