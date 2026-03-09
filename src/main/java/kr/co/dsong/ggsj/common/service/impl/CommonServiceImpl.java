package kr.co.dsong.ggsj.common.service.impl;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import kr.co.dsong.ggsj.common.ListType;
import kr.co.dsong.ggsj.common.service.CommonService;
import kr.co.dsong.ggsj.common.service.mapper.CommonMapper;
import kr.co.dsong.ggsj.common.vo.*;
import kr.co.dsong.ggsj.company.vo.CompanyVO;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class CommonServiceImpl extends EgovAbstractServiceImpl implements CommonService {

    @Resource
    private CommonMapper commonMapper;

    @Override
    public List<CommonCompanyVO> selectCompanyList(ListType listType, Integer year) throws Exception {
        return commonMapper.selectCompanyList(listType, year);
    }

    @Override
    public List<CommonCompanyCheckupTypeVO> selectCompanyCheckupTypeList(
            Integer companyCheckupId,
            Integer companyId,
            Integer checkupYear
    ) throws Exception {
        return commonMapper.selectCompanyCheckupTypeList(companyCheckupId, companyId, checkupYear);
    }

    @Override
    public List<CommonHospitalVO> selectHospitalList() throws Exception {
        return commonMapper.selectHospitalList();
    }

    @Override
    public List<CommonCenterVO> selectCenterList() throws Exception {
        return commonMapper.selectCenterList();
    }

    @Override
    public List<CommonCenterVO> checkCenterList(Integer hospitalId) throws Exception {
        return commonMapper.checkCenterList(hospitalId);
    }

    @Override
    public List<CommonCenterVO> checkCenterCodeList(Integer hospitalCode, Integer centerCode) throws Exception {
        return commonMapper.checkCenterCodeList(hospitalCode, centerCode);
    }

    @Override
    public List<AddressVO> selectCenterAddress() throws Exception {
        return commonMapper.selectCenterAddress();
    }

    @Override
    public CompanyVO selectCompanyLoginPlaceHolder(String companyCode) throws Exception {
        return commonMapper.selectCompanyLoginPlaceHolder(companyCode);
    }
}
