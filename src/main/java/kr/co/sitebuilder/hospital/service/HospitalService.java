package kr.co.sitebuilder.hospital.service;

import kr.co.sitebuilder.hospital.vo.CenterVO;
import kr.co.sitebuilder.hospital.vo.HospitalCheckupVO;
import kr.co.sitebuilder.hospital.vo.HospitalVO;

import java.util.List;

public interface HospitalService {
    List<CenterVO> selectCenterList(Integer hospitalId) throws Exception;

    List<CenterVO> selectCheckupDateList(CenterVO vo) throws Exception;

    List<HospitalVO> selectHospitalList(Integer hospitalId) throws Exception;

    CenterVO selectCenter(CenterVO vo) throws Exception;

    HospitalVO selectHospital(HospitalVO vo) throws Exception;

    List<CenterVO> tabsCenter(CenterVO vo) throws Exception;

    List<CenterVO> selectCmHospitalList(CenterVO vo) throws Exception;

    void insertCenter(CenterVO vo) throws Exception;

    void insertHospital(CenterVO vo) throws Exception;

    void updateCenter(CenterVO vo) throws Exception;

    void updateHospital(CenterVO vo) throws Exception;

    void deleteCenter(CenterVO vo) throws Exception;

    void deleteHospital(CenterVO vo) throws Exception;

    HospitalCheckupVO selectHospitalCheckup(HospitalCheckupVO vo) throws Exception;

    void insertHospitalCheckup(HospitalCheckupVO vo) throws Exception;

    CenterVO checkHospital(CenterVO vo) throws Exception;

    void copyHospitalCheckup(HospitalCheckupVO vo) throws Exception;
}
