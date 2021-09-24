package util;



import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import vo.RplikeVO;


// ** Board CRUD
// => selectList, selectOne, insert, update, delete 


@Repository
public class RplikeDAO {
	@Autowired
	SqlSession sqlSession;
	private static final String NS="green.mapper.RplikeMapper.";
	
	public int updaterplike(RplikeVO vo) {
		return sqlSession.update(NS+"updaterplike",vo);
	}	
	public int deleterplike(RplikeVO vo) {
		return sqlSession.delete(NS+"deleterplike",vo);
	}
	public int insertrplike(RplikeVO vo) {
		return sqlSession.update(NS+"insertrplike",vo);
	}
	
} //class
