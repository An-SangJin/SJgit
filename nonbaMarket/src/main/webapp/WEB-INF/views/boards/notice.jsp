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
			
			/* .subMenu_sort:hover{
				background: url(/resources/images/boardsHover.png) 170px no-repeat;
				color : #7c3fcc !important;
				background-color : #f7f7f7 !important;
			} */
			
			
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
			
			.content{
				width: 100%;
    			padding: 20px 9px 9px;
    			line-height: 25px;
			}
			/* 추가한거 */
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
		
		<script type="text/javascript">
	<%--	
	<%
    String ls_test = "세션에 저장된 데이터가 바로 접니다. ^O^";
    session.setAttribute("Testing", ls_test);    // "Testing"을 키로 문자열을 저장
   
    session.setAttribute("MyData", 10);    // "MyData"를 키로 정수를 저장
	%>
	----------------------------------------------------------------------------------------
	<%
    Object lobj_getdata = session.getAttribute("Testing");
    String ls_getdata = (String)lobj_getdata;
   
    int li_primitive = (Integer)session.getAttribute("MyData");
   
    out.println("설정된 세션값 [1] → " + ls_getdata + "<br/><br/>");
    out.println("설정된 세션값 [2] → " + li_primitive + "<hr/>");
	%>
	--%>
	

		
		
       $(function () {
    	   var session = '1';
    	   
    	   
    	   $("#menu_sort").find('a').toggleClass('on');
      		$(".n-content").css({"display":"none","font-family": "Noto Sans","font-weight":"400","letter-spacing":"0"});
 
      		$(".goDetail").click(function(){
      			var no = ".no"+$(this).parents("tr").attr("data-num");
      			var nembercnt = $(this).parents("tr").attr("data-num");
      			var resultcnt = $(this).parents("tr").find(".n-cnt");

      			if($(no).css("display")=="none"){
	      			$(".n-content").css({"display":"none","font-family": "Noto Sans","font-weight":"400","letter-spacing":"0"});
	      			$(no).css({"display":"table-cell","font-family": "Noto Sans","font-weight":"400","letter-spacing":"0"});    
	      		
	      			
	      			
	      			$.ajax({
	            		url : "/notice/noticeCnt",
	            		type : "get",
	            		data : "n_num="+nembercnt,
	            		dataType : "text",
	            		async : false,
	            		error : function(){
	            			alert("시스템 오류 입니다.");
	            		},
	            		success : function(cnt) {
	            			if(cnt=="success") {
	            				var ccnt = resultcnt.text();      				
	            				resultcnt.text(Number(ccnt)+1);
	            			}
	            			
	            		}
	            	});
      			}
      			else{
	      			$(".n-content").css({"display":"none","font-family": "Noto Sans","font-weight":"400","letter-spacing":"0"});      				
      			}      			
      		});
      		
      		//페이지버튼 클릭시 
      		$(".paginate_button a").click(function(e) {
      			e.preventDefault();
      			$("#n_search").find("input[name='pageNum']").val($(this).attr("href"));
      			goPage();
      		});
      		
      		
      		//문의사항 클릭시 비회원이면 이동 안하게
      		if(session == null) {
      		$('a[href="/qna/qnaList"]').click(function(e) {
      			alert("비회원은 사용할 수 없는 서비스입니다. 로그인 해주시길 바랍니다.")
      			e.preventDefault();
      		})
      		} 
          	
      		
      	});  //최상위 종료
      	
      //페이징 처리를 위한 함수.
  		function goPage(){
  			$("#n_search").attr({
  				"method":"get",
  				"action":"/notice/noticeList"
  			});
  			$("#n_search").submit();
  		}
      	
      	
      	
      </script>
	</head>
	
	<body>
	<div class="breadcrumb-area">
        <!-- Top Breadcrumb Area -->
        <div class="top-breadcrumb-area bg-img bg-overlay d-flex align-items-center justify-content-center" style="background-image: url(/resources/images/bg-img/24.jpg);">
            <h2>공지사항</h2>
        </div>
     </div>
		<div class="boardContainer container">
			
			<form id = "n_search" name="n_search" class  = "form-inline">
      			<input type="hidden" name="pageNum" value="${pageMaker.cvo.pageNum }">
      			<input type="hidden" name="amount" value="${pageMaker.cvo.amount }">
      		</form>
		
			<div id="sub_menu">
				<h2 id="head_title">고객 센터</h2>
				<div id="menubar">
					<ul id="menu_sort">
						<li><a href="/notice/noticeList" id="a" class="subMenu_sort " >공지사항</a></li>
						<li><a href="/faq/faqList" id="b" class="subMenu_sort on">자주하는질문</a></li>
						<li><a href="/qna/qnaList" id="c" class="subMenu_sort on">1:1문의</a></li>
						<li><a href="/review/reviewList" id="d" class="subMenu_sort on">상품후기</a></li>
						<li><a href="/inq/product-inqList" id="e" class="subMenu_sort on">상품문의</a></li>
					</ul>
				</div>
			</div>
			
			<div id="board_notice">
				<div id="board_title"><h2>공지사항</h2></div>
				<form id = "detailForm">
      				<input type = "hidden" id = "n_num" name = "n_num"/>
      			</form>
				<div id="table_section">
					<table id="notice_table">
						<colgroup>
								<col width="50px"/>
								<col width="540px"/>
								<col width="100px"/>
								<col width="100px"/>
								<col width="30px"/>							
						</colgroup> 
						<thead>
							<tr>
								<th data-value = "n_num" class="ac">번호</th>
								<th class="ac">제목</th>
								<th data-value="n_date" class="ac">작성자</th>
								<th class="ac">작성일</th>
								<th class="ac">조회</th>
							</tr>
							
						</thead>
						<tbody id = "list">
							<!-- 데이터 출력 -->
							<c:choose>
								<c:when test="${not empty noticeList}">
									<c:forEach var="notice" items="${noticeList }" varStatus="status">
										<tr data-num = "${notice.n_num }">
											<td class="ac goDetail" >${notice.n_num }</td>
											<td class="ac adad goDetail" >${notice.n_title}</td>
											<td class="ac goDetail" >${notice.a_nickname }</td>
											<td class="ac name goDetail" >${notice.n_regdate }</td>
											<td class="ac n-cnt goDetail" >${notice.n_cnt }</td>
										</tr>						
										<tr class ="tr-n-content"> <!--여기 패딩  -->
      										<td colspan="5" class = "n-content no${notice.n_num }">  <!--여기 패딩  -->
      											<div class = "ac divcontent"  > <!--클래스 지우고 추가 divcontent  -->
      											<img src ="/resources/images/faq_img.gif" >
      											<span class = "content">${notice.n_content }</span>
      											</div><!--여기 패딩  -->
      										</td>
      									</tr>
      									
									</c:forEach>
								</c:when>
								<c:otherwise>
									<tr>
										<td colspan="5" class="emptyColumn">등록된 게시물이 존재하지 않습니다.</td>
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