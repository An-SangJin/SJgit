<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
   <head>
   	<title></title>
            <meta charset="UTF-8" />
         <!-- html4 : 파일의 인코딩 방식 지정 -->
         <!--<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />-->

     	<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
         <!-- 브라우저의 호환성 보기 모드를 막고, 해당 브라우저에서 지원하는 가장 최신 버전의 방식으로 HTML 보여주도록 설정.-->
      
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
         <!--viewport : 화면에 보이는 영역을 제어하는 기술. width는 device-width로 설정(브라우저 너비를 장치 너비에 맞추어 표시). initial-scale는 초기비율(보이는 영역과 웹 페이지를 맞춤). user-scalable는 사용자가 화면축소를 하지 못하도록 설정.-->
         
         <!-- 모바일 웹 페이지 설정 - 이미지 경로 위치는 각자 변경 -->
         <link rel="shortcut icon" href="/resources/images/icon.png" />
         <link rel="apple-touch-icon" href="/resources/images/icon.png"/>
        
        <!-- 모바일 웹 페이지 설정 끝 -->
         
         <!--[if lt IE 9]>
         <script src="/resource/include/js/html5shiv.js"></script>
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
       var one=${month.jan};
       var two=${month.feb};
       var three=${month.mar};
       var four=${month.apr};
       var five=${month.may};
       var six=${month.jun};
       var seven=${month.jul};
       var eight=${month.aug};
       var nine=${month.sep};
       var ten=${month.oct};
       var eleven=${month.nov};
       var twoeleven=${month.dec};
       max=0;
      if(Number(max)<Number(one)){
    	  max=one;
      } 
      if(Number(max)<Number(two)){
    	  max=two;
      } 
      if(Number(max)<Number(three)){
    	  max=three;
      } 
      if(Number(max)<Number(four)){
    	  max=four;
      } 
      if(Number(max)<Number(five)){
    	  max=five;
      } 
      if(Number(max)<Number(six)){
    	  max=six;
      } 
      if(Number(max)<Number(seven)){
    	  max=seven;
      } 
      if(Number(max)<Number(eight)){
    	  max=eight;
      } 
      if(Number(max)<Number(nine)){
    	  max=nine;
      } 
      if(Number(max)<Number(ten)){
    	  max=ten;
      } 
      if(Number(max)<Number(eleven)){
    	  max=eleven;
      } 
      if(Number(max)<Number(twoeleven)){
    	  max=twoeleven;
      } 
       
       
       </script>
       </c:if>
</head>
<body>
<div class="col-xl-6">
	<a class="btn btn-default" href="/adminDetail/adminDaysDetail" role="button">일일 매출</a>
	<a class="btn btn-default" href="/adminDetail/adminWeeksDetail" role="button">주별 매출</a>
	<a class="btn btn-success" href="/adminDetail/adminMonthsDetail" role="button">월간 매출</a>
	</div>
	<hr/>
            <!-- Area Chart -->
            <div class="col-xl-12 col-lg-12">
              <div class="card shadow mb-4">
                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                  <h6 class="m-0 font-weight-bold text-primary">월간 매출</h6>
                </div>
                <!-- Card Body -->
                <div class="card-body">
                  <div class="chart-bar">
                     <canvas id="myBarChart" ></canvas>
                  </div>
                </div>
              </div>
            </div>
			
			<div class="col-xl-12 col-lg-12">
              <div class="card shadow mb-4">
                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                  <h6 class="m-0 font-weight-bold text-primary">월간 증감추이</h6>
                </div>
                <!-- Card Body -->
                <div class="card-body">
                	<table class="table table-hover" >
                	<colgroup>
                		<col width=5%>
                			<col width=10%>
                			<col width=10%>
                			<col width=10%>
                			<col width=7%>
                			<col width=10%>
                			<col width=7%>
                			<col width=7%>
                			<col width=7%>
                	</colgroup>
                	
                		<tr class="text-center">
                			<td style="vertical-align: middle;" rowspan="2" class="text-center">일자</td>
                			<td colspan="4" class="text-center">결제완료주문</td>
                			<td style="vertical-align: middle; " rowspan="2" class="text-center">결제합계</td>
                			
                			<td style="vertical-align: middle" class="text-center" rowspan="2">환불합계</td>
                		</tr>
                		<tr>
                		<td class="text-center">주문수</td>
                		<td class="text-center">품목수</td>
                		<td class="text-center">상품판매금액</td>
                		<td class="text-center">포인트</td>
                			
                		</tr>
                		
                		<c:forEach var="month" items="${list }">
                		<tr class="text-center">
                			<td>${month.regdate} 
                			<td class="text-center">${month.ordercnt}</td>
                			<td class="text-center">${month.stockcnt}</td>
                			<td class="text-center">${month.totalsell}</td>
                			<td class="text-center">${month.usepoint}</td>
                			
                			<td>${month.totalsum}</td>
                			<td>${month.totalrefund}</td>
                		</tr>
                		
                		
                		</c:forEach>
                	</table>
                </div>
                </div>
                </div>

</body>
<script src="/resources/include/js/sb-admin-2.min.js"></script>
 <script src="/resources/include/vendor/chart.js/Chart.min.js"></script>
 
<script type="text/javascript" src="/resources/include/js/demo/chart-bar-month.js"></script>
</html>