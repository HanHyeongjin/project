package service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import util.GameDAO;
import vo.GameVO;

@Service
public class GameServiceimpl implements GameService{
	@Autowired
	GameDAO dao;
	
	@Override
	public List<GameVO> gameList(){
		return dao.gameList();		
	}
	@Override
	public int gameinsert(GameVO vo) {
		return dao.gameInsert(vo);
	}
	
}
