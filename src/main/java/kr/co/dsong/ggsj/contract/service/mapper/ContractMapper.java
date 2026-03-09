package kr.co.dsong.ggsj.contract.service.mapper;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import kr.co.dsong.ggsj.contract.vo.*;

import java.util.List;

@Mapper
public interface ContractMapper {
    List<ContractVO> selectContractList(ContractVO vo) throws Exception;

    List<ContractVO> selectCmContractList(ContractVO vo) throws Exception;

    void insertContract(ContractVO vo) throws Exception;

    void insertContractType(ContractTypeVO vo) throws Exception;

    void deleteContract(ContractVO vo) throws Exception;

    void deleteContractType(ContractTypeVO vo) throws Exception;

    void deleteContractSubType(CheckupContractSubTypeVO vo) throws Exception;

    List<CheckupContractVO> selectPmContractTypeList(CheckupContractVO vo) throws Exception;

    CheckupContractSubTypeVO selectPmCheckupContractSubTypeCreate(CheckupContractSubTypeVO vo) throws Exception;

    CheckupContractSubTypeVO selectPmCheckupContractSubType(CheckupContractSubTypeVO vo) throws Exception;

    List<CheckupContractSubTypeVO> selectHmCheckupContractSubType(CheckupContractSubTypeVO vo) throws Exception;

    List<CheckupContractItemVO> selectPmCheckupContractSubTypeItemCreate(CheckupContractSubTypeVO vo) throws Exception;

    List<CheckupContractItemVO> selectPmCheckupContractSubTypeItem(CheckupContractSubTypeVO vo) throws Exception;

    void insertCheckupContractSubType(CheckupContractSubTypeVO vo) throws Exception;

    void updateCheckupContractSubType(CheckupContractSubTypeVO vo) throws Exception;

    void deleteCheckupContractSubType(CheckupContractSubTypeVO vo) throws Exception;

    void saveCheckupContractItem(CheckupContractItemVO vo) throws Exception;

    void insertCheckupContractReview(CheckupContractReviewVO vo) throws Exception;

    List<CheckupContractVO> selectHmContractTypeList(CheckupContractVO vo) throws Exception;
}
