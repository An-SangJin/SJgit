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
		
		<link rel="stylesheet" type="text/css" href="/resources/include/dist/css/bootstrap.min.css">
		<link rel="stylesheet" type="text/css" href="/resources/include/dist/css/bootstrap-theme.min.css">
		
		<style type="text/css">
			#signupForm{
				width:700px; 
				margin:0 auto;
				padding : 50px 50px;
				border : 1px solid #70c745;
				margin-bottom : 100px;
				background-color: white;
			}
			
			#s_form_table tr > td{
				padding : 10px 3px;
				vertical-align: top;
			}
			
			.font-bold{
				font-weight: bold;
			}
			
			.font-bold > label{
				padding-top : 7px;
			}
			
			#idChkBtn,#emailChkBtn,#phoneChkBtn,#phoneChkConfirmBtn,#searchAddr{
				background: #70c745;
				border : 0;
				outline : 0;
				font-weight: bold;
				color : white;
			}
			
			#searchAddr{
				width:auto;
			}
			
			td > span{
				display : none;
			}
			
			.show{
				display : inline;
			}
			
			.span-success{
				color : #0f851a;
			}
			.span-fail{
				color : #b3130b;			
			}
			
			.no-drag {-ms-user-select: none; -moz-user-select: -moz-none; -webkit-user-select: none; -khtml-user-select: none; user-select:none;}
			
			.countdown{display : block; position: absolute; top : 19px; right : 15px; font-size: 12px;}
			
			#addrBox{
				padding-top : 10px;
				display: none;
			}
			
			#addrBox > input{
				margin-bottom : 5px;
			}
			
			#genderBox > label,#agreement label{
				padding-left : 20px;
			}
			
			#female + label, #male + label{
				background: url(/resources/images/radioBtnOff.png) left no-repeat ;
			}
			
			#female:checked + label, #male:checked + label{
				background: url(/resources/images/radioBtnOn.png) left no-repeat ;
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
			
			input[type='checkbox']{
				display : none;
			}
			
			input[type='checkbox'] + label{
				background: url(/resources/images/nocheck.png) left no-repeat ;
				background-size: 15px;
			}
			
			input[type='checkbox']:checked + label{
				background: url(/resources/images/checked.png) left no-repeat ;
				background-size: 15px;
			}
			
			.second_area{
				margin-left : 30px;
			}
			
			.third_area{
				margin-left : 60px;
			}
			
			label[for='m_emailsend']{
				margin-left : 30px;
			}
			
			#phoneChkBtn, #phoneChkConfirmBtn{
				opacity: 0.3;
				cursor: pointer;
			}
			
			#m_phone,#phoneCheck,#addr{
				cursor : text;
			}
			
			#agreement a{
				color : #70c745;
				font-weight: 700;
				text-decoration: none;
				outline: none;
			}
			
			#sighupBtn{
				width: auto;
				background: #70c745;
				margin-top : 15px;
				border: 0;
			    outline: 0;
			    font-weight: bold;
			    color: white;
			    display: inline-block !important;
			}
		</style>
		
		<!--[if lt IE 9]>
		<script src="/resources/include/js/html5shiv.js"></script>
		<![endif]-->
		<script type="text/javascript" src="/resources/include/js/jquery-3.3.1.min.js"></script>
		<script type="text/javascript" src="/resources/include/js/common.js"></script>
		<script type="text/javascript" src="/resources/include/dist/js/bootstrap.min.js"></script>
		<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
		<script type="text/javascript">
			var checkId = false;
			var checkEmail = false;
			var checkPhone = false;
			var checkCode = false;
		
			$(function(){
				$("input").attr("autocomplete","off");
				
				//패스워드 정규식
				var pwdReg1 = /^.*(?=^.{10,16}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;
				
				//이메일 정규식
				var emailReg = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
				
				//휴대폰 정규식
				var phoneReg = /^01(?:0|1|[6-9])(\d{3}|\d{4})(\d{4})$/;
				
				//연도 정규식
				var yearReg = /^(19[0-9][0-9]|20\d{2})$/;
				
				//월 정규식
				var monthReg = /^([0-9]|0[0-9]|1[0-2])$/;
				
				//일 정규식
				var dayReg = /^([1-9]|0[1-9]|[1-2][0-9]|3[0-1])$/;
				
				//input 태그 누를시 하위에 있는 span 태그 보여주기
				$("input[type='text']").focus(function(){
					$(this).parent("td").find("span").addClass("show");
				});
				
				$("input[type='password']").focus(function(){
					$(this).parent("td").find("span").addClass("show");
				});
				
				//아이디 박스 keyup마다 유효성 체크하고 하위 span태그 스타일 바꾸기
				$("#m_id").keyup(function(){
					delWhiteSpace($("#m_id"));
					checkId = false;
					if(idCheck($("#m_id").val())==true){
						if($("#idReg").hasClass("span-fail")){
							$("#idReg").removeClass("span-fail");
						}
						$("#idReg").addClass("span-success");
					}
					else{
						if($("#idReg").hasClass("span-success")){
							$("#idReg").removeClass("span-success");
						}					
						$("#idReg").addClass("span-fail");
					}
				});
				
				$("#idChkBtn").click(function(){
					if(!chkData("#m_id","아이디를"))return;
					else if(idCheck($("#m_id").val())==true){
						console.log("띠영");
						$.ajax({
							url : "/member/idCheck.json",
							type : "POST",
							data : "m_id="+$("#m_id").val(),
							dataType : "text",
							async : false,
							error : function(){
								alert("오류 있으니 관리자문의 ㄱㄱ");
							},
							success : function(data){
								console.log("data = "+data);
								if(data==1){
									alert("이미 등록된 아이디입니다.")
									$("#idConf").css("color","#b3130b");
									$("#m_id").val("");
									$("#m_id").focus();
									
								}
								else if(data==0){
									alert("사용이 가능합니다.")
									checkId = true;
									$("#idConf").css("color","#0f851a");
								}
							}
						});
					}
					else{
						alert("아이디는 6자 이상의 영문 혹은 영문과 숫자 조합만 가능합니다.");
						$("#idConf").css("color","#b3130b");
					}
				});
				
				
				//비밀번호 박스 keyup마다 유효성 체크하고 하위 span태그 스타일 바꾸기 & 비밀번호 확인 하위 span태그 스타일바꾸기
				$("#m_pwd").keyup(function(){
					delWhiteSpace($("#m_pwd"));
					if($("#m_pwd").val().trim().length < 10){
						$("#pwdReg1").css("color","#b3130b");
					}
					else{
						$("#pwdReg1").css("color","#0f851a");
					}
					
					if(pwdReg1.test($("#m_pwd").val().trim())){
						$("#pwdReg2").css("color","#0f851a");
					}
					else{
						$("#pwdReg2").css("color","#b3130b");
					}
					
					if($("#m_pwd").val().trim()==$("#pwdCheck").val().trim()){
						$("#pwdConf").css("color","#0f851a");
					}
					else{
						$("#pwdConf").css("color","#b3130b");						
					}
				});
				
				//비밀번호 확인 박스 keyup 마다 유효성 체크 및 하위 span 스타일 변경
				$("#pwdCheck").keyup(function(){
					delWhiteSpace($("#pwdCheck"));
					if($("#m_pwd").val().trim()==$("#pwdCheck").val().trim()){
						$("#pwdConf").css("color","#0f851a");
					}
					else{
						$("#pwdConf").css("color","#b3130b");						
					}
				});
				
				//비밀번호 확인 박스 click시 유효성 체크 및 하위 span 스타일 변경
				$("#pwdCheck").click(function(){
					if($("#m_pwd").val().trim()==$("#pwdCheck").val().trim()){
						$("#pwdConf").css("color","#0f851a");
					}
					else{
						$("#pwdConf").css("color","#b3130b");						
					}
				});
				
				//이름 공백제거
				$("#m_name").keyup(function(){
					delWhiteSpace($("#m_name"));
				});
				
				//이메일 공백제거
				$("#m_email").keyup(function(){
					delWhiteSpace($("#m_email"));
					checkEmail = false;
				});
				
				//이메일 유효성 체크 및 중복 체크
				$("#emailChkBtn").click(function(){
					if(!chkData("#m_email","이메일을"))return;
					else if(emailReg.test($("#m_email").val().trim())){
						$.ajax({
							url : "/member/emailCheck.json",
							type : "POST",
							data : "m_email="+$("#m_email").val(),
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
						});
					}
					else{
						alert("잘못된 이메일 형식입니다.\nEX)nonba@market.com");						
					}
				});
			
				//휴대폰번호 keyup시 숫자 제외 삭제
				$("#m_phone").keyup(function(){
					checkPhone = false;
					$("#m_phone").val($("#m_phone").val().replace(/[^0-9]/g,""));
					if($("#m_phone").val().length >9){
						$("#phoneChkBtn").removeAttr("disabled").css("opacity","inherit");
						
					}
					else{
						$("#phoneChkBtn").attr("disabled","disabled").css("opacity","0.3");												
					}
				});
				
				//휴대폰번호 인증버튼 클릭시 유효성 체크, 중복체크 및 인증번호 발송
				$("#phoneChkBtn").click(function(){
					console.log($("input[name='m_phone']").val());
					if(!chkData("#m_phone","휴대전화를"))return;
					else if(phoneReg.test($("#m_phone").val().trim())){
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
									$("#phoneChkBtn").attr("disabled","disabled").css("opacity","0.3");	
									$("#phoneChkConfirmBtn").removeAttr("disabled").css("opacity","inherit");
									$("#phoneCheck").removeAttr("disabled");
									$("#phoneCheck").focus();
									countdown();
									checkPhone = true;
								}
								else if(data == "OVERLAP"){
									alert("이미 등록된 번호입니다. 확인 후 다시 시도 해 주세요.");
									$("#countdown").removeClass("countdown");
									
								}
							}
						});
					}
					else{
						alert("잘못된 휴대폰 번호 입니다. 확인 후 다시 시도 해 주세요.");
					}
				});
				
				//인증번호 확인
				$("#phoneChkConfirmBtn").click(function(){
					if(!chkData("#phoneCheck", "인증번호를"))return;
					else if($("#phoneCheck").val().length <6){
						alert("인증번호는 6글자(숫자) 입니다. 확인 후 다시 입력  해 주세요.");
					}
					else{
						$.ajax({
							url : "/member/codeCheck",
							type : "POST",
							data : "code="+$("#phoneCheck").val(),
							dataType : "text",
							error : function(){
								alert("에러 발생");
							},
							success : function(data){
								console.log("data : "+data);
								if(data=="SUCCESS"){
									alert("인증되었습니다.");
									codeSuccess();
								}
								else{
									alert("인증번호가 일치하지 않습니다. 확인 후 다시 입력 해 주세요.");
								}
							}
						});
					}
				});
				
				//인증번호 입력시 공백제거 및 숫자외 문자 제거
				$("#phoneCheck").keyup(function(){
					$("#phoneCheck").val($("#phoneCheck").val().replace(/[^0-9]/g,""));
					delWhiteSpace($("#phoneCheck"));
				})
				
				//주소 찾기
				$("#searchAddr").click(function(){
					searchAddr();
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
				
				//전체 동의 체크박스 누를시 하단 체크박스들 전체 선택
				$("#allAgree").click(function(){
					if($("#allAgree").prop("checked")){
						$(".all").prop("checked",true);
					}
					else{
						$(".all").prop("checked",false);						
					}
				});
				
				$("#eventReceive").click(function(){
					if($("#eventReceive").prop("checked")){
						$(".third_area input[type='checkbox']").prop("checked",true);
					}
					else{
						$(".third_area input[type='checkbox']").prop("checked",false);						
					}
				});
				
				$("#m_emailsend").click(function(){
					if($("#m_emailsend").prop("checked") && $("#m_smssend").prop("checked")){
						$("#eventReceive").prop("checked",true);
					}
					else{
						$("#eventReceive").prop("checked",false);						
					}
				});
				
				$("#m_smssend").click(function(){
					if($("#m_emailsend").prop("checked") && $("#m_smssend").prop("checked")){
						$("#eventReceive").prop("checked",true);
					}
					else{
						$("#eventReceive").prop("checked",false);						
					}
				});
				
				$("#sighupBtn").click(function(){	
					if(!chkData("#m_id","아이디를"))return;
					else if(!checkId){
						alert("아이디 중복확인을 완료해 주세요.");
					}
					else if(!chkData("#m_pwd","비밀번호를"))return;
					else if(!chkData("#pwdCheck","비밀번호 확인을"))return;
					else if(!chkData("#m_name","이름을"))return;
					else if(!chkData("#m_email","이메일을"))return;
					else if(!checkEmail){
						alert("이메일 중복확인을 완료해 주세요.");
						return;
					}
					else if(!chkData("#m_phone","휴대폰 번호를"))return;
					else if(!checkPhone){
						alert("휴대폰 인증을 완료해 주세요.");
						return;
					}
					else if(!chkData("#phoneCheck","인증번호를"))return;
					else if(!checkCode){
						alert("인증번호 확인을 완료해 주세요.");
						return;
					}
					else if(!chkData("#addr","주소를"))return;
					else if(!chkData("#birthY","태어난 연도를"))return;
					else if(!chkData("#birthM","태어난 월을"))return;
					else if(!chkData("#birthD","태어난 일을"))return;
					else if(!$("#accessTerms").prop("checked")){
						alert("이용약관(필수)에 동의해주세요.");
						return;
					}
					else if(!$("#privacyPolicy1").prop("checked")){
						alert("개인정보처리방침(필수)에 동의해주세요.");
						return;
					}
					else if(!$("#overAge14").prop("checked")){
						alert("만 14세 미만은 가입할 수 없습니다.");
						return;
					}
					else{
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
						if($("#addr_sub").val()==""){
							$("#m_address").val($("#addr").val());
						}
						else{
							$("#m_address").val($("#addr").val()+" / "+$("#addr_sub").val());
						}
						
						if($("#m_smssend").prop("checked")){
							$("input[name=m_smssend]").val("O");
						}
						else{
							$("input[name=m_smssend]").val("X");							
						}
						
						if($("#m_emailsend").prop("checked")){
							$("input[name=m_emailsend]").val("O");														
						}
						else{
							$("input[name=m_emailsend]").val("X");																					
						}
						
						console.log($("input[name='m_phone']").val());
						$("#s_form").attr({
							"method" : "post",
							"action" : "/member/memberInsert"
						});
						
						$("#m_phone").removeAttr("disabled");
						
						$("#s_form").submit();
						console.log($("#s_form").serialize());
					}
				});
				
				
				
			});//onload 끝
			
			//아이디 체크 정규식 
			function idCheck(str){
				//아이디 정규식 2개
				var idReg1 = /^[a-zA-Z0-9]{6,16}$/;
				var idReg2 = /[a-zA-Z]/g;
				
				var result1 = idReg1.test(str);
				var result2 = idReg2.test(str);
				return result1 && result2;
			}
			
			//공백제거 함수
			function delWhiteSpace(str){
				var a = str.val().replace(/\s/g,"");
				str.val(a);
			}
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
				$("#phoneChkBtn").removeAttr("disabled").css("opacity","inherit");
				$("#phoneChkConfirmBtn").attr("disabled","disabled").css("opacity","0.3");
				$("#phoneCheck").attr("disabled","disabled");
				$("#phoneCheck").val("");
			}
			
			//인증번호 맞을시
			function codeSuccess(){
				clearInterval(x);
				$("#countdown").html("");
				$("#countdown").removeClass("countdown");
				$("#phoneChkConfirmBtn").attr("disabled","disabled").css("opacity","0.3");
				$("#phoneCheck").attr("disabled","disabled");
				checkCode = true;
			}
			
			//주소 검색
			function searchAddr(){
				new daum.Postcode({
		            oncomplete: function(data) {
		                var addr = ''; 
		                var extraAddr = ''; 
		                if (data.userSelectedType === 'R') { 
		                    addr = data.roadAddress;
		                } else { 
		                    addr = data.jibunAddress;
		                }
		                if(data.userSelectedType === 'R'){
		                   
		                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
		                        extraAddr += data.bname;
		                    }
		                    
		                    if(data.buildingName !== '' && data.apartment === 'Y'){
		                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
		                    }
		                    if(extraAddr !== ''){
		                        addr +=' (' + extraAddr + ')';
		                    }
		                    
		                }
		                $("#addrBox").css("display","block");
		                $("#addr").val(addr+" ["+ data.zonecode +"]");
		            }
		        }).open();
			}
		</script>
	</head>
	<body style="background-color: #f7f7f7;" class="no-drag">
		<c:if test="${not empty s_result }">
			<script type="text/javascript">
				alert("${s_result}");
			</script>
		</c:if>
		<c:if test="${not empty user}">
			<script type="text/javascript">
				$(function(){
					alert("이미 로그인 하였습니다.");
					location.href="/";
				});	
			</script>
		</c:if>
		<div class="breadcrumb-area">
        <!-- Top Breadcrumb Area -->
        <div class="top-breadcrumb-area bg-img bg-overlay d-flex align-items-center justify-content-center" style="background-image: url(/resources/images/bg-img/24.jpg);">
            <h2>회원가입</h2>
        </div>
     </div>
		<div>
			<div class="text-center" style="margin-top : 100px;margin-bottom: 40px;"><h2>회원가입</h2></div>
			<div class="container">
				<div id="signupForm">
					<form id="s_form">
						<div>
							<table id="s_form_table">
								<colgroup>
									<col width="33%"/>
									<col width="66%"/>
									<col width="33%"/>
								</colgroup>
								<tr>
									<td class="font-bold"><label for="m_id">아이디</label></td>
									<td><input type="text" class="form-control" id="m_id" name="m_id" maxlength="16" placeholder="6자 이상의 영문 혹은 영문과 숫자 조합">
										<span id="idReg">6자 이상의 영문 혹은 영문과 숫자 조합</span>
										<span id="idConf">아이디 중복확인</span>
									</td>
									<td><input type="button" class="form-control" id="idChkBtn" value="중복 체크"></td>
								</tr>
								<tr>
									<td class="font-bold"><label for="m_pwd">비밀번호</label></td>
									<td><input type="password" class="form-control" placeholder="비밀번호를 입력해주세요" id="m_pwd" name="m_pwd" maxlength="16">
										<span id="pwdReg1">최소 10자 이상 입력</span>
										<span id="pwdReg2">영문/숫자/특수문자 허용, 3개 조합 모두 사용(필수)</span>
									</td>
									<td>&nbsp;</td>
								</tr>
								<tr>
									<td class="font-bold"><label for="pwdCheck">비빌번호확인</label></td>
									<td><input type="password" class="form-control" placeholder="비밀번호를 한번 더 입력해주세요" id="pwdCheck"  maxlength="16">
										<span id="pwdConf">동일한 비밀번호를 입력해주세요.</span>
									</td>
									<td>&nbsp;</td>
								</tr>
								<tr>
									<td class="font-bold"><label for="m_name">이름</label></td>
									<td><input type="text" class="form-control" placeholder="고객님의 이름을 입력해주세요" maxlength="6" id="m_name" name="m_name"></td>
									<td>&nbsp;</td>
								</tr>
								<tr>
									<td class="font-bold"><label for="m_email">이메일</label></td>
									<td><input type="text" class="form-control" placeholder="ex)nonba@market.com" id="m_email" name="m_email"></td>
									<td><input type="button" class="form-control" id="emailChkBtn" value="이메일 중복 확인"></td>
								</tr>
								<tr>
									<td class="font-bold"><label for="m_phone">휴대폰</label></td>
									<td><input type="text" class="form-control" placeholder="숫자만 입력해주세요" maxlength="11" id="m_phone" name="m_phone"></td>
									<td><input type="button" class="form-control" disabled="disabled" id="phoneChkBtn" value="인증번호받기"></td>
								</tr>
								<tr>
									<td class="font-bold">&nbsp;</td>
									<td style="position: relative;"><input type="text" disabled="disabled" class="form-control" maxlength="6" id="phoneCheck"><span id="countdown"></span></td>
									<td><input type="button" class="form-control" disabled="disabled" id="phoneChkConfirmBtn" value="인증번호확인" ></td>
								</tr>
								<tr>
									<td class="font-bold"><label for="m_address">주소</label></td>
									<td colspan="2"><input type="button" class="form-control" id="searchAddr" value="주소 검색">
										<div id="addrBox">
											<input type="text" readonly="readonly" class="form-control" id="addr">
											<input type="text" placeholder="상세 주소를 입력해 주세요" class="form-control" id="addr_sub">
											<input type="hidden" name="m_address" id="m_address">
										</div>
									</td>
								</tr>
								<tr>
									<td class="font-bold"><label>성별</label></td>
									<td colspan="2">
										<div id="genderBox">
											<input type="radio" id="male" checked="checked" name="m_gender" value="남자">
											<label for="male">남자</label>
											<input type="radio" name="m_gender" id="female" value="여자">
											<label style="margin-left : 50px;" for="female">여자</label>	
										</div>								
									</td>
								</tr>
								<tr>
									<td class="font-bold"><label>생년월일</label></td>
									<td>
										<div id="birthBox" class="form-control">
											<input type="text" placeholder="YYYY" maxlength="4" id="birthY" class="text-center" style="width : 30%;">/
											<input type="text" placeholder="MM" maxlength="2" id="birthM" class="text-center" style="width : 30%;">/
											<input type="text" placeholder="DD" maxlength="2" id="birthD" class="text-center" style="width : 30%;">
										</div>
										<span id="dateCheck"></span>
										<input type="hidden" name="m_birth" id="m_birth">
									</td>
									<td>&nbsp;</td>
								</tr>
							</table>
						</div>
						<div id="agreement" style="margin-top : 45px;">
							<h2 style="margin-bottom : 30px;">이용약관 동의</h2>
							<div class="first_area">
								<input type="checkbox" id="allAgree">
								<label for="allAgree"> 전체동의</label>
							</div>
							<div class="second_area">
								<input type="checkbox" class="all" id="accessTerms">
								<label for="accessTerms"> 이용약관(필수)</label> <a href="#">약관보기 &gt;</a>
							</div>
							<div class="second_area">
								<input type="checkbox" class="all" id="privacyPolicy1">
								<label for="privacyPolicy1"> 개인정보처리방침(필수)</label> <a href="#">약관보기 &gt;</a>
							</div>
							<div class="second_area">
								<input type="checkbox" class="all" id="privacyPolicy2">
								<label for="privacyPolicy2"> 개인정보처리방침(선택)</label> <a href="#">약관보기 &gt;</a>
							</div>
							<div class="second_area">
								<input type="checkbox" class="all" id="eventReceive">
								<label for="eventReceive"> 무료배송,할인쿠폰 등 혜택/정보 수신(선택)</label>
							</div>
							<div class="third_area">
								<input type="checkbox" id="m_smssend" class="all">
								<label for="m_smssend">SMS</label>
								<input type="checkbox" class="all" id="m_emailsend" >
								<label for="m_emailsend">이메일</label> 
								<input type="hidden" name="m_smssend" value="X">
								<input type="hidden" name="m_emailsend" value="X">
							</div>
							<div class="second_area">
								<input type="checkbox" class="all" id="overAge14">
								<label for="overAge14"> 본인은 만 14세 이상입니다.(필수)</label>
							</div>
						</div>
						<div class="text-center">
							<input type="button" class="all form-control" id="sighupBtn" value="가입하기">
						</div>
					</form>
				</div>
			</div>
		</div>
	</body>
</html>