package service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import util.MemberDAO;
import vo.MemberVO;

@Service
public class MemberServiceImpl implements MemberService{
	@Autowired
	MemberDAO dao;
	
	@Override
	public List<MemberVO> selectList() {
		return dao.selectList();
	}
	
	@Override
	public MemberVO selectOne(MemberVO vo) {
		return dao.selectOne(vo);
	}

	@Override
	public int insert(MemberVO vo) {
		return dao.insert(vo);
	}
	@Override
	public int delete(MemberVO vo) {
		return dao.delete(vo);
	}
	
	@Override
	public int update(MemberVO vo) {
		return dao.update(vo);
	}
	
	@Override
	public int findid(MemberVO vo) {
		return dao.findid(vo);
	}
	
	@Override
	public int findpassword(MemberVO vo) {
		return dao.findpassword(vo);
	}
	
	@Override
	public int updatepassword(MemberVO vo) {
		return dao.updatepassword(vo);
	}

}
