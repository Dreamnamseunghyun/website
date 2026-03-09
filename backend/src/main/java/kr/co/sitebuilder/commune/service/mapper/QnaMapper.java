package kr.co.sitebuilder.commune.service.mapper;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import kr.co.sitebuilder.commune.vo.QnaVO;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface QnaMapper {

    List<QnaVO> selectQnaList() throws Exception;

    List<QnaVO> selectUsQnaList(@Param("userId") Integer userId) throws Exception;

    QnaVO selectQna(QnaVO vo) throws Exception;

    void insertQna(QnaVO vo) throws Exception;

    void updateQna(QnaVO vo) throws Exception;

    void deleteQna(QnaVO vo) throws Exception;

    void insertUsQna(QnaVO vo) throws Exception;
}
