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
		
		<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
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
			
			.subMenu_sort,.subMenu_sort:hover,.subMenu_sort:focus{
				text-decoration: none !important;
				display: block !important;
				padding : 16px 0px 16px 19px !important;
				font-size: 12px !important;
				font-family: 'Noto Sans KR', sans-serif !important;
				color : #666666 !important;
				background: url(/resources/images/boards.png) 170px no-repeat;
				background-color : white !important;
				outline: none;
			}
			
			.subMenu_sort:hover{
				background: url(/resources/images/boardsHover.png) 170px no-repeat;
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
			
			#pwdConfirmBox{
				padding : 38px 0px 24px 0px;
				border-top : 2px solid #5f0080;
			}
			
			.pwdCheckImgBox{
				padding : 20px 0px;
				text-align: center;
			}
			
			.userInfo{
				text-align: center;
				font-family: 'Noto Sans KR';
				border : 1px solid #ddd;
				padding : 33px 0px;
			}
			
			.asdf{
				padding : 10px 0px;
				font-weight: 700;
			}
			
			.pwdConfirm{
				width : 120px;
				height: 34px;
				padding: 0px 10px;
				font-size : 12px;
				line-height: 32px;
			}
			
			#pwdCheck{
				width:260px;
				height: 54px;
				background-color: #5f0080;
				outline: none;
				border : 1px solid #5f0080;
				border-radius: 3px;
				color : white;
			}
			
			.up_title{
				padding-bottom : 10px; display: block; height: 38px;
				font-family: 'Noto Sans KR',sans-serif;
				
			}
			
			.up_title h3{
				float:left;padding: 0; margin:0;
				color : #333333;
				font-size : 20px;
				font-weight: 700;
			}
			
			.up_title p{
				float:right;padding: 0; margin:0;
				color : #666666;
				font-size : 12px;
				padding-top : 10px;
			}
			
			#info_box,#addInfo,#termsInfo{
				padding: 0 20px 77px 20px;
			    border-top: 2px solid #5f0080;
			    color: #747474;
			}
			
			#info_table, #addInfo_table{
				margin-top : 20px;
				font-family: 'Noto Sans KR', sans-serif;
				color : #333333;
				font-size: 14px;
			}
			
			#info_table td, #addInfo_table td{
				padding-bottom:20px;
			}
			
			#info_table td:first-child ,#addInfo_table td:first-child{
				vertical-align: top;
				padding-top : 10px;
				font-weight: 700;
			}
			
			#info_table td:nth-child(2) input{
				height: 40px;
				padding : 0px 10px;
			}
			

			
			#info_table td:nth-child(3), #addInfo_table td:nth-child(3){
				padding-left: 10px;
			}
			
			#info_table td:nth-child(3) input{
				height: 40px;
				font-family: 'Noto Sans KR', sans-serif;
				border : 1px solid #512771;
				background-color: #5f0080;
				color : white;
				font-weight: 400;
			}
			
			td > span{
				display: none;
				font-size: 12px;
				font-family: 'Noto Sans KR', sans-serif;
			}
			
			#codeConfirm{
				opacity: 0.3;
			}
			
			.countdown{display : block; position: absolute; top : 12px; right : 15px; font-size: 12px;}
			
			
			
			#female + label, #male + label{
				background: url(/resources/images/radioBtnOff.png) left no-repeat ;
				padding-left: 17px;
				margin-top : 10px;
			}
			
			#female:checked + label, #male:checked + label{
				background: url(/resources/images/radioBtnOn.png) left no-repeat ;
				padding-left : 17px;
				margin-top : 10px;
			}
			
			#female, #male{
				display: none;
			}
			
			#birthBox > input{
				height : 28px;
				border : 0;
				outline: none;
				margin-top : 3px;
			}
			
			#birthBox{
				padding : 0;
				padding-left : 10px;
			}
			#termsInfo{
				padding-top: 30px;
			}
			
			.first_area,.second_area{
				color : #333333;
				font-family: 'Noto Sans KR', sans-serif;
				font-weight: 400;
			}
			
			input[type='checkbox']{
				display: none;
			}
			
			input[type='checkbox'] + label{
				background: url(/resources/images/nocheck.png) left no-repeat ;
				background-size : 17px;
				padding-left : 25px;
			}
			
			input[type='checkbox']:checked + label{
				background: url(/resources/images/checked.png) left no-repeat ;
				background-size : 17px;
				padding-left : 25px;
			}
			
			.first_area {
			
			}
			
			.second_area{
				padding-left : 30px;
			}
			label[for='m_emailsend']{
				margin-left : 40px;
			}
			
			#delBtn{
				width : 260px;
				height: 54px;
				border : 1px solid #5f0080;
				color : #5f0080;
				border-radius: 3px;
				font-family: 'Noto Sans KR', sans-serif;
				font-weight: 400;
				background-color : white;
			}
			
			#updateBtn{
				width : 260px;
				height: 54px;
				border : 1px solid #512771;
				background-color : #5f0080;
				border-radius: 3px;
				font-family: 'Noto Sans KR', sans-serif;
				font-weight: 400;
				color : white;
				margin-left : 5px;
			}
			
			#dialog{
				font-family: 'Noto Sans KR', sans-serif !important;			
				display: none;
			}
			
			.ui-dialog-titlebar{
				background-color: #5f0080 !important;
				color : white !important;
				font-family: 'Noto Sans KR', sans-serif !important;			
			}
			
			#delConfirm{
				width: 50px;
			    height: 34px;
			    border: 1px solid #512771;
			    background-color: #5f0080;
			    border-radius: 3px;
			    font-family: 'Noto Sans KR', sans-serif;
			    font-weight: 400;
			    color: white;
			    outline: none;
			}
			
			#delCancel{
				width: 50px;
			    height: 34px;
				border: 1px solid #5f0080;
			    color: #5f0080;
			    border-radius: 3px;
			    font-family: 'Noto Sans KR', sans-serif;
			    font-weight: 400;
			    background-color: white;
			    outline: none;
			}
			
			.ui-dialog{
				position: fixed !important;
				top:30% !important;
				left:35% !important;
			}
			
			#f{
				background: url(/resources/images/boardsHover.png) 170px no-repeat;
				color : #7c3fcc !important;
				background-color : #f7f7f7 !important;
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
			var checkPhone = true;
			var checkCode = true;
			var checkEmail = true;
			var pwdCheck = true;
			$(function(){
				if("${myInfo.m_gender}"=="남자"){
					$("input[name='m_gender']").each(function(){
						if($(this).val() == "남자"){
							$(this).attr("checked",true);
						}
					});
				}
				else{
					$("input[name='m_gender']").each(function(){
						if($(this).val() == "여자"){
							$(this).attr("checked",true);
						}
					});
				}
				
				$("#pwdCheck").click(function(){
					if(!chkData("#m_pwd","비밀번호를")) return;
					else{
						$.ajax({
							url : "/member/pwdCheck",
							type : "post",
							data : "m_pwd="+$("#m_pwd").val(),
							dataType : "text",
							error : function(){
								alert("페이지에 오류가 있습니다. 잠시후 다시 시도해주세요.");
							},
							success : function(data){
								if(data=="SUCCESS"){
									alert("비밀번호가 확인되었습니다.");
									location.href="/member/myInfo";
								}
								else if(data == "FAIL"){
									alert("비밀번호가 틀렸습니다.\n다시 확인 해주세요.");
								}
								
							}
						});
					}
				});
				
				//패스워드 정규식
				var pwdReg1 = /^.*(?=^.{10,16}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;
				
				//이메일 정규식
				var emailReg = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
				
				//휴대폰 정규식
				var phoneReg = /^01(?:0|1|[6-9])(\d{3}|\d{4})(\d{4})$/;
				
				//집전화 정규식
				var homeReg =/^(0(2|3[1-3]|4[1-4]|5[1-5]|6[1-4]))(\d{3,4})(\d{4})$/;
				
				//연도 정규식
				var yearReg = /^(19[0-9][0-9]|20\d{2})$/;
				
				//월 정규식
				var monthReg = /^([0-9]|0[0-9]|1[0-2])$/;
				
				//일 정규식
				var dayReg = /^([1-9]|0[1-9]|[1-2][0-9]|3[0-1])$/;
				
				$("#currPwd").focus(function(){
					$("#currPwdChk").css({
						"color" : "#b3130b",
						"display" : "inline"
					});
				});
				
				$("#currPwd").blur(function(){
					$.ajax({
						url : "/member/pwdCheck",
						data : "m_pwd="+$(this).val(),
						dataType : "text",
						type : "post",
						success : function(data){
							if(data == "SUCCESS"){
								$("#currPwdChk").css("color","#0f851a");
								pwdCheck = true;
							}
							else{
								$("#currPwdChk").css("color","#b3130b");
								pwdCheck = false;
							}
						}
					});
				});
				
				$("#currPwd").keyup(function(){
					if($("#newPwd").val()!=$("#currPwd").val()){
						$("#pwdReg1").css("color","#0f851a");
					}
					else{
						$("#pwdReg1").css("color","#b3130b");	
					}
				});
				
				$("#info_table td:nth-child(2) input").focus(function(){
					$(this).parents("tr").find("span").css("display","block");
					
				});

				$("#info_table td:nth-child(2) input").keyup(function(){
					delWhiteSpace($(this));
				});
				
				$("#newPwd").keyup(function(){
					
					if($("#newPwd").val()!=$("#currPwd").val()){
						$("#pwdReg1").css("color","#0f851a");
					}
					else{
						$("#pwdReg1").css("color","#b3130b");	
					}
					
					if($("#newPwd").val().length < 10){
						$("#pwdReg2").css("color","#b3130b");	
					}
					else{
						$("#pwdReg2").css("color","#0f851a");
					}
					
					if(pwdReg1.test($("#newPwd").val().trim())){
						$("#pwdReg3").css("color","#0f851a");
					}
					else{
						$("#pwdReg3").css("color","#b3130b");
					}
					
					if($("#newPwd").val()==$("#newPwdChk").val()){
						$("#pwdConf").css("color","#0f851a");						
					}
					else{
						$("#pwdConf").css("color","#b3130b");
					}
					
				});
				
				$("#newPwdChk").keyup(function(){
					
					if($("#newPwd").val()==$("#newPwdChk").val()){
						$("#pwdConf").css("color","#0f851a");						
					}
					else{
						$("#pwdConf").css("color","#b3130b");
					}
				});
				
				$("#m_email").focus(function(){
					checkEmail = false;
				});
				
				$("#emailChk").click(function(){
					if(!chkData("#m_email","이메일을"))return
					if(emailReg.test($("#m_email").val().trim())){
						$.ajax({
							url : "/member/emailCheck.json",
							type : "POST",
							data : "m_email="+$("#m_email").val()+"&m_num=1",
							dataType : "text",
							async : false,
							error : function(){
								alert("오류 있으니 관리자문의 ㄱㄱ");
							},
							success : function(data){
								console.log("data = "+data);
								if(data==1){
									alert("이미 등록된 이메일입니다. 다시 작성해 주세요.");
									$("#m_email").focus();
									$("#m_email").val("");
								}
								else if(data==0){
									alert("사용이 가능합니다.");
									checkEmail = true;
									
								}
							} 
						})
					}
					else{
						alert("잘못된 이메일 형식입니다.\nEX)nonba@market.com");						
					}
				});
			
				$("#phoneChk").click(function(){
					if($(this).val()=="다른 번호 인증"){
						checkPhone = false;
						$(this).val("인증번호 받기");
						$("#m_phone").val("");
						$("#m_phone").removeAttr("disabled");
						$("#m_phone").focus();
					}
					else{
						if(!chkData("#m_phone","휴대폰 번호를"))return;
						else if(phoneReg.test($("#m_phone").val())){
							$.ajax({
								url : "/member/sendSMS.json",
								type : "POST",
								data : "m_phone="+$("#m_phone").val(),
								dataType : "text",
								async : false,
								error : function(){
									alert("오류 있으니 관리자문의 ㄱㄱ");
								},
								success : function(data){
									console.log("data = "+data);
									if(data == "SUCCESS"){
										alert("입력하신 번호로 인증번호를 발송하였습니다. 3분 이내에 입력해주세요.");
										$("#countdown").addClass("countdown");
										$("#m_phone").attr("disabled","disabled");
										$("#phoneChk").attr("disabled","disabled").css("opacity","0.3");	
										$("#codeConfirm").removeAttr("disabled").css("opacity","inherit");
										$("#code").removeAttr("disabled");
										$("#code").focus();
										countdown();
										checkPhone = true;
									}
									else if(data == "OVERLAP"){
										alert("이미 등록된 번호입니다. 확인 후 다시 시도 해 주세요.");
										$("#countdown").removeClass("countdown");
										checkPhone = false;
									}
								}
							});
						}
						else{
							alert("잘못된 휴대폰 번호 입니다. 확인 후 다시 시도 해 주세요.");
						}
					}
				});
				
				$("#m_phone, #code, #m_home").keyup(function(){
					$(this).val($(this).val().replace(/[^0-9]/g,""));
				});
				
				$("#code").focus(function(){
					checkCode = false;
				})
				
				$("#codeConfirm").click(function(){
					if(!chkData("#codeConfirm","인증번호를"))return;
					else if($("#code").val().length < 6){
						alert("인증번호는 6글자(숫자) 입니다. 확인 후 다시 입력 해주세요.");
					}
					else{
						$.ajax({
							url : "/member/codeCheck",
							type : "POST",
							data : "code="+$("#code").val(),
							dataType : "text",
							error : function(){
								alert("에러 발생");
							},
							success : function(data){
								console.log("data : "+data);
								if(data=="SUCCESS"){
									alert("인증되었습니다.");
									codeSuccess();
									checkCode = true;
								}
								else{
									alert("인증번호가 일치하지 않습니다. 확인 후 다시 입력 해 주세요.");
								}
							}
						});
					}
				});
				
				//생년월일 공백삭제 및  숫자 제외 문자삭제
				$("#birthY").keyup(function(){
					$("#birthY").val($("#birthY").val().replace(/[^0-9]/g,""));
					delWhiteSpace($("#birthY"));
				});
				$("#birthM").keyup(function(){
					$("#birthM").val($("#birthM").val().replace(/[^0-9]/g,""));
					delWhiteSpace($("#birthM"));
				});
				$("#birthD").keyup(function(){
					$("#birthD").val($("#birthD").val().replace(/[^0-9]/g,""));
					delWhiteSpace($("#birthD"));
				});
				
				//생년월일 유효성체크
				$("#birthY,#birthM,#birthD").blur(function(){
					if(!yearReg.test($("#birthY").val().trim())){
						$("#dateCheck").css({"display":"inline","color":"#b3130b"});
						$("#dateCheck").html("태어난 년도 4자리를 정확하게 입력해주세요.");
					}
					else if(!monthReg.test($("#birthM").val().trim())){
						$("#dateCheck").css({"display":"inline","color":"#b3130b"});
						$("#dateCheck").html("태어난 월을 정확하게 입력해주세요.");						
					}
					else if(!dayReg.test($("#birthD").val().trim())){
						$("#dateCheck").css({"display":"inline","color":"#b3130b"});
						$("#dateCheck").html("태어난 일을 정확하게 입력해주세요.");
					}
					else{
						$("#dateCheck").css("display","none");
						$("#dateCheck").html("");
					}
				});
				
				if("${myInfo.m_smssend}"=="O"){
					$("#m_smssend").prop("checked",true);
					$("input[name='m_smssend']").val("O");
				}
				if("${myInfo.m_emailsend}"=="O"){
					$("#m_emailsend").prop("checked",true);
					$("input[name='m_emailsend']").val("O");
				}
				if("${myInfo.m_smssend}"=="O"&&"${myInfo.m_emailsend}"=="O"){
					$("#eventReceive").prop("checked",true);
				}
				
				$("#eventReceive").change(function(){
					if($(this).prop("checked")){
						$(".second_area input[type='checkbox']").prop("checked",true);
					}
					else{
						$(".second_area input[type='checkbox']").prop("checked",false);						
					}
					
					if($("#m_emailsend").prop("checked")){
						$("input[name='m_emailsend']").val("O");
					}
					else{
						$("input[name='m_emailsend']").val("X");						
					}
					
					if($("#m_smssend").prop("checked")){
						$("input[name='m_smssend']").val("O");
					}
					else{
						$("input[name='m_smssend']").val("X");
					}
				});
				
				$(".second_area input[type='checkbox']").change(function(){
					if($("#m_emailsend").prop("checked") && $("#m_smssend").prop("checked")){
						$("#eventReceive").prop("checked",true);
					}
					else{
						$("#eventReceive").prop("checked",false);						
					}
					
					if($("#m_emailsend").prop("checked")){
						$("input[name='m_emailsend']").val("O");
					}
					else{
						$("input[name='m_emailsend']").val("X");						
					}
					
					if($("#m_smssend").prop("checked")){
						$("input[name='m_smssend']").val("O");
					}
					else{
						$("input[name='m_smssend']").val("X");
					}
				});
				
				$("#updateBtn").click(function(){
					if(!chkData("#m_name","이름을"))return;
					else if(!chkData("#m_email","이메일을"))return;
					else if(!chkData("#m_phone","휴대폰 번호를"))return;
					else if(!chkData("#birthY","태어난 년도를"))return;
					else if(!chkData("#birthD","태어난 월을"))return;
					else if(!chkData("#birthY","태어난 일을"))return;
					else if(!yearReg.test($("#birthY").val())){
						alert("태어난 년도 4자리를 정확하게 입력해주세요.");
						$("#birthY").focus();
						return;
					}
					else if(!monthReg.test($("#birthM").val())){
						alert("태어난 월을 정확하게 입력해주세요.");
						$("#birthM").focus();
						return;
					}
					else if(!dayReg.test($("#birthD").val())){
						alert("태어난 일을 정확하게 입력해주세요.");
						$("#birthD").focus();
						return;
					}
					else if(!emailReg.test($("#m_email").val())){
						alert("잘못된 이메일 형식입니다.\nEX)nonba@market.com");
						return;
					}
					else if(!phoneReg.test($("#m_phone").val())){
						alert("잘못된 휴대폰 번호 입니다. 확인 후 다시 시도 해 주세요.");
						return;
					}
					else{
						if($("#currPwd").val()!=""){
							if(!pwdCheck){
								alert("현재 비밀번호가 일치하지 않습니다. 확인 후 다시 시도해주세요.");
								$("#currPwd").focus();
								return;
							}
						}
						
						if($("#newPwd").val()!=""){
							if($("#currPwd").val()==""){
								alert("현재 비밀번호를 입력해주세요.");
								$("#currPwd").focus();
								return;
							}
							else{
								if($("#newPwd").val()!=$("#newPwdChk").val()){
									alert("새 비밀번호가 일치하지 않습니다. 다시 확인해주세요.");
									$("#newPwdChk").focus();
									return;
								}
								
								if(!pwdReg1.test($("#newPwd").val())){
									alert("비밀번호는 영문/숫자/특수문자 허용, 3개 조합 모두 사용(필수)하여야 합니다");
									$("#newPwd").focus();
									return;
								}
								
								if($("#newPwd").val().length <10){
									alert("비밀번호는 최소 10글자 이상 입력하여야 합니다.");
									$("#newPwd").focus();
									return;
								}
								
								if($("#newPwd").val() == $("#currPwd").val()){
									alert("현재 비밀번호와 다르게 입력되어야 합니다. 다시 입력해주세요.");
									$("#newPwd").focus();
									return;
								}
							}
						}
	
						if(!checkEmail){
							alert("이메일 중복 확인을 해주세요.");
							$("#m_email").focus();
							return;
						}
						
						if(!checkPhone){
							alert("휴대폰 인증을 완료해 주세요.");
							$("#m_phone").focus();
							return;
						}
						
						if(!checkCode){
							alert("인증번호를 확인해 주세요.");
							$("#m_code").focus();
							return;
						}
						
						if($("#m_home").val()!=""){
							if(!homeReg.test($("#m_home").val())){
								alert("잘못된 집전화 입니다. 확인 후 다시 시도해 주세요.");
								$("#m_home").focus();
								return;
							}
						}
						
						var year = $("#birthY").val().trim();
						var month;
						var day;
						if($("#birthM").val().trim().length==1){
							month = "0"+$("#birthM").val().trim();
						}
						else{
							month = $("#birthM").val().trim();							
						}
						
						if($("#birthD").val().trim().length==1){
							day = "0"+$("#birthD").val().trim();
						}
						else{
							day = $("#birthD").val().trim();							
						}
						
						var m_birth = year+month+day;
						
						$("#m_birth").val(m_birth.trim());
						
						var m_form = $(this).parents("form");
						console.log(m_form.serialize());
						$("#m_phone").removeAttr("disabled");
						$.ajax({
							url : "/member/memberUpdate",
							data : m_form.serialize(),
							dataType : "text",
							type : "post",
							error : function(){
								alert("시스템 오류입니다. 관리자에게 문의해주세요.")
							},
							success : function(data){
								if(data=="SUCCESS"){
									alert("회원 정보가 수정되었습니다.");
									location.href = "/member/myInfo";
								}
								else if(data == "FAIL"){
									alert("오류가 있어 회원 정보를 수정할 수없습니다. 잠시후 다시 시도해주세요.");
								}
							}
						});
					}
				});
				
				$("#delBtn").click(function(){
					if(confirm("고객님께서 회원탈퇴를 원하신다니 저희 쇼핑몰 서비스가 많이 부족하고 미흡했나 봅니다.\n이용해주셔서 갑사합니다.\n회원탈퇴를 진행하시겠습니까?")){
						$("#dialog").dialog({
							modal : true,
							title : "회원 탈퇴"
							
						});						
					}
				});
				
				$("#delCancel").click(function(){
					$("#dialog").dialog("close");
				});
				
				$("#delConfirm").click(function(){
					if(!chkData("#delPwd","비밀번호를"))return;
					else{
						$.ajax({
							url : "/member/pwdCheck",
							data : "m_pwd="+$("#delPwd").val(),
							dataType : "text",
							type : "post",
							async : false,
							error : function(){
								alert("시스템 오류입니다. 관리자에게 문의해주세요.");
							},
							success : function(data){
								if(data == "SUCCESS"){
									withdraw();
								}
								else{
									alert("비밀번호가 일치하지 않습니다. 확인 후 다시 시도해주세요.");
								}
							}
						});
					}
				});
				
				function withdraw(){
					$.ajax({
						url : "/member/withdraw",
						dataType : "text",
						type : "post",
						data : "m_num=${user.m_num}",
						async : false,
						error : function(){
							alert("시스템 오류입니다. 관리자에게 문의해주세요.");							
						},
						success : function(data){
							if(data == "SUCCESS"){
								alert("회원탈퇴가 성공적으로 되었습니다.")
								location.href = "/member/login";
							}
							else{
								alert("회원탈퇴하는데 실패하였습니다. 잠시후 다시 시도해주세요.");
							}
						}
					})
				}
			});//최상위 종료
			
			var x;
			//카운트다운
			function countdown(){
				var time = 180; //기준시간 작성
				var min = ""; //분
				var sec = ""; //초

				//setInterval(함수, 시간) : 주기적인 실행
				x = setInterval(function() {
					
					//parseInt() : 정수를 반환
					min = parseInt(time/60); 
					sec = time%60; //나머지를 계산

					$("#countdown").html(min+":"+sec);
					time--;

					//타임아웃 시
					if (time < 0) {
						timeover(x);
						checkPhone = false;
					}
				}, 1000);
			}
			
			//시간초 다될시
			function timeover(){
				clearInterval(x); //setInterval() 실행을 끝냄
				$("#countdown").html("");
				
				alert("시간이 초과 되었습니다. 다시 인증해 주세요.");
				$("#countdown").removeClass("countdown");
				$("#m_phone").removeAttr("disabled");
				$("#phoneChk").removeAttr("disabled").css("opacity","inherit");
				$("#codeConfirm").attr("disabled","disabled").css("opacity","0.3");
				$("#code").attr("disabled","disabled");
				$("#code").val("");
			}
			
			//인증번호 맞을시
			function codeSuccess(){
				clearInterval(x);
				$("#countdown").html("");
				$("#countdown").removeClass("countdown");
				$("#codeConfirm").attr("disabled","disabled").css("opacity","0.3");
				$("#code").attr("disabled","disabled");
				checkCode = true;
			}
			
			//공백제거 함수
			function delWhiteSpace(str){
				var a = str.val().replace(/\s/g,"");
				str.val(a);
			}
		</script>
		</c:if>
	</head>
	<body>
	
		<div class="boardContainer container">
			<%-- <div class="row">
				<div class="col-md-6">
					<div>등급 : ${'등급'}등급/${'이름' }님</div>
					<div>혜택  : ${'혜택혜택혜택' }</div>
				</div>
				<div class="col-md-3">
					<div><h2>적립금</h2></div>
					<div><a href="#">${'적립금'} 원</a></div>
					<div><a href="#">소멸예저 ${'얼마냐' }원</a></div>
					
				</div>
				<div class="col-md-3">
					<div><h2>쿠폰</h2></div>
					<div><a href="#">${'가진 쿠폰개수' }개</a></div>
				</div>
			</div> --%>
			
			
			
			<div id="sub_menu">
				<h2 id="head_title">마이 페이지</h2>
				<div id="menubar">
					<ul id="menu_sort">
						<li><a href="/member/orders" id="a" class="subMenu_sort">주문내역</a></li>
						<li><a href="/member/bookmark" id="b" class="subMenu_sort">자주사는것</a></li>
						<li><a href="/member/review" id="c" class="subMenu_sort">상품후기</a></li>
						<li><a href="/member/point" id="d" class="subMenu_sort">적립금</a></li>
						<li><a href="/member/coupon" id="e" class="subMenu_sort">쿠폰</a></li>
						<li><a href="/member/myInfo" id="f" class="subMenu_sort">개인정보 수정</a></li>
					</ul>
				</div>
			</div>
			
			<div id="board_notice">
				<div id="board_title"><h2>개인 정보 수정</h2></div>
				<c:if test="${sessionScope.pwdCheck == false }">
					<div id="pwdConfirmBox">
						<div class="pwdCheckImgBox">
							<img src="/resources/images/pwdCheck.gif">
						</div>
						<div class="userInfo">
							<div class="asdf">아이디</div>
							<span id="m_id">${user.m_id}</span>
							<div class="asdf">비밀번호</div>
							<div><input type="password" name="m_pwd" id="m_pwd" class="pwdConfirm"></div>
						</div>
						<div style="padding-top: 20px; text-align: center;">
							<input type="button" value="확인" id="pwdCheck">
						</div>
					</div>
				</c:if>
				<c:if test="${sessionScope.pwdCheck == true}">
				<form>
					<input type="hidden" name="m_num" value="${myInfo.m_num }">
					<div class="up_title">
						<h3 >기본정보</h3>
						<p>*필수입력사항</p>
					</div>
					<div id="info_box">
						<table id="info_table">
							<colgroup>
								<col width="149px">
								<col width="300px">
								<col width="150px">
							</colgroup>
							<tbody data-num="${myInfo.m_num}">
								<tr>
									<td><label for="m_id">아이디*</label></td>
									<td><input type="text" class="form-control" disabled="disabled" name="m_id" value="${myInfo.m_id }"></td>
									<td></td>
								</tr>
								<tr>
									<td><label for="currPwd">현재 비밀번호</label></td>
									<td><input type="password" id="currPwd" class="form-control" maxlength="16">
										<span id="currPwdChk">현재 비밀번호를 확인해주세요.</span>
									</td>
									<td></td>
								</tr>
								<tr>
									<td><label for="newPwd">새 비밀번호</label></td>
									<td><input type="password" id="newPwd" maxlength="16" name="m_pwd" class="form-control">
										<span id="pwdReg1">현재 비밀번호와 다르게 입력</span>
										<span id="pwdReg2">최소 10자 이상 입력</span>
										<span id="pwdReg3">영문/숫자/특수문자 허용, 3개 조합 모두 사용(필수)</span>
									</td>
									<td></td>
								</tr>
								<tr>
									<td><label for="newPwdChk">새 비밀번호 확인</label></td>
									<td><input type="password" id="newPwdChk" maxlength="16" class="form-control">
										<span id="pwdConf">동일한 비밀번호를 입력해주세요.</span>
									</td>
									<td></td>
								</tr>
								<tr>
									<td><label for="m_name">이름*</label></td>
									<td><input type="text" id="m_name" name="m_name" maxlength="6" class="form-control" value="${myInfo.m_name}"></td>
									<td></td>
								</tr>
								<tr>
									<td><label for="m_email">이메일*</label></td>
									<td><input type="text" id="m_email" name="m_email" class="form-control" value="${myInfo.m_email }"></td>
									<td><input type="button" class="form-control" id="emailChk" value="이메일 중복 확인"></td>
								</tr>
								<tr>
									<td><label for="m_phone">휴대폰*</label></td>
									<td><input type="text" id="m_phone" name="m_phone" maxlength="11" class="form-control" disabled="disabled" value="${myInfo.m_phone }"></td>
									<td><input type="button" class="form-control" id="phoneChk" value="다른 번호 인증"></td>
								</tr>
								<tr>
									<td></td>
									<td style="position: relative;"><input type="text" class="form-control" maxlength="6" id="code" disabled="disabled"><span id="countdown"></span></td>
									<td><input type="button" id="codeConfirm" id="phoneCheck" disabled="disabled" class="form-control" value="인증번호 확인"></td>
								</tr>
								<tr>
									<td><label for="m_home">집전화</label></td>
									<td><input type="text" id="m_home" maxlength="11" name="m_home" class="form-control" value="${myInfo.m_home}"></td>
									<td></td>
								</tr>
							</tbody>
						</table>
					</div>
					<div class="up_title">
						<h3>추가정보</h3>
					</div>
					<div id="addInfo">
						<table id="addInfo_table">
							<colgroup>
								<col width="149px">
								<col width="300px">
							</colgroup>
							<tbody>
								<tr>
									<td>성별</td>
									<td><input id="male" type="radio" name="m_gender" value="남자">
										<label for="male">남자</label>
										<input type="radio" id="female" name="m_gender" value="여자">
										<label for="female">여자</label>
									</td>
								</tr>
								<tr>
									<td><label for="birthY">생년월일</label></td>
									<td>
										<div id="birthBox" class="form-control">
											<input type="text" placeholder="YYYY" value="${myInfo.m_birth.substring(0,4) }" maxlength="4" id="birthY" class="text-center" style="width : 30%;">/
											<input type="text" placeholder="MM" value="${myInfo.m_birth.substring(4,6) }" maxlength="2" id="birthM" class="text-center" style="width : 30%;">/
											<input type="text" placeholder="DD" value="${myInfo.m_birth.substring(6,8) }" maxlength="2" id="birthD" class="text-center" style="width : 30%;">
										</div>
										<span id="dateCheck"></span>
										<input type="hidden" name="m_birth" id="m_birth">
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					
					<div class="up_title">
						<h3>이용약관동의</h3>
					</div>
					<div id="termsInfo">
						<div class="first_area">
							<input type="checkbox" class="all" id="eventReceive">
							<label for="eventReceive"> 무료배송,할인쿠폰 등 혜택/정보 수신(선택)</label>
						</div>
						<div class="second_area">
							<input type="checkbox" ${myInfo.m_smssend=='O'? checked : '' } class="all" id="m_smssend">
							<label for="m_smssend">SMS</label>
							<input type="checkbox" class="all" id="m_emailsend">
							<label for="m_emailsend">이메일</label> 
							<input type="hidden" name="m_smssend">
							<input type="hidden" name="m_emailsend">
						</div>
					</div>
					
					<div class="text-center">
						<input type="button" id="delBtn" value="탈퇴하기">
						<input type="button" id="updateBtn" value="회원정보수정">
					</div>
				</form>
				</c:if>
			</div>
			<div id="dialog">
				<p>비밀번호를 확인해 주세요.</p>
				<input type="password" id="delPwd" class="form-control">
				<div style="float:right; margin-top : 15px;">
					<input type="button" id="delConfirm" value="확인">
					<input type="button" id="delCancel" value="취소">
				</div>
			</div>
			
		</div>
	</body>
</html>