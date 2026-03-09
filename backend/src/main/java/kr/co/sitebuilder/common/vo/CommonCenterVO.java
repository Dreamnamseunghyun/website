package kr.co.sitebuilder.common.vo;

import lombok.Data;

@Data
public class CommonCenterVO {

    private Integer hospitalId;
    private String hospitalCode;
    private String hospitalName;
    private Integer centerId;
    private String centerCode;
    private String centerName;
    private String hospitalCenterName;
}
