package service;



import java.util.List;

import vo.ReplVO;
import vo.ReviewVO;



public interface ReplService {
	public int rpdelete(ReplVO vo);
	public int rpupdate(ReplVO vo);
	public int rreplInsert(ReplVO vo); 
	public int replInsert(ReplVO vo); 
	public List<ReplVO> replpopList(ReviewVO vo); 
	public List<ReplVO> replrecList(ReviewVO vo); 
	public List<ReplVO> replmyList(ReviewVO vo); 
	public List<ReplVO> rreplList(ReplVO vo); 
}