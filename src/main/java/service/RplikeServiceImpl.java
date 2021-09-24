package service;






import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import util.RplikeDAO;
import vo.RplikeVO;





@Service
public class RplikeServiceImpl implements RplikeService  {
	@Autowired
	RplikeDAO dao;
	
	@Override
	public int updaterplike(RplikeVO vo) {
		
		return dao.updaterplike(vo);
	}
	
	@Override
	public int deleterplike(RplikeVO vo) {
		return dao.deleterplike(vo);
	}
	@Override
	public int insertrplike(RplikeVO vo) {
		return dao.insertrplike(vo);
	}
	
} //class
