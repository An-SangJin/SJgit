<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
   <head>
      <style type="text/css">
         input[type="number"]::-webkit-outer-spin-button,
         input[type="number"]::-webkit-inner-spin-button {
             -webkit-appearance: none;
             margin: 0;
         }
         .productPrice{
            border: 1px solid lightgray;
            text-align: center;
            width: 200px;
         }
         
         .productPrice .title{
            padding: 38px 0px 0px 0px;
            line-height: 20px;
         }
         
         .productPrice .result{
            display: table;
            width: 100%;
            height: 103px;
            vertical-align: middle;
            line-height: 28px;
            letter-spacing: -0.4px;
         }
         
         .productPrice .result .resultSpan{
            display: table-cell;
            width: 100%;
            height: 100%;
            vertical-align: middle;
            font-weight: bold;
         }
         
         .priceMinus, .pricePlus, .priceThis{
            width: 72px;
            text-align: center;
            font-size: 45px;
         }
         
         .priceMinus span, .pricePlus span, .priceThis span{
            position: relative;
            top: 50px;
         }
         
         .checkout-btn{
            padding: 30px 0px 0px 0px;
            text-align: center;
         }
         
         #orderBtn{
            width: 20%;
         }
         
         .basketDeleteBtn{
            border: none;
         }
         
         .table-responsive > th{
            text-align: center;
         }
      </style>
      <script type="text/javascript" src="/resources/include/js/jquery-2.2.4.min.js"></script>
      <c:if test="${empty user}">
      	<script type="text/javascript">
      		$(function(){
      			alert("로그인이 필요한 작업입니다.");
      			location.href="/member/login";
      		});
      	</script>
      </c:if>
      <c:if test="${not empty user }">
      <script type="text/javascript">
         var effect = "", qty = "", basketNum = 0;
         var t_price = 0, price = 0, delivery = 0, salePrice = 0, b_price = 0, payment = 0;
         
         var exp = "";
         
         var now_delivery = 0, t_payment = 0;      
         
         $(function(){
            console.log("${totalList.t_payment}");
            $(".t_price").html(Number("${totalList.t_payment}"));
            $(".t_payment").html(Number("${totalList.t_payment}"));
            $(".qty-minus").click(function(){
               effect = $(this).parents(".quantity").children("#qty");
               qty = effect.val();
               basketNum = $(this).parents(".basketNum").attr("data-num");
               exp = $(this).parents(".basketNum").find("#p_sale").val();
               //console.log(total);
               if( !isNaN( qty ) && qty > 1 ){
                  qty--;
                  effect.val(qty);
                  update();
                  
                  var total = qty * parseInt($(this).parents(".basketNum").find("#b_price").val());
                  $(this).parents(".quantity").parents(".basketNum").find(".b_price").html(total);
                  
                  t_price = Number($(this).parents(".container").find(".t_price").html());
                  price = Number($(this).parents(".basketNum").find("#p_price").val());
                  

                  if(exp < 0){
                     salePrice = qty * exp;
                     $(this).parents(".container").find(".sale").html(salePrice);
                  }
                  
                  payment = Number($(this).parents(".container").find(".t_payment").html());
                  b_price = Number($(this).parents(".basketNum").find("#b_price").val());
                  
                  $(this).parents(".container").find(".t_price").html((payment - b_price));
                  $(this).parents(".container").find(".t_payment").html((payment - b_price));                  
               }else if(qty == 1){
                  alert("수량을 1 밑으로 내릴 수 없습니다.");
               }         
               
            })
            
            $(".qty-plus").click(function(){
               effect = $(this).parents(".quantity").children("#qty");
               qty = effect.val();
               basketNum = $(this).parents(".basketNum").attr("data-num");
               exp = $(this).parents(".basketNum").find("#p_sale").val();
               console.log(exp);
               if( !isNaN( qty ) && qty >= 1 ){
                  qty++;
                  effect.val(qty);
                  update();
                  
                  var total = qty * parseInt($(this).parents(".basketNum").find("#b_price").val());
                  $(this).parents(".quantity").parents(".basketNum").find(".b_price").html(total);
                  
                  t_price = Number($(this).parents(".container").find(".t_price").html());
                  price = Number($(this).parents(".basketNum").find("#p_price").val());
                  
                  
                  if(exp < 0){
                     salePrice = qty * exp;
                     $(this).parents(".container").find(".sale").html(salePrice);                     
                  }
               
                  payment = Number($(this).parents(".container").find(".t_payment").html());
                  b_price = Number($(this).parents(".basketNum").find("#b_price").val());
                  
                  $(this).parents(".container").find(".t_price").html((payment + b_price));
                  $(this).parents(".container").find(".t_payment").html((payment + b_price));
               }
            })
            
            $(".basketDeleteBtn").click(function(){
               basketNum = $(this).parents(".basketNum").attr("data-num");
               var result = confirm("선택하신 상품을 삭제하시겠습니까?");
               if(result){
                  delbasket();
               }
            });
            
            $("#orderBtn").click(function(){
            	if($("#no-basket").attr("colspan")==5){
            		alert("장바구니에 담겨진 상품이 없습니다.");
            		return;
            	}
            	else{
	               location.href = "/orders/ordersForm";
            		
            	}
            })
         });
         
