package kr.co.dsong.ggsj.common.service;

import kr.co.dsong.ggsj.common.ListType;
import kr.co.dsong.ggsj.common.vo.*;
import kr.co.dsong.ggsj.company.vo.CompanyVO;

import java.util.List;

public interface CommonService {

    List<CommonCompanyVO> selectCompanyList(ListType listType, Integer year) throws Exception;

    List<CommonCompanyCheckupTypeVO> selectCompanyCheckupTypeList(Integer companyCheckupId, Integer companyId, Integer checkupYear) throws Exception;

    List<CommonHospitalVO> selectHospitalList() throws Exception;

    List<CommonCenterVO> selectCenterList() throws Exception;

    List<CommonCenterVO> checkCenterList(Integer hospitalId) throws Exception;

    List<CommonCenterVO> checkCenterCodeList(Integer hospitalCode, Integer centerCode) throws Exception;

    List<AddressVO> selectCenterAddress() throws Exception;

    CompanyVO selectCompanyLoginPlaceHolder(String companyCode) throws Exception;
}
