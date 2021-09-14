package util;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import lombok.extern.log4j.Log4j;
import vo.ReviewVO;

// ** Board CRUD
// => selectList, selectOne, insert, update, delete 

@Log4j
@Repository
public class ReviewDAO {
	@Autowired
	SqlSession sqlSession;
	private static final String NS="green.mapper.ReviewMapper.";
	
	public ReviewVO reviewDetail(ReviewVO vo) {
		return sqlSession.selectOne(NS+"reviewDetail",vo);
	}
	
	
	public List<ReviewVO> rInfoList(ReviewVO vo) {
		return sqlSession.selectList(NS+"rInfoList",vo);
	}
	
	
	public int reviewInsert(ReviewVO vo) {
		return sqlSession.insert(NS+"insert",vo);
	} //insert
	
} //class
