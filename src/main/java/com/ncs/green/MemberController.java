package com.ncs.green;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
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
	
	// ** Update
	@RequestMapping(value = "/mupdate")
	public ModelAndView mupdate(HttpServletRequest request, ModelAndView mv, 
						MemberVO vo, RedirectAttributes rttr) throws IOException {
				
		if (service.update(vo) > 0) {
			// Update 성공 -> mList
			rttr.addFlashAttribute("message", "정보 수정 성공");
			mv.setViewName("redirect:home");
		}else {
			// Update 실패 -> 재수정 할 수 있도록 유도
			rttr.addFlashAttribute("message", "정보수정 오류, 다시 하세요 ~~");
			mv.setViewName("redirect:mdetail?id="+vo.getId()+"&jcode=U");
		}
		return mv;
	} //mupdate
	
	@RequestMapping(value = "/myinfo")
	public ModelAndView myinfo(HttpServletRequest request, ModelAndView mv, MemberVO vo) {

		HttpSession session = request.getSession(false);
		if (session!=null && session.getAttribute("loginID") !=null) {
			vo.setId((String)session.getAttribute("loginID"));

			if  (request.getParameter("id")!=null) vo.setId(request.getParameter("id"));

			vo=service.selectOne(vo);
			if (vo!=null) {
				// updateForm 요청인지 확인 
				if ("U".equals(request.getParameter("jcode"))) { 
					mv.setViewName("member/updateForm");
					// ** PasswordEncoder 사용 때문에 
					//    session에 보관해 놓은 raw_password 를 수정할수 있도록 vo에 set 해줌.
					vo.setPassword((String)session.getAttribute("loginPW"));
				}else {
					mv.setViewName("member/memberDetail");
					vo.setPassword("*****"); // ~Detail.jsp 에서 표시하지 않아도 됨.
				}
				mv.addObject("Apple", vo);
			}else {
				mv.addObject("message","정보를 찾을 수 없습니다, 로그인 후 이용하세요 ~~");
				mv.setViewName("member/loginForm");
			}
		}else {
			// 로그인 정보 없음
			mv.addObject("message","로그인 정보 없습니다, 로그인 후 이용하세요 ~~");
			mv.setViewName("member/loginForm");
		}
		return mv;
	} //mdetail
	
	@RequestMapping(value = "/mdelete")
	public ModelAndView mdelete(HttpServletRequest request, ModelAndView mv, MemberVO vo,
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
		mv.addObject("message", "탈퇴 불가능 !!  로그인후 하세요 ~~");
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
		System.out.println("vo"+vo);
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
	
	// ** ID 중복확인
	@RequestMapping(value = "/idCheck")
	public ModelAndView idCheck(ModelAndView mv, MemberVO vo) {
			// => 전달된 ID 의 존재여부 확인
			// => notNull : 존재 -> 사용불가 
			// => Null : 없음 -> 사용가능
			// => 그러므로 전달된 ID 보관해야함
			mv.addObject("newID", vo.getId());
			if (service.selectOne(vo) != null) {
				  mv.addObject("idUse", "F"); // 사용불가
			}else mv.addObject("idUse", "T"); // 사용가능
			mv.setViewName("member/idDupCheck");
			return mv;
		} //idCheck
	
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
