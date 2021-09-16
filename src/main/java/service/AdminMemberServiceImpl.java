package service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import util.AdminMemberDAO;
import util.MemberDAO;
import vo.AdminMemberVO;
import vo.MemberVO;

@Service
public class AdminMemberServiceImpl implements AdminMemberService{
	@Autowired
	AdminMemberDAO dao;
	
@Override
	public List<AdminMemberVO> selectList() {
		return dao.selectList();
	}
	@Override
	public AdminMemberVO selectOne(AdminMemberVO vo) {
		return dao.selectOne(vo);
	}

	@Override
	public int insert(AdminMemberVO vo) {
		return dao.insert(vo);
	}
	@Override
	public int delete(AdminMemberVO vo) {
		return dao.delete(vo);
	}
	
	@Override
	public int update(AdminMemberVO vo) {
		return dao.update(vo);
	}
	
	@Override
	public List<AdminMemberVO> findid(AdminMemberVO vo) {
		return dao.findid(vo);
	}
	
	@Override
	public int findpassword(AdminMemberVO vo) {
		return dao.findpassword(vo);
	}
	
	@Override
	public int updatepassword(AdminMemberVO vo) {
		return dao.updatepassword(vo);
	}

}
