<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<style type="text/css">
			.cart-table tbody tr td{
				text-align: left;
			}
		</style>
		<c:if test="${empty user}">
      	<script type="text/javascript">
      		$(function(){
      			alert("로그인이 필요한 작업입니다.");
      			location.href="/member/login";
      		});
      	</script>
      </c:if>
      
	</head>
	<body>
		<div class="breadcrumb-area">
        <!-- Top Breadcrumb Area -->
        <div class="top-breadcrumb-area bg-img bg-overlay d-flex align-items-center justify-content-center" style="background-image: url(/resources/images/bg-img/24.jpg);">
            <h2>구매 완료</h2>
        </div>
     </div>
		<div class="checkout_area mb-100">
	        <div class="container">
				<div class="row justify-content-between">
	            	<div class="col-12 col-lg-12">
	            		<div class="checkout_details_area clearfix">
	            			<h5>주문이 완료되었습니다.</h5>
	            			<div class="row">
	            				<div class="col-12">
	            					<div class="cart-table clearfix">
				                        <table class="table cm-table">
	                                		<tr>
	                                			<th>배송지 정보</th>
	                                			<td>
			                                	    <div>
					                                   	<c:choose>
					                                   		<c:when test="${not empty orders}">
					                                   			<c:forEach var="orders" items="${orders}" varStatus="status">
						                                			<h5>수령인 이름 : ${orders.o_name}</h5>
						                                			<h5>수령인 전화번호 : ${orders.o_phone}</h5>
						                                			<h5>배송지 : ${orders.o_address}</h5>
					                                   			</c:forEach>
				                                    		</c:when>
				                                    		<c:otherwise>
				                                    			<td>주문한 정보를 불러오지 못했습니다.</td>
				                                    		</c:otherwise>
				                                    	</c:choose>	                                		                                	    
			                                	    </div>
	                                			</td>
	                                		</tr>
	                                		<tr>
	                                			<th>
	                                				결제 정보
	                                			</th>
	                                			<td>
	                                				<div>
		                                				<c:choose>
		                                					<c:when test="${not empty orders}">				                                				
					                                			<c:forEach var="orders" items="${orders}" varStatus="status">
						                                			<h5>결제 방식 : ${orders.o_method}</h5>   
						                                			<h5>결제 금액 : ${orders.o_allprice}</h5>                     										                                									                                			
					                                			</c:forEach>
		                                					</c:when>
		                                					<c:otherwise>
		                                						<td>결제 정보를 불러오는데 실패하였습니다.</td>
		                                					</c:otherwise>
		                                				</c:choose>	                                				
	                                				</div>
	                                			</td>
	                                		</tr>
	                                	</table>
	                                	<div class="checkout-btn mt-30">
		                            		<a href="/" class="btn alazea-btn w-100">홈으로</a>
		                       			</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>