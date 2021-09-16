package com.ncs.green;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
				mv.setViewName("member/deleteForm");
			}else {
				rttr.addFlashAttribute("message", "회원탈퇴 오류 다시 시도해보세요");
				mv.setViewName("redirect/home");
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

	@RequestMapping(value = "/findpasswordf")
	public ModelAndView findpasswordf(ModelAndView mv) {
		mv.setViewName("member/findpassword");
		return mv;
	}

	@RequestMapping(value = "/findpassword")
	public ModelAndView findpassword(ModelAndView mv, MemberVO vo) {
		vo =service.selectOne(vo);

		if(vo == null) {
			mv.addObject("loginID", "F");
		}else {
			mv.addObject("loginID", "T");
			mv.addObject("updateid", vo.getId());
		}
		mv.setViewName("member/findpassword");
		return mv;
	}

	@RequestMapping(value = "/findidf")
	public ModelAndView findidf(ModelAndView mv) {
		mv.setViewName("member/findid");
		return mv;
	}
//
//	@RequestMapping(value = "/findid")
//	public ModelAndView findid(ModelAndView mv, MemberVO vo) {
//		List <MemberVO> list = service.findid(vo);
//
//		if(list != null) {
//			mv.addObject("findID",list);
//		}else {
//			mv.addObject("findID", "T");
//			mv.addObject("message","가입된 아이디가 없습니다");
//		}
//		mv.setViewName("member/findidForm");
//		return mv;
//	}
	
	@RequestMapping(value = "/findid")
	public ModelAndView findid(ModelAndView mv, MemberVO vo) {
		mv.addObject("newID", vo.getId());
		if (service.selectOne(vo) != null) {
			  mv.addObject("idUse", "F"); // 사용불가
		}else mv.addObject("idUse", "T"); // 사용가능
		mv.setViewName("member/findid");
		return mv;
	} //idCheck

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
	
	// ** Json Login
	@RequestMapping(value = "/jslogin")
	public ModelAndView jslogin(HttpServletRequest request, HttpServletResponse response, ModelAndView mv, MemberVO vo) {
		
		//jsonView 사용시 response의 한글처리
		response.setContentType("text/html; charset=UTF-8");
		
		String password = vo.getPassword();
		vo = service.selectOne(vo);
		if (vo != null) {
			if (vo.getPassword().equals(password)) {
				// 로그인 성공 : 로그인정보 session에 보관,  home으로
				mv.addObject("loginSuccess", "T");
				request.getSession().setAttribute("loginID",vo.getId());
				request.getSession().setAttribute("loginName",vo.getName());
				mv.setViewName("redirect:home");
			}else {
				// password 오류 : message , 재로그인 유도 (loginForm 으로)
				mv.addObject("loginSuccess", "F");
				mv.addObject("message"," password 오류 !! 다시 하세요 ~~");
				mv.setViewName("member/loginForm");
			}
		}else {
			// ID 오류
			mv.addObject("loginSuccess", "F");
			mv.addObject("message"," ID 오류 !! 다시 하세요 ~~");
		}
		mv.setViewName("jsonView");
		return mv;
	} //jslogin
	

	// ** ID 중복확인

	@RequestMapping(value = "/idcheck")
	public ModelAndView idcheck(ModelAndView mv, MemberVO vo) {
		if (service.selectOne(vo) != null) {
			mv.addObject("idUse", "F"); // 사용불가
		}else mv.addObject("idUse", "T"); // 사용가능
		mv.setViewName("jsonView");
		return mv;
	} //idCheck
	
	
//	// ** nick 중복확인
//	@RequestMapping(value = "/nickCheck")
//	public ModelAndView nickCheck(ModelAndView mv, MemberVO vo) {
//		if (service.selectOne(vo) != null) {
//			mv.addObject("nickuse", "F"); // 사용불가
//		}else mv.addObject("nickuse", "T"); // 사용가능
//		mv.setViewName("jsonView");
//		return mv;
//	} 

	@RequestMapping(value = "/joinf")
	public ModelAndView joinf(ModelAndView mv ,MemberVO vo) {
		mv.setViewName("member/joinForm");
		return mv;
	}

	@RequestMapping(value = "/join")
	public ModelAndView join(ModelAndView mv, MemberVO vo, HttpServletRequest request) throws IOException{
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
