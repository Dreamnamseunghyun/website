package kr.co.dsong.ggsj.hospital.service.mapper;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import kr.co.dsong.ggsj.hospital.vo.HsuItemsVO;
import kr.co.dsong.ggsj.hospital.vo.HsubcontractVO;

import java.util.List;

@Mapper
public interface HsubcontractMapper {
    HsubcontractVO selectHsub(HsubcontractVO vo) throws Exception;

    List<HsuItemsVO> selectHsubItems(HsuItemsVO vo) throws Exception;

    void insertCheckupContractSub(HsubcontractVO vo) throws Exception;

    void insertItemClass(HsuItemsVO vo) throws Exception;

    void insertItemCategory(HsuItemsVO vo) throws Exception;

    void insertItem(HsuItemsVO vo) throws Exception;

    void updateCheckupContractSub(HsubcontractVO vo) throws Exception;

    void updateItemClass(HsuItemsVO vo) throws Exception;

    void updateItemCategory(HsuItemsVO vo) throws Exception;

    void updateItem(HsuItemsVO vo) throws Exception;

    void deleteItemClass(HsuItemsVO vo) throws Exception;

    void deleteItemCategory(HsuItemsVO vo) throws Exception;

    void deleteItem(HsuItemsVO vo) throws Exception;
}
