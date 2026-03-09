package kr.co.dsong.ggsj.contract.vo;

import kr.co.dsong.ggsj.common.vo.BaseVO;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.util.Date;

@Data
@EqualsAndHashCode(callSuper = true)
public class CheckupContractVO extends BaseVO {

    // Company Table
    private Integer companyId;
    private String companyCode;
    private String companyName;

    // Company Checkup Table
    private Integer companyCheckupId;
    private Integer checkupYear;

    // Company Checkup Type Table
    private Integer companyCheckupTypeId;
    private String companyCheckupTypeCode;
    private String companyCheckupTypeName;
    private Integer supportPay;
    private Integer copay;
    private Integer hospitalPay;
    private Integer platformPay;

    // Checkup Contract Table
    private Integer checkupContractId;
    private String writedUserName;
    private Date createdAt;

    // Checkup Contract Type Table
    private Integer checkupContractTypeId;

    // Checkup Contract SubType Table
    private Integer checkupContractSubTypeId;
    private String subTypeName;
    private Integer upgradePay;
    private Boolean confirmedCheck;

    // Hospital Table
    private Integer hospitalId;
    private String hospitalCode;
    private String hospitalName;

    // Center Table
    private Integer centerId;
    private String centerCode;
    private String centerName;

    // virtual
    private String hospitalCenterName;
    private String managerName;
}
