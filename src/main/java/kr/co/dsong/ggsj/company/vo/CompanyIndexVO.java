package kr.co.dsong.ggsj.company.vo;

import kr.co.dsong.ggsj.common.vo.BaseVO;
import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper = true)
public class CompanyIndexVO extends BaseVO {

    private Integer userId;
    private Integer companyCheckupId;
    private Integer companyId;
    private String companyName;
    private Integer centerId;
    private String hospitalCenterName;

    private Integer totalCount;
    private Integer applyCount;
    private Integer checkupedCount;
    private Integer nonCount;
}
