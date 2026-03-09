package kr.co.dsong.ggsj.codemanage.service;

import kr.co.dsong.ggsj.codemanage.vo.ItemCodeVO;

import java.util.List;

public interface ItemCodeService {

    List<ItemCodeVO> selectItemCodeList() throws Exception;

    void insertItemCode(ItemCodeVO vo) throws Exception;

    void updateItemCode(ItemCodeVO vo) throws Exception;

    void deleteItemCode(ItemCodeVO vo) throws Exception;

    void saveItemCodeList(List<ItemCodeVO> vo) throws Exception;
}
