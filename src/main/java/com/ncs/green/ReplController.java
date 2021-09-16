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

import vo.ReplVO;
import vo.ReviewVO;






@Controller
public class ReplController {
	@Autowired
	ReplService rpservice;
	@Autowired
	ReviewService rservice;
	@Autowired
	GameService gservice;

	
	
	@RequestMapping(value = "/rreplist")
	public ModelAndView rreplist(ModelAndView mv, ReplVO rpvo, HttpServletResponse response, HttpServletRequest request) {
		List<ReplVO> list= rpservice.rreplList(rpvo);
		if(list != null && list.size() != 0) {
			mv.addObject("rrepls", list);
			mv.setViewName("repl/rreplList");
		}
		
		return mv;
	} //rinsert
	
	@RequestMapping(value = "/repllist")
	public ModelAndView rrepllist(ModelAndView mv,ReplVO rpvo, ReviewVO rvo, HttpServletResponse response, HttpServletRequest request) {
		List<ReplVO> rlist= rpservice.rreplList(rpvo);
		if(rlist != null && rlist.size() != 0) {
			mv.addObject("rrepls", rlist);
		}
		List<ReplVO> rplist= rpservice.rreplList(rpvo);
		if(rplist != null && rplist.size() != 0) {
			mv.addObject("rrepls", rplist);
		}
		List<ReplVO> list= rpservice.replList(rvo);
		if(list != null && list.size() != 0) {
			mv.addObject("repls", list);
			
			mv.setViewName("repl/replList");
		}else {
			mv.addObject("message", "아직 댓글이 없습니다. 첫 댓글을 작성해 주세요.");
		}
		
		return mv;
	} //rinsert
	
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
				List<ReplVO> list = rpservice.rreplList(rpvo);
				mv.addObject("rrepls", list);
				mv.addObject("rpinmessage", "댓글이 등록되었습니다.");
				mv.addObject("rreplin", "T");
				mv.setViewName("repl/rreplList");
			}else {
				mv.addObject("rpinmessage", "댓글이 등록에 실패했습니다.");
			}
		}else {
			mv.addObject("message", "로그인 후 이용가능한 서비스 입니다.");
			
		}
		return mv;
	} //rinsert
	

} // class
