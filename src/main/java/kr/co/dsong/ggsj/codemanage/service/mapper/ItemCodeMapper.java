package kr.co.dsong.ggsj.codemanage.service.mapper;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import kr.co.dsong.ggsj.codemanage.vo.ItemCodeVO;

import java.util.List;

@Mapper
public interface ItemCodeMapper {

    List<ItemCodeVO> selectItemCodeList() throws Exception;

    void insertItemClass(ItemCodeVO vo) throws Exception;

    void insertItemCategory(ItemCodeVO vo) throws Exception;

    void insertItem(ItemCodeVO vo) throws Exception;

    void insertItemSub(ItemCodeVO vo) throws Exception;

    void updateItemClass(ItemCodeVO vo) throws Exception;

    void updateItemCategory(ItemCodeVO vo) throws Exception;

    void updateItem(ItemCodeVO vo) throws Exception;

    void updateItemSub(ItemCodeVO vo) throws Exception;

    void deleteItemClass(ItemCodeVO vo) throws Exception;

    void deleteItemCategory(ItemCodeVO vo) throws Exception;

    void deleteItem(ItemCodeVO vo) throws Exception;

    void deleteItemSub(ItemCodeVO vo) throws Exception;
}
