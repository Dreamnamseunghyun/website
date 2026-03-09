package kr.co.dsong.ggsj.companyarchive.service;

import kr.co.dsong.ggsj.companyarchive.vo.CompanyArchiveVO;

import java.util.List;

public interface CompanyArchiveService {

    List<CompanyArchiveVO> selectCompanyArchiveList(Integer type) throws Exception;

    List<CompanyArchiveVO> selectHmCompanyArchiveList(Integer type, Integer hospitalId, Integer userId) throws Exception;

    List<CompanyArchiveVO> selectCmCompanyArchiveList(Integer type, Integer companyId, Integer userId) throws Exception;

    void insertCompanyArchive(CompanyArchiveVO vo) throws Exception;

    void deleteCompanyArchive(CompanyArchiveVO vo) throws Exception;

    void updateCompanyArchive(CompanyArchiveVO vo) throws Exception;
}
