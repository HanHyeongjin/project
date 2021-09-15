package com.ncs.green;


import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import service.GameService;
import service.ReplService;
import service.ReviewService;
import vo.GameVO;
import vo.ReplVO;
import vo.ReviewVO;





@Controller
public class ReviewController {
	@Autowired
	GameService gservice;
	@Autowired
	ReviewService rservice;
	@Autowired
	ReplService rpservice;

	@RequestMapping(value = "/reviewdetail")
	public ModelAndView reviewdetail(ModelAndView mv, GameVO gvo,ReviewVO rvo,HttpServletRequest request) {		
		String loginID = (String)request.getSession().getAttribute("loginID");
		if(loginID !=null) {
			mv.addObject("loginID", loginID);


			gvo = gservice.gameInfo(gvo);
			rvo = rservice.reviewDetail(rvo);
			List<ReplVO> list = rpservice.replList(rvo);
			if(list != null && list.size() !=0) {
				mv.addObject("repls", list);
			}else {
				mv.addObject("rpmessage", "작성된 댓글이 없습니다. 첫 댓글을 작성해 주세요");
			}
			
			if(rvo != null) {			
				mv.addObject("game", gvo);
				mv.addObject("review",rvo);
				mv.setViewName("review/reviewDetail");
			}else {
				mv.addObject("message", "해당하는 게시물을 찾을 수 없습니다.");
				mv.setViewName("redirect:gameinfo");
			}
		}else {
			mv.setViewName("member/loginForm");
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
				gservice.gameGradePlus(rvo);
				mv.setViewName("redirect:home");
			}
		}else {
			mv.addObject("message", "로그인 후 이용가능한 서비스 입니다.");
			mv.setViewName("member/loginForm");
		}
		return mv;
	} //rinsert


} // class
