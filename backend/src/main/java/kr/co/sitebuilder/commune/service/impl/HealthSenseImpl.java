package kr.co.sitebuilder.commune.service.impl;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import kr.co.sitebuilder.commune.service.HealthSenseService;
import kr.co.sitebuilder.commune.service.mapper.HealthSenseMapper;
import kr.co.sitebuilder.commune.vo.HealthSenseVO;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class HealthSenseImpl extends EgovAbstractServiceImpl implements HealthSenseService {
    @Resource
    private HealthSenseMapper healthSenseMapper;

    @Override
    public Integer totalHealthSenseCount() throws Exception {
        return healthSenseMapper.totalHealthSenseCount();
    }

    @Override
    public List<HealthSenseVO> selectHealthSenseList(HealthSenseVO vo) throws Exception {
        return healthSenseMapper.selectHealthSenseList(vo);
    }

    @Override
    public HealthSenseVO selectHealthSense(HealthSenseVO vo) throws Exception {
        return healthSenseMapper.selectHealthSense(vo);
    }

    @Override
    public void insertHealthSense(HealthSenseVO vo) throws Exception {
        healthSenseMapper.insertHealthSense(vo);
    }

    @Override
    public void updateHealthSense(HealthSenseVO vo) throws Exception {
        healthSenseMapper.updateHealthSense(vo);
    }

    @Override
    public void deleteHealthSense(HealthSenseVO vo) throws Exception {
        healthSenseMapper.deleteHealthSense(vo);
    }


}
