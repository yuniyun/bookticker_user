package org.bs.common.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.bs.user.board.model.BoardCriteria;
import org.bs.user.board.model.BoardReplyVO;
import org.bs.user.board.model.BoardReportVO;
import org.bs.user.board.model.BoardVO;

public interface BoardMapper {
	
	public List<BoardVO> boardList(BoardCriteria cri) throws Exception;//��ü �Խñ۸���Ʈ
	
	
	public void autherBoardWrite(BoardVO vo) throws Exception;//�۰� �Խñ۾���
	public void userBoardWrite(BoardVO vo) throws Exception;//���� �Խñ۾���
	public void adminBoardWrite(BoardVO vo) throws Exception;//������ �Խñ۾���
	
	public BoardVO boardRead(@Param("boardNo")Integer boardNo) throws Exception;//�Խñ���ȸ
	
	public void boardUpdate(BoardVO vo) throws Exception;//�Խñۼ���

	public void boardDelete(Integer boardNo) throws Exception;//�Խñۻ���
	
	public Integer boardTotalCnt(BoardCriteria cri) throws Exception;//��ü �Խñ� �� ��ȸ
	
	
	

	public List<BoardReportVO> boardReportList(@Param("boardNo")Integer boardNo) throws Exception;//�Խñ� �Ű���Ʈ
	public void boardReportDelete(Integer reportNo) throws Exception;//�Խñ� �Ű����
	public BoardReportVO boardReportRead(@Param("reportNo")Integer reportNo) throws Exception;//�Խñ� �Ű� ������ȸ
	
	
	
	public List<BoardReplyVO> boardReplyList(@Param("boardNo")Integer boardNo) throws Exception;//�Խñ� ��۸���Ʈ
	public Integer boardReplyCnt(BoardReplyVO vo) throws Exception;//�Խñ� ��۸���Ʈ


}
