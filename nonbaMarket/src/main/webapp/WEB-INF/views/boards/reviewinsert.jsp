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
			
			.subMenu_sort{
				text-decoration: none !important;
				display: block !important;
				padding : 16px 0px 16px 19px !important;
				font-size: 12px !important;
				font-family: 'Noto Sans KR', sans-serif !important;
				color : #666666 !important;
				background: url(/resources/images/boards.png) 170px no-repeat;
				background-color : white !important;
				
			}
			
			.subMenu_sort:hover{
			background:#f7f7f7 url(/resources/images/boardsHover.png) 170px no-repeat;
			color : #7c3fcc !important;
			background-color : #f7f7f7 !important;
			}
			
			.on{
			background:#f7f7f7 url(/resources/images/boardsHover.png) 170px no-repeat;
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
				border-bottom : 1px solid #5f0080;
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
				font-weight: 400;
				color: #555555;
			}
			
			.adad{
				text-align: left;
			}
			
			
		
			.tr-n-content{
				font-family: 'Noto Sans';
   				font-weight: 400;
    			letter-spacing: 0;
    			
			}
			
			#boardSearch{
				margin-bottom: 10px;
			}
			
			
			#insertlist{
				width : 820px;
				float : right;
				display: inline-block;
			}
			
			th{
				width: 110px;
   				padding: 15px 0 15px 20px;
    			background-color: #F7F5F8;
    			border-bottom: 1px solid #e8e8e8;
    			text-align: left;
    			font-weight: normal;
    			vertical-align: middle;
			}
			
			 td{
				width: auto;
    			padding: 15px 0 15px 10px;
    			height: 23px;
    			border-top: 1px solid #e8e8e8;
    			border-bottom: 1px solid #e8e8e8;
    			vertical-align: middle;
    			line-height: 20px;
			}
			
			.qna-item{
				padding: 6px 5px;
    			border: 1px solid #d9d9d9;
    			margin-bottom: 5px;
    			color: #202020;
			}
			
			.qna-input{
				height: 30px;
    			line-height: 25px;
    			border: 1px solid #d9d9d9;
    			color: #202020;
    			width: 80%;
    			font-family: 'Noto Sans';
    			font-weight: 400;
    			letter-spacing: 0;
    			margin: 0px;
    			text-align: left;
			}
			
			.in-o-btn{
				background-color: #795b8f;
    			color: #fff;
    			float: none; 
    			line-height: 27px; 
    			width: 100px;
    			
			}
			
			.qna-check{		
    			position: relative;
    			right: 2px;
    			vertical-align: middle;
				width: 60px;
			}
			
			span{
				font-family: 'Noto Sans';
    			font-weight: 400;
   				letter-spacing: 0;
			}
			
			.strong{
				display: block;
    			padding: 4px 0 10px;
    			font-size: 12px;
    			line-height: 20px;
    			font-family: 'Noto Sans';
    			font-weight: 700;
			
			}
			
			dd, dl{
				font-family: 'Noto Sans';
    			font-weight: 400;
    			letter-spacing: 0;
			
			}
			
			.file-td{
				width: auto;
    			padding: 15px 0 15px 10px;
    			height: 23px;
    			border-top: 1px solid #e8e8e8;
    			border-bottom: 1px solid #e8e8e8;
    			vertical-align: middle;
    			line-height: 20px;
			}
			
			.qna-file{
				font-family: 'Noto Sans';
    			font-weight: 400;
    			letter-spacing: 0;
			
			}
			
			.qna-insertbtn{
				background-color: #795b8f;
    			color: #fff;
    			margin-top: 10px;
    			width: 100px;
    			height: 50px;
    			text-align: center;
    			font-family: 'Noto Sans';
    			font-weight: 400;
    			letter-spacing: 0;
			}
			
			
		.modal {
			text-align : center;
			
            display: none; /* Hidden by default */
            position: fixed; /* Stay in place */
            z-index: 1; /* Sit on top */
            width: 100%; /* Full width */
            height: 100%; /* Full height */
            overflow: auto; /* Enable scroll if needed */
            background-color: rgb(0,0,0); /* Fallback color */
            background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
        }
    
        /* Modal Content/Box */
        .modal-content {
            background-color: #fefefe;
            margin: 15% auto; /* 15% from the top and centered */
            padding: 20px;
            border: 1px solid #888;
            width: 50%; /* Could be more or less, depending on screen size */                          
        }
        /* The Close Button */
        .close {
            color: purple;
            float: right;
            font-size: 28px;
            font-weight: bold;
        }
        .close:hover,
        .close:focus {
            color: black;
            text-decoration: none;
            cursor: pointer;
        }

			
		
			
		</style>
		
		
		<!--[if lt IE 9]>
		<script src="/resources/include/js/html5shiv.js"></script>
		<![endif]-->
		<script type="text/javascript" src="/resources/include/js/jquery-3.3.1.min.js"></script>
		<script type="text/javascript" src="/resources/include/js/common.js"></script>
		<script type="text/javascript" src="/resources/include/dist/js/bootstrap.min.js"></script>
		 
		 
		<script type="text/javascript">
		$(function() {
			  $("#menu_sort").find('a').toggleClass('on');
		
				// Get the modal
		        var modal = document.getElementById('myModal');
		 
		        // Get the button that opens the modal
		        var btn = document.getElementById("modalBtn");
		 
		        // Get the <span> element that closes the modal
		        var span = document.getElementsByClassName("close")[0];                                          
		 
		        // When the user clicks on the button, open the modal 
		        btn.onclick = function() {
		            modal.style.display = "block";
		            
		        }
		 
		        // When the user clicks on <span> (x), close the modal
		        span.onclick = function() {
		            modal.style.display = "none";
		        }
		 
		        // When the user clicks anywhere outside of the modal, close it
		        window.onclick = function(event) {
		            if (event.target == modal) {
		                modal.style.display = "none";
		            }
		        }
				/* 
		        //이메일 전화번호 자동입력
		    	var email = "${mvo.m_email}";
		    	var phone = "${mvo.m_phone}";
		
		        $("#m_email").val(email);
		        $("#m_phone").val(phone);
		        */
		        
		        //더블 클릭시 주문번호 폼에 넣고 모달창 끄기
		        $(".goDetail").dblclick(function(){
		        	var no =$(this).parents("tr").find("#order-num").html();
		        	var p_no =$(this).parents("tr").find("#p_num").html();
		        	$("#in_o_num").val(no);
		        	$("#in_p_num").val(p_no);
		        	modal.style.display = "none";
		        
		        });
		        
		        
		        //취소시 리스트로
		        $("#cancleBtn").click(function(){
		        	location.href = "/review/reviewList";
		        });
		        


	
		        //글쓰기 저장버튼 클릭시
		        $("#insertFormBtn").click(function(){
		        	if(!$('input:radio[name=gpa]').is(':checked')){
		        		alert("평점을 선택해주세요.");
		        		$("input[name='gpa']").focus();
		        		return;
		        	};
		        	if(!chkData($("#in_q_select"),"제목을")) return;
		        	else if (!chkData($("#in_o_num"),"주문 번호를")) return;
		        	else if (!chkData($("#faqcontent"),"후기 내용을")) return;
		        	else {	
			       
		        		$("#insert-form").ajaxForm({
		        			url : "/review/reviewupload",
		        			type : "post",
		        			enctype: "multipart/form-data",
		        			dataType : "text",
		        			error : function(){
		        				alert("시스템 오류 입니다. 관리자에게 문의해 주세요.");	
		        			},
		        			success : function(data) {
		        				if(data=="성공"){
		        					location.href = "/review/reviewList";
		        				}else{
		        					alert("입력에 문제가 있어 완료하지 못했습니다. 관리자에게 문의해 주세요.");
		        				}		
		        			}
		        		});
		        	$("#insert-form").submit();
		        	}
		        })
		        
		      
		      	
		        
			  
		}); //최상위 종료
		
		
		
		
		
		</script>
		
		
		
		
      
	</head>
	<body>
	<div class="breadcrumb-area">
        <!-- Top Breadcrumb Area -->
        <div class="top-breadcrumb-area bg-img bg-overlay d-flex align-items-center justify-content-center" style="background-image: url(/resources/images/bg-img/24.jpg);">
            <h2>상품후기</h2>
        </div>
     </div>
		<div class="boardContainer container">
		
		
			<div id="sub_menu">
				<h2 id="head_title">고객 센터</h2>
				<div id="menubar">
					<ul id="menu_sort">
						<li><a href="/notice/noticeList" id="a" class="subMenu_sort on" >공지사항</a></li>
						<li><a href="/faq/faqList" id="b" class="subMenu_sort on" >자주하는질문</a></li>
						<li><a href="/qna/qnaList" id="c" class="subMenu_sort on">1:1문의</a></li>
						<li><a href="/review/reviewList" id="d" class="subMenu_sort">상품후기</a></li>
						<li><a href="/inq/product-inqList" id="e" class="subMenu_sort on" >상품문의</a></li>
					</ul>
				</div>
			</div>
			
			<div id="board_notice">
				<div id="board_title"><h2> 상품후기</h2></div>

      			
      			<div id = "insertlist">
      			<form id = "insert-form" name = "insert-form">
					<table id="notice_table">
						<colgroup>
							<col width="114px">
							<col width="706px">
						</colgroup>
						<tbody>
							<tr>
								<th class = "th-title">제목</th>
								<td>
									<input type = "text" name = "re_title" id = "in_q_select" class = "qna-input"> 
								</td>
							</tr>
							<tr>
								<th>주문번호</th>
								<td>
									<input type = "text" id = "in_o_num" name = "o_num"  style="width: 25%" readonly="readonly" class = "qna-input">
									<input type = "text" id = "in_p_num" name = "p_num" style = "width: 25%" readonly="readonly" class = "qna-input">
									<button type = "button" class = "in-o-btn"  id = "modalBtn">주문조회</button>
									<div style="position: relative; z-index:1">  <!--여기 모달  -->
									</div>
								</td>
							</tr>
							<tr>
								<th class="input_tex">평점</th>
								<td>
										<input type = "radio" class = "qna-check" name = "gpa" id = "gparadio1" value = "1">
										<label for = "gparadio1" class = "qna-check" >1</label>
										<input type = "radio" class = "qna-check" name = "gpa" id = "gparadio2" value = "2">
										<label for = "gparadio2" class = "qna-check">2</label>
										<input type = "radio" class = "qna-check" name = "gpa" id = "gparadio3" value = "3">
										<label for = "gparadio3" class = "qna-check">3</label>
										<input type = "radio" class = "qna-check" name = "gpa" id = "gparadio4" value = "4">
										<label for = "gparadio4" class = "qna-check">4</label>
										<input type = "radio" class = "qna-check" name = "gpa" id = "gparadio5" value = "5">
										<label for = "gparadio5" class = "qna-check">5</label>
								</td>	
							</tr>
							<tr>
								<th>내용</th>
								<td style="position: relative;">
								<textarea style="width: 100%; height: 474px;" id = "faqcontent" name = "re_content"></textarea>
								</td>
							</tr>
							<tr>
								<th>이미지</th>
								<td>
									<table style="width:95%; border: solid 1px #CCC; border-collapse: collapse;">
										<tbody>
											<tr>
												<td class="file-td" width="20" nowrap="nowrap" align="center">1</td>
												<td width="100%">
													<input type="file" style="width: 50%" class = "qna-file" id = "qna-file" name = "file">
												</td>
											</tr>
										</tbody>
									</table>
									<table>
										<tbody>
											<tr>
												<td height="2"></td>
											</tr>
										</tbody>
									</table>
									<div>
											-1개의 gif.png,jpg,jpeg 파일만 업로드 할 수 있습니다.
											<br>
									</div>
								</td>
							</tr>
						</tbody>
					</table>
					<div  style="float: right;">
      					<input type = "button" value = "저장" id = "insertFormBtn" class = "qna-insertbtn">
      					<input type = "button" value = "취소" id = "cancleBtn" class = "qna-insertbtn">
      				</div>
					</form>	
      			</div>		
			</div> 		
		</div>
		
		
 
    				<!-- The Modal -->
    				<div id="myModal" class="modal">
 					 <form id = "order-form">
      				<input type = "hidden" id = "o_num" name = "o_num"/>
      				</form>
      				<!-- Modal content -->
      				<div class="modal-content" >
        			                                                   
        			<div id="order_table_section">
					<table id="order_table" style="width: 100%; height: 100%;">
						<colgroup>
								<col width="40px"/>
								<col width="40px"/>
								<col width="250px"/>
								<col width="40px"/>
								<col width="40px"/>		
								<col width="40px"/>	
						</colgroup> 
						<thead>
							<tr>
								<th data-value = "o_num" class="ac">주문번호</th>
								<th class="ac">주문일자</th>
								<th class="ac">상품명</th>
								<th class="ac">수량</th>
								<th class="ac">주문금액</th>
								<th class="ac">물품번호</th>
							</tr>
						</thead>
						<tbody id = "list">
							<!-- 데이터 출력 -->
							<c:choose>
								<c:when test="${not empty orderList}">
									<c:forEach var="order" items="${orderList }" varStatus="status">
										<tr data-num = "${order.o_num }">
											<td class="ac goDetail" id = "order-num" >${order.o_num }</td>
											<td class="ac goDetail" >${order.o_regdate }</td>
											<td class="ac goDetail" >${order.d_name}</td>
											<td class="ac goDetail" >${order.d_amount }</td>
											<td class="ac goDetail" >${order.d_price }원</td>
											<td class="ac goDetail" id = "p_num">${order.p_num }</td>
										</tr>						
									</c:forEach>
								</c:when>
								<c:otherwise>
									<tr>
										<td colspan="6" class="emptyColumn">등록된 물품이 존재하지 않습니다.</td>
									</tr>
								</c:otherwise>
							</c:choose>
						</tbody>
					</table>
					<span class="close">&times;</span>     
      				</div>
    				</div>
					</div>
	  
	  
	  
	</body>
</html>