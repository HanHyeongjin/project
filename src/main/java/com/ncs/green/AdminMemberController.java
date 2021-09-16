package com.ncs.green;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import service.AdminMemberService;
import vo.AdminMemberVO;

@Controller
public class AdminMemberController {

	@Autowired
	AdminMemberService service;

	// ** Update
	@RequestMapping(value = "/admupdate")
	public ModelAndView admupdate(HttpServletRequest request, ModelAndView mv, 
			AdminMemberVO vo, RedirectAttributes rttr) throws IOException {

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

	@RequestMapping(value = "/admyinfo")
	public ModelAndView admyinfo(HttpServletRequest request, ModelAndView mv, AdminMemberVO vo) {

		HttpSession session = request.getSession(false);
		if (session!=null && session.getAttribute("loginID") !=null) {
			vo.setId((String)session.getAttribute("loginID"));

			if  (request.getParameter("id")!=null) vo.setId(request.getParameter("id"));

			vo=service.selectOne(vo);
			if (vo!=null) {
				// updateForm 요청인지 확인 
				if ("U".equals(request.getParameter("jcode"))) { 
					mv.setViewName("admember/adupdateForm");
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
				mv.setViewName("admember/adloginForm");
			}
		}else {
			// 로그인 정보 없음
			mv.addObject("message","로그인 정보 없습니다, 로그인 후 이용하세요 ~~");
			mv.setViewName("admember/adloginForm");
		}
		return mv;
	} //mdetail

	@RequestMapping(value = "/admdelete")
	public ModelAndView admdelete(HttpServletRequest request, ModelAndView mv, AdminMemberVO vo,
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
			mv.setViewName("admember/adloginForm");
		}
		return mv;
	}//delete


	@RequestMapping(value = "/adlogout")
	public ModelAndView adlogout(HttpServletRequest request, ModelAndView mv,
			RedirectAttributes rttr) {

		HttpSession session = request.getSession(false);
		if(session !=null) {
			session.invalidate();
		}
		rttr.addFlashAttribute("message","로그아웃");
		mv.setViewName("redirect:home");
		return mv;
	}

	@RequestMapping(value = "/adfindpasswordf")
	public ModelAndView adfindpasswordf(ModelAndView mv) {
		mv.setViewName("admember/adfindpassword");
		return mv;
	}

	@RequestMapping(value = "/adindpassword")
	public ModelAndView adfindpassword(ModelAndView mv, AdminMemberVO vo) {
		vo =service.selectOne(vo);

		if(vo == null) {
			mv.addObject("loginID", "F");
		}else {
			mv.addObject("loginID", "T");
			mv.addObject("updateid", vo.getId());
		}
		mv.setViewName("admember/adfindpassword");
		return mv;
	}

	@RequestMapping(value = "/adfindidf")
	public ModelAndView adfindidf(ModelAndView mv) {
		mv.setViewName("admember/adfindid");
		return mv;
	}

	@RequestMapping(value = "/adfindid")
	public ModelAndView adfindid(ModelAndView mv, AdminMemberVO vo) {
		List <AdminMemberVO> list = service.findid(vo);

		if(list != null) {
			mv.addObject("findID",list);
		}else {
			mv.addObject("findID", "T");
			mv.addObject("message","가입된 아이디가 없습니다");
		}
		mv.setViewName("admember/adfindidForm");
		return mv;
	}

	@RequestMapping(value = "/adloginf")
	public ModelAndView adloginf(ModelAndView mv) {
		mv.setViewName("adminmember/adloginForm");
		return mv;
	}

	@RequestMapping(value = "/adlogin")
	public ModelAndView adlogin(HttpServletRequest request, ModelAndView mv, AdminMemberVO vo) {
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
				mv.setViewName("adminmember/adloginForm");
			}

		}else{
			//id오류
			mv.addObject("message","비밀번호 또는 ID가 틀렸습니다");
			mv.setViewName("adminmember/adloginForm");
		}
		return mv;
	}//login

	// ** ID 중복확인

	@RequestMapping(value = "/adidcheck")
	public ModelAndView adidcheck(ModelAndView mv, AdminMemberVO vo) {
		if (service.selectOne(vo) != null) {
			mv.addObject("idUse", "F"); // 사용불가
		}else mv.addObject("idUse", "T"); // 사용가능
		mv.setViewName("jsonView");
		return mv;
	} //idCheck
	
	
	// ** nick 중복확인
	@RequestMapping(value = "/adnickCheck")
	public ModelAndView adnickCheck(ModelAndView mv, AdminMemberVO vo) {
		if (service.selectOne(vo) != null) {
			mv.addObject("nickuse", "F"); // 사용불가
		}else mv.addObject("nickuse", "T"); // 사용가능
		mv.setViewName("jsonView");
		return mv;
	} 

	@RequestMapping(value = "/adjoinf")
	public ModelAndView adjoinf(ModelAndView mv ,AdminMemberVO vo) {
		mv.setViewName("adminmember/adjoinForm");
		return mv;
	}

	@RequestMapping(value = "/adjoin")
	public ModelAndView adjoin(ModelAndView mv, AdminMemberVO vo, HttpServletRequest request) throws IOException{
		if(service.insert(vo) > 0) {
			//성공
			mv.setViewName("adminmember/adloginForm");
		}else {
			//실패
			mv.addObject("message","회원가입이 실패했습니다");
			mv.setViewName("adminmember/adjoinForm");
		}
		return mv;
	}//join



}
