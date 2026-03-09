package kr.co.sitebuilder.reserve.service.impl;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import kr.co.sitebuilder.notitok.service.NotitokService;
import kr.co.sitebuilder.reserve.service.ReserveService;
import kr.co.sitebuilder.reserve.service.mapper.ReserveMapper;
import kr.co.sitebuilder.reserve.vo.DayOffVO;
import kr.co.sitebuilder.reserve.vo.ReserveItemVO;
import kr.co.sitebuilder.reserve.vo.ReserveVO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

@Service
@Slf4j
public class ReserveServiceImpl extends EgovAbstractServiceImpl implements ReserveService {

    @Resource
    private NotitokService notitokService;

    @Resource
    private ReserveMapper reserveMapper;

    @Override
    public List<ReserveVO> selectReserveList(ReserveVO vo) throws Exception {
        return reserveMapper.selectReserveList(vo);
    }

    @Override
    public List<ReserveVO> selectHmReserveList(ReserveVO vo) throws Exception {
        return reserveMapper.selectHmReserveList(vo);
    }

    @Override
    public List<ReserveVO> selectCancelReserveList(ReserveVO vo) throws Exception {
        return reserveMapper.selectCancelReserveList(vo);
    }

    @Override
    public List<ReserveVO> selectCmReserveList(ReserveVO vo) throws Exception {
        return reserveMapper.selectCmReserveList(vo);
    }

    @Override
    public ReserveVO selectReserve(ReserveVO vo) throws Exception {

        vo = reserveMapper.selectReserve(vo);

        ReserveItemVO item = new ReserveItemVO();
        item.setReservationId(vo.getReservationId());
        vo.setReserveItems(reserveMapper.selectReserveItem(item));

        return vo;
    }

    @Override
    public List<ReserveVO> selectCmCancelReserveList(ReserveVO vo) throws Exception {
        return reserveMapper.selectCmCancelReserveList(vo);
    }

    @Override
    public List<ReserveVO> selectCancelNameList() throws Exception {
        return reserveMapper.selectCancelNameList();
    }

    @Override
    public List<ReserveVO> updateReserve(List<ReserveVO> vo) throws Exception {
        List<Integer> completeIds = new ArrayList<>();
        List<Integer> changeIds = new ArrayList<>();

        for (ReserveVO reserve : vo) {
            if (reserve.getReservationState() == 2) { // ?덉빟 ?뺤젙
                completeIds.add(reserve.getReservationId());
            }

            if (reserve.getReservationState() == 3) { // ?덉빟 痍⑥냼
                changeIds.add(reserve.getReservationId());
            }
            reserveMapper.updateReserve(reserve);
            reserveMapper.insertReserveHistory(reserve);
        }

        if (completeIds.size() > 0) {
            notitokService.notitokSendReserveComplete(completeIds);
        }

        if (changeIds.size() > 0) {

        }

        return vo;
    }

    @Override
    public List<ReserveVO> updateCancelReserve(List<ReserveVO> vo) throws Exception {
        for (ReserveVO reserve : vo) {
            reserveMapper.updateCancelReserve(reserve);
        }

        return vo;
    }

    @Override
    public void updateReserveNotes(ReserveVO vo) throws Exception {
        List<Integer> completeIds = new ArrayList<>();
        List<Integer> changeIds = new ArrayList<>();

        if (vo.getReservationState() == 2) { // ?덉빟 ?뺤젙
            completeIds.add(vo.getReservationId());
        }

        if (vo.getReservationState() == 3) { // ?덉빟 痍⑥냼
            changeIds.add(vo.getReservationId());
        }
        reserveMapper.updateReserveNotes(vo);
        reserveMapper.insertReserveHistory(vo);

        if (completeIds.size() > 0) {
            notitokService.notitokSendReserveComplete(completeIds);
        }

        if (changeIds.size() > 0) {

        }
    }

    @Override
    public List<DayOffVO> selectDayOffList(Integer centerId) throws Exception {
        return reserveMapper.selectDayOffList(centerId);
    }

    @Override
    public void SaveDayOff(List<DayOffVO> vo) throws Exception {
        for (DayOffVO dayOffVo : vo) {
            switch (dayOffVo._crudType) {
                case INSERT:
                case UPDATE:
                    reserveMapper.insertDayOff(dayOffVo);
                    break;
                case REMOVE:
                    reserveMapper.deleteDayOff(dayOffVo);
                    break;
                default:
                    break;
            }
        }
    }


    @Override
    public void copyDayOff(DayOffVO vo) throws Exception {
        reserveMapper.copyDayOff(vo);
    }

    @Override
    public List<ReserveVO> reserveCenterList(ReserveVO vo) throws Exception {
        return reserveMapper.reserveCenterList(vo);
    }

    @Override
    public List<ReserveVO> selectReserveManager(ReserveVO vo) {
        return reserveMapper.selectReserveManager(vo);
    }

    @Override
    public List<ReserveVO> selectNonReserveList(Integer companyCheckupId) throws Exception {
        return reserveMapper.selectNonReserveList(companyCheckupId);
    }

    @Override
    public List<ReserveVO> selectCmNonReserveList(ReserveVO vo) throws Exception {
        return reserveMapper.selectCmNonReserveList(vo);
    }
}
