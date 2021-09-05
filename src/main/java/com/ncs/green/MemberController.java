package com.ncs.green;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import service.MemberService;
import vo.MemberVO;

@Controller
public class MemberController {
	
	@Autowired
	MemberService service;
	
	@RequestMapping(value = "/delete")
	public ModelAndView delete(HttpServletRequest request, ModelAndView mv, MemberVO vo,
			RedirectAttributes rttr) {
		HttpSession session = request.getSession(false);
		String loginID =(String)session.getAttribute("loginID");
		if(loginID !=null && session != null) {
			vo.setId(loginID);
			vo= service.selectOne(vo);
		
		if(service.delete(vo) >0) {
			session.invalidate();
			rttr.addFlashAttribute("message", "회원탈퇴 되었습니다!");
			mv.setViewName("redirect:home");
		}else {
			rttr.addFlashAttribute("message", "회원탈퇴 오류 다시 시도해보세요");
			mv.setViewName("");
		}
	}else {
		// 탈퇴 불가능 => message, loginForm.jsp 
		mv.addObject("message", "~~ 탈퇴 불가능 !!  로그인후 하세요 ~~");
		mv.setViewName("member/loginForm");
	}
		return mv;
	}//delete
		
	
	@RequestMapping(value = "/logout")
	public ModelAndView logout(HttpServletRequest request, ModelAndView mv,
			RedirectAttributes rttr) {
		HttpSession session = request.getSession(false);
		if(session !=null) {
			session.invalidate();
		}
		rttr.addFlashAttribute("message","로그아웃");
		mv.setViewName("redirect:home");
		return mv;
	}
	
	@RequestMapping(value = "/findpassword")
	public ModelAndView findpassword(ModelAndView mv) {
		mv.setViewName("member/findpassword");
		return mv;
	}
	
	
	@RequestMapping(value = "/findid")
	public ModelAndView findid(ModelAndView mv) {
		mv.setViewName("member/findid");
		return mv;
	}
	
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
				 request.getSession().setAttribute("loginID", vo.getId());
				 request.getSession().setAttribute("loginName", vo.getName());
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
	public ModelAndView join(ModelAndView mv, MemberVO vo) {
		if(service.insert(vo) > 0) {
			//성공
		   mv.addObject("message","회원가입이 완료 되었습니다");
		   mv.setViewName("member/loginForm");
		}else {
			//실패
		    mv.addObject("message","회원가입이 실패했습니다");
			mv.setViewName("member/joinForm");
		}
		return mv;
	}//join
	
	

}
