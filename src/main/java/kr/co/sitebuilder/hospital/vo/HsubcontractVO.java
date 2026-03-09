package kr.co.sitebuilder.hospital.vo;


import kr.co.sitebuilder.common.vo.BaseVO;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.util.List;

@Data
@EqualsAndHashCode(callSuper = true)
public class HsubcontractVO extends BaseVO {

    private Integer hospitalId;
    private String hospitalName;
    private String centerName;
    private Integer centerId;
    private Integer companyId;
    private String companyName;
    private Integer companyCheckupId;
    private Integer checkupYear;
    private Integer companyCheckupTypeId;
    private String companyCheckupTypeCode;
    private String companyCheckupTypeName;
    private Integer checkupContractSubTypeId;
    private Integer checkupContractTypeId;
    private String subTypeName;
    private Integer supportPay;
    private Integer hospitalPay;
    private Integer copay;
    private Integer selectACount;
    private String selectAMemo;
    private Integer selectBCount;
    private String selectBMemo;
    private Integer selectCCount;
    private String selectCMemo;
    private Integer selectDCount;
    private String selectDMemo;
    private Integer selectECount;
    private String selectEMemo;
    private Integer selectFCount;
    private String selectFMemo;

    private List<HsuItemsVO> HsubItems;
}
