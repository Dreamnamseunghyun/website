package kr.co.dsong.ggsj.commune.service.mapper;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import kr.co.dsong.ggsj.commune.vo.HealthSenseVO;

import java.util.List;

@Mapper
public interface HealthSenseMapper {

    Integer totalHealthSenseCount() throws Exception;

    List<HealthSenseVO> selectHealthSenseList(HealthSenseVO vo) throws Exception;

    HealthSenseVO selectHealthSense(HealthSenseVO vo) throws Exception;

    void insertHealthSense(HealthSenseVO vo) throws Exception;

    void updateHealthSense(HealthSenseVO vo) throws Exception;

    void deleteHealthSense(HealthSenseVO vo) throws Exception;
}
