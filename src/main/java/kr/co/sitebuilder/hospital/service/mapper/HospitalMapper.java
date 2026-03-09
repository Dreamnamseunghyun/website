package kr.co.sitebuilder.hospital.service.mapper;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import kr.co.sitebuilder.hospital.vo.CenterVO;
import kr.co.sitebuilder.hospital.vo.HospitalCheckupItemVO;
import kr.co.sitebuilder.hospital.vo.HospitalCheckupVO;
import kr.co.sitebuilder.hospital.vo.HospitalVO;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface HospitalMapper {
    List<CenterVO> selectCenterList(@Param("hospitalId") Integer hospitalId) throws Exception;

    List<CenterVO> selectCheckupDateList(CenterVO vo) throws Exception;

    CenterVO selectCenter(CenterVO vo) throws Exception;

    void insertCenter(CenterVO vo) throws Exception;

    void updateCenter(CenterVO vo) throws Exception;

    void deleteCenter(CenterVO vo) throws Exception;

    void deleteHospital(CenterVO vo) throws Exception;

    HospitalVO selectHospital(HospitalVO vo) throws Exception;

    List<CenterVO> tabsCenter(CenterVO vo) throws Exception;

    List<CenterVO> selectCmHospitalList(CenterVO vo) throws Exception;

    List<HospitalVO> selectHospitalList(@Param("hospitalId") Integer hospitalId) throws Exception;

    List<HospitalCheckupItemVO> selectHospitalCheckupItem(HospitalCheckupVO vo) throws Exception;

    void insertHospitalCheckupItem(HospitalCheckupItemVO vo) throws Exception;

    void updateHospital(CenterVO vo) throws Exception;

    void insertHospital(CenterVO vo) throws Exception;

    CenterVO checkHospital(CenterVO vo) throws Exception;

    void copyHospitalCheckup(HospitalCheckupVO vo) throws Exception;
}
