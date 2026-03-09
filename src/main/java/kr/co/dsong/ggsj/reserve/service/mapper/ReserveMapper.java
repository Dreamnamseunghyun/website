package kr.co.dsong.ggsj.reserve.service.mapper;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import kr.co.dsong.ggsj.reserve.vo.DayOffVO;
import kr.co.dsong.ggsj.reserve.vo.ReserveItemVO;
import kr.co.dsong.ggsj.reserve.vo.ReserveVO;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface ReserveMapper {

    List<ReserveVO> selectReserveList(ReserveVO vo) throws Exception;

    List<ReserveVO> selectHmReserveList(ReserveVO vo) throws Exception;

    List<ReserveVO> selectCancelReserveList(ReserveVO vo) throws Exception;

    List<ReserveVO> selectCmReserveList(ReserveVO vo) throws Exception;

    List<ReserveVO> selectCancelNameList() throws Exception;

    List<ReserveVO> selectCmCancelReserveList(ReserveVO vo) throws Exception;

    void updateReserve(ReserveVO vo) throws Exception;

    void updateCancelReserve(ReserveVO vo) throws Exception;

    void updateAutoCancelReserve() throws Exception;

    void updateReserveNotes(ReserveVO vo) throws Exception;

    void insertReserveHistory(ReserveVO vo) throws Exception;

    void insertReserveItemHistory(ReserveVO vo) throws Exception;

    List<DayOffVO> selectDayOffList(@Param("centerId") Integer centerId) throws Exception;

    List<ReserveVO> selectNonReserveList(@Param("companyCheckupId") Integer companyCheckupId) throws Exception;

    List<ReserveVO> selectCmNonReserveList(ReserveVO vo) throws Exception;

    List<ReserveVO> reserveCenterList(ReserveVO vo) throws Exception;

    void insertDayOff(DayOffVO vo) throws Exception;

    void deleteDayOff(DayOffVO vo) throws Exception;

    void copyDayOff(DayOffVO vo) throws Exception;

    ReserveVO selectReserve(ReserveVO vo) throws Exception;

    List<ReserveItemVO> selectReserveItem(ReserveItemVO vo) throws Exception;

    List<ReserveVO> selectReserveManager(ReserveVO vo);
}
