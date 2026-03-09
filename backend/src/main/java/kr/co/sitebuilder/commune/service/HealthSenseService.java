package kr.co.sitebuilder.commune.service;

import kr.co.sitebuilder.commune.vo.HealthSenseVO;

import java.util.List;

public interface HealthSenseService {

    Integer totalHealthSenseCount() throws Exception;

    List<HealthSenseVO> selectHealthSenseList(HealthSenseVO vo) throws Exception;

    HealthSenseVO selectHealthSense(HealthSenseVO vo) throws Exception;

    void insertHealthSense(HealthSenseVO vo) throws Exception;

    void updateHealthSense(HealthSenseVO vo) throws Exception;

    void deleteHealthSense(HealthSenseVO vo) throws Exception;
}
