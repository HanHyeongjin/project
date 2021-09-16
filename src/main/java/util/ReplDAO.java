package util;


import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import lombok.extern.log4j.Log4j;
import vo.ReplVO;
import vo.ReviewVO;


// ** Board CRUD
// => selectList, selectOne, insert, update, delete 


@Repository
public class ReplDAO {
	@Autowired
	SqlSession sqlSession;
	private static final String NS="green.mapper.ReplMapper.";
	
	
	 public List<ReplVO> rreplList(ReplVO vo) {
	 
	  return sqlSession.selectList(NS+"rreplList",vo); 
	  }
	 
	
	
	public int rreplInsert(ReplVO vo) {
		return sqlSession.insert(NS+"rreplInsert",vo);
	} //insert
	
	public int replInsert(ReplVO vo) {
		return sqlSession.insert(NS+"replInsert",vo);
	} //insert
	
	public List<ReplVO> replList(ReviewVO vo) {
		
		return sqlSession.selectList(NS+"replList",vo);
	}
	
public List<ReplVO> replListl(ReplVO vo) {
		
		return sqlSession.selectList(NS+"replListl",vo);
	}
} //class