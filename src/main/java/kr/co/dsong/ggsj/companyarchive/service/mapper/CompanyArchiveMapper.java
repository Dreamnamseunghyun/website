package kr.co.dsong.ggsj.companyarchive.service.mapper;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import kr.co.dsong.ggsj.companyarchive.vo.CompanyArchiveFileVO;
import kr.co.dsong.ggsj.companyarchive.vo.CompanyArchiveVO;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface CompanyArchiveMapper {

    List<CompanyArchiveVO> selectCompanyArchiveList(@Param("type") Integer type) throws Exception;

    List<CompanyArchiveVO> selectHmCompanyArchiveList(@Param("type") Integer type, @Param("hospitalId") Integer hospitalId, @Param("userId") Integer userId) throws Exception;

    List<CompanyArchiveVO> selectCmCompanyArchiveList(@Param("type") Integer type, @Param("companyId") Integer companyId, @Param("userId") Integer userId) throws Exception;

    void insertCompanyArchive(CompanyArchiveVO vo) throws Exception;

    void insertCompanyArchiveFile(CompanyArchiveFileVO vo) throws Exception;

    void deleteCompanyArchive(CompanyArchiveVO vo) throws Exception;

    void updateCompanyArchive(CompanyArchiveVO vo) throws Exception;
}
