package kr.co.sitebuilder.contract.vo;

import kr.co.sitebuilder.common.vo.BaseVO;
import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper = true)
public class CheckupContractTypeVO extends BaseVO {
    private Integer checkupContractTypeId;

    private Integer companyCheckupTypeId;
    private Integer companyCheckupId;

    private String companyCheckupTypeCode;
    private String companyCheckupTypeName;

    private Integer supportPay;
    private Integer copay;
    private Integer hospitalPay;
    private Integer platformPay;

    private Boolean typeSelf;
    private Boolean typeFamily;
    private Boolean typeCopay;
}
