package kr.co.dsong.ggsj.common.service.mapper;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import kr.co.dsong.ggsj.common.ListType;
import kr.co.dsong.ggsj.common.vo.*;
import kr.co.dsong.ggsj.company.vo.CompanyVO;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface CommonMapper {

    List<CommonCompanyVO> selectCompanyList(@Param("listType") ListType listType, @Param("year") Integer year) throws Exception;

    List<CommonCompanyCheckupTypeVO> selectCompanyCheckupTypeList(@Param("companyCheckupId") Integer companyCheckupId,
                                                                  @Param("companyId") Integer companyId,
                                                                  @Param("checkupYear") Integer checkupYear) throws Exception;

    List<CommonHospitalVO> selectHospitalList() throws Exception;

    List<CommonCenterVO> selectCenterList() throws Exception;

    List<CommonCenterVO> checkCenterList(@Param("hospitalId") Integer hospitalId) throws Exception;

    List<CommonCenterVO> checkCenterCodeList(@Param("hospitalCode") Integer hospitalCode, @Param("centerCode") Integer centerCode) throws Exception;

    List<AddressVO> selectCenterAddress() throws Exception;

    CompanyVO selectCompanyLoginPlaceHolder(@Param("companyCode") String companyCode) throws Exception;
}
