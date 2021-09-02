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
	
	private static final String NS = "green.ncs.mapper.MemberMapper";
	
	public List<MemberVO> selectList(){
		return sqlsession.selectList(NS+"selectList");
	}
	
	public MemberVO selectOne(){
		return sqlsession.selectOne(NS+"selectOne");
	}
	
	public int insert(MemberVO vo) {
		return sqlsession.insert(NS+"insert",vo);
	}


}
