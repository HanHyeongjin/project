package service;



import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import util.ReviewDAO;
import vo.ReviewVO;



//** interface 자동완성 
// => Alt + Shift + T  
// => 또는 마우스우클릭 PopUp Menu 의  Refactor - Extract Interface...

@Service
public class ReviewServiceImpl implements ReviewService {
	@Autowired
	ReviewDAO dao;

	@Override
	public List<ReviewVO> rInfoList(ReviewVO vo) {
		return dao.rInfoList(vo);
	}
	
	@Override
	public int reviewInsert(ReviewVO vo) {
		return dao.reviewInsert(vo);
	} //insert

} //class
