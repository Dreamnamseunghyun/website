package kr.co.sitebuilder.common.vo;

import lombok.Data;

@Data
public class CommonCompanyCheckupTypeVO {

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
