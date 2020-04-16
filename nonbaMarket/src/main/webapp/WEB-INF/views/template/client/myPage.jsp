<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
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
			#myPageTop{
				padding : 50px 0px;
				background-color: #f7f7f7;
			}
			
			#myPage_user{
				
				margin-left: 45px;
			}
			
			#myPageBox{
				height:176px;
				background-color: #f7f7f7;
				position: relative;
			}

			#a1,#a2,#a3,#a4,#a5{
				height:100%;
				padding : 29px 0px 29px 30px;
				width: 176px;
				display: inline-block;
				background-color: white;
				
			}
			
			#a2,#a3,#a4,#a5{
				position: relative;
				left: 350px;
			}
			
			#a1{
				width:345px;
				position: absolute;
			}
			
			#grade_img{
				display: inline-block;
				width: 62px;
				height: 61px;
				background: url(/resources/images/grade1.png) left no-repeat;
			}
			
			#user_name{
				font-size: 20px;
				font-family: 'Noto Sans KR', sans-serif;
				font-weight: bold;
				
			}
			
			#user_name > span{
				font-weight: normal;
				font-size : 16px;
			}
			
			#grade_box{
				font-size: 14px;
				padding-top: 18px;
				font-family: 'Noto Sans KR', sans-serif;
				color : #333333;
			}
			
			#all_grade, #all_grade:hover,#all_grade:focus{
				text-decoration: none;
				color:#333333;
				outline: none;
			}
			#grader_benefit{
			 padding : 6px 0px;
			 display: inline-block;
			}
			
			#all_grade{
				display: inline-block;
				padding: 6px 15px;
				background-color : #f7f7f7;
				border-radius : 100px;
				margin-right: 15px;
			}
			
			.tit{
				font-family: 'Noto Sans KR', sans-serif;
				color : #333333;
				font-size : 14px;
				padding-bottom : 26px;
				display: inline;
				position: absolute;
				font-weight: 400;
			}
			
			.info,.info:hover, .info:focus{
				position: absolute;
				top : 72px;
				text-decoration: none;
				color:#333333;
				outline: none;
				font-weight: 700;
				font-size: 20px;
				color : #5f0080;
			}
			
			.info2,.info2:hover,.info2:focus{
				position: absolute;
				top : 102px;
				text-decoration: none;
				color:#333333;
				outline: none;
				font-weight: 700;
				font-size: 14px;
				color : #5f0080;
			}
			
			.info2 > img{
				height: 25px;
				width: 25px;
				padding-bottom: 5px;
			}
			
			.info > img{
				height: 32px;
				width: 32px;
				padding-bottom: 5px;
			}
		</style>
		<!--[if lt IE 9]>
		<script src="/resources/include/js/html5shiv.js"></script>
		<![endif]-->
		<script type="text/javascript" src="/resources/include/js/jquery-3.3.1.min.js"></script>
		<script type="text/javascript" src="/resources/include/js/common.js"></script>
		<script type="text/javascript" src="/resources/include/dist/js/bootstrap.min.js"></script>
	</head>
	<body>
		<div id="myPageTop">
			<div class="container">
				<div id="myPage_user" >
					<div id="myPageBox">
						<div id="a1">
							<span id="grade_img"></span>
							<h3 id="user_name" style="display: inline-block; vertical-align: top; margin: 0; margin-left:24px; padding-top:18px;">
								${info.m_name } <span>님</span>
							</h3>
							<div id="grade_box"><span id="grader_benefit">혜택 : ${info.g_percent}%적립</span><a href="#" id="all_grade" style="float : right;">전체등급 보기</a></div>
						</div>
						<div id="a2">
							<div class="tit">
								적립금
							</div>
							<a href="/member/point" class="info">${info.m_point} 원 <img src="https://res.kurly.com/pc/service/common/1905/ico_arrow_56x56.png"></a>
						</div>
						<div id="a3">
							<div class="tit">
								쿠폰
							</div>
							<a href="/member/coupon" class="info">${info.coupon_cnt} 개 <img src="https://res.kurly.com/pc/service/common/1905/ico_arrow_56x56.png"></a>
							
						</div>
						<div id="a4">
							<div class="tit">
								후기
							</div>
							<a href="/member/review" class="info">완료: ${info.review_cnt} 건 <img src="https://res.kurly.com/pc/service/common/1905/ico_arrow_56x56.png"></a>
							<a href="/member/review" class="info2">작성하러가기<img src="https://res.kurly.com/pc/service/common/1905/ico_arrow_56x56.png"></a>
							
						</div>
						<div id="a5">
							<div class="tit">
								배송중
							</div>
							<a href="/member/orders" class="info">${info.bae_cnt} 건 <img src="https://res.kurly.com/pc/service/common/1905/ico_arrow_56x56.png"></a>
						</div>
						
					</div>
				</div>
			</div>
		</div>
		
	</body>
</html>