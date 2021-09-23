package com.ncs.green;


import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import service.GameService;
import service.ReplService;
import service.ReviewService;
import service.RplikeService;
import vo.ReplVO;
import vo.ReviewVO;
import vo.RplikeVO;






@Controller
public class RplikeController {
	@Autowired
	ReplService rpservice;
	@Autowired
	ReviewService rservice;
	@Autowired
	GameService gservice;
	@Autowired
	RplikeService likeservice;
	
	@RequestMapping(value = "/insertrplike")
	public ModelAndView insertrplike(ModelAndView mv,  RplikeVO vo, HttpServletResponse response, HttpServletRequest request) {
		response.setContentType("text/html; charset=UTF-8");
		String loginID = (String)request.getSession().getAttribute("loginID");
		if(loginID != null) {
			vo.setId(loginID);
			likeservice.insertrplike(vo);			
			mv.setViewName("jsonView");
		}else {
			mv.addObject("message", "로그인 후 이용가능한 서비스 입니다.");
			mv.setViewName("member/loginForm");
		}
		return mv;
	} //댓글 좋아요 insert
	
	@RequestMapping(value = "/updaterplike")
	public ModelAndView updaterplike(ModelAndView mv,  RplikeVO vo, HttpServletResponse response, HttpServletRequest request) {
		response.setContentType("text/html; charset=UTF-8");
		String loginID = (String)request.getSession().getAttribute("loginID");
		if(loginID != null) {
			vo.setId(loginID);
			likeservice.updaterplike(vo);			
			mv.setViewName("jsonView");
		}else {
			mv.addObject("message", "로그인 후 이용가능한 서비스 입니다.");
			mv.setViewName("member/loginForm");
		}
		return mv;
	} //댓글 좋아요 insert
	
	@RequestMapping(value = "/deleterplike")
	public ModelAndView deleterplike(ModelAndView mv,  RplikeVO vo, HttpServletResponse response, HttpServletRequest request) {
		response.setContentType("text/html; charset=UTF-8");
		String loginID = (String)request.getSession().getAttribute("loginID");
		if(loginID != null) {
			vo.setId(loginID);
			likeservice.deleterplike(vo);			
			mv.setViewName("jsonView");
		}else {
			mv.addObject("message", "로그인 후 이용가능한 서비스 입니다.");
			mv.setViewName("member/loginForm");
		}
		return mv;
	} //댓글 좋아요 delete

} // class
