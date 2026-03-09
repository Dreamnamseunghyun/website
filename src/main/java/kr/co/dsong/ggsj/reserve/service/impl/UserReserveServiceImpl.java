package kr.co.dsong.ggsj.reserve.service.impl;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import kr.co.dsong.ggsj.company.vo.CompanyCheckupTypeVO;
import kr.co.dsong.ggsj.employee.service.mapper.EmployeeMapper;
import kr.co.dsong.ggsj.employee.vo.EmployeeVO;
import kr.co.dsong.ggsj.hospital.vo.CenterVO;
import kr.co.dsong.ggsj.notitok.service.NotitokService;
import kr.co.dsong.ggsj.reserve.service.UserReserveService;
import kr.co.dsong.ggsj.reserve.service.mapper.ReserveMapper;
import kr.co.dsong.ggsj.reserve.service.mapper.UserReserveMapper;
import kr.co.dsong.ggsj.reserve.vo.CheckupItemClassVO;
import kr.co.dsong.ggsj.reserve.vo.CheckupItemVO;
import kr.co.dsong.ggsj.reserve.vo.CheckupRegisterVO;
import kr.co.dsong.ggsj.reserve.vo.ReserveVO;
import kr.co.dsong.ggsj.util.SessionUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Calendar;
import java.util.List;

@Service
@Slf4j
public class UserReserveServiceImpl extends EgovAbstractServiceImpl implements UserReserveService {

    @Resource
    private NotitokService notitokService;

    @Resource
    private UserReserveMapper userReserveMapper;

    @Resource
    private ReserveMapper reserveMapper;

    @Resource
    private EmployeeMapper employeeMapper;

    @Override
    public List<CompanyCheckupTypeVO> selectCopayCompanyCheckupTypeList() throws Exception {
        ReserveVO vo = new ReserveVO();

        vo.setCompanyId(SessionUtil.getInteger("sessionTypeId"));
        vo.setCheckupYear(Calendar.getInstance().get(Calendar.YEAR));

        return userReserveMapper.selectCopayCompanyCheckupTypeList(vo);
    }

    @Override
    public List<ReserveVO> selectReserveList() throws Exception {
        ReserveVO vo = new ReserveVO();

        vo.setCompanyId(SessionUtil.getInteger("sessionTypeId"));
        vo.setEmployeeCode(SessionUtil.getString("sessionLoginId"));
        vo.setCheckupYear(Calendar.getInstance().get(Calendar.YEAR));

        return userReserveMapper.selectReserveList(vo);
    }

    @Override
    public ReserveVO selectReserve(ReserveVO vo) throws Exception {
        vo.setCompanyId(SessionUtil.getInteger("sessionTypeId"));
        vo.setEmployeeCode(SessionUtil.getString("sessionLoginId"));
        vo.setCheckupYear(Calendar.getInstance().get(Calendar.YEAR));

        if (vo.getReservationId() != null) {
            return userReserveMapper.selectReserveDetail(vo);
        }

        List<ReserveVO> reserveList = userReserveMapper.selectReserveList(vo);
        if (reserveList.size() == 1) {
            return reserveList.get(0);
        }

        return null;
    }

    @Override
    public void insertReserve(ReserveVO vo) throws Exception {
        vo.setCheckupYear(Calendar.getInstance().get(Calendar.YEAR));

        ReserveVO reserve = userReserveMapper.selectReserveState(vo);
        if (reserve != null) {
            if (reserve.getReservationState() != null) {
                return;
            }
            vo.setReservationId(reserve.getReservationId());
        }

        if (vo.getCheckupContractSubTypeId() != null) {
            ReserveVO checkupTypePay = userReserveMapper.selectCheckupTypePay(vo);
            vo.setUpgradePay(checkupTypePay.getUpgradePay());
            vo.setSupportPay(checkupTypePay.getSupportPay());
            vo.setCopay(checkupTypePay.getCopay());
            vo.setHospitalPay(checkupTypePay.getHospitalPay());
            vo.setPlatformPay(checkupTypePay.getPlatformPay());
        }

        if (vo.getSelectedItemIds() != null && vo.getSelectedItemIds().size() > 0) {
            userReserveMapper.deleteReservationItem(vo);
            userReserveMapper.insertReservationItem(vo);

            ReserveVO checkupItemPay = userReserveMapper.selectCheckupItemPay(vo);
            vo.setSumItemCopay(checkupItemPay.getSumItemCopay());
            vo.setSumItemDiscountBill(checkupItemPay.getSumItemDiscountBill());
        }

        userReserveMapper.insertReserve(vo);
        if (reserve != null) {
            vo.setReservationId(reserve.getReservationId());
        }

        if (vo.getReservationState() != null && vo.getReservationState() == 1) {
            EmployeeVO employee = new EmployeeVO();
            employee.setUserId(vo.getUserId());
            employee.setEmployeeName(vo.getReservationName());
            employee.setBirth(vo.getBirth());
            employee.setSex(vo.getSex());
            employee.setMobile(vo.getMobile());
            employee.setEmail(vo.getEmail());
            employee.setZipcode(vo.getZipcode());
            employee.setAddress1(vo.getAddress1());
            employee.setAddress2(vo.getAddress2());

            employeeMapper.updateMypage(employee);

            reserveMapper.insertReserveHistory(vo);
            reserveMapper.insertReserveItemHistory(vo);

            // notitok
            notitokService.notitokSendReserveOffer(vo.getReservationId());
        }
    }

    @Override
    public void updateReserve(ReserveVO vo) throws Exception {
        if (vo.getReservationState() != null) {
            if (vo.getSelectedItemIds() != null && vo.getSelectedItemIds().size() > 0) {
                userReserveMapper.deleteReservationItem(vo);
                userReserveMapper.insertReservationItem(vo);

                ReserveVO checkupItemPay = userReserveMapper.selectCheckupItemPay(vo);
                vo.setSumItemCopay(checkupItemPay.getSumItemCopay());
                vo.setSumItemDiscountBill(checkupItemPay.getSumItemDiscountBill());
            }

            userReserveMapper.updateReserve(vo);
        } else {
            userReserveMapper.updateReserveNotes(vo);
        }

        reserveMapper.insertReserveHistory(vo);
        reserveMapper.insertReserveItemHistory(vo);

        if (vo.getReservationState() != null) {
            if (vo.getReservationState() == 3) { // 예약 변경
                notitokService.notitokSendReserveChange(vo.getReservationId());
            }

            if (vo.getReservationState() == 0) { // 예약 취소
                notitokService.notitokSendReserveCancel(vo.getReservationId());
            }
        }
    }

    @Override
    public List<CenterVO> selectCenterList(ReserveVO vo) throws Exception {
        return userReserveMapper.selectCenterList(vo);
    }

    @Override
    public List<CheckupItemVO> selectCheckupContractItemList(ReserveVO vo) throws Exception {
        return userReserveMapper.selectCheckupContractItemList(vo);
    }

    @Override
    public List<CheckupRegisterVO> selectCheckupRegisterList(ReserveVO vo) throws Exception {
        return userReserveMapper.selectCheckupRegisterList(vo);
    }

    @Override
    public List<CheckupItemClassVO> selectCheckupItemClassList() throws Exception {
        return userReserveMapper.selectCheckupItemClassList();
    }
}
