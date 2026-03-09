package kr.co.sitebuilder.contract.vo;

import kr.co.sitebuilder.common.vo.BaseVO;
import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper = true)
public class ContractTypeVO extends BaseVO {

    // Checkup Contract Table
    private Integer checkupContractId;

    // Company Checkup Type Table
    private Integer companyCheckupTypeId;
    private String companyCheckupTypeCode;
    private String companyCheckupTypeName;
    private Integer supportPay;
    private Integer copay;
    private Integer hospitalPay;
    private Integer platformPay;

    // Checkup Contract Type Table
    private Integer checkupContractTypeId;
    private Integer centerId;
    private Boolean register;
}
