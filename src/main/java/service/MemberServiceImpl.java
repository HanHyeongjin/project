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
		return dao.selectOne();
	}

	@Override
	public int insert(MemberVO vo) {
		return dao.insert(vo);
	}
	@Override
	public int delete(MemberVO vo) {
		return dao.insert(vo);
	}

}
