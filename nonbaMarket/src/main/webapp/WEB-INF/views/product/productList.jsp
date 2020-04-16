<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>



<style type="text/css">
	.salePrice{
		text-decoration: line-through;
		color: #cfcfcf;
	}
	.saleNum{
		float:rigth;
		font-size: 30px;
		color: red;
	}
	.saleImg{
		width: 40px;
		height: 40px;
		float: right;
	}
	
</style>
<body>
	<div class="breadcrumb-area">
        <!-- Top Breadcrumb Area -->
        <div class="top-breadcrumb-area bg-img bg-overlay d-flex align-items-center justify-content-center" style="background-image: url(/resources/images/bg-img/24.jpg);">
            <h2>Shop</h2>
        </div>
     </div>
<section class="new-arrivals-products-area bg-gray section-padding-100">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <!-- Section Heading -->
                    <div class="section-heading text-center">
                    <h1 style="text-align: left;">${lcName}</h1><br/>
                        <a href="/product/categori?lc_num=${lcNum}"><h3 class="mc_hover" style="display: inline-block; margin-right: 20px;margin-bottom:20px; float: left;text-shadow: 1px 1px 1px; text-decoration: underline;">전체</h3></a>
                        <c:forEach var="mlist" items="${mcList}" varStatus="index">
                        <a href="/product/categori?mc_num=${mlist.mc_num}"><h3 class="mc_hover" style="display: inline-block; margin-right: 20px;margin-bottom:20px; float: left;text-shadow: 1px 1px 1px; text-decoration: underline;">${mlist.mc_name}</h3></a>
                        
                        </c:forEach>
                    </div>
                </div>
            </div>

            <div class="row">

                <!-- Single Product Area -->
                <c:forEach var="p_list" items="${list}">
                <div class="col-12 col-sm-6 col-lg-3">
                    <div class="single-product-area mb-50 wow fadeInUp" data-wow-delay="100ms">
                        <!-- Product Image -->
                        <div class="product-img">
                            <a href="/product/productDetail?p_num=${p_list.p_num}"><img style="width: 255px; height: 255px;" src="/uploadStorage/pImg/${p_list.p_img }" alt=""/></a>
                            <!-- Product Tag -->
                          
                        </div>
                        <!-- Product Info -->
                        <div class="product-info mt-15 tesxt-center">
                        	 <c:choose>
                            	<c:when test="${p_list.p_sale!=0 }">
                            		<a href="#">
                               			<span>${p_list.p_name }</span>
                            		</a>
                            		<img class="saleImg" alt="sale" src="/resources/images/sale.png"/><span class="saleNum">${p_list.p_sale}%</span>
                          
                            		<h5 class="totalPrice">>${Integer(p_list.p_price*(100-p_list.p_sale)/100)}원</h5><h6 class="salePrice">${p_list.p_price}원</h6>                           		
                           		</c:when>
                           		<c:otherwise>
                           			<a href="#">
                               			<span>${p_list.p_name }</span>
                            		</a>
                           			<h6>${p_list.p_price}원</h6>
                           		</c:otherwise>
                        	</c:choose>
                        </div>
                    </div>
                </div>
                </c:forEach>

                <div class="col-12 text-center">
                    <a href="#" class="btn alazea-btn">View All</a>
                </div>

            </div>
        </div>
    </section>
    <!-- ##### Product Area End ##### -->
 </body>
 <script src=""></script>
<script type="text/javascript">
	$(function() {
		$(".mc_hover").hover(function() {
			$(this).css("color","green");
		}, function() {
			$(this).css("color","black");	
		});
	});
</script>