/*          function listData(){
            console.log("리스트 출력");
            $("#basketList").html("");
            var count = 0;
            
            $.getJSON("/basket/basketData", function(data){
               console.log("length: " + data.length);
               $(data).each(function(index){
                  var b_num = this.b_num;
                  var b_amount = this.b_amount;
                  var b_price = this.b_price;
                  $("#qty").val(b_amount);
                  $(".price > span").html(b_price);
               });
            }).fail(function(){
               alert("목록을 불러오는데 실패하였습니다. 잠시 후에 다시 시도해 주세요.");
            });
         } */
         
         function update(){
            $.ajax({
               url: "/basket/basketUpdate",
               type: "get",
               data: "b_num="+basketNum+"&&b_amount="+qty,
               dataType: "text",
               error: function(){
                  alert("시스템 오류입니다. 관리자에게 문의해 주세요.");         
               },
               success: function(resultData){
                  if(resultData == 0){
                     console.log(resultData);
                     alert("오류 발생");
                  }
               }
            })
         }
         
         function delbasket(){
            $.ajax({
               url: "/basket/basketDelete",
               type: "get",
               data: "b_num="+basketNum,
               dataType: "text",
               error: function(){
                  alert("시스템 오류입니다. 관리자에게 문의해 주세요.");         
               },
               success: function(resultData){
                  if(resultData == 0){
                     alert("선택하신 상품의 삭제 처리가 되지 않았습니다.\n 잠시 후에 다시 시도해 주세요.");
                  }
                  else if(resultData == 1){
                     location.href = "/basket/basketForm";
                  }
               }
            });
         }
      </script>
      </c:if>
   </head>
   <body>
       <div class="breadcrumb-area">
        <!-- Top Breadcrumb Area -->
        <div class="top-breadcrumb-area bg-img bg-overlay d-flex align-items-center justify-content-center" style="background-image: url(/resources/images/bg-img/24.jpg);">
            <h2>장바구니</h2>
        </div>
     </div>
      <div class="cart-area section-padding-0-100 clearfix">
           <div class="container">
               <div class="row">
                   <div class="col-12">
                       <div class="cart-table clearfix">
                           <table class="table table-responsive">
                               <thead>
                                   <tr>
                                       <th>상품명</th>
                                       <th>상품정보</th>
                                       <th>수량</th>
                                       <th>상품금액</th>
                                       <th></th>
                                   </tr>
                               </thead>
                               <tbody id="basketList">
                                  <c:choose>
                              <c:when test="${not empty basketList}">
                                 <c:forEach var="basket" items="${basketList}" varStatus="status">
                                    <input type="hidden" class="op_num" value="${basket.op_num}" />
                                    <tr class="basketNum" data-num="${basket.b_num}">
                                       <td class="cart_product_img">
                                                    <a href="#"><img src="/uploadStorage/pImg/${basket.p_img}" alt="Product"></a>
                                                    <h5>${basket.p_name}</h5>
                                                </td>
                                                <td class="productInfo">
                                                   <h5>${basket.op_name}</h5>
                                                </td>
                                                <td class="qty">
                                                    <div class="quantity">
                                                        <span class="qty-minus"><i class="fa fa-minus" aria-hidden="true"></i></span><!-- onclick="var effect = document.getElementById('qty'); var qty = effect.value; if( !isNaN( qty ) &amp;&amp; qty &gt; 1 ) effect.value--;return false;" -->
                                                        <input type="number" class="qty-text" id="qty" step="1" min="1" max="99" name="quantity" value="${basket.b_amount}" readonly="readonly">
                                                        <span class="qty-plus"><i class="fa fa-plus" aria-hidden="true"></i></span><!-- onclick="var effect = $(this).parents('.quantity').children('.qty-text'); var qty = effect.val(); if( !isNaN( qty )) qty++;effect.val(qty);return false;" -->
                                                    </div>
                                                </td>
                                                <td class="price">
                                                   <input id="p_price" type="hidden" value="${basket.p_price}"/>
                                                   <input id="b_price" type="hidden" value="${basket.b_price}"/>
                                                   <input id="b_amount" type="hidden" value="${basket.b_amount}"/>
                                                   <input id="p_sale" type="hidden" value="${basket.p_sale}"/>
                                                   <span class="b_price">${basket.b_price * basket.b_amount}</span>
                                                   <span>원</span>
                                                </td>
                                                <td class="action">
                                                   <button class="basketDeleteBtn" type="button">
                                                      <i class="icon_close" aria-hidden="true"></i>
                                                   </button>
                                                </td>
                                    </tr>
                                 </c:forEach>
                              </c:when>
                              <c:otherwise>
                                 <tr>
                                    <td colspan="5" id="no-basket" class="tac text-center">장바구니에 담겨진 상품이 없습니다.</td>
                                 </tr>
                              </c:otherwise>
                           </c:choose>
                               </tbody>
                           </table>
                       </div>
                   </div>
               </div>
               
               <div class="row">
                   <!-- Cart Totals -->
                   <div class="col-12 col-lg-12">
                       <div class="cart-totals-area mt-70">
                           <div class="subtotal d-flex justify-content-between">
                              <div class="productPrice">
                                 <dl class="priceList">
                                    <dt class="title">상품 총 금액</dt>
                                    <dd class="result">
                                       <span class="resultSpan">
                                          <c:choose>
                                       <c:when test="${not empty basketList}">                                             
                                                <span class="t_price"></span>                                                                                          
                                       </c:when> 
                                       <c:otherwise>
                                                <span>0</span>
                                             </c:otherwise>                                     
                                          </c:choose>
                                          <span>원</span>
                                       </span>
                                    </dd>
                                 </dl>
                              </div>
                              <div class="priceMinus">
                                 <span>-</span>
                              </div>
                              <div class="productPrice">
                                 <dl class="priceList">
                                    <dt class="title">상품 할인 금액</dt>
                                    <dd class="result">
                                       <span class="resultSpan">
                                          <c:choose>                                          
                                             <c:when test="${not empty basketList}">
                                                <span class="sale">0</span>                                                
                                             </c:when>
                                             <c:otherwise>
                                                <span>0</span>
                                             </c:otherwise>
                                          </c:choose>
                                          <span>원</span>
                                       </span>
                                    </dd>
                                 </dl>
                              </div>
                              <div class="priceThis">
                                 <span>=</span>
                              </div>
                              <div class="productPrice">
                                 <dl class="priceList">
                                    <dt class="title">결제 예정 금액</dt>
                                    <dd class="result">
                                       <span class="resultSpan">
                                          <c:choose>                                          
                                                <c:when test="${not empty basketList}">
                                                   <span class="t_payment"></span>
                                                </c:when>
                                                <c:otherwise>
                                                <span>0</span>
                                             </c:otherwise>
                                          </c:choose>
                                          <span>원</span>
                                       </span>
                                    </dd>
                                 </dl>
                              </div>
                           </div>
                           <div class="checkout-btn">
                              <form id="moveOrder">
                                 <input type="hidden" name="m_num" value="${totalList.m_num}" />
                                  <input id="orderBtn" class="btn alazea-btn" type="button" value="주문하기"/>                              
                              </form>
                           </div>
                       </div>
                   </div>
               </div>
           </div>
       </div>
    </body>
 </html>