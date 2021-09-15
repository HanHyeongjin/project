package com.ncs.green;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import service.GameService;
import service.ReplService;
import service.ReviewService;

import vo.ReplVO;






@Controller
public class ReplController {
	@Autowired
	ReplService rpservice;
	@Autowired
	ReviewService rservice;
	@Autowired
	GameService gservice;

	

	@RequestMapping(value = "/replinsert")
	public ModelAndView reviewinsert(ModelAndView mv, ReplVO rpvo, HttpServletResponse response, HttpServletRequest request) {
		response.setContentType("text/html; charset=UTF-8");
		String loginID = (String)request.getSession().getAttribute("loginID");
		if(loginID != null) {
			
			
			rpvo.setId(loginID);
			
			if(rpservice.replInsert(rpvo)>0){
				
				mv.addObject("rpinmessage", "댓글이 등록되었습니다.");
				mv.addObject("replin", "T");
			}else {
				mv.addObject("rpinmessage", "댓글이 등록에 실패했습니다.");
			}mv.setViewName("jsonView");
		}else {
			mv.addObject("message", "로그인 후 이용가능한 서비스 입니다.");
			mv.setViewName("member/loginForm");
		}
		return mv;
	} //rinsert

	@RequestMapping(value = "/rreplinsert")
	public ModelAndView rreviewinsert(ModelAndView mv,  ReplVO rpvo, HttpServletResponse response, HttpServletRequest request) {
		response.setContentType("text/html; charset=UTF-8");
		String loginID = (String)request.getSession().getAttribute("loginID");
		if(loginID != null) {
			rpvo.setId(loginID);
			System.out.println(rpvo);
			if(rpservice.rreplInsert(rpvo)>0){
				mv.addObject("rpinmessage", "댓글이 등록되었습니다.");
				mv.addObject("replins", "T");
			}else {
				mv.addObject("rpinmessage", "댓글이 등록에 실패했습니다.");
			}mv.setViewName("jsonView");
		}else {
			mv.addObject("message", "로그인 후 이용가능한 서비스 입니다.");
			mv.setViewName("member/loginForm");
		}
		return mv;
	} //rinsert
	

} // class
