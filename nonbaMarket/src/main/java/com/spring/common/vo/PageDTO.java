package com.spring.common.vo;

import lombok.Getter;
import lombok.ToString;

@Getter
@ToString
public class PageDTO {
	private int startPage;  //화면에서 보여지는 페이지의 시작 번호
	private int endPage; //화면에서 보여지는 페이지의 끝번호
	private boolean prev, next; //이전과 다음으로 이동하는 링크의 표시
	
	private int total;
	private CommonVO cvo;
	
	public PageDTO(CommonVO cvo, int total) {
		this.cvo = cvo;
		this.total = total;
		
		/* 페이징의 끝번호(endPage) 구하기
		 * this.endPage = (int) (Math.ceil(페이지번호 / 10.0)) * 10;
		 * Math.cell은 나온 번호를 무조건 올림해준다.
		 * 1페이지 선택시 1/10*10 결과는 1 ceil에의해 최종적으로 10이되고 끝페이지가 10이다.
		 */
		this.endPage = (int) (Math.ceil(cvo.getPageNum() / 10.0)) * 10;
		
		//페이지의 시작번호(startPage) 구하기 
		this.startPage = this.endPage - 9;
		
		//끝 페이지 구하기
		int realEnd = (int)(Math.ceil((total * 1.0) / cvo.getAmount()));
		
		if(realEnd <= this.endPage) {
			this.endPage = realEnd;
		}
		
		//이전(prev) 구하기 
		this.prev = this.startPage > 1;
		
		//다음(next) 구하기
		this.next = this.endPage < realEnd;
	}
}
