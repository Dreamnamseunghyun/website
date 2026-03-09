package kr.co.sitebuilder.reserve.service;

import kr.co.sitebuilder.company.vo.CompanyCheckupTypeVO;
import kr.co.sitebuilder.hospital.vo.CenterVO;
import kr.co.sitebuilder.reserve.vo.CheckupItemClassVO;
import kr.co.sitebuilder.reserve.vo.CheckupItemVO;
import kr.co.sitebuilder.reserve.vo.CheckupRegisterVO;
import kr.co.sitebuilder.reserve.vo.ReserveVO;

import java.util.List;

public interface UserReserveService {

    List<CompanyCheckupTypeVO> selectCopayCompanyCheckupTypeList() throws Exception;

    List<ReserveVO> selectReserveList() throws Exception;

    ReserveVO selectReserve(ReserveVO vo) throws Exception;

    void insertReserve(ReserveVO vo) throws Exception;

    void updateReserve(ReserveVO vo) throws Exception;

    List<CenterVO> selectCenterList(ReserveVO vo) throws Exception;

    List<CheckupItemVO> selectCheckupContractItemList(ReserveVO vo) throws Exception;

    List<CheckupRegisterVO> selectCheckupRegisterList(ReserveVO vo) throws Exception;

    List<CheckupItemClassVO> selectCheckupItemClassList() throws Exception;
}
