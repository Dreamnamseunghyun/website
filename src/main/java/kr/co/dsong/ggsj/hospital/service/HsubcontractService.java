package kr.co.dsong.ggsj.hospital.service;

import kr.co.dsong.ggsj.hospital.vo.HsuItemsVO;
import kr.co.dsong.ggsj.hospital.vo.HsubcontractVO;

import java.util.List;

public interface HsubcontractService {
    HsubcontractVO selectHsub(HsubcontractVO vo) throws Exception;

    void insertCheckupContractSub(HsubcontractVO vo) throws Exception;

    void insertItemCode(HsuItemsVO vo) throws Exception;

    void updateItemCode(HsuItemsVO vo) throws Exception;

    void saveItemCodeList(List<HsuItemsVO> listvo) throws Exception;
}
