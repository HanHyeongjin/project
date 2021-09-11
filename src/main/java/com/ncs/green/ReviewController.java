package com.ncs.green;


import java.lang.ProcessBuilder.Redirect;

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
	
		@RequestMapping(value = "/reviewinsertf")
		public ModelAndView reviewinsertf(ModelAndView mv, GameVO vo) {
			vo = gservice.gameInfo(vo);
			mv.addObject("game", vo);
			mv.setViewName("review/reviewInsert");
			return mv;
		} //rinsertf
		
		@RequestMapping(value = "/reviewinsert")
		public ModelAndView reviewinsert(ModelAndView mv, GameVO gvo, ReviewVO rvo, HttpServletRequest request) {
			rvo.setId((String)request.getSession().getAttribute("loginID"));
			
		
			if(rservice.reviewInsert(rvo)>0){
				mv.setViewName("redirect:home");
			}
			return mv;
		} //rinsertf
		
		
} // class
