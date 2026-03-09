package kr.co.dsong.ggsj.contract.service.impl;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import kr.co.dsong.ggsj.contract.service.ContractService;
import kr.co.dsong.ggsj.contract.service.mapper.ContractMapper;
import kr.co.dsong.ggsj.contract.vo.*;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
@Slf4j
public class ContractServiceImpl extends EgovAbstractServiceImpl implements ContractService {

    @Resource
    private ContractMapper contractMapper;

    @Override
    public List<ContractVO> selectContractList(ContractVO vo) throws Exception {
        return contractMapper.selectContractList(vo);
    }

    @Override
    public List<ContractVO> selectCmContractList(ContractVO vo) throws Exception {
        return contractMapper.selectCmContractList(vo);
    }

    @Override
    public void saveContractList(List<ContractVO> vo) throws Exception {
        for (ContractVO contract : vo) {
            if (contract.getCenterId() == null) {
                continue;
            }

            contractMapper.insertContract(contract);

            for (ContractTypeVO contractType : contract.getContractTypes()) {
                contractType.setCenterId(contract.getCenterId());
                contractType.setCheckupContractId(contract.getCheckupContractId());
                if (contractType.getRegister()) {
                    contractMapper.insertContractType(contractType);
                } else if (contractType.getCheckupContractTypeId() != null) {
                    CheckupContractSubTypeVO sub = new CheckupContractSubTypeVO();
                    sub.setCheckupContractTypeId(contractType.getCheckupContractTypeId());

                    contractMapper.deleteCheckupContractSubType(sub);
                    contractMapper.deleteContractType(contractType);
                }
            }

            contractMapper.deleteContract(contract);
        }
    }

    @Override
    public List<CheckupContractVO> selectPmContractTypeList(CheckupContractVO vo) throws Exception {
        return contractMapper.selectPmContractTypeList(vo);
    }

    @Override
    public List<CheckupContractSubTypeVO> selectHmCheckupContractSubType(CheckupContractSubTypeVO vo) throws Exception {
        return contractMapper.selectHmCheckupContractSubType(vo);
    }

    @Override
    public CheckupContractSubTypeVO selectPmCheckupContractSubTypeCreate(CheckupContractSubTypeVO vo) throws Exception {
        vo = contractMapper.selectPmCheckupContractSubTypeCreate(vo);
        vo.setCheckupContractItems(contractMapper.selectPmCheckupContractSubTypeItemCreate(vo));

        return vo;
    }

    @Override
    public CheckupContractSubTypeVO selectPmCheckupContractSubType(CheckupContractSubTypeVO vo) throws Exception {
        vo = contractMapper.selectPmCheckupContractSubType(vo);
        vo.setCheckupContractItems(contractMapper.selectPmCheckupContractSubTypeItem(vo));

        return vo;
    }

    @Override
    public void savePmCheckupContractSubType(CheckupContractSubTypeVO vo) throws Exception {
        switch (vo._crudType) {
            case INSERT:
                contractMapper.insertCheckupContractSubType(vo);
                break;
            case UPDATE:
                contractMapper.updateCheckupContractSubType(vo);
                break;
            case REMOVE:
                contractMapper.deleteCheckupContractSubType(vo);
                break;
            default:
                break;
        }

        if (vo.getCheckupContractItems() == null) {
            return;
        }

        for (CheckupContractItemVO itemVO : vo.getCheckupContractItems()) {
            itemVO.setCheckupContractSubTypeId(vo.getCheckupContractSubTypeId());

            // Tree Key to Org Key
            itemVO.setId(itemVO.getId() - 1000000);

            contractMapper.saveCheckupContractItem(itemVO);
        }
    }

    @Override
    public void insertCheckupContractReview(CheckupContractReviewVO vo) throws Exception {
        contractMapper.insertCheckupContractReview(vo);
    }

    @Override
    public List<CheckupContractVO> selectHmContractTypeList(CheckupContractVO vo) throws Exception {
        return contractMapper.selectHmContractTypeList(vo);
    }
}
