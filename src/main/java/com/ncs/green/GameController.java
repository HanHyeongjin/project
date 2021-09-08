package com.ncs.green;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import service.GameService;
import vo.GameVO;


@Controller
public class GameController {
	@Autowired
	GameService service;
	
	
	
	//게임 정보 출력
	@RequestMapping(value = "/gameinfo")
	public ModelAndView gameinfo(HttpServletRequest request, ModelAndView mv, 
	GameVO vo, RedirectAttributes rttr) {		
		vo=service.gameInfo(vo);
		if(vo !=null) {
			request.setAttribute("game",vo);
			mv.setViewName("game/gameInfo");
		}else {
			rttr.addFlashAttribute("message", "해당하는 게시물을 찾을 수 없습니다 ~~");
			mv.setViewName("redirect:gamelist"); 
		}
		return mv;
	}
	
	
	//게임 추가 화면
	@RequestMapping(value = "/gameinsertf")
	public ModelAndView gameinsertf(ModelAndView mv) {
		mv.setViewName("game/gameInsertForm");
		return mv;
	} //gameinsertf
	
	//게임 추가
	@RequestMapping(value = "/gameinsert")
	   public ModelAndView gameinsert(HttpServletRequest request, ModelAndView mv, GameVO vo)throws IOException {
	  
	      String realPath = request.getRealPath("/"); //deprecated Method

	      if(realPath.contains("eclipse"))
	    	  realPath =  "D:\\MTest\\MyWork\\gamep\\src\\main\\webapp\\resources\\gameImage\\";
	      else realPath += "resources\\gameImage\\"; 
	      

	      File f1 = new File(realPath);
	      if (!f1.exists()) f1.mkdir();

	      
	      // 기본 Image 지정
	      String file1, file2 = "resources/gameImage/basicman1.jpg";
	         

	      MultipartFile imgf = vo.getImgf();
	      if (imgf != null && !imgf.isEmpty()) {
	         //Image를 선택했음
	         file1 = realPath + imgf.getOriginalFilename(); // 전송된 파일명 추출
	         imgf.transferTo(new File(file1)); // real 위치에 Image 붙여넣기
	         file2 = "resources/uploadImage/" + imgf.getOriginalFilename();// Table 저장 경로
	      }
	      vo.setImg(file2); // Table 저장 경로 set
	     
	      System.out.println("game VO =>"+vo);
	      if (service.gameinsert(vo) > 0) {
	         // Join 성공 -> 로그인 유도
	         mv.addObject("message", "게임이 추가되었습니다.");
	         mv.setViewName("redirect:gamelist");
	      }else {
	         // Join 실패 -> 재가입 유도
	         mv.addObject("message", "게임 추가중 오류가 발생했습니다.");
	         mv.setViewName("game/gameInsertForm");
	      }
	      return mv;
	   } //gameinsert
	 
	//게임 리스트 출력
	@RequestMapping(value = "/gamelist")
	public ModelAndView gamelist(ModelAndView mv) {

		List<GameVO> list = service.gameList();
		if (list != null) {
			mv.addObject("games", list);
		}else {
			mv.addObject("message", "~~ 출력할 자료가 한건도 없습니다 ~~") ;
		}
		mv.setViewName("game/gameList");
		return mv;
	} //gamelist
	
}//class
