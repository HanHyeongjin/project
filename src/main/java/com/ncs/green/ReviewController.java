package com.ncs.green;


import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import service.GameService;
import service.ReviewService;
import vo.GameVO;
import vo.ReviewVO;





@Controller
public class ReviewController {
	@Autowired
	GameService gservice;
	@Autowired
	ReviewService rservice;

	@RequestMapping(value = "/reviewdetail")
	public ModelAndView reviewdetail(ModelAndView mv, GameVO gvo,ReviewVO rvo) {		
		
		gvo = gservice.gameInfo(gvo);
		rvo = rservice.reviewDetail(rvo);
		
		if(rvo != null) {			
			mv.addObject("game", gvo);
			mv.addObject("review",rvo);
			mv.setViewName("review/reviewDetail");
		}else {
			mv.addObject("message", "해당하는 게시물을 찾을 수 없습니다.");
			mv.setViewName("redirect:gameinfo");
		}
		return mv;
	} //reviewdetail


	@RequestMapping(value = "/reviewinsertf")
	public ModelAndView reviewinsertf(ModelAndView mv, GameVO vo, HttpServletRequest request) {
		String loginID = (String)request.getSession().getAttribute("loginID");


		if(loginID != null) {
			vo = gservice.gameInfo(vo);
			mv.addObject("game", vo);
			mv.setViewName("review/reviewInsert");
		}else {
			mv.addObject("message", "로그인 후 이용가능한 서비스 입니다.");
			mv.setViewName("member/loginForm");
		}

		return mv;
	} //rinsertf

	@RequestMapping(value = "/reviewinsert")
	public ModelAndView reviewinsert(ModelAndView mv, GameVO gvo, ReviewVO rvo, HttpServletRequest request) {
		String loginID = (String)request.getSession().getAttribute("loginID");
		if(loginID != null) {
			rvo.setId(loginID);
			if(rservice.reviewInsert(rvo)>0){
				mv.setViewName("redirect:home");
			}
		}else {
			mv.addObject("message", "로그인 후 이용가능한 서비스 입니다.");
			mv.setViewName("member/loginForm");
		}
		return mv;
	} //rinsert


} // class
