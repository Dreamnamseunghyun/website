package kr.co.sitebuilder.company.vo;

import kr.co.sitebuilder.common.vo.BaseVO;
import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper = true)
public class CompanyApplyCountVO extends BaseVO {

    private Integer userId;
    private Integer companyCheckupId;
    private Integer centerId;
    private Integer applyCount;
}
