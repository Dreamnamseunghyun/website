package kr.co.dsong.ggsj.manager.service.mapper;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import kr.co.dsong.ggsj.manager.vo.*;

import java.util.List;

@Mapper
public interface ManagerMapper {

    List<ManagerVO> selectManagerList() throws Exception;

    List<CenterManagerCompanyVO> selectCenterManagerCompany(CenterManagerCompanyVO vo) throws Exception;

    CenterManagerVO selectCenterManager(CenterManagerVO vo) throws Exception;

    PlatformManagerVO selectPlatformManager(PlatformManagerVO vo) throws Exception;

    CompanyManagerVO selectCompanyManager(CompanyManagerVO vo) throws Exception;

    List<CenterManagerVO> centerManagerList() throws Exception;

    void insertCenterManager(CenterManagerVO vo) throws Exception;

    void insertPlatformManager(PlatformManagerVO vo) throws Exception;

    void insertCompanyManager(CompanyManagerVO vo) throws Exception;

    void insertCenterManagerCompany(CenterManagerCompanyVO vo) throws Exception;

    void updateCenterManager(CenterManagerVO vo) throws Exception;

    void updatePlatformManager(PlatformManagerVO vo) throws Exception;

    void updateCompanyManager(CompanyManagerVO vo) throws Exception;

    void updateCenterManagerCompany(CenterManagerCompanyVO vo) throws Exception;

    void deleteHospitalManager(ManagerVO vo) throws Exception;

    void deletePlatformManager(ManagerVO vo) throws Exception;

    void deleteCompanyManager(ManagerVO vo) throws Exception;

    void deleteCenterManagerCompany(CenterManagerCompanyVO vo) throws Exception;
}
