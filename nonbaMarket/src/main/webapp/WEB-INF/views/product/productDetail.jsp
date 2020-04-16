<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  <script src="https://code.jquery.com/jquery-latest.js"></script> 
  
 <script src="/resources/include/js/common.js"></script>
    <style type="text/css">
    
    .starR{
        background: url('http://miuu227.godohosting.com/images/icon/ico_review.png') no-repeat right 0;
        background-size: auto 100%;
        width: 20px;
        height: 20px;
        display: inline-block;
        text-indent: -9999px;
        cursor: pointer;
   }
	.starR.on{background-position:0 0;}
    
     .modal2 {
            display: none; /* Hidden by default */
            position: fixed; /* Stay in place */
            z-index: 5; /* Sit on top */
            left: 0;
            top: 0;
            width: 100%; /* Full width */
            height: 100%; /* Full height */
            overflow: auto; /* Enable scroll if needed */
            background-color: rgb(0,0,0); /* Fallback color */
            background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
        }
    
        /* Modal Content/Box */
        .modal-content2 {
            background-color: #fefefe;
            margin: 15% auto; /* 15% from the top and centered */
            padding: 20px;
            border: 1px solid #888;
            width: 50%; /* Could be more or less, depending on screen size */                          
        }
    	 input[type="number"]::-webkit-outer-spin-button,
         input[type="number"]::-webkit-inner-spin-button {
             -webkit-appearance: none;
             margin: 0;
             
         }
         .plus{
     		padding:8px;;
         	background-image:url("/resources/images/cil-caret-top.png") ;
         	vertical-align: middle;
         	margin:0px;
         	cursor: pointer;
         }
         .minus{
         	padding: 8px;
         	cursor: pointer;
         	margin:0px;
         	background-image: url("/resources/images/cil-caret-bottom.png");
         	vertical-align: middle;
         }
         .close{
         	padding: 8px;
         	cursor: pointer;
         	margin:0px;
         	background-image: url("/resources/images/cil-remove.png");
         	
         }
         select{
         	width:100%;
         }
         .totalPrice{
         	margin-top: 20px; 
         	margin-bottom: 20px; 
         	text-align: right;
         }
         .cart--area{
         	float: right;
         }
  
         .addOption2{
         	margin-bottom:10px;
         	border-bottom: 1px solid #D8D8D8;
         }
                  
         .plus2{
     		padding:8px;;
         	background-image:url("/resources/images/cil-caret-top.png") ;
         	vertical-align: middle;
         	margin:0px;
         	cursor: pointer;
         }
         .minus2{
         	padding: 8px;
         	cursor: pointer;
         	margin:0px;
         	background-image: url("/resources/images/cil-caret-bottom.png");
         	vertical-align: middle;
         }
         .reviewInsert{
         	text-align: right;
         }
         .contentHide{
         	display: none;
         }
         
        .pagination a {
  			display: inline-block;
		}
		.inqInsert{
			text-align: right;
		}

.pagination a {
  color: black;
  float: left;
  padding: 8px 16px;
  text-decoration: none;
  border: 1px solid #ddd;
}

.pagination a.active {
  background-color: #4CAF50;
  color: white;
  border: 1px solid #4CAF50;
}

