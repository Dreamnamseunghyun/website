package kr.co.dsong.ggsj.company.vo;

import kr.co.dsong.ggsj.common.vo.BaseVO;
import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper = true)
public class CompanyCheckupedCountVO extends BaseVO {

    private Integer userId;
    private Integer companyCheckupId;
    private Integer centerId;
    private Integer checkupedCount;
}
