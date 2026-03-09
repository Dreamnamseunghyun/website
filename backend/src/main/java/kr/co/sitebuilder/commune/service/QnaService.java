package kr.co.sitebuilder.commune.service;

import kr.co.sitebuilder.commune.vo.QnaVO;

import java.util.List;

public interface QnaService {

    List<QnaVO> selectQnaList() throws Exception;

    List<QnaVO> selectUsQnaList(Integer userId) throws Exception;

    QnaVO selectQna(QnaVO vo) throws Exception;

    void insertQna(QnaVO vo) throws Exception;

    void updateQna(QnaVO vo) throws Exception;

    void deleteQna(QnaVO vo) throws Exception;

    void insertUsQna(QnaVO vo) throws Exception;
}
