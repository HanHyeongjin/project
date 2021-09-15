package service;

import java.util.List;

import vo.GameVO;
import vo.ReviewVO;

public interface GameService {
	
	public GameVO gameInfo(GameVO vo);
	
	public List<GameVO> gameList();	
	
	public int gameinsert(GameVO vo);
	
	public int gameGradePlus(ReviewVO vo);
	
}//class
