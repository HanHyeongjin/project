package com.ncs.green;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import service.MemberService;
import vo.MemberVO;

@Controller
public class MemberController {
	
	@Autowired
	MemberService service;
	
	
	@RequestMapping(value = "/loginf")
	public ModelAndView loginf(ModelAndView mv) {
		mv.setViewName("member/loginForm");
		return mv;
	}
	
	@RequestMapping(value = "/login")
	public ModelAndView login(HttpServletRequest request, ModelAndView mv, MemberVO vo) {
		String password =vo.getPassword();
		vo = service.selectOne(vo);
		
		 HttpSession session = request.getSession();
		 if(vo != null) {
			 if(vo.getPassword().equals(password)) {
				 session.setAttribute("loginID", vo.getId());
				 session.setAttribute("loginName", vo.getName());
				 mv.setViewName("redirect:home");
		 }else {
			 // 비밀번호 오류
			 mv.addObject("message","비밀번호 또는 ID가 틀렸습니다");
			 mv.setViewName("member/loginForm");
		 }
		
	 }else{
		 //id오류
		 mv.addObject("message","비밀번호 또는 ID가 틀렸습니다");
		 mv.setViewName("member/loginForm");
	 }
		return mv;
	}//login
	
	@RequestMapping(value = "/joinf")
	public ModelAndView joinf(ModelAndView mv) {
		mv.setViewName("member/joinForm");
		return mv;
	}
	
	@RequestMapping(value = "/join")
	public ModelAndView join(ModelAndView mv, MemberVO vo, HttpServletRequest request) throws IOException{
		System.out.println("***vo"+vo);
		if(service.insert(vo) > 0) {
			//성공
		   mv.setViewName("member/loginForm");
		}else {
			//실패
		    mv.addObject("message","회원가입이 실패했습니다");
			mv.setViewName("member/joinForm");
		}
		return mv;
	}//join
	
	

}
