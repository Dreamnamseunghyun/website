package kr.co.sitebuilder.contract.vo;

import kr.co.sitebuilder.common.vo.BaseVO;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.util.Date;
import java.util.List;

@Data
@EqualsAndHashCode(callSuper = true)
public class CheckupContractSubTypeVO extends BaseVO {

    // Company Table
    private Integer companyId;
    private String companyCode;
    private String companyName;

    // Company Checkup Table
    private Integer companyCheckupId;
    private Integer checkupYear;
    private String companyNameYear;

    // Hospital Table
    private Integer hospitalId;
    private String hospitalCode;
    private String hospitalName;

    // Center Table
    private Integer centerId;
    private String centerCode;
    private String centerName;
    private Integer head;
    private String hospitalCenterName;

    // Checkup Contract Type Table
    private Integer checkupContractTypeId;
    private Integer checkupContractId;
    private Integer companyCheckupTypeId;
    private String companyCheckupTypeCode;
    private String companyCheckupTypeName;

    // Checkup Contract Sub Type Table
    private Integer checkupContractSubTypeId;
    private String subTypeName;
    private Integer upgradePay;
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
    private Boolean confirmedCheck;
    private Date registeredAt;

    private List<CheckupContractTypeVO> checkupContractTypes;
    private List<CheckupContractItemVO> checkupContractItems;
    private List<CheckupContractReviewVO> checkupContractReviews;
}
