package kr.co.sitebuilder.commune.service.mapper;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import kr.co.sitebuilder.commune.vo.NoticeVO;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface NoticeMapper {

    List<NoticeVO> selectNoticeList() throws Exception;

    List<NoticeVO> selectUsNoticeList(@Param("companyId") Integer companyId) throws Exception;

    List<NoticeVO> hospitalNoticeList(@Param("userId") Integer userId) throws Exception;

    List<NoticeVO> companyNoticeList(@Param("userId") Integer userId) throws Exception;

    NoticeVO selectNotice(NoticeVO vo) throws Exception;

    NoticeVO nextNotice(NoticeVO vo) throws Exception;

    NoticeVO beforeNotice(NoticeVO vo) throws Exception;

    void insertNotice(NoticeVO vo) throws Exception;

    void updateNotice(NoticeVO vo) throws Exception;

    void deleteNotice(NoticeVO vo) throws Exception;
}
