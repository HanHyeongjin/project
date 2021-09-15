package service;




import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import util.ReplDAO;
import vo.ReplVO;
import vo.ReviewVO;





@Service
public class ReplServiceImpl implements ReplService  {
	@Autowired
	ReplDAO dao;
	
	@Override
	public List<ReplVO> replListl(ReplVO vo) {
		
		return dao.replListl(vo);
	}
	
	@Override
	public int rreplInsert(ReplVO vo) {
		return dao.rreplInsert(vo);
	}
	
	@Override
	public int replInsert(ReplVO vo) {
		return dao.replInsert(vo);
	}
@Override
public List<ReplVO> replList(ReviewVO vo) {
	
	return dao.replList(vo);
}

} //class
