package kr.co.sitebuilder.hospital.service.mapper;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import kr.co.sitebuilder.hospital.vo.HcontractVO;

import java.util.List;

@Mapper
public interface HcontractMapper {
    List<HcontractVO> selectHcontractList(HcontractVO vo) throws Exception;

    List<HcontractVO> selectHcontract(HcontractVO vo) throws Exception;
}
