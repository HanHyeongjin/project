package service;

import java.util.List;

import vo.GameVO;

public interface GameService {
	
	public GameVO gameInfo(GameVO vo);
	
	public List<GameVO> gameList();	
	
	public int gameinsert(GameVO vo);
	
}//class
