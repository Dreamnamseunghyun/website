package kr.co.dsong.ggsj.company.vo;

import kr.co.dsong.ggsj.common.vo.BaseVO;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.util.Date;
import java.util.List;

@Data
@EqualsAndHashCode(callSuper = true)
public class CompanyCheckupVO extends BaseVO {

    private Integer companyCheckupId;
    private Integer companyId;

    private Integer checkupYear;
    private Integer employeeNumber;
    private Integer familyNumber;

    private Date checkupDateBegin;
    private Date checkupDateEnd;
    private Date reserveDateBegin;
    private Date reserveDateEnd;

    private Integer expectedTotalSupportPay;
    private Integer expectedTotalPlatformPay;
    private Integer expectedTotalEtcPay;

    private String salesManager;
    private String assistManager;
    private Integer userId;

    private String notes;

    private List<CompanyCheckupTypeVO> companyCheckupTypes;
}
