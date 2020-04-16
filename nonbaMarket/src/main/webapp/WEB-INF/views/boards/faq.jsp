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
			
			.content{
				width: 100%;
    			padding: 20px 9px 9px;
    			line-height: 25px;
			}
			
			.divcontent{
				display : block;
				padding-left: 50px;
				text-align: left;
				font-family: 'Noto Sans';
   				font-weight: 400;
    			letter-spacing: 0;
			}
			
		</style>
		
		
		
		
		
		<!--[if lt IE 9]>
		<script src="/resources/include/js/html5shiv.js"></script>
		<![endif]-->
		<script type="text/javascript" src="/resources/include/js/jquery-3.3.1.min.js"></script>
		<script type="text/javascript" src="/resources/include/js/common.js"></script>
		<script type="text/javascript" src="/resources/include/dist/js/bootstrap.min.js"></script>
		<script type="text/javascript" src = "/resources/include/js/pagenavigator.js"></script>
		<script type="text/javascript" src = "/resources/include/js/jquery.pagenavigator.js"></script>
		
		
		<script type="text/javascript">
       $(function () {
          	var search = "<c:out value='${data.search}' />";
          	if(search!=""){
          		$("#search_keyword").val("<c:out value='${data.search}' />"); 
          	}
    	   
    	   $("#menu_sort").find('a').toggleClass('on');
    	   
      		$(".n-content").css({"display":"none","font-family": "Noto Sans","font-weight":"400","letter-spacing":"0"});

      		
      		/* $(document).on("click",".goDetail")  */
      		$(document).on("click", ".goDetaile",function(){
      			var no = ".no"+$(this).parents("tr").attr("data-num");
      			var nembercnt = $(this).parents("tr").attr("data-num");


      			if($(no).css("display")=="none"){
	      			$(".n-content").css({"display":"none","font-family": "Noto Sans","font-weight":"400","letter-spacing":"0"});
	      			$(no).css({"display":"table-cell","font-family": "Noto Sans","font-weight":"400","letter-spacing":"0"});    
	      			
      			}
      			else{
	      			$(".n-content").css({"display":"none","font-family": "Noto Sans","font-weight":"400","letter-spacing":"0"});      				
      			}      			
      		});
      		
      		$(".goDetail").click(function(){
      			var no = ".no"+$(this).parents("tr").attr("data-num");
      			var nembercnt = $(this).parents("tr").attr("data-num");
				
  

      			
      			if($(no).css("display")=="none"){
	      			$(".n-content").css({"display":"none","font-family": "Noto Sans","font-weight":"400","letter-spacing":"0"});
	      			$(no).css({"display":"table-cell","font-family": "Noto Sans","font-weight":"400","letter-spacing":"0"});    
	      			
      			}
      			else{
	      			$(".n-content").css({"display":"none","font-family": "Noto Sans","font-weight":"400","letter-spacing":"0"});      				
      			}      			
      		});//상세페이지 펼치기
      		
      		
      	
          		
          		
			//셀렉트 값에 따라 페이지 변경
          	$("#search_keyword").change(function(){
          		/*여기 추가*/
           	
          		$("input[name='pageNum']").val(1);
        		$("input[name='amount']").val(10);
          		goPage();
			}); 
			
   
          	$(".paginate_button a").click(function(e) {
          		e.preventDefault();
          		$("#f_search").find("input[name='pageNum']").val($(this).attr("href"));
          		goPage();
          	});

          		          		
      		
      	});//최상위 종료
      		
      		
        //페이징 처리를 위한 함수.
  		function goPage(){
  			$("#f_search").attr({
  				"method":"get",
  				"action":"/faq/faqList"
  			});
  			$("#f_search").submit();
  		}
      		
       
       
      </script>
    
	</head>
	<body>
	<div class="breadcrumb-area">
        <!-- Top Breadcrumb Area -->
        <div class="top-breadcrumb-area bg-img bg-overlay d-flex align-items-center justify-content-center" style="background-image: url(/resources/images/bg-img/24.jpg);">
            <h2>자주하는 질문</h2>
        </div>
     </div>
		<div class="boardContainer container">
			
			<%-- <form id = "f_search" name="f_search" class  = "form-inline">
      			<input type="hidden" name="pageNum" value="${pageMaker.cvo.pageNum }">
      			<input type="hidden" name="amount" value="${pageMaker.cvo.amount }">
      		</form>  --%>
		
		
			<div id="sub_menu">
				<h2 id="head_title">고객 센터</h2>
				<div id="menubar">
					<ul id="menu_sort">
						<li><a href="/notice/noticeList" id="a" class="subMenu_sort on" >공지사항</a></li>
						<li><a href="/faq/faqList" id="b" class="subMenu_sort" >자주하는질문</a></li>
						<li><a href="/qna/qnaList" id="c" class="subMenu_sort on">1:1문의</a></li>
						<li><a href="/review/reviewList" id="d" class="subMenu_sort on">상품후기</a></li>
						<li><a href="/inq/product-inqList" id="e" class="subMenu_sort on" >상품문의</a></li>
					</ul>
				</div>
			</div>
			
			<div id="board_notice">
				<div id="board_title"><h2> 자주하는질문</h2></div>
      			
      
      		<div id = "boardSearch" class = "text-left">
      			<form id = "f_search" name="f_search" class  = "form-inline">
      				<div class = "form-group">
      					<select id="search_keyword" name = "search" class="form-control">
      						<option value = "all">전체</option>
      						<option value = "f_client">회원문의</option>
      						<option value = "f_order">주문/결제</option>
      						<option value = "f_back">교환/반품</option>
      						<option value = "f_delivery">배송문의</option>
      						<option value = "f_coupon">쿠폰/적립</option>
      						<option value = "f_service">서비스이용</option>
      					</select>
      					<input type="hidden" name="pageNum" value="${pageMaker.cvo.pageNum }">
      					<input type="hidden" name="amount" value="${pageMaker.cvo.amount }">
      				</div>
      			</form>
      		</div>
      			
      			
      			
      					<%-- =============== 리스트 시작 ==================== --%>
				<div id="table_section">
					<table id="notice_table">
						<colgroup>
								<col width="70px"/>
								<col width="135px"/>
								<col width="615px"/>					
						</colgroup> 
						<thead>
							<tr>
								<th data-value = "f_num" class="ac">번호</th>
								<th data-value="f_date" class="ac">카테고리</th>
								<th class="ac">제목</th>
							</tr>
							
						</thead>
						<tbody id = "list">
							<!-- 데이터 출력 -->
							<c:choose>
								<c:when test="${not empty faqList}">
									<c:forEach var="faq" items="${faqList }" varStatus="status">
										<tr data-num = "${faq.f_num }">
											<td class="ac goDetail" >${faq.f_num }</td>
											<td class="ac goDetail" >${faq.f_category}</td>
											<td class="ac adad goDetail" >${faq.f_title}</td>	
										</tr>						
										<tr class ="tr-n-content"> 
      										<td colspan="3" class = "n-content no${faq.f_num }">
      											<div class = "divcontent ac">
      											<img src ="/resources/images/faq_img.gif"  style="margin-left: 30px;">
      											<span class = "content">${faq.f_content }</span>
      											</div><!--여기 패딩  -->
      										</td>
      									</tr>
      									
									</c:forEach>
								</c:when>
								<c:otherwise>
									<tr>
										<td colspan="3" class="emptyColumn">등록된 게시물이 존재하지 않습니다.</td>
									</tr>
								</c:otherwise>
							</c:choose>
						</tbody>
					</table>
				</div>
			<%-- ==================페이지바======================== --%>
			 <nav class = "text-center">
  				<ul class="pagination">
    				<c:if test = "${pageMaker.prev }">
  					<li class="paginate_button previous">
  						<a href="${pageMaker.startPage -1 }">Previous</a>
  					</li>
  				</c:if>
    			
    			<c:forEach var="num" begin="${pageMaker.startPage }" end="${pageMaker.endPage }">
    				<li class="paginate_button ${pageMaker.cvo.pageNum == num ? 'active':''}">
    					<a href="${num }">${num }</a>
    				</li>
    			</c:forEach>
    			
    			<c:if test="${pageMaker.next }">
    				<li class="paginate_button next">
    					<a href="${pageMaker.endPage +1 }">Next</a>
    				</li>
    			</c:if>
  				</ul>
			</nav>  
			
			<%-- ==================페이지바======================== --%>
			
			</div>
		</div>
		
	</body>
</html>