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

import service.GameService;
import service.ReviewService;
import vo.GameVO;
import vo.ReviewVO;


@Controller
public class GameController {
	@Autowired
	GameService gservice;
	@Autowired
	ReviewService rservice;


	//게임 정보 출력
	@RequestMapping(value = "/gameinfo")
	public ModelAndView gameinfo(HttpServletRequest request, ModelAndView mv, 
			GameVO gvo, ReviewVO rvo) {	
		List<ReviewVO> rlist = rservice.rInfoList(rvo);
		gvo=gservice.gameInfo(gvo);
		if(gvo !=null) {
			request.setAttribute("game",gvo);
			
			if(rlist !=null) {
				request.setAttribute("reviews",rlist);
			}else {
				mv.addObject("message", "리뷰가 없습니다. 첫 리뷰를 작성해 주세요!");
			}mv.setViewName("game/gameInfo");
		}else {
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

		if (gservice.gameinsert(vo) > 0) {
			mv.addObject("message", "게임이 추가되었습니다.");
			mv.setViewName("redirect:gamelist");
		}else {
			mv.addObject("message", "게임 추가중 오류가 발생했습니다.");
			mv.setViewName("game/gameInsertForm");
		}
		return mv;
	} //gameinsert

	//게임 리스트 출력
	@RequestMapping(value = "/gamelist")
	public ModelAndView gamelist(ModelAndView mv) {

		List<GameVO> list = gservice.gameList();
		if (list != null) {
			mv.addObject("games", list);
		}else {
			mv.addObject("message", "~~ 출력할 자료가 한건도 없습니다 ~~") ;
		}
		mv.setViewName("game/gameList");
		return mv;
	} //gamelist

}//class
