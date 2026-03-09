package kr.co.dsong.ggsj.company.service;

import kr.co.dsong.ggsj.company.vo.CompanyCheckupVO;
import kr.co.dsong.ggsj.company.vo.CompanyIndexVO;
import kr.co.dsong.ggsj.company.vo.CompanyVO;
import kr.co.dsong.ggsj.manager.vo.PlatformManagerVO;

import java.util.List;

public interface CompanyService {

    List<CompanyVO> selectCompanyList(Integer checkupYear) throws Exception;

    List<PlatformManagerVO> selectPlatformManagerList() throws Exception;

    List<CompanyCheckupVO> salesManagerList() throws Exception;

    List<CompanyCheckupVO> assistManagerList() throws Exception;

    CompanyVO selectCompany(CompanyVO vo) throws Exception;

    CompanyVO selectCompanyCm(CompanyVO vo) throws Exception;

    CompanyVO checkCode(CompanyVO vo) throws Exception;

    List<CompanyIndexVO> selectCompanyIndexList(CompanyIndexVO vo) throws Exception;

    List<CompanyIndexVO> selectCompanyIndexSubList(CompanyIndexVO vo) throws Exception;

    List<CompanyIndexVO> selectCompanyIndexCount(CompanyIndexVO vo) throws Exception;

    void insertCompany(CompanyVO vo) throws Exception;

    void updateCompany(CompanyVO vo) throws Exception;

    CompanyVO deleteCompanyCi(CompanyVO vo) throws Exception;

    void deleteCompany(CompanyVO vo) throws Exception;

    void insertCompanyCheckup(CompanyCheckupVO vo) throws Exception;

    void updateCompanyCheckup(CompanyCheckupVO vo) throws Exception;

    void deleteCompanyCheckup(CompanyCheckupVO vo) throws Exception;
}
