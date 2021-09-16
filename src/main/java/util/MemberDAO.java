package util;

import java.util.List;



import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import vo.MemberVO;

@Repository
public class MemberDAO {
	
	@Autowired
	private SqlSession sqlsession;
	
	private static final String NS = "green.mapper.MemberMapper.";
	
	public List<MemberVO> selectList(){
		return sqlsession.selectList(NS+"selectList");
	}
	
	public MemberVO selectOne(MemberVO vo){
		return sqlsession.selectOne(NS+"selectOne",vo);
	}
	
	public int insert(MemberVO vo) {
		return sqlsession.insert(NS+"insert",vo);
	}
	
	public int update(MemberVO vo) {
		return sqlsession.update(NS+"update",vo);
	}
	
	public int delete(MemberVO vo) {
		return sqlsession.delete(NS+"delete",vo);
	}
	
	public List<MemberVO> findid(MemberVO vo) {
		return sqlsession.selectOne(NS+"findid",vo);
	}
	
	public int findpassword(MemberVO vo) {
		return sqlsession.selectOne(NS+"findpassword",vo);
	}
	
	public int updatepassword(MemberVO vo) {
		return sqlsession.update(NS+"updatepassword",vo);
	}


}
