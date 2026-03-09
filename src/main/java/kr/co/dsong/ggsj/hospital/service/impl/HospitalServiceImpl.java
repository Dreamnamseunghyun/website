package kr.co.dsong.ggsj.hospital.service.impl;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import kr.co.dsong.ggsj.hospital.service.HospitalService;
import kr.co.dsong.ggsj.hospital.service.mapper.HospitalMapper;
import kr.co.dsong.ggsj.hospital.vo.CenterVO;
import kr.co.dsong.ggsj.hospital.vo.HospitalCheckupItemVO;
import kr.co.dsong.ggsj.hospital.vo.HospitalCheckupVO;
import kr.co.dsong.ggsj.hospital.vo.HospitalVO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Slf4j
@Service
public class HospitalServiceImpl extends EgovAbstractServiceImpl implements HospitalService {

    @Resource
    private HospitalMapper hospitalMapper;

    @Override
    public List<CenterVO> selectCenterList(Integer hospitalId) throws Exception {
        return hospitalMapper.selectCenterList(hospitalId);
    }

    @Override
    public List<CenterVO> selectCheckupDateList(CenterVO vo) throws Exception {
        return hospitalMapper.selectCheckupDateList(vo);
    }

    @Override
    public List<HospitalVO> selectHospitalList(Integer hospitalId) throws Exception {
        return hospitalMapper.selectHospitalList(hospitalId);
    }

    @Override
    public CenterVO selectCenter(CenterVO vo) throws Exception {
        return hospitalMapper.selectCenter(vo);
    }

    @Override
    public HospitalVO selectHospital(HospitalVO vo) throws Exception {
        return hospitalMapper.selectHospital(vo);
    }

    @Override
    public List<CenterVO> tabsCenter(CenterVO vo) throws Exception {
        return hospitalMapper.tabsCenter(vo);
    }

    @Override
    public List<CenterVO> selectCmHospitalList(CenterVO vo) throws Exception {
        return hospitalMapper.selectCmHospitalList(vo);
    }

    @Override
    public void insertCenter(CenterVO vo) throws Exception {
        hospitalMapper.insertCenter(vo);
        hospitalMapper.updateHospital(vo);
    }

    @Override
    public void insertHospital(CenterVO vo) throws Exception {
        hospitalMapper.insertHospital(vo);
    }

    @Override
    public void updateCenter(CenterVO vo) throws Exception {
        hospitalMapper.updateCenter(vo);
    }

    @Override
    public void updateHospital(CenterVO vo) throws Exception {
        hospitalMapper.updateHospital(vo);
    }

    @Override
    public void deleteCenter(CenterVO vo) throws Exception {
        hospitalMapper.deleteCenter(vo);
    }

    @Override
    public void deleteHospital(CenterVO vo) throws Exception {
        hospitalMapper.deleteHospital(vo);
    }

    @Override
    public HospitalCheckupVO selectHospitalCheckup(HospitalCheckupVO vo) throws Exception {
        HospitalVO hospitalVO = new HospitalVO();
        hospitalVO.setHospitalId(vo.getHospitalId());

        hospitalVO = hospitalMapper.selectHospital(hospitalVO);

        vo.setHospitalName(hospitalVO.getHospitalName());

        vo.setHospitalCheckupItems(hospitalMapper.selectHospitalCheckupItem(vo));

        return vo;
    }

    @Override
    public void insertHospitalCheckup(HospitalCheckupVO vo) throws Exception {
        for (HospitalCheckupItemVO hospitalCheckupItemVO : vo.getHospitalCheckupItems()) {
            hospitalCheckupItemVO.setHospitalId(vo.getHospitalId());
            hospitalCheckupItemVO.setCheckupYear(vo.getCheckupYear());

            // Tree Key to Org Key
            hospitalCheckupItemVO.setId(hospitalCheckupItemVO.getId() - 1000000);

            hospitalMapper.insertHospitalCheckupItem(hospitalCheckupItemVO);
        }
    }

    @Override
    public CenterVO checkHospital(CenterVO vo) throws Exception {
        return hospitalMapper.checkHospital(vo);
    }

    @Override
    public void copyHospitalCheckup(HospitalCheckupVO vo) throws Exception {
        hospitalMapper.copyHospitalCheckup(vo);
    }
}
