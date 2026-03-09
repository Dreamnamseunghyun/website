package kr.co.sitebuilder.hospital.service.impl;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import kr.co.sitebuilder.hospital.service.HsubcontractService;
import kr.co.sitebuilder.hospital.service.mapper.HsubcontractMapper;
import kr.co.sitebuilder.hospital.vo.HsuItemsVO;
import kr.co.sitebuilder.hospital.vo.HsubcontractVO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Slf4j
@Service
public class HsubcontractImpl extends EgovAbstractServiceImpl implements HsubcontractService {

    @Resource
    private HsubcontractMapper hsubcontractMapper;

    @Override
    public HsubcontractVO selectHsub(HsubcontractVO vo) throws Exception {
        vo = hsubcontractMapper.selectHsub(vo);

        HsuItemsVO subItems = new HsuItemsVO();
        subItems.setHospitalId(vo.getHospitalId());
        subItems.setCheckupYear(vo.getCheckupYear());
        subItems.setCheckupContractSubTypeId(vo.getCheckupContractSubTypeId());

        vo.setHsubItems(hsubcontractMapper.selectHsubItems(subItems));

        return vo;
    }

    @Override
    public void insertCheckupContractSub(HsubcontractVO vo) throws Exception {
        HsubcontractVO hsubcontract = new HsubcontractVO();
        hsubcontract.setCenterId(vo.getCenterId());

        hsubcontractMapper.insertCheckupContractSub(vo);

        for (HsuItemsVO hsuItemsVO : vo.getHsubItems()) {
            hsuItemsVO.setCheckupContractSubTypeId(vo.getCheckupContractSubTypeId());
            hsubcontractMapper.insertItemCategory(hsuItemsVO);
            hsubcontractMapper.insertItemClass(hsuItemsVO);
            hsubcontractMapper.insertItem(hsuItemsVO);
        }
    }

    @Override
    public void insertItemCode(HsuItemsVO vo) throws Exception {
        if ("class".equals(vo.getItemType())) {
            hsubcontractMapper.insertItemClass(vo);
        } else if ("category".equals(vo.getItemType())) {
            hsubcontractMapper.insertItemCategory(vo);
        } else {
            hsubcontractMapper.insertItem(vo);
        }
    }

    @Override
    public void updateItemCode(HsuItemsVO vo) throws Exception {
        if ("class".equals(vo.getItemType())) {
            hsubcontractMapper.updateItemClass(vo);
        } else if ("category".equals(vo.getItemType())) {
            hsubcontractMapper.updateItemCategory(vo);
        } else {
            hsubcontractMapper.updateItem(vo);
        }
    }

    @Override
    public void saveItemCodeList(List<HsuItemsVO> listvo) throws Exception {
        for (HsuItemsVO hsuItemsVo : listvo) {
            switch (hsuItemsVo._crudType) {
                case INSERT:
                    if ("class".equals(hsuItemsVo.getItemType())) {
                        hsubcontractMapper.insertItemClass(hsuItemsVo);
                    } else if ("category".equals(hsuItemsVo.getItemType())) {
                        hsubcontractMapper.insertItemCategory(hsuItemsVo);
                    } else {
                        hsubcontractMapper.insertItem(hsuItemsVo);
                    }
                    break;
                case UPDATE:
                    if ("class".equals(hsuItemsVo.getItemType())) {
                        hsubcontractMapper.updateItemClass(hsuItemsVo);
                    } else if ("category".equals(hsuItemsVo.getItemType())) {
                        hsubcontractMapper.updateItemCategory(hsuItemsVo);
                    } else {
                        hsubcontractMapper.updateItem(hsuItemsVo);
                    }
                    break;
                case REMOVE:
                    if ("class".equals(hsuItemsVo.getItemType())) {
                        hsubcontractMapper.deleteItemClass(hsuItemsVo);
                    } else if ("category".equals(hsuItemsVo.getItemType())) {
                        hsubcontractMapper.deleteItemCategory(hsuItemsVo);
                    } else {
                        hsubcontractMapper.deleteItem(hsuItemsVo);
                    }
                    break;
                default:
                    break;
            }
        }
    }
}
