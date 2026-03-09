package kr.co.sitebuilder.commune.service;

import kr.co.sitebuilder.commune.vo.FaqVO;

import java.util.List;

public interface FaqService {

    Integer totalFaqCount(FaqVO vo) throws Exception;

    List<FaqVO> selectFaqList(FaqVO vo) throws Exception;

    FaqVO selectFaq(FaqVO vo) throws Exception;

    List<FaqVO> selectUsFaqList() throws Exception;

    FaqVO selectCategory(FaqVO vo) throws Exception;

    void insertFaq(FaqVO vo) throws Exception;

    void updateFaq(FaqVO vo) throws Exception;

    void deleteFaq(FaqVO vo) throws Exception;
}
