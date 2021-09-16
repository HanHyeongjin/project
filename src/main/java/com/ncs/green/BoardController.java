package com.ncs.green;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import criTest.PageMaker;
import criTest.SearchCriteria;
import service.BoardService;
import vo.BoardVO;





@Controller
public class BoardController {

	@Autowired
	BoardService service;
	// ** Board CriPageList
	@RequestMapping(value = "/blist")
	// ** ver01 
	//public ModelAndView bcplist(ModelAndView mv, Criteria cri, PageMaker pageMaker) {
	// ** ver02
	public ModelAndView bcplist(ModelAndView mv, SearchCriteria cri, PageMaker pageMaker) {
		// 1) Criteria 처리
		// => setCurrPage, setRowsPerPage 는 Parameter 로 전달되어,
		//    setCurrPage(..) , setRowsPerPage(..) 는 자동처리됨(스프링에 의해)
		//    -> cri.setCurrPage(Integer.parseInt(request.getParameter("currPage")))
		// => 그러므로 currPage 이용해서 sno, eno 계산만 하면됨
		cri.setSnoEno();
		
		// 2) 서비스 처리
		// ** ver01
		//mv.addObject("Banana",service.criPList(cri));
		// ** ver02 : searchType, keyword 에 따른 조건검색
		// => service 에 메서드 추가 searchList(cri) , searchRowsCount() 
		mv.addObject("Banana",service.searchList(cri));
		
		// 3) PageMaker 처리
		pageMaker.setCri(cri);
		// ** ver01
		//pageMaker.setTotalRowCount(service.totalRowsCount());
		// ** ver02
		pageMaker.setTotalRowCount(service.searchRowsCount(cri));
		
		System.out.println("*** pageMaker => "+pageMaker);
		mv.addObject("pageMaker",pageMaker);
		mv.setViewName("board/boardList");
		return mv;
	} //blist 
	
	
		
	@RequestMapping(value = "/bdetail")
	public ModelAndView bdetail(HttpServletRequest request, ModelAndView mv, 
			BoardVO vo, RedirectAttributes rttr) {
		// ** Detail 처리 조건
		// => 로그인 했을때만 글내용을 볼 수 있도록 ( boardList.jsp 에서 처리 ) 
		// => 조회수 증가 
		//    글쓴이(Parameter 로 전달) 와 글보는이(loginID) 가 달라야 함.

		HttpSession session = request.getSession(false);
		if (session != null && session.getAttribute("loginID") != null) {
			String loginID = (String)session.getAttribute("loginID");
			// 글쓴이(Parameter 로 전달) 와 글보는이(loginID) 가 다른경우에만 조회수 증가
			if (!loginID.equals(vo.getId())) {
				service.countUp(vo) ;
			} 
			// 글내용 조회
			vo = service.selectOne(vo);
			if (vo != null) {
				request.setAttribute("Apple", vo);
				// 글 수정 하기의 경우 
				if ("U".equals(request.getParameter("jcode"))) {
					mv.setViewName("board/bupdateForm");
				}else mv.setViewName("board/boardDetail");  
			}else {
				rttr.addFlashAttribute("message", "글번호에 해당하는 글을 찾을 수 없습니다");
				mv.setViewName("redirect:blist"); 
			}
		}else {
			mv.addObject("message", "로그인 후 이용하세요");
			mv.setViewName("member/loginForm"); 
		}
		return mv;
	} //bdetail
	
	@RequestMapping(value = "/binsert")
	public ModelAndView binsert(ModelAndView mv, BoardVO vo, RedirectAttributes rttr) {

		if ( service.insert(vo) > 0) {
			rttr.addFlashAttribute("message", "새글 등록");
			mv.setViewName("redirect:blist"); 
		}else {
			mv.addObject("message", "새글 등록 실패");
			mv.setViewName("board/binsertForm");
		}
		return mv;
	} //binsert	
	
	// ** 새글등록
		@RequestMapping(value = "/binsertf")
		public ModelAndView binsertf(ModelAndView mv) {
			mv.setViewName("board/binsertForm");
			return mv;
		} //binsertf
		
		@RequestMapping(value = "/bupdate")
		public ModelAndView bupdate(ModelAndView mv, BoardVO vo, RedirectAttributes rttr) {
			if (service.update(vo) > 0) {
				rttr.addFlashAttribute("message", "글수정 성공");
				mv.setViewName("redirect:blist");
			}else {
				rttr.addFlashAttribute("message", "글수정 실패 다시 하세요");
				mv.setViewName("redirect:bdetail?seq="+vo.getSeq()+"&jcode=U");
			}
			return mv;
		} //bupdate	
		
		@RequestMapping(value = "/bdelete")
		public ModelAndView bdelete(ModelAndView mv, BoardVO vo, RedirectAttributes rttr) {
			if (service.delete(vo) > 0) {
				rttr.addFlashAttribute("message", "글삭제 성공");
				mv.setViewName("redirect:blist");
			}else {
				rttr.addFlashAttribute("message", "글삭제 실패다시 하세요");
				mv.setViewName("redirect:bdetail?seq="+vo.getSeq());
			}
			return mv;
		}
} // class
