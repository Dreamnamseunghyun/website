package kr.co.sitebuilder.contract.service;

import kr.co.sitebuilder.contract.vo.CheckupContractReviewVO;
import kr.co.sitebuilder.contract.vo.CheckupContractSubTypeVO;
import kr.co.sitebuilder.contract.vo.CheckupContractVO;
import kr.co.sitebuilder.contract.vo.ContractVO;

import java.util.List;

public interface ContractService {

    List<ContractVO> selectContractList(ContractVO vo) throws Exception;

    List<ContractVO> selectCmContractList(ContractVO vo) throws Exception;

    void saveContractList(List<ContractVO> vo) throws Exception;

    List<CheckupContractVO> selectPmContractTypeList(CheckupContractVO vo) throws Exception;

    List<CheckupContractSubTypeVO> selectHmCheckupContractSubType(CheckupContractSubTypeVO vo) throws Exception;

    CheckupContractSubTypeVO selectPmCheckupContractSubTypeCreate(CheckupContractSubTypeVO vo) throws Exception;

    CheckupContractSubTypeVO selectPmCheckupContractSubType(CheckupContractSubTypeVO vo) throws Exception;

    void savePmCheckupContractSubType(CheckupContractSubTypeVO vo) throws Exception;

    void insertCheckupContractReview(CheckupContractReviewVO vo) throws Exception;

    List<CheckupContractVO> selectHmContractTypeList(CheckupContractVO vo) throws Exception;
}
