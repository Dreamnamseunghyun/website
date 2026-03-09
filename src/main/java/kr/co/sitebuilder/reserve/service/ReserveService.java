package kr.co.sitebuilder.reserve.service;

import kr.co.sitebuilder.reserve.vo.DayOffVO;
import kr.co.sitebuilder.reserve.vo.ReserveVO;

import java.util.List;

public interface ReserveService {

    List<ReserveVO> selectReserveList(ReserveVO vo) throws Exception;

    List<ReserveVO> selectHmReserveList(ReserveVO vo) throws Exception;

    List<ReserveVO> selectCancelReserveList(ReserveVO vo) throws Exception;

    List<ReserveVO> selectCmReserveList(ReserveVO vo) throws Exception;

    List<ReserveVO> selectCmCancelReserveList(ReserveVO vo) throws Exception;

    List<ReserveVO> selectCancelNameList() throws Exception;

    List<ReserveVO> updateReserve(List<ReserveVO> vo) throws Exception;

    List<ReserveVO> updateCancelReserve(List<ReserveVO> vo) throws Exception;

    List<DayOffVO> selectDayOffList(Integer centerId) throws Exception;

    List<ReserveVO> selectNonReserveList(Integer companyCheckupId) throws Exception;

    void updateReserveNotes(ReserveVO vo) throws Exception;

    void SaveDayOff(List<DayOffVO> vo) throws Exception;

    void copyDayOff(DayOffVO vo) throws Exception;

    ReserveVO selectReserve(ReserveVO vo) throws Exception;

    List<ReserveVO> selectCmNonReserveList(ReserveVO vo) throws Exception;

    List<ReserveVO> reserveCenterList(ReserveVO vo) throws Exception;

    List<ReserveVO> selectReserveManager(ReserveVO vo);
}
