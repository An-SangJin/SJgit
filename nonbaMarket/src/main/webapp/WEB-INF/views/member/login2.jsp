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
			#l_form{
				width:300px;
				margin : 0 auto;
			}
			#loginChkBox{
				float:left;
				vertical-align: middle;
			}
			#searchBox{
				float:right;
			}
			
			#asdasd{
				padding-top : 100px;
			}
			
			#l_form input[type="text"], #l_form input[type="button"],#l_form input[type="password"]{
				height : 50px;
				padding : 0 14px;
			}
			
			#m_pwd{
				margin-top : 10px;
			}
			
			#loginSave{
				display:none;
			}
			
			#s_label{
				padding-left: 17px;
			}
			
			#loginSave + label{
				background: url(/resources/images/nocheck.png) left no-repeat ;
			}
			
			
			#loginSave:checked + label{
				background: url(/resources/images/checked.png) left no-repeat ;
			}
			
			.no-drag {-ms-user-select: none; -moz-user-select: -moz-none; -webkit-user-select: none; -khtml-user-select: none; user-select:none;}

			#searchBox > a{
				font-size : 13px;
				text-decoration: none;
				color : black;
			}
			
			#btnBox{
				margin-top : 13px;
			}
			
			#loginBtn{
				background: #70c745;
				font-weight: bold;
				color : white;
			}
			
			#signUp{
				margin-top : 10px;
				color : #70c745;
				font-weight: bold;
			}
			
			.container{
				margin-top : 30px;
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
				$("#loginBtn").click(function(){
					$.ajax({
						url : "/member/loginCheck.json",
						type : "POST",
						data : "m_id="+$("#m_id").val()+"&m_pwd="+$("#m_pwd").val(),
						dataType : "text",
						error : function(){
							alert("오류 있으니 관리자문의 ㄱㄱ");
						},
						success : function(data){
							console.log("data = "+data);
							if(data==1){
								alert("로그인 성공")
								location.href ="/";
							}
							else if(data==0){
								alert("로그인 실패")
							}
						}
					});
					
				});
				
				$("#signUp").click(function(){
					location.href="/member/signup";
				})
				
			
				
			});
		</script>
	</head>
	<body class="no-drag">
		<c:if test="${not empty s_result}">
			<script type="text/javascript">
				alert("${s_result}");
			</script>
		</c:if>
		<div id="asdasd">
			<div id="title" class="text-center"><h2>로그인</h2></div>
			<div class="container">
				<div id="loginForm">
					<form id="l_form">
						<div>
							<input type="text" class="form-control" id="m_id" name="m_id" placeholder="아이디를 입력해 주세요">
						</div>
						<div>
							<input type="password" class="form-control" id="m_pwd" name="m_pwd" placeholder="비밀번호를 입력해 주세요">
						</div>
						<div id="chkBox">
							<input type="checkbox" id="loginSave">
							<label for="loginSave" id="s_label">로그인 저장</label>
							<div id="searchBox">
								<a href="#">아이디 찾기</a>
								<a href="#">비밀번호 찾기</a>
							</div>
						</div>
						<div id="btnBox">
							<input type="button" id="loginBtn" class="form-control" value="로그인">
							<input type="button" id="signUp" class="form-control" value="회원가입">
						</div>
					</form>
				</div>
			</div>
		</div>
	</body>
</html>