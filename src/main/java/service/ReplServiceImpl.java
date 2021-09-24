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
	public int rpdelete(ReplVO vo) {
		return dao.rpdelete(vo);
	}
		
	@Override
	public int rpupdate(ReplVO vo) {
		return dao.rpupdate(vo);
	}
	
	@Override public List<ReplVO> rreplList(ReplVO vo) { return
			dao.rreplList(vo);
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
	public List<ReplVO> replrecList(ReviewVO vo) {
		return dao.replrecList(vo);
	}
	 @Override public List<ReplVO> replpopList(ReviewVO vo) {
	 return dao.replpopList(vo); 
	 }
	 @Override public List<ReplVO> replmyList(ReviewVO vo) {
		 return dao.replmyList(vo); 
		 }
		 
} //class
