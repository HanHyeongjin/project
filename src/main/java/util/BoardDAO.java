package util;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import criTest.Criteria;
import criTest.SearchCriteria;
import lombok.extern.log4j.Log4j;
import vo.BoardVO;

// ** Board CRUD
// => selectList, selectOne, insert, update, delete 

@Log4j
@Repository
public class BoardDAO {
	@Autowired
	SqlSession sqlSession;
	private static final String NS="green.mapper.BoardMapper.";
	
	// PageList2. => ver02 : SearchPageList---------------
	// => mapper 에 searchRowsCount, searchList 추가
	public int searchRowsCount(SearchCriteria cri) {
		return sqlSession.selectOne(NS+"searchRowsCount",cri);
	}
	public List<BoardVO> searchList(SearchCriteria cri) {
		return sqlSession.selectList(NS+"searchList",cri);
	}
	//----------------------------------------------------- 
	
	// ** selectOne
	public BoardVO selectOne(BoardVO vo) {
		return sqlSession.selectOne(NS+"selectOne", vo);
	} //selectOne 
	
	// ** 조회수 증가
	public int countUp(BoardVO vo) {
		return sqlSession.update(NS+"countUp",vo);
	} //countUp
	
	// ** insert (원글)
	public int insert(BoardVO vo) {
		return sqlSession.insert(NS+"insert",vo);
	} //insert
	// ** update
	public int update(BoardVO vo) {
		return sqlSession.update(NS+"update",vo);
	} //update
	// ** delete
	public int delete(BoardVO vo) {
		return sqlSession.delete(NS+"delete",vo);
	} //delete
} //class
