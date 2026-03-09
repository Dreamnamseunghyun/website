package kr.co.dsong.ggsj.reserve.service;

import kr.co.dsong.ggsj.company.vo.CompanyCheckupTypeVO;
import kr.co.dsong.ggsj.hospital.vo.CenterVO;
import kr.co.dsong.ggsj.reserve.vo.CheckupItemClassVO;
import kr.co.dsong.ggsj.reserve.vo.CheckupItemVO;
import kr.co.dsong.ggsj.reserve.vo.CheckupRegisterVO;
import kr.co.dsong.ggsj.reserve.vo.ReserveVO;

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