.pagination a:hover:not(.active) {background-color: #ddd;}

.pagination a:first-child {
  border-top-left-radius: 5px;
  border-bottom-left-radius: 5px;
}

.pagination a:last-child {
  border-top-right-radius: 5px;
  border-bottom-right-radius: 5px;
}
    </style>
   <script type="text/javascript">
   
   

//팝업 Close 기능
function close_pop(flag) {
     $('#myModal').hide();
};
   		var re_num = 0;
   		var t_price = 0;
   		console.log(t_price);
   		var pi_num=0;
   		var array_op_num = new Array();
   		var bool=true;
   		var bool2;
   		
   		$(function() {
   			//별점
   			$('.starRev input').click(function(){
   			  $(this).parent().children('input').removeClass('on');
   			  $(this).addClass('on').prevAll('input').addClass('on');
   			  $("#gpa").val($(this).val());
   			  return false;
   			});
   			
   			
   			
   			//닫기 눌렀을때
   			$("#closeBtn").click(function () {
   			 	$('#myModal').hide();
			});
   			
   			$("#closeBtn2").click(function () {
   			 	$('#myModal2').hide();
			});

			var pageNum = 1;
			var paging = $(".paging");
			var paging2 = $(".paging2");
			
			function pagenav() {
				listData().then(function (reviewCnt) {
					showPage(pageNum,reviewCnt,paging);
				});
			}
			function pagenav2() {
				listData2().then(function (reviewCnt) {
					showPage(pageNum,reviewCnt,paging2);
					
				});
			}
			pagenav();
			
			pagenav2();
			
			paging.on("click",".pagination li a", function(e) {
				e.preventDefault();
				var targetPageNum = $(this).attr("href");
				console.log("targetPageNum: "+targetPageNum);
				pageNum = targetPageNum;
				
				$("#pageNum").val(targetPageNum);
					pagenav();
					$("#reviewUpdate").attr("disabled","disabled");
					$("#reviewDelete").attr("disabled","disabled");
			});
			
			paging2.on("click",".pagination li a", function(e) {
				e.preventDefault();
				var targetPageNum = $(this).attr("href");
				console.log("targetPageNum: "+targetPageNum);
				pageNum = targetPageNum;
				
				$("#pageNum").val(targetPageNum);
					pagenav2();
					$("#reviewUpdate").attr("disabled","disabled");
					$("#reviewDelete").attr("disabled","disabled");
			});
			
			
			
			
			if(${vo.p_sale}!=0){
				var price = ${vo.p_price}*(100-${vo.p_sale})/100;
				console.log(price);
				$(".price2").html(${vo.p_price}+"원");
				$(".sale").html(${vo.p_sale}+"%");
				$(".saleTitle").html("할인가").css("margin-bottom","0px");
				$(".price2").css({"text-decoration":"line-through","color":"#CFCFCF"});
				
				$(".price").html("->"+price+"원").css("color","green");
			}else{
				$(".price").html(${vo.p_price}+"원");
				$(".price2").hide();
				$(".sale").hide();
				$(".saleTitle").hide();
			}
		
			var check="${vo.p_option}";
			if(check=='X'&&${vo.p_sale}!=0){
				addItem("구매수량");
				totalPrice(${vo.p_price}*(100-${vo.p_sale})/100);
			}else if(check=='X'){
				addItem("구매수량");
				totalPrice(${vo.p_price});
			}else{
				totalPrice(0);
				$.ajax({
					url:"/product/productOption",
					type:"post",
					data:"p_num="+${vo.p_num},
					dataType:"json",
					error: function() {
						alert("시스템 오류입니다. 관리자에게 문의 하세요.");
					},
					success : function(data) {
						addSelect("상품 선택")
							var new_option = $("<option>");
				
							$(".p_option").append(new_option.append("상품 선택"));
						$(data).each(function() {
							var new_span = $("<span>");
							var new_div=$("<div>");
							var op_num = this.op_num;
							var op_name = this.op_name;
							var op_price = this.op_price;
							console.log(op_name);
							var new_option = $("<option>");
							new_option.addClass("optionMenu");
						
							var new_a = $("<a>");
							new_a.attr({"href":"#","data-num":op_num,"data-name":op_name,"data-price":op_price});
							new_a.addClass("aClass");
							$(".p_option").append(new_option.append(new_a.append(op_name)).append(new_div.append(new_span.append(op_price+"원"))));
						});
					}
				});
   			}
			
				$(document).on("click","label[class=close]", function () {
				
				$(this).parents(".addOption").parents(".removeDiv").remove();
				var price =$(this).parents(".addOption").parents(".removeDiv").children(".addOption2").find("span").html();
				var array = new Array();
				array= price.split("원");
				t_price = Number(t_price)-Number(array[0]);
				$(".total").html(t_price);
				console.log(t_price);
			});
			
			$(document).on("change","select[class=p_option]", function() {
				/* $(".p_option").children("option:eq(0)").prop("selected",true); */
				var array = new Array();
				
				var op_num = $(this).find("option:selected").find("a").attr("data-num");
				console.log(op_num);
				var op_name = $(this).find("option:selected").find("a").attr("data-name");
				var op_price = $(this).find("option:selected").find("a").attr("data-price");
				
				$(".addOption").find("span").each(function () {
					array.push($(this).attr("data-name"));
				});
				console.log(array);
				for(var a = 0;a<array.length;a++){
			 		if(op_name==array[a]){ 
						alert("이미 선택된 상품입니다.");
						$(this).children("option:eq(0)").prop("selected",true);
						return;
			 		}
				}
				addOption(op_num,op_name,op_price);
				
				$(this).children("option:eq(0)").prop("selected",true);
				t_price = Number(t_price)+Number(op_price);
				$(".total").html(t_price);
				
			});
			
			
			
			$(document).on("click","label[class=plus]", function() {
				var count = $(this).parents(".addOption2").children("input[type=number]").val();
				console.log(count);
				count++;
				$(this).parents(".addOption2").children("input[type=number]").val(count);
				
				var price =$(this).parents(".addOption2").children("span[data-price]").attr("data-price");
				console.log(price*count);
				var total = price*count;
				
				$(this).parents(".addOption2").children("span[data-price]").html(total+"원");
				t_price=Number(t_price)+Number(price);
				$(".total").html(Number(t_price));
			});
			$(document).on("click","label[class=minus]", function() {
				var count = $(this).parents(".addOption2").children("input[type=number]").val();
				if(count==1){
					alert("더이상 수량을 내릴 수 없습니다.");
				}else{
					count--;
					$(this).parents(".addOption2").children("input[type=number]").val(count);		
					
					var price =$(this).parents(".addOption2").children("span[data-price]").attr("data-price");
					console.log(price*count);
					var total = price*count;
					
					$(this).parents(".addOption2").children("span[data-price]").html(total+"원");
					
					t_price=Number(t_price)-Number(price);
					$(".total").html(Number(t_price));
				}
			});
			
			$(document).on("click","label[class=plus2]", function() {
				var count = $("input[type=number]").val();
				count ++;
				$("input[type=number]").val(count);
				
				if(${vo.p_sale}!=0){
					var price = ${vo.p_price}*(100-${vo.p_sale})/100;
					var total = price*count;
					t_price = total;
					$(".total").html(Number(t_price));
				}else{
					var price = ${vo.p_price};
					var total = price*count;
					t_price = total;
					$(".total").html(Number(t_price));
				}
			});
			$(document).on("click","label[class=minus2]", function() {
				var count = $("input[type=number]").val();
				if(count==1){
					alert("더 이 상 수량을 내릴 수 없습니다.");
				}else if(${vo.p_sale}!=0){
					count--
					$("input[type=number]").val(count);
					var price = ${vo.p_price}*(100-${vo.p_sale})/100;
					t_price = t_price-price;
					$(".total").html(Number(t_price));
				}else{
					count--
					$("input[type=number]").val(count);
					var price = ${vo.p_price};
					t_price = t_price-price;
					$(".total").html(Number(t_price));
				}
			});
			 
			
			$(".nav-tabs a").click(function(){
				    $(this).tab('show');
			
			});
			$(document).on("click","tr[dataPi-num]",function(){
				$("#inqUpdate").attr("disabled","disabled");
				$("#inqDelete").attr("disabled","disabled");
				pi_num = $(this).attr("datapi-num");
				var m_num = $(this).attr("dataPim_num");
				console.log(m_num);
				var secret = $(this).children("td[data-secret]").attr("data-secret");
				var submenu = $(this).next("tr");
				if(secret=='O'&&"${sessionScope.id}"!=""){
						$.ajax({
			            	url:"/product/reviewUpdateBtn",
			            	type:"post",
			            	data:"m_id=${sessionScope.id}",
			            	dataType:"text",
			            	error : function () {
								alert("시스템 오류 입니다.관리자에게 문의하세요.");
							},
							success: function(data) {
								console.log(data);
								if(data==m_num){
									$("#inqUpdate").removeAttr("disabled");
									$("#inqDelete").removeAttr("disabled");
									if($(".contentHide").is(":visible")){
										  $(".contentHide").slideUp();
											console.log("같아");
										  
									  }else{
										  $(".contentHide").slideUp();
									  }
							
							            if( submenu.is(":visible") ){
							                submenu.slideUp();
							                
							            }else{
							                submenu.slideDown();
							            }
								}else{
									alert("비밀글입니다.");
								}
							}
							
			            });
		        	   
		 
				}else if(secret=="O"&&"${sessionScope.id}"==""){
					alert("비밀글입니다.");
				}else if(secret=="X"&&"${sessionScope.id}"!=""){
					if($(".contentHide").is(":visible")){
						  $(".contentHide").slideUp();
							console.log("같아");
						  
					  }else{
						  $(".contentHide").slideUp();
					  }
			
			            if( submenu.is(":visible") ){
			                submenu.slideUp();
			                
			            }else{
			                submenu.slideDown();
			            }
					$.ajax({
		            	url:"/product/reviewUpdateBtn",
		            	type:"post",
		            	data:"m_id=${sessionScope.id}",
		            	dataType:"text",
		            	error : function () {
							alert("시스템 오류 입니다.관리자에게 문의하세요.");
						},
						success: function(data) {
							console.log(data);
							if(data==m_num){
								$("#inqUpdate").removeAttr("disabled");
								$("#inqDelete").removeAttr("disabled");
							
							}
						}
						
		            });
				}else if(secret=='X'&&"${sessionScope.id}"==""){
					if($(".contentHide").is(":visible")){
						  $(".contentHide").slideUp();
							console.log("같아");
						  
					  }else{
						  $(".contentHide").slideUp();
					  }
			
			            if( submenu.is(":visible") ){
			                submenu.slideUp();
			                
			            }else{
			                submenu.slideDown();
			            }
				}
				
			});
			
			
			$(document).on("click","tr[data-num]",function(){
	              var click = 0;
	              $("#reviewUpdate").attr("disabled","disabled");
	               $("#reviewDelete").attr("disabled","disabled");
	               re_num = $(this).attr("data-num");
	                  var m_num = $(this).attr("data-m_num");
	                  var re_cnt = $(this).children("td[re_cnt]");
	                  //추가
	                  
	                 if($(".contentHide").css("display")=="none"){
	                     $.ajax({
	                      url:"/product/cntUpdate",
	                      data : "re_num="+re_num,
	                      type:"post",
	                      dataType:"text",
	                      error : function() {
	                        alert("시스템 에러입니다. 관리자에게 문의하세요");
	                     },
	                     success: function (data) {
	                        console.log(data);
	                        re_cnt.html(data);
	                     }
	                    });

	                  }
	                  
	               if("${sessionScope.id}"!=""){
	                  $.ajax({
	                     url:"/product/reviewUpdateBtn",
	                     type:"post",
	                     data:"m_id=${sessionScope.id}",
	                     dataType:"text",
	                     error : function () {
	                     alert("시스템 오류 입니다.관리자에게 문의하세요.");
	                  },
	                  success: function(data) {
	                     if(data==m_num){
	                        console.log("asd");
	                        $("#reviewUpdate").removeAttr("disabled");
	                        $("#reviewDelete").removeAttr("disabled");
	                     }else{
	                        $("#reviewUpdate").attr("disabled","disabled");
	                        $("#reviewDelete").attr("disabled","disabled");
	                     }
	                  }
	                  
	                  });
	               }
	                  if($(".contentHide").is(":visible")){
	                    $(".contentHide").slideUp();
	                    
	                 }else{
	                    $(".contentHide").slideUp();
	                 }
	                     var submenu = $(this).next("tr");
	                     if( submenu.is(":visible") ){
	                         submenu.slideUp();
	                         
	                     }else{
	                        
	                         submenu.slideDown();
	                     }
	              }); 
			  
			
			$("#reviewDelete").click(function () {
				if(confirm("삭제하시겠습니까?")){
					$.ajax({
						url:"/product/reviewDelete",
						data:"re_num="+re_num,
						type:"post",
						dataType:"text",
						error : function () {
							alert("시스템 오류입니다.관리자에게 문의 하세요.");
						},
						success: function(data) {
							if(data=="SUCCESS"){
								alert("삭제되었습니다.");
								location.href = "/product/productDetail?p_num=${vo.p_num}";
							}
						}
					});
				}
			});
			
			 $("#reviewCheck").click(function() {
	   		   		setModal("후기등록","reviewInsert","등록");
	   		   		$('#myModal').show();
	  		 	});
			 
			 $("#reviewUpdate").click(function() {
				 
				updateForm();
				setModal("후기 수정","reviewUpdate", "수정");
				$('#myModal').show();
			});
			
			 $("#inqInsert").click(function() {
				 setModal2("상품 문의","productInqinsert","문의");
				$("#myModal2").show();
			});
			 
			 $("#inqUpdate").click(function() {
				 updateForm2();
				setModal2("문의 수정","productInqUpdate","수정");
				$("#myModal2").show();
			});
			 
			 $("#inqDelete").click(function() {
				
				if(confirm("정말 삭제하시겠습니까?")){
					$.ajax({
						url:"/product/productInqDelete",
						data:"pi_num="+pi_num,
						type:"get",
						dataType:"text",
						error : function() {
							alert("시스템 오류 입니다. 관리자에게 문의 하세요.");
						},
						success: function(data) {
							if(data=="성공"){
								alert("정상적으로 삭제 되었습니다.");
								listData2();
								dataReset2();
								location.href = "/product/productDetail?p_num=${vo.p_num}";
							}else{
								alert("["+data+"]에 문제가있어 삭제 하지 못하였습니다.잠시후 시도해 주세요.");
							}
						}
					});
				}
			});
		   if(${sessionScope.reviewCheck}){
			   $("#reviewCheck").removeAttr("disabled");
		   }else{
			   $("#reviewCheck").attr("disabled",true);
		   }
		   
		   if("${sessionScope.id}"==""){
			   $("#inqInsert").attr("disabled","disabled");
		   }else{
			   $("#inqInsert").removeAttr("disabled");
		   }
		   
		   
		   $(document).on("click","button[data-btn='reviewInsert']", function() {
				 console.log("체크");
				 if(!checkForm($("#re_title"),"글 제목을"))return;
					else if(!checkForm($("#re_content"),"글 내용을"))return;
					else if(!chkFile($("#file")))return;
					else{
						$("#comment_form").ajaxForm({
							url:"/product/reviewInsert",
							type:"post",
							enctype:"multipart/form-data",
							dataType:"text",
							error: function(){
								alert("시스템 오류입니다. 관리자에게 문의 하세요.");
							},
							success: function(data) {
								console.log(data);
								if(data=="성공"){
									alert("후기가 등록 되었습니다.");
									listData();
									dataReset();
									$('#myModal').hide();
								}else{
									alert("["+data+"]\n등록에 문제가 있어 완료하지 못하였습니다.잠시 후 다시 시도해 주세요.");
									dataReset();
								}
							}
						});
						$("#comment_form").submit();	
					}
				});
		   
		   $(document).on("click","button[data-btn='productInqinsert']", function() {
			   console.log("확인");
				if(!checkForm($("#pi_title"),"글 제목을"))return;
				else if(!checkForm($("#pi_content"),"글 내용을"))return;
				else{
					$.ajax({
						url:"/product/productInq",
						type:"post",
						dataType:"text",
						data:$("#product_inqForm").serialize(),
						error : function() {
							alert("시스템 문제 입니다. 관리자에게 문의 하세요.");
						},
						success: function(data) {
							console.log(data);
							if(data=="성공"){
								alert("등록 되었습니다.");
								listData2();
								dataReset2();
								$("#myModal2").hide();
							}else{
								alert("["+data+"]\n등록에 문제가 있어 완료하지 못하였습니다.잠시 후 다시 시도해 주세요.");
							}
							
						}
					});
				}
		});
		   
		   $(document).on("click","button[data-btn='reviewUpdate']", function() {
			   if(!checkForm($("#re_title"),"글 제목을"))return;
					else if(!checkForm($("#re_content"),"글 내용을"))return;
					else{
						if($("#file").val()!=""){
							if(!chkFile($("#file")))return;
						}
						$("#comment_form").ajaxForm({
							url:"/product/reviewUpdate",
							type:"post",
							enctype:"multipart/form-data",
							dataType:"text",
							error: function(){
								alert("시스템 오류입니다. 관리자에게 문의 하세요.");
							},
							success: function(data) {
								console.log(data);
								if(data=="성공"){
									alert("수정되었습니다.");
									location.href="/product/productDetail?p_num=${vo.p_num}";
									listData();
									dataReset();
									$('#myModal').hide();
								}else{
									alert("["+data+"]\n등록에 문제가 있어 완료하지 못하였습니다.잠시 후 다시 시도해 주세요.");
									dataReset();
								}
							}
						});
						$("#comment_form").submit();
					}
		});
			$(document).on("click","button[data-btn='productInqUpdate']", function() {
				if(!checkForm($("#pi_title"),"글 제목을"))return;
				else if(!checkForm($("#pi_content"),"글 내용을"))return;
				else if("${user}"==""){
					alert("로그인이 필요한 작업입니다.");
					return;
				}
				else{
					$.ajax({
						url:"/product/productInqUpdate",
						data:$("#product_inqForm").serialize(),
						dataType:"text",
						type:"post",
						error : function() {
							alert("시스템 문의 입니다.관리자에게 문의 하세요.");
						},
						success: function(data) {
							if(data=="성공"){
								alert("수정 되었습니다.");
								listData2();
								dataReset2();
								$("#myModal").hide();
								location.href = "/product/productDetail?p_num=${vo.p_num}";
							}else{
								alert("["+data+"]에 문제가있어 실패 하였습니다. 다시 시도해 주세요.");
							}
						}
					});
				}
		});
		   $("button[name='addtocart']").click(function () {
			   if("${user}"!=""){
				   if($(".countName").length!=0){
						var m_num = "${m_num}";
						var p_num = "${vo.p_num}";
						var b_amount = $(".countName").children("input[type='number']").val();
						var p_price = $(".total").attr("price");
						if("${sessionScope.id}"==""){
							noMemberGoBasket2(p_num,b_amount,p_price);
						}else{
							goBasket2(m_num,p_num,b_amount,p_price);
						}
							$(".countName").children("input[type='number']").val('1');
							$(".total").html(p_price);				
						
						return;
				  }
				   if($(".removeDiv").length!=0){
						
						$(".removeDiv").each(function () {
							var m_num = "${m_num}";
							var p_num = "${vo.p_num}";
							var op_num = $(this).children(".addOption2").attr("data-num");
							var b_amount = $(this).children(".addOption2").children("input[type='number']").val();
							var op_price = $(this).children(".addOption2").children("span").attr("data-price");
							if("${sessionScope.id}"==""){
								noMemberGoBasket(p_num,op_num,b_amount,op_price);
							}else{
								goBasket(m_num,p_num,op_num,b_amount,op_price);						
							}
						});
						$(".removeDiv").remove();
						t_price = 0;
						$(".total").html(t_price);
				   }else{
					   alert("옵션을 선택해주세요.");
				   }
				   
			   }
			   else{
				   alert("로그인이 필요한 작업입니다.");
			   }
			 	
		});
		   
		 $("button[name='enjoy']").click(function() {
			var p_num = "${vo.p_num}";
			array_op_num = new Array();
			
			if("${sessionScope.id}"!=""&&$(".p_option").length!=0){
					if($(".removeDiv").length==0){
						alert("옵션을 선택해 주세요.");
						
					}else{
						console.log("else");
						
						$(".removeDiv").each(function() {
							array_op_num.push($(this).children(".addOption2").attr("data-num"));
						});							
						var cnt=0;
						enjoyBtn().then(function(data) {
							console.log(data.length);
							if(data.length!=0){
								$(data).each(function() {						
										for(var i = 0;i<array_op_num.length;i++){
											if(this.op_num==array_op_num[i]){
												array_op_num = new Array();
												cnt = cnt+1;
												console.log("cnt="+cnt);
												return;
											}
										}
									
								});							
															
							}	
							console.log(cnt);
							if(cnt==0){
									console.log(bool2);
								$(".removeDiv").each(function() {
									var opNum = $(this).children(".addOption2").attr("data-num");
									bookMarkInsert2(opNum);
								});									
							}
							else{
								alert("이미 즐겨 찾기에 담겨 있습니다.");
							}
						});
					}			
			}else if("${sessionScope.id}"!=""&&$(".countName").length!=0){
				var cnt2 = 0;
				enjoyBtn().then(function(data) {
					if(data.length!=0){
						$(data).each(function() {						
							if(this.p_num==p_num){
								cnt2=cnt2+1;
								return;										
							}
						});										
					}
						if(cnt2==0){
							bookMarkInsert();
							
						}else{
							alert("이미 즐겨 찾기에 담겨 있습니다.");		
						}
							
				});
			}else{
				/* if(confirm("로그인후 이용 가능 합니다. 이동하시겠습니까?")){
				} */
				alert("로그인후 이용 가능합니다.");
			}
		});
	});
		<!-- 온로드 끝@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@-->	  
		
		function chkFile(item){
			
			var ext = item.val().split('.').pop().toLowerCase();
			if(jQuery.inArray(ext, ['gif','png','jpg','jpeg'])==-1){
				alert("gif, png, jpg, jpeg 파일만 업로드 할수 있습니다");
				return false;
			}
			else{
				return true;
			}
		}
		
		function updateForm() {
			$.ajax({
				url:"/product/updateForm",
				type:"get",
				data:"re_num="+re_num,
				dataType:"json",
				error : function() {
					alert("시스템 오류 입니다. 관리자에게 문의하세요.");
				},
				success : function(data) {
					$("#re_title").val(data.re_title);
					$("#re_content").val(data.re_content);
					$("#gpa").val(data.gpa);
					if(data.gpa!=1){
						for(var i=1;i<=data.gpa;i++){
							
							$("input[value="+i+"]").addClass("on");
							console.log("asdasdasdad");
						}
					}
					var input_num = $("<input>");
					input_num.attr({"type":"hidden","name":"re_num"});
					input_num.val(data.re_num);
					
					var input_file = $("<input>");
					input_file.attr({"type":"hidden","name":"re_img"});
					input_file.val(data.re_img);
					
					if(data.re_img!=null){
						var img = $("<img>");
						img.attr({"src":"/uploadStorage/p_img/"+data.re_img}); 
						$(".image_area").append(img);
					}
					
					$("#comment_form").append(input_num).append(input_file);
					
				}
			});
		}	  
		
		function updateForm2() {
			$.ajax({
				url:"/product/inqUpdateForm",
				type:"get",
				data:"pi_num="+pi_num,
				dataType:"json",
				error : function() {
					alert("시스템 오류 입니다. 관리자에게 문의하세요.");
				},
				success : function(data) {

					$("#pi_title").val(data.pi_title);
					$("#pi_content").val(data.pi_content);
					
					var email = data.pi_emailsend;
					$('input:radio[name=pi_emailsend]:input[value=' + email + ']').attr("checked", true);
					
					var sms = data.pi_smssend;
					$('input:radio[name=pi_smssend]:input[value=' + sms + ']').attr("checked", true);
					var secret = data.pi_secret;
					$('input:radio[name=pi_secret]:input[value=' + secret + ']').attr("checked", true);
					
					
					var input_num = $("<input>");
					input_num.attr({"type":"hidden","name":"pi_num"});
					input_num.val(data.pi_num);
					
					/*var input_num2 = $("<input>");
					input_num2.attr({"type":"hidden","name":"pi_smssend"});					
					input_num2.val(data.pi_smssend);
					
					var input_num3 = $("<input>");
					input_num3.attr({"type":"hidden","name":"pi_smssend"});
					input_num3.val(data.pi_smssend);
					
					var input_num4 = $("<input>");
					input_num4.attr({"type":"hidden","name":"pi_secret"});
					input_num4.val(data.pi_secret); */
	
					
					$("#product_inqForm").append(input_num);
					
				}
			});
		}	  
			  
   		
   		
   		
   		function addItem(countName) {
			var new_tr = $("<tr>");
			
			var new_td = $("<td>");
			new_td.html(countName);
			
			var new_td2 = $("<td>");
			new_td2.addClass("countName");
			
			var new_label = $("<label>");
			new_label.addClass("plus2");
			new_label.attr("for","upBtn");
			
			var new_label2=$("<label>");
			new_label2.addClass("minus2");
			new_label2.attr("for","btnDown");
			
			var new_button = $("<button>");
			new_button.attr({"type":"button","style":"display:none","name":"btnDown"});
			new_button.addClass("btnDown2");
			
			var new_button2 = $("<button>");
			new_button2.attr({"type":"button","style":"display:none","name":"upBtn"});
			new_button2.addClass("upBtn2");
			
			var new_input = $("<input>");
			new_input.attr({"type":"number","min":"1","max":"50","value":"1","readonly":"readonly"});
			
			new_td2.append(new_label2.append(new_button)).append(new_input).append(new_label.append(new_button2));
			new_tr.append(new_td).append(new_td2);
			$("#table").append(new_tr);
		}
   		
   		function addSelect(countName) {
			var new_tr = $("<tr>");
			
			var new_td = $("<td>");
			new_td.html(countName);
			
			var new_td2 = $("<td>");
			
			var new_select = $("<select>");
			new_select.attr =({"name":"op_name"});
			new_select.addClass("p_option");
			
			new_tr.append(new_td).append(new_td2.append(new_select));
			
			$("#table").append(new_tr);
		}
   		
   		function addOption(op_num,op_name,op_price) {
			var big_div=$("<div>");
			big_div.addClass("removeDiv");
			
   			var new_div=$("<div>");
			new_div.addClass("addOption");

			var new_div2 = $("<div>");
			new_div2.addClass("addOption2");
			
			new_div2.attr("data-num",op_num);
			var new_span = $("<span>");
			new_span.append(op_name);
			new_span.attr("data-name",op_name);
			
			var new_span2 = $("<span>");
			new_span2.append(op_price+"원");
			new_span2.attr({"data-price":op_price,"style":"float:right"});
			
			var new_label = $("<label>");
			new_label.addClass("plus");
			new_label.attr("for","upBtn");
			
			var new_label2=$("<label>");
			new_label2.addClass("minus");
			new_label2.attr("for","btnDown");
			
			var new_label3 = $("<label>");
			new_label3.addClass("close");
			new_label3.attr("for","btnDel");
			
			var new_buttonDel = $("<button>");
			new_buttonDel.addClass("btnDel");
			new_buttonDel.attr({"type":"button","style":"display:none","name":"btnDel"});
			
			
			
			var new_button = $("<button>");
			new_button.attr({"type":"button","style":"display:none","name":"btnDown"});
			new_button.addClass("btnDown");
			
			var new_button2 = $("<button>");
			new_button2.attr({"type":"button","style":"display:none","name":"upBtn"});
			new_button2.addClass("upBtn");
			
			var new_input = $("<input>");
			new_input.attr({"type":"number","min":"1","max":"50","value":"1","readonly":"readonly"});
			
			new_div.append(new_span).append(new_label3.append(new_buttonDel));
			new_div2.append(new_label2.append(new_button)).append(new_input).append(new_label.append(new_button2)).append(new_span2);
			
			
			$(".option").append(big_div.append(new_div).append(new_div2));
			return op_num;
		}
   		
   		function totalPrice(t_price) {
			var new_span1=$("<span>");
			new_span1.append("총 상품 금액:");
			
			var new_span2 = $("<span>");
			new_span2.addClass("total");
			new_span2.attr("price",t_price);
			new_span2.append(t_price);
			
			var new_span3=$("<span>");
			new_span3.append("원");
			
			$(".totalPrice").append(new_span1).append(new_span2).append(new_span3);
		}
   		
   		function reviewList(re_num,m_num,m_name,p_num,re_title,re_content,gpa,re_regdate,re_img,re_cnt,index) {
            var new_tr = $("<tr>");
            new_tr.attr({"data-num":re_num,"data-m_num":m_num});
            
            var hide_td=$("<td>");
            
            var content_td=$("<td>");
            content_td.append(re_content+"<br/>");
            content_td.attr("colspan","5");
            
            var content_tr = $("<tr>");
            content_tr.attr({"style":"display:none"});
            content_tr.addClass("contentHide");
            
            var img = $("<img>");
            img.addClass("reviewImg");
            if(re_img!=null){
            img.attr("src","/uploadStorage/review/"+re_img);   
            content_td.append(img);
            }
            
            content_tr.append(hide_td).append(content_td);
            
            var num_td = $("<td>");
            num_td.append(re_num);
            num_td.addClass("text-center");
            
            var title_td = $("<td>");
            title_td.append(re_title);
            
            var name_td = $("<td>");
            name_td.append(m_name);
            name_td.addClass("text-center");
            
            var date_td = $("<td>");
            date_td.append(re_regdate);
            date_td.addClass("text-center");
            
            var gpa_td = $("<td>");
            gpa_td.addClass("text-center");
            for(var i =0;i<gpa;i++){
               var gpa_span=$("<span>");
               gpa_span.addClass("starR on");
               console.log("asdasd");
               gpa_td.append(gpa_span);         
            }
            
            var cnt_td = $("<td>");
            cnt_td.addClass("text-center");
            cnt_td.attr("re_cnt",re_cnt);
            cnt_td.append(re_cnt);
            new_tr.append(num_td).append(title_td).append(name_td).append(date_td).append(gpa_td).append(cnt_td);
            $("#list").append(new_tr).append(content_tr);
         }
   		
   		function inqList(pi_num,m_num,m_name,p_num,pi_title,pi_content,pi_regdate,pi_secret,index) {
   			var new_tr = $("<tr>");
			new_tr.attr({"dataPi-num":pi_num,"dataPim_num":m_num});
			
			var content_tr = $("<tr>");
			content_tr.attr({"colspan":"5","style":"display:none"});
			content_tr.append(pi_content+"<br/>");
			content_tr.addClass("contentHide");
			
			var num_td = $("<td>");
			num_td.append(pi_num);
			num_td.addClass("text-center");
			
			var title_td = $("<td>");
			title_td.append(pi_title);
		
			var name_td = $("<td>");
			name_td.append(m_name);
			name_td.addClass("text-center");
			
			var date_td = $("<td>");
			date_td.append(pi_regdate);
			date_td.addClass("text-center");
			
			var secret_td = $("<td>");
			secret_td.addClass("text-center");
			if(pi_secret=='O'){
				secret_td.append("비밀글입니다.");
				secret_td.attr("data-secret",pi_secret);
			}else{
				secret_td.attr("data-secret",pi_secret);
				secret_td.append("");
			}
			
			new_tr.append(num_td).append(title_td).append(name_td).append(date_td).append(secret_td);
			$("#piList").append(new_tr).append(content_tr);
		}
   		
   		function listData() {
			console.log("리스트 출력");
			$("#list").html("");
			var def = new $.Deferred();
			var count = 0;
			
			$.getJSON("/product/reviewData",$("#f_search").serialize(), function (data) {
				console.log("length:"+data.length);
				$(data).each(function (index) {
					var re_num = this.re_num;
					var m_num = this.m_num;
					var m_name = this.m_name;
					var p_num = this.p_num;
					var re_title = this.re_title;
					var re_content = this.re_content;
					var gpa = this.gpa;
					var re_regdate = this.re_regdate;
					var re_img = this.re_img;
					var re_cnt = this.re_cnt;
					if(index==0){count = this.re_count;}
					console.log(index);
					reviewList(re_num,m_num,m_name,p_num,re_title,re_content,gpa,re_regdate,re_img,re_cnt,index);
				});
				def.resolve(count);
			}).fail(function() {
				alert("후기가 없습니다");
			});
			return def.promise();
		}
   		
   		function listData2() {
			console.log("리스트 출력");
			$("#piList").html("");
			var def = new $.Deferred();
			var count = 0;
			
			$.getJSON("/product/inqData",$("#f_search").serialize(), function (data) {
				console.log("length:"+data.length);
				$(data).each(function (index) {
					var pi_num = this.pi_num;
					var m_num = this.m_num;
					var m_name = this.m_name;
					var p_num = this.p_num;
					var pi_title = this.pi_title;
					var pi_content = this.pi_content;
					var pi_regdate = this.pi_regdate;
					var pi_reproot = this.pi_reproot;
					var pi_repstep = this.pi_repstep;
					var pi_emailsend = this.pi_emailsend;
					var pi_smssend = this.pi_smssned;
					var pi_secret = this.pi_secret;
					var pi_state = this.pi_state;
					if(index==0){count = this.inq_count;}
					console.log(count);
					console.log(index);
					inqList(pi_num,m_num,m_name,p_num,pi_title,pi_content,pi_regdate,pi_secret,index);
				});
				def.resolve(count);
			}).fail(function() {
				alert("문의가 없습니다");
			});
			return def.promise();
		}
   		
   		function setModal(title,value,text) {
			$("#reviewInsertBtn").html(text);
			$("#reviewInsertBtn").attr("data-btn",value);
			$("#reviewModalTitle").html(title);
		}
   		
   		function setModal2(title,value,text) {
			$("#productInqBtn").html(text);
			$("#productInqBtn").attr("data-btn",value);
			$("#productInq").html(title);
		}
   		
   		//폼 초기화 작업
		function dataReset() {
			$("#comment_form").each(function() {
				this.reset();
			});
		}
		function dataReset2() {
			$("#product_inqForm").each(function() {
				this.reset();
			});
		}
		
		function goBasket(m_num,p_num,op_num,b_amount,op_price) {

			$.ajax({
				url : "/product/goBasket",
				data :"m_num="+m_num+"&p_num="+p_num+"&op_num="+op_num+"&b_amount="+b_amount+"&op_price="+op_price,
				type:"post",
				dataType:"text",
				error : function () {
					alert("시스템 문제 입니다.관리자에게 문의하세요");
				},
				success: function (data) {
					if(data=="성공"){
						alert("장바구니에 담았습니다.");
					}else{
						alert("장바구니 담기 실패");
					}
				}
			});
		}
		function noMemberGoBasket(p_num,op_num,b_amount,op_price) {

			$.ajax({
				url : "/product/goBasket",
				data :"p_num="+p_num+"&op_num="+op_num+"&b_amount="+b_amount+"&op_price="+op_price,
				type:"post",
				dataType:"text",
				error : function () {
					alert("시스템 문제 입니다.관리자에게 문의하세요");
				},
				success: function (data) {
					if(data=="성공"){
						alert("장바구니에 담았습니다.");
					}else{
						alert("장바구니 담기 실패");
					}
				}
			});
		}
		function noMemberGoBasket2(p_num,b_amount,p_price) {

			$.ajax({
				url : "/product/goBasket",
				data :"p_num="+p_num+"&b_amount="+b_amount+"&p_price="+p_price,
				type:"post",
				dataType:"text",
				error : function () {
					alert("시스템 문제 입니다.관리자에게 문의하세요");
				},
				success: function (data) {
					if(data=="성공"){
						alert("장바구니에 담았습니다.");
					}else{
						alert("장바구니 담기 실패");
					}
				}
			});
		}
		function goBasket2(m_num,p_num,b_amount,p_price) {

			$.ajax({
				url : "/product/goBasket",
				data :"m_num="+m_num+"&p_num="+p_num+"&b_amount="+b_amount+"&p_price="+p_price,
				type:"post",
				dataType:"text",
				error : function () {
					alert("시스템 문제 입니다.관리자에게 문의하세요");
				},
				success: function (data) {
					if(data=="성공"){
						alert("장바구니에 담았습니다.");
					}else{
						alert("장바구니 담기 실패");
					}
				}
			});
		}
		
		function enjoyBtn() {
			var def = new $.Deferred();
			
			$.ajax({
				url:"/product/productEnjoy",
				data:"m_num=${m_num}",
				type:"post",
				dataType:"json",
				error: function() {
					alert("시스템 문제입니다.");
				},
				success: function(data) {
					def.resolve(data);
				}
			});
			return def.promise();
		}
		
		function bookMarkInsert() {
			$.ajax({
				url:"/product/bookMarkInsert",
				data:"p_num=${vo.p_num}&m_num=${m_num}",
				dataType:"text",
				type:"post",
				error: function() {
					alert("시스템 오류 입니다. 관리자에게 문의하세요.");
				},
				success: function(data) {
					if(data=="성공"){
						alert("즐겨 찾기에 추가 되었습니다.");
					}else{
						alert("즐겨 찾기 등록 실패");
					}
				}
			});		
		}
		function bookMarkInsert2(op_num) {
			$.ajax({
				url:"/product/bookMarkInsert2",
				data:"p_num=${vo.p_num}&m_num=${m_num}&op_num="+op_num,
				dataType:"text",
				type:"post",
				error: function() {
					alert("시스템 오류 입니다. 관리자에게 문의하세요.");
				},
				success: function(data) {
					if(data=="성공"){
						alert("즐겨 찾기에 추가 되었습니다.");
					}else{
						alert("즐겨 찾기 등록 실패");
					}
				}
			});		
		}
			
   </script>
    <div class="breadcrumb-area">
        <!-- Top Breadcrumb Area -->
        <div class="top-breadcrumb-area bg-img bg-overlay d-flex align-items-center justify-content-center" style="background-image: url(/resources/images/bg-img/24.jpg);">
            <h2>Shop</h2>
        </div>
     </div>
    
    <form name="f_search" id="f_search">
    	<input type="hidden" name="pageNum" id="pageNum" value="${data.pageNum}"/>
    	<input type="hidden" name="amount" id="amount" value="10"/>
    	<input type="hidden" name="p_num" id="p_num" value="${vo.p_num}"/>
    </form>
    <!-- ##### Single Product Details Area Start ##### -->
    <section class="single_product_details_area mb-50" style="margin-top: 50px;">
        <div class="produts-details--content mb-50">
            <div class="container">
                <div class="row justify-content-between">
                    <div class="col-12 col-md-6 col-lg-5">
                        <div class="single_product_thumb">                           
                                <div class="carousel-inner">                                   
                                        <img class="d-block w-100" src="/uploadStorage/pImg/${vo.p_img }" alt="1">                                                             
                                </div>                      
                        </div>
                    </div>
                    <div class="col-12 col-md-6">
                        <div class="single_product_desc">
                        <input type="hidden" name="p_num" value="${vo.p_num}">
                            <h4 class="title" style="margin-bottom: 20px;">${vo.p_name}</h4>
                            <h6 class="saleTitle"></h6>
                            <span class="price" style="margin-bottom: 0px; font-size: 40px; margin-right: 20px;"></span><span style="color: red; font-size: 20px;" class="sale" ></span>
                            <h5 class="price2"></h5>
                            <div class="short_overview" style="margin-bottom: 0px;">
                                <table id="table" class="table" style="margin-bottom: 0px;">
                                	<tr>
                                		<td>판매단위:</td>
                                		<td>${vo.sales_unit}</td>
                                	</tr>
                                	<tr>
                        
                                		<td>중량/용량:</td>
                                		<td>${vo.p_weight}</td>
                                	</tr>
                                	<tr>
                                		<td>배송구분:</td>
                                		<td>샛별배송/택배배송</td>
                                	</tr>
                                	<tr>
                                		<td>원산지:</td>
                                		<td>${vo.p_origin}</td>
                                	</tr>
                                	<tr>
                                		<td>안내사항</td>
                                		<td>${vo.p_announce}</td>
                                	</tr>
                     
                                </table>
                            </div>
                            <form action="" class="basket">
                            	<input type="hidden" name="p_num" value="${vo.p_num}"/>
                            	<input type="hidden" name="op_num"/>
                            	<input type="hidden" name="b_amount"/>
                            	<input type="hidden" name="b_price"/>
                            </form>
                            <div class="option">                          	
                            </div>
                            <div class="totalPrice"></div>
                            <div class="cart--area d-flex flex-wrap align-items-center" >
                                <!-- Add to Cart Form -->
                                <form class="cart clearfix d-flex align-items-center" method="post">
                                
                                    <button type="button" name="addtocart" value="5" class="btn alazea-btn ml-15">장바구니</button>
                                    <button  type="button" name="enjoy" value="5" class="btn alazea-btn ml-15">즐겨찾기추가</button>
                                <!-- Wishlist & Compare -->
		                        </form>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
       <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="product_details_tab clearfix">
                        <!-- Tabs -->
                        <ul class="nav nav-tabs" role="tablist" id="product-details-tab">
                            <li class="nav-item active">
                                <a href="#description" class="nav-link active" data-toggle="tab" role="tab">상품 설명</a>
                            </li>
                            <li class="nav-item">
                                <a href="#addi-info" class="nav-link" data-toggle="tab" role="tab">고객 후기</a>
                            </li>
                            <li class="nav-item">
                                <a href="#reviews" class="nav-link" data-toggle="tab" role="tab">상품 문의 <span class="text-muted">(1)</span></a>
                            </li>
                        </ul>
                        <!-- Tab Content -->
                        <div class="tab-content">
                            <div role="tabpanel" class="tab-pane fade show active" id="description">
                                <div class="description_area">
                           			<h1>상품 상세</h1>
                           			<img style="width: 100%" alt="" src="/uploadStorage/pDetail/${vo.p_explain_img }"/>
                                 </div>
                            </div>
                            <div role="tabpanel" class="tab-pane fade" id="addi-info">
           	<div id="reviewList">
            <table summary="리뷰 리스트" class="table table-hover">
               <colgroup>
                  <col width="10%"/>
                  <col width="36%"/>
                  <col width="15%"/>
                  <col width="13%"/>
                  <col width="13%"/>
                  <col width="13%"/>
               </colgroup>
               <thead>
                  <tr>
                     <th data-value="re_num" class="order text-center">글번호</th>
                     <th class="text-center">글 제목</th>
                     <th data-value="m_num" class="text-center">작성자</th>
                     <th class="text-center">작성일</th>
                     <th class="text-center">평점</th>
                     <th class="text-center">조회수</th>
                  </tr>
               </thead>
               <tbody id="list" class="table-hover">
                  
               </tbody>
            </table>


            <div class="reviewInsert">
            	<button id="reviewCheck" type="button" class="btn btn-success" disabled="disabled">후기 등록</button>
            	<button id="reviewUpdate" type="button" class="btn btn-success" disabled="disabled">수정하기</button>
            	<button id="reviewDelete" type="button" class="btn btn-success" disabled="disabled">삭제하기</button>
            </div>
            
         </div>
            <nav class="paging text-center">
            
            </nav>
   </div>
                            <div role="tabpanel" class="tab-pane fade" id="reviews">
                                <div id="reviewList">
							            <table summary="리뷰 리스트" class="table table-hover">
							               <colgroup>
							                  <col width="10%"/>
							                  <col width="25%"/>
							                  <col width="15%"/>
							                  <col width="13%"/>
							                  <col width="24%"/>
							                  <col width="13%"/>
							               </colgroup>
							               <thead>
							                  <tr>
							                     <th data-value="re_num" class="order text-center">글번호</th>
							                     <th class="text-center">글 제목</th>
							                     <th data-value="m_num" class="text-center">작성자</th>
							                     <th class="text-center">작성일</th>
							                     <th class="text-center">비밀글</th>

							                  </tr>
							               </thead>
							               <tbody id="piList" class="table-hover">
							                  
							               </tbody>
							            </table>
							            <div class="inqInsert">
            								<button id="inqInsert" type="button" class="btn btn-success" disabled="disabled">문의하기</button>
            								<button id="inqUpdate" type="button" class="btn btn-success" disabled="disabled">수정하기</button>
            								<button id="inqDelete" type="button" class="btn btn-success" disabled="disabled">삭제하기</button>
            							</div>
							        </div>
							        <nav class="paging2 text-center">
            
            						</nav>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
         <!-- The Modal -->
    <div id="myModal" class="modal2">
      <!-- Modal content -->
      <div class="modal-content2">
             
				<form id="comment_form" name="comment_form">
					<input type="hidden" name="m_num" value="${m_num}"/>
					<input type="hidden" name="p_num" value="${vo.p_num}"/>
					<div class="form-group">
						<h3 id="reviewModalTitle">리뷰 작성</h3>
					</div>
						<div class="form-group">
							<label for="re_title" class="control-label">제목</label>
							<input type="text" class="form-control" name="re_title" id="re_title" maxlength="30"/>
						</div>
						<div class="form-group">
							<label for="re_content" class="control-label">글내용</label>
							<textarea rows="5" class="form-control" name="re_content" id="re_content" ></textarea>
						</div>
						<div class="form-group starRev" >
							<label class="control-label">별점</label>
							<input class="col-md-1 starR on" type="text" value="1" name="gpa" id="gpa" />
							<input class="col-md-1 starR" type="text" value="2" />
							<input class="col-md-1 starR" type="text" value="3" />
							<input class="col-md-1 starR" type="text" value="4"/>
							<input class="col-md-1 starR" type="text" value="5"/>
						</div>
						<div class="form-group image_area">
                           <label for="file" class="control-label">이미지</label>
                           <input type="file" name="file" id="file" />
                        </div>
				</form>
						
				<div class="modal-footer" >
					<button type="button" class="btn btn-default" id="closeBtn">닫기</button>
					<button type="button" class="btn btn-success" id="reviewInsertBtn">등록</button>							
				</div>
      </div>
 
    </div>
        <!--End Modal-->
        
              <!-- The Modal -->
    <div id="myModal2" class="modal2">
      <!-- Modal content -->
      <div class="modal-content2">
             
				<form id="product_inqForm" name="product_inqForm">
					<input type="hidden" name="m_num" value="${m_num}"/>
					<input type="hidden" name="p_num" value="${vo.p_num}"/>
					<div class="form-group">
						<h3 id="productInq">문의하기</h3>
					</div>
						<div class="form-group">
							<label for="pi_title" class="control-label">제목</label>
							<input type="text" class="form-control" name="pi_title" id="pi_title" maxlength="30"/>
						</div>
						<div class="form-group">
							<label for="pi_content" class="control-label">글내용</label>
							<textarea rows="5" class="form-control" name="pi_content" id="pi_content" ></textarea>
						</div>
						<div class="form-group" >
							<label for="pi_emailsend">이메일 수신 여부</label><br/>
							<input type="radio" name="pi_emailsend" id="pi_emailsend" value="O"/>수신
							<input type="radio" name="pi_emailsend" value="X"/>거부
						</div>
						<div class="form-group" >
							<label for="pi_smssend">문자 수신 여부</label><br/>
							<input type="radio" name="pi_smssend" id="pi_smssend" value="O"/>수신
							<input type="radio" name="pi_smssend" value="X"/>거부
						</div>
						<div class="form-group" >
							<label for="pi_secret">비밀글 선택 여부</label><br/>
							<input type="radio" name="pi_secret" id="pi_secret" value="O"/>예
							<input type="radio" name="pi_secret" value="X"/>아니요
						</div>
				</form>
						
				<div class="modal-footer" >
					<button type="button" class="btn btn-default" id="closeBtn2">닫기</button>
					<button type="button" class="btn btn-success" id="productInqBtn">등록</button>							
				</div>
      </div>
 
    </div>
        <!--End Modal-->

    </section>
    <!-- ##### Single Product Details Area End ##### -->