package service;

import java.util.List;

import criTest.Criteria;
import criTest.SearchCriteria;
import vo.BoardVO;
import vo.MemberVO;



public interface BoardService {
	
	// PageList2. => ver02 : SearchPageList
	public int searchRowsCount(SearchCriteria cri);
	public List<BoardVO> searchList(SearchCriteria cri);

	BoardVO selectOne(BoardVO vo); //selectList

	// ** 조회수 증가
	int countUp(BoardVO vo); //countUp

	int insert(BoardVO vo); //insert
	int update(BoardVO vo); //update
	int delete(BoardVO vo); //delete


}