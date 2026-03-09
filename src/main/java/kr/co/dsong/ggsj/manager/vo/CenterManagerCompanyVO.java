package kr.co.dsong.ggsj.manager.vo;

import kr.co.dsong.ggsj.common.vo.BaseVO;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.util.List;

@Data
@EqualsAndHashCode(callSuper = true)
public class CenterManagerCompanyVO extends BaseVO {

    private Integer centerManagerCompanyId;
    private Integer userId;
    private Integer companyId;
    private Integer centerId;
    private String companyName;
    private Boolean contract;
    private Boolean reserve;
    private Boolean result;
    private Integer checkupYear;

    private List<CenterManagerCompanyVO> centerManagerCompanies;
}
