package com.ncs.green;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
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
	@Autowired
	PasswordEncoder passwordEncoder;

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
					vo.setPassword("*******"); 
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
	
	@RequestMapping(value = "/findid")
	public ModelAndView findid(ModelAndView mv, MemberVO vo) throws Exception{
		List<MemberVO> memlist = service.findid(vo);
		
		if(memlist != null && memlist.size() !=0) {
			mv.addObject("findid", memlist);
			mv.setViewName("member/idfind");
		}else {
					
		}
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
		String diest1 = passwordEncoder.encode(password) ;
		System.out.println("digest1 => "+diest1);
		System.out.println("** matches1 => "+passwordEncoder.matches(password, diest1));

		HttpSession session = request.getSession();
		if(vo != null) {
			//if(vo.getPassword().equals(password)) {
			// ** BCryptPasswordEncoder 적용
			// => passwordEncoder.matches(rawData, digest) -> (입력값, DB에보관된값_digest)
			if (passwordEncoder.matches(password, vo.getPassword())) { 	
				session.setAttribute("loginID", vo.getId());
				session.setAttribute("loginName", vo.getName());
				session.setAttribute("loginPW",password);
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

	@RequestMapping(value = "/idcheck")
	public ModelAndView idcheck(ModelAndView mv, MemberVO vo) {
		if (service.selectOne(vo) != null) {
			mv.addObject("idUse", "F"); // 사용불가
		}else mv.addObject("idUse", "T"); // 사용가능
		mv.setViewName("jsonView");
		return mv;
	} //idCheck
	
	
	// ** nick 중복확인
	@RequestMapping(value = "/nickCheck")
	public ModelAndView nickCheck(ModelAndView mv, MemberVO vo) {
		if (service.selectNick(vo) != null) {
			mv.addObject("nickuse", "F"); // 사용불가
		}else mv.addObject("nickuse", "T"); // 사용가능
		mv.setViewName("jsonView");
		return mv;
	} 

	@RequestMapping(value = "/joinf")
	public ModelAndView joinf(ModelAndView mv ,MemberVO vo) {
		mv.setViewName("member/joinForm");
		return mv;
	}

	@RequestMapping(value = "/join")
	public ModelAndView join(ModelAndView mv, MemberVO vo, HttpServletRequest request) throws IOException{
		
		// ** Password 암호화
		// => BCryptPasswordEncoder 적용
		//    encode(rawData) -> digest 생성 & vo 에 set  
		vo.setPassword(passwordEncoder.encode(vo.getPassword()));
		
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
