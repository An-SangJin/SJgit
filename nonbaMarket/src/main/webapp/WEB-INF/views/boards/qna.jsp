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
			
			.qnabtn{
				margin-bottom: 10px;
				float: right;
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
       $(function () {
    	   $("#menu_sort").find('a').toggleClass('on');
    	   
      		$(".n-content").css({"display":"none","font-family": "Noto Sans","font-weight":"400","letter-spacing":"0"});
 
      		
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
      		
      		
          		
         	//페이지 버튼 클릭
          	$(".paginate_button a").click(function(e) {
          		e.preventDefault();
          		$("#q_search").find("input[name='pageNum']").val($(this).attr("href"));
          		goPage();
          	});

          
      		//글쓰기 버튼 클릭
      		
      		$("#insertFormBtn").click(function(){	
      			location.href = "/qna/qnaInsert";
      		});
      		
      		//수정버튼
      		$(".qnabtn input[value='수정']").click(function(){
      			location.href = "/qna/qnaupdatepop?q_num="+$(this).parents("tr").attr("data-num");
      		});
      		
      		//삭제버튼
      		$(".qnabtn input[value='삭제']").click(function(){
      			if(confirm("선택한 내용을 삭제하시겠습니까?")) {
            		$.ajax({
            			url : "/qna/qnaDelete",
            			type : "post",
            			data : "q_num="+$(this).parents("tr").attr("data-num")+"&q_attimg="+$(this).parents("tr").attr("data-img"),
            			dataType : "text",
            			error : function() {
            				alert('시스템 오류 입니다. 관리자에게 문의 하십시오.');
            			},
            			success : function(data) {
            				if(data =='성공') {
            					alert("삭제되었습니다.");
            					location.href = "/qna/qnaList";
            				}
            			}
            		})
            	}
      		});
      		
      		
      		
      	});//최상위 종료
      	
      	
      		
        //페이징 처리를 위한 함수.
  		function goPage(){
  			$("#q_search").attr({
  				"method":"get",
  				"action":"/qna/qnaList"
  			});
  			$("#q_search").submit();
  		}
      		
  	//문의사항 클릭시 비회원이면 이동 안하게
  		/* if(session == null) {
  		$('a[href="/qna/qnaList"]').click(function(e) {
  			alert("비회원은 사용할 수 없는 서비스입니다. 로그인 해주시길 바랍니다.")
  			e.preventDefault();
  		})
  		}  */
      	
      	
       
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
			
			<form id = "q_search" name="q_search" class  = "form-inline">
      			<input type="hidden" name="pageNum" value="${pageMaker.cvo.pageNum }">
      			<input type="hidden" name="amount" value="${pageMaker.cvo.amount }">
      		</form>
		
		
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
      			
      			
      			
      			
      			
      			
      					<%-- =============== 리스트 시작 ==================== --%>
				<div id="table_section">
					<table id="notice_table">
						<colgroup>
								<col width="50px"/>
								<col width="150px"/>
								<col width="540px"/>
								<col width="80px"/>						
						</colgroup> 
						<thead>
							<tr>
								<th data-value = "q_num" class="ac">번호</th>
								<th data-value="q_category" class="ac">카테고리</th>
								<th class="ac">제목</th>
								<th class="ac">답변유무</th>
							</tr>
							
						</thead>
						<tbody id = "list">
							<!-- 데이터 출력 -->
							<c:choose>
								<c:when test="${not empty qnaList}">
									<c:forEach var="qna" items="${qnaList }" varStatus="status">
										<tr data-num = "${qna.q_num }">
											<td class="ac goDetail" >${qna.q_num }</td>
											<td class="ac goDetail" >${qna.q_category }</td>
											<td class="ac adad goDetail" >${qna.q_title}</td>
											<td class="ac goDetail" >${qna.q_state }</td>
										</tr>						
										<tr data-num = "${qna.q_num }" data-img="${qna.q_attimg }" class ="tr-n-content"> 
      										<td colspan="4" class = "n-content no${qna.q_num }">
      											<div class = "divcontent">
      										<%-- 	<input type="hidden" id = "attimg" data-img="${qna.attimg }"> --%>
      											<c:if test = "${not empty qna.q_attimg }">
      												<img style="display : block;margin : 0 auto;" src = "/uploadStorage/upload/${qna.q_attimg}">
      											</c:if>
      											<c:if test = "${empty qna.q_attimg }">
      											</c:if>   										
      											
      											<span>${qna.q_content }</span>
      												
      											</div><!--여기 패딩  -->
      											<div class = "qnabtn">
      											<input type = "button" value = "수정"  class = "btn btn-info">
      											<input type = "button" value = "삭제"  class = "btn btn-danger">
      											</div>
      										</td>
      									</tr>
      									
									</c:forEach>
								</c:when>
								<c:otherwise>
									<tr>
										<td colspan="4" class="emptyColumn">등록된 게시물이 존재하지 않습니다.</td>
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
			<div class = "text-right">
      			<input type = "button" value = "글쓰기" id = "insertFormBtn" class = "btn btn-success">
      		</div>
			</div>
		</div>
	</body>
</html>