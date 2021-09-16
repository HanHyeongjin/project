package service;

import java.util.List;

import vo.AdminMemberVO;

public interface AdminMemberService {
	
	List<AdminMemberVO> selectList();
	
	AdminMemberVO selectOne(AdminMemberVO vo);
	
	int insert(AdminMemberVO vo);
	int update(AdminMemberVO vo);
	int delete(AdminMemberVO vo);
	List<AdminMemberVO> findid(AdminMemberVO vo);
	int findpassword(AdminMemberVO vo);

	int updatepassword(AdminMemberVO vo);

}
