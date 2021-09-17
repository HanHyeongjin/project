package service;


import java.util.List;

import vo.ReviewVO;



public interface ReviewService {
	
	public int reviewInsert(ReviewVO vo); //insert
	
	public List<ReviewVO> rInfoList(ReviewVO vo);
	
	public ReviewVO reviewDetail(ReviewVO vo);

}