package kr.co.sitebuilder.common.service;

import kr.co.sitebuilder.common.ListType;
import kr.co.sitebuilder.common.vo.*;
import java.util.List;

public interface CommonService {

    List<CommonCompanyVO> selectCompanyList(ListType listType, Integer year) throws Exception;

    List<CommonCompanyCheckupTypeVO> selectCompanyCheckupTypeList(Integer companyCheckupId, Integer companyId, Integer checkupYear) throws Exception;

    List<CommonHospitalVO> selectHospitalList() throws Exception;

    List<CommonCenterVO> selectCenterList() throws Exception;

    List<CommonCenterVO> checkCenterList(Integer hospitalId) throws Exception;

    List<CommonCenterVO> checkCenterCodeList(Integer hospitalCode, Integer centerCode) throws Exception;

    List<AddressVO> selectCenterAddress() throws Exception;
}
