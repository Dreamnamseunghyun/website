package kr.co.sitebuilder.config;

import java.util.List;

import kr.co.sitebuilder.common.ListType;
import kr.co.sitebuilder.common.vo.AddressVO;
import kr.co.sitebuilder.common.vo.CommonCenterVO;
import kr.co.sitebuilder.common.vo.CommonCompanyCheckupTypeVO;
import kr.co.sitebuilder.common.vo.CommonCompanyVO;
import kr.co.sitebuilder.common.vo.CommonHospitalVO;
import kr.co.sitebuilder.company.vo.CompanyVO;

public interface WebMvcConfig {

    List<CommonCompanyVO> selectCompanyList(ListType listType, Integer year) throws Exception;

    List<CommonCompanyCheckupTypeVO> selectCompanyCheckupTypeList(Integer companyCheckupId, Integer companyId, Integer checkupYear) throws Exception;

    List<CommonHospitalVO> selectHospitalList() throws Exception;

    List<CommonCenterVO> selectCenterList() throws Exception;

    List<CommonCenterVO> checkCenterList(Integer hospitalId) throws Exception;

    List<CommonCenterVO> checkCenterCodeList(Integer hospitalCode, Integer centerCode) throws Exception;

    List<AddressVO> selectCenterAddress() throws Exception;

    CompanyVO selectCompanyLoginPlaceHolder(String companyCode) throws Exception;
}
