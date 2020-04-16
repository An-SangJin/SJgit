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
		
		<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
		
		<style type="text/css">
			#loginBg{
				background-color: #ebedef;
			}
			
			#loginForm{
				padding : 44px;
				width : 389px;
				height: 320px;
				display : inline-block;
				float: left;
				background-color: white;
				border-radius: 7px 0 0 7px;
			}
			
			#pwdLbl{
				background: url(/resources/images/pwd_icon.png) left no-repeat;
			}
			
			#idLbl{
				background: url(/resources/images/id_icon.png) left no-repeat;
			}
			
			#l_form > label{
				background-position : 10px;
				background-color: #ebedef; 
				border : 1px solid #ccc; 
				padding-right:35px;
				border-radius: 4px;
				margin-bottom:16px;
			}
			
			#m_id,#m_pwd{
				margin-left : 35px;
				width : 100%;
				border-top-left-radius: 0;
				border-bottom-left-radius: 0;
				border : 0;
				border-left: 1px solid #ccc;
			}
			
			
			
			#loginContainer{
				padding : 50px 0;
			}
			
			#loginTitle{
				font-weight: 700;
				font-family: Dosis;
				font-size: 40px;
				margin : 0 0 8px 0;
			}
			
			#signup{
				text-decoration: none;
				font-family: 'Noto Sans KR', sans-serif;
			}
			
			#loginChk{
				font-family: 'Noto Sans KR', sans-serif;
				box-shadow: 2px 2px 5px #ccc;			
				width : 82.36px;
			}
			
			#searchId,#searchPwd{
				text-decoration: none;
				color : #ababab;
				font-family: 'Noto Sans KR', sans-serif;
				font-size: 13px;
			}
			
			#search1{
				color : #ababab;
				font-size: 14px;
			}
			
			#searchBox{
				padding-top : 7px;
			}
			
			#social_login{
				width: 389px;
				height:320px;
				/* background-color: #23A41A; */
				background-color: black;
				display: inline-block;
				float: left;
				border-radius: 0 7px 7px 0;	
				text-align: center;
			}
			
			#loginBox{
				display: inline-block;
				margin-left: 15%;
			}
			
			#social_login > input[type='button']{
				width:80%;
				height: 50px;
				font-size : 20px;
				outline: none;
				border : 0;
				margin-bottom : 20px;
				color : white;
				font-family: 'Noto Sans KR', sans-serif;
				padding-left : 30px;
			}
			
			#naver{
				background: url(/resources/images/naver.png) left no-repeat;
				background-color: #2db400;
			}
			#facebook{
				background: url(/resources/images/facebook.png) 3px no-repeat;
				background-color: #3b5998;
			}
			#kakao{
				background: url(/resources/images/kakao.png) 3px no-repeat;
				background-color: #f7e600;
			}
			#sc_title{
				color : white;
				font-family: Dosis;
				margin-bottom : 20px;
				text-align: left;
				margin-left : 35px;
				margin-top : 30px;
				font-size : 25px;
			}
		</style>
		
		<!--[if lt IE 9]>
		<script src="/resources/include/js/html5shiv.js"></script>
		<![endif]-->
		<script type="text/javascript" src="/resources/include/js/jquery-3.3.1.min.js"></script>
		<script type="text/javascript" src="/resources/include/js/common.js"></script>
		<script type="text/javascript" src="/resources/include/dist/js/bootstrap.min.js"></script>
		<script type="text/javascript">
			$(function(){
				$("#m_id").focus();
				$("#loginChk").click(function(){
					if(!chkData("#m_id","아이디를 "))return;
					else if(!chkData("#m_pwd","비밀번호를 "))return;
					else{
						$.ajax({
							url : "/member/loginCheck.json",
							type : "POST",
							data : "m_id="+$("#m_id").val()+"&m_pwd="+$("#m_pwd").val(),
							dataType : "text",
							error : function(){
								alert("로그인 하는데 오류가 발생하였습니다. 관리자에 문의해주세요.");
							},
							success : function(data){
								console.log("data = "+data);
								if(data==1){
									
									location.href ="/";
								}
								else if(data==0){
									alert("존재하지 않는 아이디거나 비밀번호가 틀렸습니다.");
								}
							}
						});	
					}
				});
				
				$("#signup").click(function(){
					location.href="/member/signup";
				});
			});
		</script>
	</head>
	<body id="loginBg">
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
            <h2>로그인</h2>
        </div>
     </div>
		<div class="container" id="loginContainer">
			<div id="loginBox">
				<div id="loginForm">
					<form id="l_form">
						<h2 id="loginTitle">Login</h2>
						<p><a href="#" id="signup">계정이 없으신가요?</a></p>
						<label id="idLbl"><input type="text" class="form-control" id="m_id" name="m_id"></label>
						<label id="pwdLbl"><input type="password" class="form-control" id="m_pwd" name="m_pwd"></label>
						<div class="row">
							<div class="col-6">
								<input type="button" class="btn" id="loginChk" value="로그인">
							</div>
							<div class="col-6" id="searchBox">
								<span id="search1"><a href="#" id="searchId">아이디찾기</a>/<a id="searchPwd" href="#">비밀번호찾기</a></span>
							</div>
						</div>
					</form>
				</div>
				<div id="social_login">
					<h2 id="sc_title">Social Login</h2>
					<input type="button" value="네이버 ID로 로그인" id="naver">
					<input type="button" value="페이스북 ID로 로그인" id="facebook">
					<input type="button" value="카카오톡 ID로 로그인" id="kakao">					
				</div>
			</div>
		</div>
	</body>
</html>