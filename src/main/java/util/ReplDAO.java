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

	public int rpdelete(ReplVO vo) {
		return sqlSession.delete(NS+"rpdelete",vo);
	}
	public int rpupdate(ReplVO vo) {
		return sqlSession.update(NS+"rpupdate",vo);
	}
	
	public List<ReplVO> repltwo(ReplVO vo) {
		return sqlSession.selectList(NS+"repltwo",vo);
	}


	public ReplVO replone(ReplVO vo) {
		return sqlSession.selectOne(NS+"replone",vo);
	}
	public List<ReplVO> rreplList(ReplVO vo) {

		return sqlSession.selectList(NS+"rreplList",vo); 
	}

	public int rreplInsert(ReplVO vo) {
		return sqlSession.insert(NS+"rreplInsert",vo);
	} //insert

	public int replInsert(ReplVO vo) {
		return sqlSession.insert(NS+"replInsert",vo);
	} //insert

	public List<ReplVO> replrecList(ReviewVO vo) {
		return sqlSession.selectList(NS+"replrecList",vo);
	}
	
	 public List<ReplVO> replpopList(ReviewVO vo) {
		 return sqlSession.selectList(NS+"replpopList",vo); 
	 }
	 public List<ReplVO> replmyList(ReviewVO vo) {
		 return sqlSession.selectList(NS+"replmyList",vo); 
	 }
} //class
