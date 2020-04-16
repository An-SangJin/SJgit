/* 함수명 : chkData(유효성 체크 대상, 메시지 내용)*/
function chkData(item,msg){
	if($(item).val().replace(/\s/g,"")==""){
		alert(msg+" 입력해주세요");
		$(item).focus();
		$(item).val("");
		return false;
	}
	else{
		return true;
	}
}

function formCheck(main,item,msg){
	if(main.val().replace(/\s/g,"")==""){
		item.css("color","#000099").html(msg+" 입력해주세요");
		main.val("");
		return false;
	}
	else{
		return true;
	}
}

function checkForm(item,msg){
	if($(item).val().replace(/\s/g,"")==""){
		$(item).attr("placeholder",msg+" 입력해주세요");
		$(item).val("");
		$(item).focus();
		return false;
	}
	else{
		return true;
	}
}

/*함수명 : chkFile(item)
 * 설명 : 이미지 파일 여부를 확인하기 위해 확장자 확인 함수*/
function chkFile(item){
	/**
	 * 배열내의 값을 찾아서 인덱스를 반환(요소가 없을 경우 -1반화)
	 * jQuery.inArray(찾을 값, 검색 대상의 배열)
	 */
	var ext = item.val().split('.').pop().toLowerCase();
	if(jQuery.inArray(ext, ['gif','png','jpg','jpeg'])==-1){
		alert("gif, png, jpg, jpeg 파일만 업로드 할수 있습니다");
		return false;
	}
	else{
		return true;
	}
}

function selectChk(item,msg){
	if($(item).val()=="0"){
		alert(msg+"선택해주세요");
		return false;
	}else{
		return true;
	}
}