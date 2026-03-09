package kr.co.sitebuilder.hospital.service.impl;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import kr.co.sitebuilder.hospital.service.HcontractService;
import kr.co.sitebuilder.hospital.service.mapper.HcontractMapper;
import kr.co.sitebuilder.hospital.vo.HcontractVO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Slf4j
@Service
public class HcontractImpl extends EgovAbstractServiceImpl implements HcontractService {

    @Resource
    private HcontractMapper hcontractMapper;

    @Override
    public List<HcontractVO> selectHcontractList(HcontractVO vo) throws Exception {
        return hcontractMapper.selectHcontractList(vo);
    }

    @Override
    public List<HcontractVO> selectHcontract(HcontractVO vo) throws Exception {
        return hcontractMapper.selectHcontract(vo);
    }
}
