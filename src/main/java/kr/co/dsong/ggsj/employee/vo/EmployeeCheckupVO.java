package kr.co.dsong.ggsj.employee.vo;

import kr.co.dsong.ggsj.common.vo.BaseVO;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.util.Date;

@Data
@EqualsAndHashCode(callSuper = true)
public class EmployeeCheckupVO extends BaseVO {

    private Integer employeeCheckupId;
    private Integer userId;
    private Integer companyCheckupId;
    private Boolean vip;
    private Integer supportType;
    private Integer companyCheckupTypeId;
    private String companyCheckupTypeName;
    private String companyCheckupTypeCode;
    private Boolean specialCheckup;
    private String specialCheckupMemo;
    private String notes;

    private Boolean notokGuide;
    private Boolean notokReserve;
    private Boolean notokUrge;
    private Date notokUpdatedAt;
    private Integer notokUpdatedUserId;

    private Boolean termsOfUse;
    private Boolean privacyPolicy;
    private Boolean collectionAndUse;

    private Integer companyId;
    private Integer checkupYear;
}
