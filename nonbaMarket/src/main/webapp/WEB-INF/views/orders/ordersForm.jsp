<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
   <head>
      <style type="text/css">
         *{
            font-weight: bold;
         }
         
         .cart-table thead th:first-child{
            width: 10%;
         }
         
         .cart-table thead th:nth-child(2){
            width: 60%;
         }
         
         .cart-table tbody td:nth-child(2){
            text-align: left;
         }
         
         input[type="number"]::-webkit-outer-spin-button,
         input[type="number"]::-webkit-inner-spin-button {
             -webkit-appearance: none;
             margin: 0;
         }
         
         .cart-table thead th{
            padding: 10px 15px;
            font-size: 16px;
            font-weight: bold;
         }
         
         .checkout-content .subtotal,
         .checkout-content .shipping,
         .checkout-content .products {
            padding: 10px 0px;
            border-bottom: none;
         }
         
         
         .checkout-content .subtotal h5, 
         .checkout-content .shipping h5, 
         .checkout-content .products h5 {
            font-weight: bold;   
            font-size: 12px;
         }
         
         
         .checkout-content .order-total h5 {
            font-weight: bold;   
            font-size: 16px;
         }
         
         .checkout-content .order-total{
            padding: 20px 0px 0px 0px;
            border-top: 1px solid #ebebeb;
            border-bottom: none;
         }
         .single-products{
            padding-bottom: 10px;
            border-bottom: 1px solid #ebebeb;
            margin-bottom: 10px;
         }
         
         .subtotal, .shipping{
            margin-bottom: 10px;
         }
         
         .clearfix .orders{
            border-bottom: 1px solid #ebebeb;
            margin-bottom: 50px;
         }
         
         .clearfix h5{
            padding-bottom: 20px;
            border-bottom: 2px solid #47C83E;
         }
         
         .basketList-tbody h5, .basketList-tbody span{
            font-weight: normal;
            padding-bottom: 0px;
            border-bottom: none;
            margin-bottom: 10px;
         }
         
         .basketList-tbody span{
            font-size: 16px;
         }
         
         .userInfo .ordername, .userInfo .orderphone, .userInfo .orderemail,
         .userInfo td{
            vertical-align: middle;
            padding: 0px 0.75rem;
            border-top: none;
         }
         
         .userInfo .orderemail{
            padding: 12px 0.75rem 0px 0.75rem;
            vertical-align: top;
         }
         
         .userInfo span{
            padding: 0px 12px;
            font-size: 10px;
            font-weight: bold;
         }
         
         table #first_name, table #phone_number{
            width: 70%;
            background-color: #ffffff;
            border: 1px solid #ffffff;
            font-size: 16px; 
         }
         
         table #email_address{
            width: 100%;
            background-color: #ffffff;
            border: 1px solid #ffffff;
            font-size: 16px;
         }
         
         table #first_name:hover, table #phone_number:hover, table #email_address:hover{
            border : 1px solid #C5FFBC;
         }
         
         .delivery-table th, .delivery-table td{
            border-top: none; 
         }
         
         .delivery-table th{
            width: 20%;
         }
         
         .delivery h5{
            margin: 0px;
         }
         
         .delivery h5 span{
            font-weight: bold;
            font-size: 12px; 
         }
         
         .delivery h5 span span{
            color: red;
         }
         
         .addr-col input{
            margin-bottom: 10px;
         }
         
         .addr-col #addrBtn{
            margin-bottom: 20px;
         }
         
         .cm-table{
            width: 210%;
            border-bottom: 1px solid #ebebeb;
         }
         
         .cm-table th, .cm-table td{
            border-top: none; 
         }
         
         .payment{
            border: 2px solid #47C83E;
            padding: 10px;
         }
         
         .paymentway{
            width: 700%;
         }
         
         .custom-control{
            display: inline-block;
         }
         
         .custom-control .custom-control-input{
            height: 0px;
         }
         
         .modal {
               background-color: rgb(0,0,0); 
               background-color: rgba(0,0,0,0.4); 
         }
          
          .modal-title{
             text-align: center;
          }
           
           .modal-dialog {
              margin: 400px 600px;
               z-index: 1060px;             
           }
           
           .cm-table input{
              width: 50%;
              float: right; 
           }
           
           .coupon-area{
              display: inline-block;
              width: 100%;
           }
           
           .coupon-area #coupon{
              margin: 0px;
              float: right;
              width: 50%;
           }
           
           .mileage-area span, .coupon-td label{
              float: right;
           }
           
           .mileage-area span{
              margin-bottom: 5px;
           }
           
           .mileage-area div{
              width: 100%;
              display: inline-block;
           }
           
           .mileage-area .o_usepoint{
              text-align: right;
           }
           
           .errorMsg{
              text-align: right;
           }
      </style>
      
      <script type="text/javascript" src="/resources/include/js/jquery-2.2.4.min.js"></script>
      
      <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
      
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
         var coupon = 0, use_point = 0, point = 0, f_pay = 0, delivery = 0;
         
         var msg = "";
         
         var hName = /^[가-힣]+$/;
         
         var regPhone = /^((01[1|6|7|8|9])[1-9]+[0-9]{6,7})|(010[0-9][0-9]{7})$/;
         
         var company = "", serial = "", card_pwd = 0;
         
         var finalpay = 0;
         
         $(function(){
            
            coupon = $("#coupon").val();
            
            use_point = $(".o_usepoint").val();
            
            //페이지 로딩 시 쿠폰 사용 금액 표시
            $(".coupon-use").html(0 + "원");
            
            //페이지 로딩 시 적립금 사용 금액 표시
            $(".mileage").html(0 + "원");
            
            delivery = $(".deliveryPrice").html().split("원");
            
            $(".final_pay").html((Number("${total.t_payment}") + Number(delivery[0])) + "원");
            f_pay = "${total.t_payment + data.delivery}";
            
          	//페이지 로딩 시 적립 될 적립금 표시
          	finalpay = $(".final_pay").html().split("원");
          	
          	console.log(Number(finalpay[0]));
            point = Math.floor(Number(finalpay[0]) * "${member.g_percent}" / 100);
            $(".payment").find($(".point")).html(point + "p");
            
            $(".ps_type").val("적립");
            $(".ps_point").val(point);
            $(".m_point").val(Number("${member.m_point}") + Number(point));
            
            //주소 버튼 클릭 시 창 생성
            $("#addrBtn").click(function(){
               searchAddr();
            })
            
            $("#addrsub").blur(function(){
               $(".o_address").val($("#addr").val() + $("#addrsub").val());
               console.log($(".o_address").val());
            });
            
            $("#o_name").focus(function(){
               $(this).val("");
               $(this).blur(function(){
                  if(!hName.test($(this).val())){
                     msg = "한글만 입력해 주세요.";
                     $(this).parents().children(".errorMsg").html(msg).css({"color" : "red"});
                     $(this).val("");
                  }else{
                     $(this).parents().children(".errorMsg").html("");
                  }                  
               })
            });
            
            $("#o_phone").focus(function(){
               $(this).val("");
               $(this).blur(function(){
                  if(!regPhone.test($(this).val())){
                     msg = "잘못된 휴대폰 번호입니다.";
                     $(this).parents().children(".errorMsg").html(msg).css({"color" : "red"});
                     $(this).val("");
                  }else if(isNaN($(this).val())){
                     msg = "숫자만 입력해 주세요.";
                     $(this).parents().children(".errorMsg").html(msg).css({"color" : "red"});
                     $(this).val("");
                  }else{
                     $(this).parents().children(".errorMsg").html("");
                  }                  
               })
            });
            
            //쿠폰 선택 시
            $("#coupon").change(function(){
               //쿠폰 미사용 일때
               if($("#coupon").val() == "0"){
                  console.log($("#coupon").val());
                  
                  use_point = $(".o_usepoint").val();
                  
                  $(".coupon-use").html(0 + "원");
                  
                  $(".final_pay").html((Number("${total.t_payment}") + Number(delivery[0])) - use_point + "원");
                  
                  finalpay = $(".final_pay").html().split("원");
                  point = Math.floor(Number(finalpay[0]) * "${member.g_percent}" / 100);
                  $(".payment").find($(".point")).html(point + "p");
                  
                  console.log("${total.t_payment + data.delivery}");
                  
                  $(".i_num").val($("#coupon option:selected").attr("data-num"));
                  
               //쿠폰 사용 일때
               }else{
                  console.log($("#coupon").val());
                  
                  coupon = Math.floor(Number("${total.t_payment}") * Number($("#coupon").val() / 100));
                  
                  use_point = $(".o_usepoint").val();
                  
                  $(".coupon-use").html("-" + coupon + "원");
                  
                  $(".final_pay").html((Number("${total.t_payment}") + Number(delivery[0])) - coupon - use_point + "원");
                  
                  finalpay = $(".final_pay").html().split("원");
                  point =Math.floor( Number(finalpay[0]) * "${member.g_percent}" / 100);
                  $(".payment").find($(".point")).html(point + "p");
                  
                  $(".i_num").val($("#coupon option:selected").attr("data-num"));
               }
               
               console.log($(".i_num").val());
            });

            $(".o_usepoint").keyup(function(){
            	$(this).val($(this).val().replace(/[^0-9]/g,"")); 
            });
            
            //적립금
            $(".o_usepoint").focus(function(){
               $(this).val("");
            });
            
            $(".o_usepoint").blur(function(){
                if(Number($(this).val()) > Number("${member.m_point}")){
              	 console.log('${member.m_point}');
              	 console.log($(this).val());
                   msg = "적립된 금액 보다 사용 금액이 높습니다.";
                   $(this).parents().children(".errorMsg").html(msg).css({"color" : "red"});
                   $(this).val("0");
                   return;
                }else if($(this).val() == ""){
                    $(this).val("0");
                    use_point = $(this).val();
                    coupon = Number("${total.t_payment}") * Number($("#coupon").val() / 100);
                    $(".mileage").html(use_point + "원");
                    $(this).parents().children(".errorMsg").html("");
                    $(".payment").find($(".point")).html(point + "p");
                    $(".ps_type").val("적립");
                    $(".ps_point").val(point);
                    $(".m_point").val(Number("${member.m_point}") + Number(point));
                    $(".final_pay").html((Number("${total.t_payment}") + Number(delivery[0])) - coupon - use_point + "원");
                    return;
                 }else if(Number($(this).val()) <= Number("${member.m_point}")){
                   use_point = $(this).val();
                   coupon = Number("${total.t_payment}") * Number($("#coupon").val() / 100);
                   $(".mileage").html("-" + use_point + "원");
                   $(this).parents().children(".errorMsg").html("");
                   $(".point").html("0"+"p");
                   $(".ps_type").val("차감");
                   $(".ps_point").val(use_point);
                   $(".m_point").val(Number("${member.m_point}") - Number(use_point));
                   $(".final_pay").html((Number("${total.t_payment}") + Number(delivery[0])) - coupon - use_point + "원");
                   return;
                }
             });
            
            
            
            //결제 방법 체크박스 선택
            if($("td input[type='checkbox']").change(function(){
               $("td input[type='checkbox']").prop("checked",false);
               $(this).prop("checked",true);
               $(".o_method").val($(this).val());
               console.log($(".o_method").val());
            }))
            
            //결제하기 버튼 클릭 시 결제 모달 창 띄우기
            $("#payBtn").click(function(){
               f_pay = $(".final_pay").html().split("원");
               $(".o_allprice").val(f_pay[0]);
               console.log($(".o_allprice").val());
               if($("#addr").val().replace(/\s/g,"")==""){
                  alert("주소지를 입력해 주세요.");
                  $("#addr").val("");
                  $("#addr").focus();
                  return;
               }else if($("#addrsub").val().replace(/\s/g,"")==""){
            	  alert("상세주소를 입력해주세요.");
            	  $("#addrsub").focus();
            	  return;
               }else if(!$("#cardCheck").is(":checked") && !$("#phoneCheck").is(":checked")){
                  alert("결제 방법을 선택해 주세요.");
                  return;
               }else if($("#cardCheck").is(":checked")){
                  $('#cardModal').modal();
                  $('#cardModal').css("opacity","1");
                  $(".modal-backdrop").css("z-index", "0");
                  $(".modal-final-pay").html($(".final_pay").html());
                  return;
               }else if($("#phoneCheck").is(":checked")){
                  $('#phoneModal').modal();
                  $('#phoneModal').css("opacity","1");
                  $(".modal-backdrop").css("z-index", "0");
                  $(".modal-final-pay").html($(".final_pay").html());
                  return;
               }
              });
            
            $("#cardpaymentBtn").click(function(){
               console.log($("#card_serialnum").val());
               if($("#card-company").val() == "선택하세요."){
                  alert("카드회사를 선택해 주세요.");
                  return;
               }else if(isNaN($("#card_serialnum").val())){
                  alert("카드 시리얼 입력 창에 숫자로만 입력해 주세요.");
                  return;
               }else if(isNaN($("#card_pwd").val())){
                  alert("비밀번호 입력 창에 숫자로만 입력해 주세요.");
                  return;
               }
               
               company = $("#card-company").val();
               serial = $("#card_serialnum").val();
               card_pwd = $("#card_pwd").val();
               
               payment_card();
            });
            
            $("#phonepaymentBtn").click(function(){
               if($("#m_phone").val() == ""){
                  alert("폰 번호를 입력해 주세요.");
                  return;
               }else if($("#m_name").val() == ""){
                  alert("이름을 입력해 주세요.");
                  return;
               }
               
               payment_phone();
            });
         }); //최상위 종료
         
         //주소 함수
         function searchAddr(){
            new daum.Postcode({
               oncomplete: function(data) {
                  // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
                  
                  // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                  // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                  var addr = ''; // 주소 변수
                  var extraAddr = ''; // 참고항목 변수
                  
                  //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                  if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                      addr = data.roadAddress;
                  } else { // 사용자가 지번 주소를 선택했을 경우(J)
                      addr = data.jibunAddress;
                  }
                  
                  // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                  if(data.userSelectedType === 'R'){
                      // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                      // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                      if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                          extraAddr += data.bname;
                      }
                      // 건물명이 있고, 공동주택일 경우 추가한다.
                      if(data.buildingName !== '' && data.apartment === 'Y'){
                          extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                      }
                      // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                      if(extraAddr !== ''){
                          addr +=' (' + extraAddr + ')';
                      }
                  } 
                  
                  // 우편번호와 주소 정보를 해당 필드에 넣는다.
                  $("#addrBox").css("display","block");
                  $("#addr").val(addr+" ["+ data.zonecode +"]");
               }
            }).open();
         };
         
         function payment_card(){
            $.ajax({
               url: "/orders/cardPay",
               type: "get",
               data: "card_company="+company+"&&card_serialnum="+serial+"&&card_pwd="+card_pwd,
               dataType: "text",
               error: function(){
                  alert("시스템 오류입니다. 관리자에게 문의해 주세요.");         
               },
               success: function(resultData){
                  if(resultData == 0){
                     console.log(resultData);
                     alert("오류 발생");
                  }else if(resultData == 1){
                     alert("카드 체크 완료");
                     orderInfoFunc();
                  }
               }
            })
         }
         
         function payment_phone(){
            $.ajax({
               url: "/orders/phonePay",
               type: "get",
               data: "m_num="+$(".m_num").val()+"&&m_phone="+$("#m_phone").val(),
               dataType: "text",
               error: function(){
                  alert("시스템 오류입니다. 관리자에게 문의해 주세요.");         
               },
               success: function(resultData){
                  if(resultData == 0){
                     console.log(resultData);
                     alert("오류ㅇ 발생");
                  }else if(resultData == 1){
                     alert("폰 결제 완료");
                     orderInfoFunc();
                  }
               }
            })
         }
         
         function orderInfoFunc(){
            console.log($("#o_form").serialize());
            $.ajax({
               url: "/orders/ordersFunction",
               type: "post",
               data: $("#o_form").serialize(),
               dataType: "text",
               error: function(){
                  alert("시스템 오류입니다. 관리자에게 문의해 주세요.");         
               },
               success: function(resultData){
                  if(resultData == 0){
                     console.log(resultData);
                     alert("오류1222 발생");
                  }else{
                	  $("#o_num").removeAttr("disabled");
                	  $("#o_num").val(resultData);
                     $("#o_form").submit();
                  }
               }
            })
         }   
         
        
      </script>
      </c:if>
   </head>
   <body>
      <div class="breadcrumb-area">
        <!-- Top Breadcrumb Area -->
        <div class="top-breadcrumb-area bg-img bg-overlay d-flex align-items-center justify-content-center" style="background-image: url(/resources/images/bg-img/24.jpg);">
            <h2>상품구매</h2>
        </div>
     </div>
      <div class="checkout_area mb-100">
           <div class="container">
              <form id="o_form" action="/orders/ordersComplete" method="post">
              		<input disabled="disabled" type="hidden" name="o_num" id="o_num">
                  <div class="row justify-content-between">
                     <div class="col-12 col-lg-12">
                        <div class="checkout_details_area clearfix">
                           <h5>상품 정보</h5>
                           <div class="row">
                              <div class="col-12">
                                 <div class="cart-table clearfix">
                                       <table class="table table-responsive">
                                           <thead class="basketList-thead">
                                               <tr>
                                                  <th></th>
                                                   <th>상품정보</th>
                                                   <th>상품금액</th>
                                               </tr>
                                           </thead>
                                           <tbody class="basketList-tbody">
                                              <c:choose>
                                          <c:when test="${not empty basketList}">
                                             <c:forEach var="basket" items="${basketList}" varStatus="status">
                                             	<input type="hidden" name="list[${status.index}].p_num" value="${basket.p_num }">
                                             	<input type="hidden" name="list[${status.index}].op_num" value="${basket.op_num }">
                                             	<input type="hidden" name="list[${status.index}].d_name" value="${basket.p_name}">
                                             	<input type="hidden" name="list[${status.index}].d_img" value="${basket.p_img }">
                                             	<input type="hidden" name="list[${status.index}].d_amount" value="${basket.b_amount}">
                                             	<input type="hidden" name="list[${status.index}].d_price" value="${basket.b_price}">
                                             	
                                                <tr class="basketNum" data-num="${basket.b_num}">
                                                   <td class="cart_product_img" colspan="2">
                                                                <a href="#"><img class="asd" src="/uploadStorage/pImg/${basket.p_img}" alt="Product"></a>
                                                            </td>
                                                            <td>
                                                                <h5>${basket.p_name}</h5>
                                                                <c:if test="${not empty basket.op_name}">
                                                                   <span>${basket.op_name} / </span>
                                                               </c:if>
                                                               <span>${basket.b_amount}개</span>
                                                            </td>
                                                            <td class="price">
                                                               <input id="p_price" type="hidden" value="${basket.p_price}"/>
                                                               <input id="b_price" type="hidden" value="${basket.b_price}"/>
                                                               <input id="b_amount" type="hidden" value="${basket.b_amount}"/>
                                                               <input id="p_sale" type="hidden" value="${basket.p_sale}"/>
                                                               <span class="b_price">${basket.b_price * basket.b_amount}</span>
                                                               <span>원</span>
                                                            </td>
                                                </tr>
                                             </c:forEach>
                                          </c:when>
                                          <c:otherwise>
                                             <tr>
                                                <td colspan="3" class="tac text-center">장바구니에 담겨진 상품이 없습니다.</td>
                                             </tr>
                                          </c:otherwise>
                                       </c:choose>
                                           </tbody>
                                       </table>
                                   </div>
                              </div>
                           </div>
                        </div>
                     </div>
                     
                     <div class="col-12 col-lg-12">
                          <div class="checkout_details_area clearfix">
                              <h5>주문자 정보</h5>
                               <div class="row">
                                  <div class="col-12 col-lg-12 orders">
                                     <c:choose>
                                        <c:when test="${not empty member}">
                                           <input type="hidden" name="m_num" value="${member.m_num}"/>
                                           <table class="table table-resp onsive">
                                              <tr class="userInfo">
                                                 <th class="ordername">
                                                      <label for="first_name">주문자 *</label>
                                                 </th>
                                                 <td>
                                                     <div class="col-md-4">
                                                         <input type="text" class="form-control" name="m_name" id="first_name" value="${member.m_name}" readonly="readonly">
                                                      </div>
                                                 </td>
                                              </tr>
                                              <tr class="userInfo">
                                                 <th class="orderphone">
                                                      <label for="phone_number">휴대폰 *</label>
                                                 </th>
                                                 <td>
                                                     <div class="col-md-4">
                                                         <input type="text" class="form-control" name="m_phone" id="phone_number" value="${member.m_phone}" readonly="readonly">
                                                     </div>
                                                 </td>
                                              </tr>
                                              <tr class="userInfo">
                                                 <th class="orderemail" rowspan="2">
                                                      <label for="email_address">이메일 *</label>
                                                 </th>
                                                 <td>
                                                     <div class="col-md-4">
                                                         <input type="email" class="form-control" name="m_email" id="email_address" value="${member.m_email}" readonly="readonly">
                                                     </div>
                                                    <div class="col-md-12">
                                                       <span>이메일을 통해 주문처리 과정을 보내드립니다.</span><br />
                                                       <span>정보 변경은 마이페이지 메뉴에서 변경 할 수 있습니다.</span>
                                                    </div>
                                                 </td>
                                              </tr>
                                           </table>
                                        </c:when>
                                        <c:otherwise>
                                    <input type="hidden" name="m_num" value="${member.m_num}"/>
                                           <table class="table table-resp onsive">
                                              <tr class="userInfo">
                                                 <th class="ordername">
                                                      <label for="first_name">주문자 *</label>
                                                 </th>
                                                 <td>
                                                     <div class="col-md-4">
                                                         <input type="text" class="form-control" name="m_name" id="first_name" value="" />
                                                      </div>
                                                 </td>
                                              </tr>
                                              <tr class="userInfo">
                                                 <th class="orderphone">
                                                      <label for="phone_number">휴대폰 *</label>
                                                 </th>
                                                 <td>
                                                     <div class="col-md-4">
                                                         <input type="text" class="form-control" name="m_phone" id="phone_number" value="" />
                                                     </div>
                                                 </td>
                                              </tr>
                                              <tr class="userInfo">
                                                 <th class="orderemail" rowspan="2">
                                                      <label for="email_address">이메일 *</label>
                                                 </th>
                                                 <td>
                                                     <div class="col-md-4">
                                                         <input type="email" class="form-control" name="m_email" id="email_address" value="" />
                                                     </div>
                                                    <div class="col-md-12">
                                                       <span>이메일을 통해 주문처리 과정을 보내드립니다.</span><br />
                                                       <span>정보 변경은 마이페이지 메뉴에서 변경 할 수 있습니다.</span>
                                                    </div>
                                                 </td>
                                              </tr>
                                           </table>
                                        </c:otherwise>
                                     </c:choose>
                                   </div>
                               </div>
                          </div>
                      </div>
                      
                      <div class="col-12 col-lg-12">
                          <div class="checkout_details_area clearfix delivery">
                              <h5>배송 정보&nbsp;&nbsp;
                                 <span>*정기 배송 휴무일 : 상진배송(<span>휴무없음</span>),택배배송(<span>일요일</span>)</span>
                              </h5>
                               <div class="row">
                                  <div class="col-12 col-lg-12 orders">
                                     <table class="table table-resp onsive delivery-table">
                                        <tr class="addr-col">
                                           <th class="ordername">
                                                <label for="first_name">주소</label>
                                           </th>
                                           <td>
                                               <div class="col-md-2">
                                                   <input type="button" class="form-control" id="addrBtn" value="배송지 검색">
                                                </div>
                                                <div class="col-md-8">
                                                   <input type="text" class="form-control" id="addr" value="" placeholder="주소" readonly="readonly"/>
                                                </div>
                                                <div class="col-md-8">
                                                   <input type="text" class="form-control" id="addrsub" value="" placeholder="나머지 주소"/>                                                
                                                </div>
                                                <div>
                                                   <input type="hidden" class="o_address" name="o_address" />
                                                </div>
                                                <p class="errorMsg"></p>
                                           </td>
                                        </tr>
                                        <tr>
                                           <th class="orderphone">
                                                <label for="o_name">수령인 이름*</label>
                                           </th>
                                           <td>
                                               <div class="col-md-4">
                                                   <input type="text" class="form-control o_name" name="o_name" id="o_name" value="${member.m_name}">
                                                   <p class="errorMsg"></p>
                                               </div>
                                           </td>
                                        </tr>
                                        <tr>
                                           <th class="orderemail" rowspan="2">
                                                <label for="o_phone">휴대폰*</label>
                                           </th>
                                           <td>
                                               <div class="col-md-4">
                                                   <input type="text" class="form-control" name=o_phone id="o_phone" value="${member.m_phone}" maxlength="11">
                                                   <p class="errorMsg"></p>
                                               </div>
                                           </td>
                                        </tr>
                                     </table>
                                   </div>
                               </div>
                          </div>
                      </div>
   
                      <div class="col-12 col-lg-7">
                          <div class="checkout_details_area clearfix">
                              <h5>쿠폰 / 적립금</h5>
                               <div class="row">
                                   <div class="col-md-6 mb-4">
                                      <table class="table cm-table">
                                         <tr>
                                            <th>쿠폰 적용</th>
                                            <td class="coupon-td">
                                                <label class="coupon_label" for="coupon">사용 가능 쿠폰</label>
                                                <div class="coupon-area">
                                                   <select class="custom-select" id="coupon">
                                                      <c:choose>
                                                         <c:when test="${not empty issue}">
                                                            <option value="0" data-num="0">사용 안함</option>
                                                            <c:forEach var="coupon" items="${issue}" varStatus="status">
                                                               <c:if test="${coupon.i_state != 'O'}">
                                                                   <option value="${coupon.c_percent}" data-num="${coupon.i_num}">${coupon.c_name}</option>
                                                                </c:if>
                                                            </c:forEach>
                                                            <input type="hidden" class="i_num" name="i_num" value="0" />   
                                                         </c:when>
                                                         <c:otherwise>
                                                            <option value="0">사용가능한 쿠폰이 없습니다.</option>
                                                         </c:otherwise>
                                                      </c:choose>                                   
                                                   </select>                                                
                                                </div>
                                            </td>
                                         </tr>
                                         <tr>
                                            <th>
                                               <label>적립금 적용</label>
                                            </th>
                                            <td>
                                               <div class="mileage-area">
                                                  <c:choose>
                                                     <c:when test="${not empty member}">
                                                        <span>사용 가능한 적립금 &nbsp;&nbsp;${member.m_point}p</span>
                                                        <div>
                                                           <input type="text" class="o_usepoint" name="o_usepoint" value="0" max="${member.m_point}"/>
                                                           <input type="hidden" class="ps_type" name="ps_type"/>
                                                           <input type="hidden" class="ps_point" name="ps_point" />
                                                           <input type="hidden" class="m_point" name="m_point" />
                                                        </div>                                             
                                                        <p class="errorMsg"></p>                                                        
                                                     </c:when>
                                                     <c:otherwise>
                                                        <span>사용 가능한 적립금이 없습니다.</span><br />
                                                        <span>회원 로그인 시 사용 가능한 적립금이 표시 됩니다.</span>
                                                     </c:otherwise>
                                                  </c:choose>                                               
                                               </div>
                                            </td>
                                         </tr>
                                      </table>
                                   </div>                                 
                               </div>
                          </div>
                          <div class="checkout_details_area clearfix">
                              <h5>결제 방법</h5>
                               <div class="row">
                                   <div class="col-md-12 mb-7">
                                      <div class="col-12">
                                          <div class="d-flex align-items-center">
                                              <!-- Single Checkbox -->
                                    <table class="paymentway">
                                       <tr>
                                          <th>
                                             <label>일반 결제</label>
                                          </th>
                                          <td>
                                                       <div class="custom-control custom-checkbox align-items-center mr-30">
                                                           <input type="checkbox" class="custom-control-input" id="cardCheck" value="card">
                                                           <label class="custom-control-label" for="cardCheck">신용카드</label>
                                                       </div>
                                                       <!-- Single Checkbox -->
                                                       <div class="custom-control custom-checkbox align-items-center">
                                                           <input type="checkbox" class="custom-control-input" id="phoneCheck" value="phone">
                                                           <label class="custom-control-label" for="phoneCheck">휴대폰</label>
                                                       </div>
                                                       <input type="hidden" class="o_method" name="o_method"/>
                                          </td>
                                       </tr>
                                    </table>
                                          </div>
                                      </div>
                                   </div>                                 
                               </div>
                          </div>
                      </div>
                                   
                  <div class="col-12 col-lg-4">
                      <div class="checkout-content">
                        <h5 class="title--">결제 금액</h5>
                        <div class="payment">
                           <div class="single-productsorder-total d-flex justify-content-between align-items-center">
                               <h5>상품금액</h5>
                               <h5>${total.t_payment}<span>&nbsp;원</span></h5>
                           </div>
                                 <div class="subtotal d-flex justify-content-between align-items-center">
                                     <h5>상품 할인액</h5>
                                     <h5>${total.t_payment-total.t_payment}<span>&nbsp;원</span></h5>
                                 </div>
                                 <div class="shipping d-flex justify-content-between align-items-center delivery">
                                     <h5>배송비</h5>
                                     <c:if test="${empty total}">
                                        <h5 class="deliveryPrice">0원</h5>
                                     </c:if>
                                     <c:if test="${total.t_payment >= 50000}">
                                        <h5 class="deliveryPrice">0원</h5>
                                     </c:if>
                                     <c:if test="${total.t_payment <= 50000}">
                                        <h5 class="deliveryPrice">3000원</h5>
                                     </c:if>
                                 </div>
                                 <div class="shipping d-flex justify-content-between align-items-center">
                                     <h5>쿠폰사용</h5>
                                     <h5 class="coupon-use"></h5>
                                 </div>
                                 <div class="shipping d-flex justify-content-between align-items-center point-use">
                                     <h5>적립금사용</h5>
                                     <h5 class="mileage"></h5>
                                 </div>
                                 <div class="order-total d-flex justify-content-between align-items-center">
                                     <h5>최종 결제 금액</h5>
                                    <h5 class="final_pay"></h5>
                                    <input type="hidden" name="o_allprice" class="o_allprice" />                                     
                                 </div>
                                  <div class="shipping d-flex justify-content-between align-items-center">
                                     <h5>구매 시 적립액</h5>
                                     <h5 class="point"></h5>
                                  </div>
                                  <div class="shipping d-flex justify-content-between align-items-center">
                                     <h5></h5>
                                     <h5 style="font-size: 14px; float: right;">포인트 사용 시 적립액은 적립되지 않습니다.</h5>
                                  </div>
                        </div>
                              <div class="checkout-btn mt-30">
                                  <a href="#" class="btn alazea-btn w-100" id="payBtn">결제하기</a>
                              </div>
                          </div>                     
                      </div>
                  </div>
               </form>
           </div>
       </div>
       <!-- ##### Checkout Area End ##### -->
       
       <!-- The Modal -->
      <div class="modal fade" id="cardModal" tabindex="-1" role="dialog" aria-labelledby="paymentModalLabel" aria-hidden="true" data-backdrop="static" data-keyboard="false">
         <div class="modal-dialog">
            <div class="modal-content">
               <div class="modal-header">
                  <h4 class="modal-title" id="paymentModalLabel">결제 하기</h4>
               </div>
               <div class="modal-body">
                  <form id="f_writeForm" name="f_writeForm">
                     <div class="form-group">
                        <label for="card_company" class="control-label">카드 회사</label>
                        <div class="card-companys">
                           <select class="custom-select d-block w-100" id="card-company">
		                        <option value="선택하세요">선택하세요.</option>
		                        <option value="신한" data-num>신한</option>
		                        <option value="우리" data-num>우리</option>
		                        <option value="삼성" data-num>삼성</option>
		                        <option value="하나" data-num>하나</option>
		                        <option value="국민" data-num>국민</option>
		                     </select>                                         
                        </div>
                     </div>
                     <div class="form-group">
                        <label for="card_serialnum" class="control-label">카드 번호</label>
                        <input type="text" class="form-control" name="card_serialnum" id="card_serialnum" maxlength="16" />
                     </div>
                     <div class="form-group">
                        <label for="card_pwd" class="control-label">카드 비밀 번호</label>
                        <input type="password" class="form-control" name="card_pwd" id="card_pwd" maxlength="4" />
                     </div>
                     <div class="form-group">
                        <label for="t_payment" class="control-label">결제 금액</label>
                        <p class="modal-final-pay"></p>
                     </div>
                  </form>
               </div>
               <div class="modal-footer">
                  <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
                  <button type="button" class="btn btn-primary" id="cardpaymentBtn">결제</button>
               </div>
            </div>
         </div>
      </div>
      
      <div class="modal fade" id="phoneModal" tabindex="-1" role="dialog" aria-labelledby="paymentModalLabel" aria-hidden="true" data-backdrop="static" data-keyboard="false">
         <div class="modal-dialog">
            <div class="modal-content">
               <div class="modal-header">
                  <h4 class="modal-title" id="paymentModalLabel">결제 하기</h4>
               </div>
               <div class="modal-body">
                  <form id="f_writeForm" name="f_writeForm">
                     <input type="hidden" class="m_num" name="m_num" value="${member.m_num}"/>
                     <div class="form-group">
                        <label for="phone_number" class="control-label">핸드폰 번호</label>
                        <div class="card-companys">
                           <input type="text" class="form-control" name="m_phone" id="m_phone" maxlength="11" />                                       
                        </div>
                     </div>
                     <div class="form-group">
                        <label for="m_name" class="control-label">이름</label>
                        <input type="text" class="form-control" name="m_name" id="m_name" maxlength="5" />
                     </div>
                     <div class="form-group">
                        <label for="t_payment" class="control-label">결제 금액</label>
                        <p class="modal-final-pay"></p>
                     </div>
                  </form>
               </div>
               <div class="modal-footer">
                  <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
                  <button type="button" class="btn btn-primary" id="phonepaymentBtn">결제</button>
               </div>
            </div>
         </div>
      </div>
   </body>
</html>