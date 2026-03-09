package kr.co.dsong.ggsj.codemanage.service.impl;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import kr.co.dsong.ggsj.codemanage.service.ItemCodeService;
import kr.co.dsong.ggsj.codemanage.service.mapper.ItemCodeMapper;
import kr.co.dsong.ggsj.codemanage.vo.ItemCodeVO;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class ItemCodeServiceImpl extends EgovAbstractServiceImpl implements ItemCodeService {

    @Resource
    private ItemCodeMapper itemCodeMapper;

    @Override
    public List<ItemCodeVO> selectItemCodeList() throws Exception {
        return itemCodeMapper.selectItemCodeList();
    }

    @Override
    public void insertItemCode(ItemCodeVO vo) throws Exception {
        if ("class".equals(vo.getItemType())) {
            itemCodeMapper.insertItemClass(vo);
        } else if ("category".equals(vo.getItemType())) {
            itemCodeMapper.insertItemCategory(vo);
        } else if ("item".equals(vo.getItemType())) {
            itemCodeMapper.insertItem(vo);
        } else {
            itemCodeMapper.insertItemSub(vo);
        }
    }

    @Override
    public void updateItemCode(ItemCodeVO vo) throws Exception {
        if ("class".equals(vo.getItemType())) {
            itemCodeMapper.updateItemClass(vo);
        } else if ("category".equals(vo.getItemType())) {
            itemCodeMapper.updateItemCategory(vo);
        } else if ("item".equals(vo.getItemType())) {
            itemCodeMapper.updateItem(vo);
        } else {
            itemCodeMapper.updateItemSub(vo);
        }
    }

    @Override
    public void deleteItemCode(ItemCodeVO vo) throws Exception {
        if ("class".equals(vo.getItemType())) {
            itemCodeMapper.deleteItemClass(vo);
        } else if ("category".equals(vo.getItemType())) {
            itemCodeMapper.deleteItemCategory(vo);
        } else if ("item".equals(vo.getItemType())) {
            itemCodeMapper.deleteItem(vo);
        } else {
            itemCodeMapper.deleteItemSub(vo);
        }
    }

    @Override
    public void saveItemCodeList(List<ItemCodeVO> vo) throws Exception {
        for (ItemCodeVO itemCodeVo : vo) {
            switch (itemCodeVo._crudType) {
                case INSERT:
                    if ("class".equals(itemCodeVo.getItemType())) {
                        itemCodeMapper.insertItemClass(itemCodeVo);
                    } else if ("category".equals(itemCodeVo.getItemType())) {
                        itemCodeMapper.insertItemCategory(itemCodeVo);
                    } else if ("item".equals(itemCodeVo.getItemType())) {
                        itemCodeMapper.insertItem(itemCodeVo);
                    } else {
                        itemCodeMapper.insertItemSub(itemCodeVo);
                    }
                    break;
                case UPDATE:
                    if ("class".equals(itemCodeVo.getItemType())) {
                        itemCodeMapper.updateItemClass(itemCodeVo);
                    } else if ("category".equals(itemCodeVo.getItemType())) {
                        itemCodeMapper.updateItemCategory(itemCodeVo);
                    } else if ("item".equals(itemCodeVo.getItemType())) {
                        itemCodeMapper.updateItem(itemCodeVo);
                    } else {
                        itemCodeMapper.updateItemSub(itemCodeVo);
                    }
                    break;
                case REMOVE:
                    if ("class".equals(itemCodeVo.getItemType())) {
                        itemCodeMapper.deleteItemClass(itemCodeVo);
                    } else if ("category".equals(itemCodeVo.getItemType())) {
                        itemCodeMapper.deleteItemCategory(itemCodeVo);
                    } else if ("item".equals(itemCodeVo.getItemType())) {
                        itemCodeMapper.deleteItem(itemCodeVo);
                    } else {
                        itemCodeMapper.deleteItemSub(itemCodeVo);
                    }
                    break;
                default:
                    break;
            }
        }
    }
}
