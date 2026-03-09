package kr.co.sitebuilder.reserve.service.mapper;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import kr.co.sitebuilder.company.vo.CompanyCheckupTypeVO;
import kr.co.sitebuilder.hospital.vo.CenterVO;
import kr.co.sitebuilder.reserve.vo.CheckupItemClassVO;
import kr.co.sitebuilder.reserve.vo.CheckupItemVO;
import kr.co.sitebuilder.reserve.vo.CheckupRegisterVO;
import kr.co.sitebuilder.reserve.vo.ReserveVO;

import java.util.List;

@Mapper
public interface UserReserveMapper {

    List<CompanyCheckupTypeVO> selectCopayCompanyCheckupTypeList(ReserveVO vo) throws Exception;

    List<ReserveVO> selectReserveList(ReserveVO vo) throws Exception;

    ReserveVO selectReserveDetail(ReserveVO vo) throws Exception;

    ReserveVO selectCheckupTypePay(ReserveVO vo) throws Exception;

    ReserveVO selectCheckupItemPay(ReserveVO vo) throws Exception;

    ReserveVO selectReserveState(ReserveVO vo) throws Exception;

    void deleteReservationItem(ReserveVO vo) throws Exception;

    void insertReservationItem(ReserveVO vo) throws Exception;

    void insertReserve(ReserveVO vo) throws Exception;

    void updateReserveNotes(ReserveVO vo) throws Exception;

    void updateReserve(ReserveVO vo) throws Exception;

    List<CenterVO> selectCenterList(ReserveVO vo) throws Exception;

    List<CheckupItemVO> selectCheckupContractItemList(ReserveVO vo) throws Exception;

    List<CheckupRegisterVO> selectCheckupRegisterList(ReserveVO vo) throws Exception;

    List<CheckupItemClassVO> selectCheckupItemClassList() throws Exception;
}
