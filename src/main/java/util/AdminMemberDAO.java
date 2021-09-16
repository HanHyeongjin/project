package util;

import java.util.List;



import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import vo.AdminMemberVO;
import vo.MemberVO;

@Repository
public class AdminMemberDAO {
	
	@Autowired
	private SqlSession sqlsession;
	
	private static final String NS = "green.mapper.AdMapper.";
	
	public List<AdminMemberVO> selectList(){
		return sqlsession.selectList(NS+"selectList");
	}
	
	public AdminMemberVO selectOne(AdminMemberVO vo){
		return sqlsession.selectOne(NS+"selectOne",vo);
	}
	
	public int insert (AdminMemberVO vo) {
		return sqlsession.insert(NS+"insert",vo);
	}
	
	public int update(AdminMemberVO vo) {
		return sqlsession.update(NS+"update",vo);
	}
	
	public int delete(AdminMemberVO vo) {
		return sqlsession.delete(NS+"delete",vo);
	}
	
	public List<AdminMemberVO> findid(AdminMemberVO vo) {
		return sqlsession.selectOne(NS+"findid",vo);
	}
	
	public int findpassword(AdminMemberVO vo) {
		return sqlsession.selectOne(NS+"findpassword",vo);
	}
	
	public int updatepassword(AdminMemberVO vo) {
		return sqlsession.update(NS+"updatepassword",vo);
	}


}
