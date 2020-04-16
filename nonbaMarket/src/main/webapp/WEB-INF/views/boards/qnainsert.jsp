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
				
		        //이메일 전화번호 자동입력
		    	var email = "${mvo.m_email}";
		    	var phone = "${mvo.m_phone}";
		
		        $("#m_email").val(email);
		        $("#m_phone").val(phone);
		       
		        
		        //더블 클릭시 주문번호 폼에 넣고 모달창 끄기
		        $(".goDetail").dblclick(function(){
		        	var no =$(this).parents("tr").find("#order-num").html();
		        	$("#in_o_num").val(no);
		        	
		        	modal.style.display = "none";
		        
		        });
		        
		        
		        
		        
		
		        //글쓰기 저장버튼 클릭시
		        $("#insertFormBtn").click(function(){
		        	if(!$("input[name='q_smssend']").prop("checked")&&!$("input[name='q_emailsend']").prop("checked")){
		        		alert("이메일과 sns, 둘중 하나는 선택해 주세요.");
		        		$("input[name='q_smssend']").focus();
		        		return;
		        	};	        	
		        	if(!chkData($("#in_q_select"),"제목을")) return;
		        	else if (!chkData($("#faqcontent"),"문의 내용을")) return;
		        	else {	
			        	if($("#in_o_num").val()==""){
			        		$("#in_o_num").attr("disabled","disabled");
			        	}
		        		$("#insert-form").ajaxForm({
		        			url : "/qna/qnaupload",
		        			type : "post",
		        			enctype: "multipart/form-data",
		        			dataType : "text",
		        			error : function(){
		        				alert("시스템 오류 입니다. 관리자에게 문의해 주세요.");	
		        			},
		        			success : function(data) {
		        				if(data=="성공"){
		        					location.href = "/qna/qnaList";
		        				}else{
		        					alert("입력에 문제가 있어 완료하지 못했습니다. 관리자에게 문의해 주세요.");
		        				}		
		        			}
		        		});
		        	$("#insert-form").submit();
		        	}
		        })
		        
		      //문의사항 클릭시 비회원이면 이동 안하게
		  		/* if(session == null) {
		  		$('a[href="/qna/qnaList"]').click(function(e) {
		  			alert("비회원은 사용할 수 없는 서비스입니다. 로그인 해주시길 바랍니다.")
		  			e.preventDefault();
		  		})
		  		}  */
		      	
		        
		        
			  
		}); //최상위 종료
		
		
		
		
		
		</script>
		</c:if>
		
		
		
      
	</head>
	<body>
	<div class="breadcrumb-area">
        <!-- Top Breadcrumb Area -->
        <div class="top-breadcrumb-area bg-img bg-overlay d-flex align-items-center justify-content-center" style="background-image: url(/resources/images/bg-img/24.jpg);">
            <h2>1:1 문의</h2>
        </div>
     </div>
		<div class="boardContainer container">
		
		
			<div id="sub_menu">
				<h2 id="head_title">고객 센터</h2>
				<div id="menubar">
					<ul id="menu_sort">
						<li><a href="/notice/noticeList" id="a" class="subMenu_sort on" >공지사항</a></li>
						<li><a href="/faq/faqList" id="b" class="subMenu_sort on" >자주하는질문</a></li>
						<li><a href="/qna/qnaList" id="c" class="subMenu_sort">1:1문의</a></li>
						<li><a href="/review/reviewList" id="d" class="subMenu_sort on">상품후기</a></li>
						<li><a href="/inq/product-inqList" id="e" class="subMenu_sort on" >상품문의</a></li>
					</ul>
				</div>
			</div>
			
			<div id="board_notice">
				<div id="board_title"><h2> 1:1문의</h2></div>
				<form id = "detailForm">
      				<input type = "hidden" id = "q_num" name = "q_num"/>
      			</form>
      			
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
									<select name = "q_category" id = "qna-item" class = "qna-item">
										<option value = "배송지연">배송지연</option>
										<option value = "반품문의">반품문의</option>
										<option value = "A/S문의">A/S문의</option>
										<option value = "환불문의">환불문의</option>
										<option value = "주문결제">주문결제</option>
										<option value = "회원정보">회원정보</option>
										<option value = "취소문의">취소문의</option>
										<option value = "교환문의">교환문의</option>
										<option value = "기타문의">기타문의</option>
									</select>
									<br>
									<input type = "text" name = "q_title" id = "in_q_select" class = "qna-input"> 
								</td>
							</tr>
							<tr>
								<th>주문번호</th>
								<td>
									<input type = "text" id = "in_o_num" name = "o_num"  style="width: 25%" readonly="readonly" class = "qna-input">
									<!-- <input onclick ="order_open()" type = "button" class = "in-o-btn" value="주문조회" id = ""> -->
									<button type = "button" class = "in-o-btn"  id = "modalBtn">주문조회</button>
									<div style="position: relative; z-index:1">  <!--여기 모달  -->
										<iframe id = "ifm_order" style="display:none; width: 560px; height: 390px; background-color: rgb(255,255,255); position: absolute; left: 0px; top: 0px; border: 1px solid rgb(0,0,0);">
										<%--frameborder="0" scrolling="no" 스타일 안에 src=--%>
										</iframe>
									</div>
								</td>
							</tr>
							<tr>
								<th class="input_tex">이메일</th>
								<td>
									<input type = "text" id ="m_email" name="q_email" size="26" style="width: 40%" readonly="readonly" class="qna-input">
									<span style="padding-left:10px">
										<input type = "checkbox" class = "qna-check" name = "q_emailsend" id = "email-heckb" value = "O">
										<label for = "q_emailsend" style="font-size:8pt;">답변수신을 이메일로 받겠습니다.</label>
									</span>
								</td>	
							</tr>
							<tr>
								<th class="@">문자메시지</th>
								<td>
									<input type = "text" id = "m_phone"  name="q_phone" size="26"  style="width: 40%"readonly="readonly" class="qna-input">
									<span style="padding-left:10px">
										<input type = "checkbox" class = "qna-check" name = "q_smssend" id = "phone-check" value = "O">
										<label for = "q_smssend"  style="font-size:8pt;">답변수신을 문자메시지로 받겠습니다.</label>
									</span>
								</td>
							</tr>
							<tr>
								<th>내용</th>
								<td style="position: relative;">
								<div>
									<div>
										<div>
										<strong class = "strong">1:1 문의 작성 전 확인해주세요!</strong>
										<dl class = "wek">
											<dd>현재 문의량이 많아 순차적으로 답변 중에 있으며, 평균 2~3일 정도 소요되는 점 양해 부탁드립니다. 빠르게 안정화될 수 있도록 노력하겠습니다.</dd>
										</dl>

										<strong class = "strong">반품 / 환불</strong>
										<dl class = "wek">
											<dd>제품 하자 혹은 이상으로 반품 (환불)이 필요한 경우 사진과 함께 구체적인 내용을 남겨주세요.</dd>
										</dl>

										<strong class = "strong">주문취소</strong>
										<dl class = "wek">
											<dd>-배송 단계별로 주문취소 방법이 상이합니다.</dd>
											<dd>[입금확인] 단계 : [마이컬리 > 주문내역 상세페이지] 에서 직접 취소 가능</dd>
											<dd>[입금확인] 이후 단계 : 고객행복센터로 문의</dd>
											<dd>-생산이 시작된 [상품 준비중] 이후에는 취소가 제한되는 점 고객님의 양해 부탁드립니다.</dd>
											<dd>-비회원은 모바일 App 또는 모바일 웹사이트에서 [마이컬리 > 비회원 주문 조회 페이지] 에서 취소가 가능합니다.</dd>
											<dd>-일부 예약상품은 배송 3~4일 전에만 취소 가능합니다.</dd>
											<dd>-주문상품의 부분 취소는 불가능합니다. 전체 주문 취소 후 재구매 해주세요.</dd>
										</dl>
										<strong class = "strong">배송</strong>
										<dl>
											<dd>-주문 완료 후 배송 방법(샛별 / 택배)은 변경이 불가능합니다.</dd>
											<dd>-배송일 및 배송시간 지정은 불가능합니다. (예약배송 포함)</dd>
											<dd style="color: #5f0080;">※ 전화번호, 이메일, 주소, 계좌번호 등의 상세 개인정보가 문의 내용에 저장되지 않도록 주의해 주시기 바랍니다.</dd>
										</dl>
										</div>
									</div>
								</div>
								<textarea style="width: 100%; height: 474px;" id = "faqcontent" name = "q_content"></textarea>
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
								<col width="290px"/>
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
										</tr>						
									</c:forEach>
								</c:when>
								<c:otherwise>
									<tr>
										<td colspan="5" class="emptyColumn">등록된 물품이 존재하지 않습니다.</td>
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