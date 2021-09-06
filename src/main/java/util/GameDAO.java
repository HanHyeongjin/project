package util;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import vo.GameVO;

@Repository
public class GameDAO {

	@Autowired
	private SqlSession sqlSession;
	private static final String NS = "green.mapper.GameMapper.";
	
	
public GameVO gameInfo(GameVO vo) {		
		return  sqlSession.selectOne(NS+"gameInfo",vo);
	}
	public List<GameVO> gameList() {
		return sqlSession.selectList(NS+"gameList");
	}
	public int gameInsert(GameVO vo) {
		return sqlSession.insert(NS+"gameInsert",vo);
	}
}
