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

	
	@RequestMapping(value = "/rrpupdate")
	public ModelAndView rrpupdate(ModelAndView mv,  ReplVO rpvo, HttpServletResponse response, HttpServletRequest request) {
		response.setContentType("text/html; charset=UTF-8");
		String loginID = (String)request.getSession().getAttribute("loginID");
		
		if(loginID != null) {
			rpvo.setId(loginID);
			if(rpservice.rpupdate(rpvo)>0){
				List<ReplVO> list= rpservice.rreplList(rpvo);
				mv.addObject("rrepls", list);
				mv.setViewName("repl/rreplList");				
			}else {
				mv.addObject("rrpinmessage", "답글 수정에 실패했습니다.");
			}
		}else {
			mv.addObject("message", "로그인 후 이용가능한 서비스 입니다.");
			mv.setViewName("member/loginForm");
		}
		return mv;
	} //답글 수정
	
	@RequestMapping(value = "/rpdelete")
	public ModelAndView rpdelete(ModelAndView mv, ReplVO rpvo, HttpServletRequest request,HttpServletResponse response) {
		response.setContentType("text/html; charset=UTF-8");
		mv.addObject("loginID", request.getSession().getAttribute("loginID"));
		if(rpservice.rpdelete(rpvo)>0) {
			mv.addObject("message","댓글이 삭제되었습니다.");
		}else {
			mv.addObject("message","삭제중 오류가 발생했습니다.");
		}mv.setViewName("jsonView");
		
		return mv;
	} //rinsert
	@RequestMapping(value = "/rrpdelete")
	public ModelAndView rrpdelete(ModelAndView mv, ReplVO rpvo, HttpServletRequest request,HttpServletResponse response) {
		response.setContentType("text/html; charset=UTF-8");
		mv.addObject("loginID", request.getSession().getAttribute("loginID"));
		if(rpservice.rpdelete(rpvo)>0) {
			List<ReplVO> list= rpservice.rreplList(rpvo);
			mv.addObject("rrepls", list);
			mv.setViewName("repl/rreplList");	
		}		
		return mv;
	} //rinsert
	
	
	@RequestMapping(value = "/rpupdate")
	public ModelAndView rpupdate(ModelAndView mv, ReplVO rpvo, HttpServletRequest request,HttpServletResponse response) {
		response.setContentType("text/html; charset=UTF-8");
		mv.addObject("loginID", request.getSession().getAttribute("loginID"));
		if(rpservice.rpupdate(rpvo)>0) {
			mv.addObject("message","댓글이 수정되었습니다.");
		}else {
			mv.addObject("message","수정중 오류가 발생했습니다.");
		}mv.setViewName("jsonView");
		
		return mv;
	} //rinsert
	
	@RequestMapping(value = "/rreplist")
	public ModelAndView rrplist(ModelAndView mv, ReplVO rpvo, HttpServletRequest request) {
		mv.addObject("loginID", request.getSession().getAttribute("loginID"));
		String loginID = (String)request.getSession().getAttribute("loginID");
	    rpvo.setId(loginID);
		List<ReplVO> list= rpservice.rreplList(rpvo);
		if(list != null && list.size() != 0) {
			mv.addObject("rrepls", list);
			mv.setViewName("repl/rreplList");
		}
		
		return mv;
	} //rinsert

	
	 @RequestMapping(value = "/replpoplist") public ModelAndView
	 replpoplist(ModelAndView mv,ReplVO rpvo, ReviewVO rvo, HttpServletResponse
	 response, HttpServletRequest request) {
	 
			String loginID = (String)request.getSession().getAttribute("loginID");
			rvo.setId(loginID);
			List<ReplVO> list= rpservice.replpopList(rvo);
			if(list != null && list.size() != 0) {
				mv.addObject("repls", list);
				
				mv.setViewName("repl/replList");
			}else {
				mv.addObject("message", "아직 댓글이 없습니다. 첫 댓글을 작성해 주세요.");
			}
			
			return mv;
	 } //인기순
		
	@RequestMapping(value = "/replreclist")
	public ModelAndView replreclist(ModelAndView mv,ReplVO rpvo, ReviewVO rvo, HttpServletResponse response, HttpServletRequest request) {
		String loginID = (String)request.getSession().getAttribute("loginID");
		rvo.setId(loginID);
		List<ReplVO> list= rpservice.replrecList(rvo);
		if(list != null && list.size() != 0) {
			mv.addObject("repls", list);
			
			mv.setViewName("repl/replList");
		}else {
			mv.addObject("message", "아직 댓글이 없습니다. 첫 댓글을 작성해 주세요.");
		}
		
		return mv;
	} //최신순
	@RequestMapping(value = "/replmylist")
	public ModelAndView replmylist(ModelAndView mv,ReplVO rpvo, ReviewVO rvo, HttpServletResponse response, HttpServletRequest request) {
		String loginID = (String)request.getSession().getAttribute("loginID");
		rvo.setId(loginID);
		List<ReplVO> list= rpservice.replmyList(rvo);
		if(list != null && list.size() != 0) {
			mv.addObject("repls", list);
			
			mv.setViewName("repl/replList");
		}else {
			mv.addObject("message", "아직 댓글이 없습니다. 첫 댓글을 작성해 주세요.");
		}
		
		return mv;
	} //내가 쓴 글
	
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
	public ModelAndView rreplinsert(ModelAndView mv,  ReplVO rpvo, HttpServletResponse response, HttpServletRequest request) {
		response.setContentType("text/html; charset=UTF-8");
		String loginID = (String)request.getSession().getAttribute("loginID");
		
		if(loginID != null) {
			rpvo.setId(loginID);
			if(rpservice.rreplInsert(rpvo)>0){
				List<ReplVO> list= rpservice.rreplList(rpvo);
				mv.addObject("rrepls", list);
				mv.setViewName("repl/rreplList");				
			}else {
				mv.addObject("rrpinmessage", "답글 등록에 실패했습니다.");
			}
		}else {
			mv.addObject("message", "로그인 후 이용가능한 서비스 입니다.");
			mv.setViewName("member/loginForm");
		}
		return mv;
	} //rrinsert
	

} // class
