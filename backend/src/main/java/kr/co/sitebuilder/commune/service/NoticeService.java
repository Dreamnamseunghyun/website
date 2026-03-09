package kr.co.sitebuilder.commune.service;

import kr.co.sitebuilder.commune.vo.NoticeVO;

import java.util.List;

public interface NoticeService {

    List<NoticeVO> selectNoticeList() throws Exception;

    List<NoticeVO> selectUsNoticeList(Integer companyId) throws Exception;

    List<NoticeVO> hospitalNoticeList(Integer userId) throws Exception;

    List<NoticeVO> companyNoticeList(Integer userId) throws Exception;

    NoticeVO selectNotice(NoticeVO vo) throws Exception;

    List<NoticeVO> selectNoticeWith(NoticeVO vo) throws Exception;

    void insertNotice(NoticeVO vo) throws Exception;

    void updateNotice(NoticeVO vo) throws Exception;

    void deleteNotice(NoticeVO vo) throws Exception;
}
