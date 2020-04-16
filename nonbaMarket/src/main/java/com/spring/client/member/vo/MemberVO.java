package com.spring.client.member.vo;


import lombok.Data;

@Data
public class MemberVO{
	private int m_num			=0;	//멤버고유번호
	private String m_id			="";//멤버 아이디
	private String m_pwd		="";//멤버 패스워드
	private String m_name		="";//멤버 이름
	private String m_email		="";//멤버 이메일
	private String m_phone		="";//멤버 휴대전화번호
	private String m_home		="";//멤버 집번호
	private String m_address	="";//멤버 주소
	private String m_gender		="";//멤버 성별
	private String m_birth		="";//멤버 생년월일
	private String m_emailsend	="";//멤버 이메일전송여부
	private String m_smssend	="";//멤버 SMS전송여부
	private int m_point			=0; //멤버 포인트
	private String m_regdate	="";//멤버 등록일자
	private String m_update		="";//멤버 수정일자
	private int g_num			=0;	//등급 고유번호
	private String m_withdraw	="";//멤버 탈퇴날짜

	//추가정보
	private float g_percent		=0;	//회원등급의 적립률
	private int coupon_cnt		=0;	//회원이 가진 쿠폰갯수
	private int review_cnt		=0;	//회원이 작성한 후기갯수
	private int bae_cnt			=0;	//회원의 상품 배송중 갯수
	private String g_name		="";//회원의 등급명
}
