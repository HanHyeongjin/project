package service;



import java.util.List;

import vo.ReplVO;
import vo.ReviewVO;



public interface ReplService {
	
	public int rreplInsert(ReplVO vo); 
	public int replInsert(ReplVO vo); 
	public List<ReplVO> replList(ReviewVO vo); 
	public List<ReplVO> replListl(ReplVO vo); 
	
}