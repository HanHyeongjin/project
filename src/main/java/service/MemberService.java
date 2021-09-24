package service;

import java.util.List;

import vo.AdminMemberVO;
import vo.MemberVO;

public interface MemberService {
	
	List<MemberVO> selectList();
	
	MemberVO selectOne(MemberVO vo);
	MemberVO selectNick(MemberVO vo);
	
	int insert(MemberVO vo);
	int update(MemberVO vo);
	int delete(MemberVO vo);
	List<MemberVO> findid(MemberVO vo);
	int findpassword(MemberVO vo);

	int updatepassword(MemberVO vo);

}
