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
		
		<!--[if lt IE 9]>
		<script src="/resources/include/js/html5shiv.js"></script>
		<![endif]-->
		
		<script type="text/javascript" src="/resources/include/js/common.js"></script>
		
	</head>
	<body>
		<div class="container-fluid">
		<h5 class="text-left m-0 font-weight-bold text-primary">공지게시판 관리</h5>
			<hr class="sidebar-divider">
				
		 <br/>
		 
		 
		  <div class="row">
		 <div class="container-fluid text-right">
				<span  class="m-0 font-weight-bold text-default">총</span> 
                  <span id="noticeCnt" class="m-0 font-weight-bold text-danger"></span>
                  <span class="m-0 font-weight-bold text-default">개</span> 
                  </div>
            <div class="col-lg-12">
              <div class="card shadow mb-4">
                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
<!--                   <h6 class="m-0 font-weight-bold text-primary">공지게시판 목록</h6> -->
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
              
              
              
              
           </div>
	</body>
</html>