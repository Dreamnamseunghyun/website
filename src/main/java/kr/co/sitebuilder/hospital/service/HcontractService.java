package kr.co.sitebuilder.hospital.service;

import kr.co.sitebuilder.hospital.vo.HcontractVO;

import java.util.List;

public interface HcontractService {
    List<HcontractVO> selectHcontractList(HcontractVO vo) throws Exception;

    List<HcontractVO> selectHcontract(HcontractVO vo) throws Exception;
}
