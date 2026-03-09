package kr.co.dsong.ggsj.company.service.mapper;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import kr.co.dsong.ggsj.company.vo.CompanyCheckupTypeVO;
import kr.co.dsong.ggsj.company.vo.CompanyCheckupVO;
import kr.co.dsong.ggsj.company.vo.CompanyIndexVO;
import kr.co.dsong.ggsj.company.vo.CompanyVO;
import kr.co.dsong.ggsj.manager.vo.PlatformManagerVO;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface CompanyMapper {
    List<CompanyVO> selectCompanyList(@Param("checkupYear") Integer checkupYear) throws Exception;

    List<CompanyCheckupVO> salesManagerList() throws Exception;

    List<CompanyCheckupVO> assistManagerList() throws Exception;

    List<PlatformManagerVO> selectPlatformManagerList() throws Exception;

    CompanyVO selectCompany(CompanyVO vo) throws Exception;

    CompanyVO selectCompanyCm(CompanyVO vo) throws Exception;

    CompanyVO checkCode(CompanyVO vo) throws Exception;

    List<CompanyIndexVO> selectCompanyIndexList(CompanyIndexVO vo) throws Exception;

    List<CompanyIndexVO> selectCompanyIndexSubList(CompanyIndexVO vo) throws Exception;

    List<CompanyIndexVO> selectCompanyIndexCount(CompanyIndexVO vo) throws Exception;

    void insertCompany(CompanyVO vo) throws Exception;

    void insertCompanyCheckup(CompanyCheckupVO vo) throws Exception;

    void insertCompanyCheckupType(CompanyCheckupTypeVO vo) throws Exception;

    void updateCompany(CompanyVO vo) throws Exception;

    void deleteCompanyCi(CompanyVO vo) throws Exception;

    void updateCompanyCheckup(CompanyCheckupVO vo) throws Exception;

    void updateCompanyCheckupType(CompanyCheckupTypeVO vo) throws Exception;

    void deleteCompany(CompanyVO vo) throws Exception;

    void deleteCompanyCheckup(CompanyCheckupVO vo) throws Exception;

    void deleteCompanyCheckupType(CompanyCheckupTypeVO vo) throws Exception;
}
