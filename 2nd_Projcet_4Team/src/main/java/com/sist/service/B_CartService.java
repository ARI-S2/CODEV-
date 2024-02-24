package com.sist.service;

import java.util.List;

import com.sist.vo.B_CartVO;

public interface B_CartService {

	public List<B_CartVO> findCartItemsByUserId(String userId);
	public void updateCartItem(B_CartVO vo);
	public void insertCartItem(B_CartVO vo);
	public void deleteCartItem(int rno);
	public void payCartItem(B_CartVO vo);
	public B_CartVO pay_ok(int rno);
}
