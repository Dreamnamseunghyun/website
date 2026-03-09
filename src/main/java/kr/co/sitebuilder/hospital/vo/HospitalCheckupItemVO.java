package kr.co.sitebuilder.hospital.vo;

import kr.co.sitebuilder.common.vo.BaseVO;
import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper = true)
public class HospitalCheckupItemVO extends BaseVO {
    private Integer id;
    private Integer keyId;
    private Integer parentId;
    private Integer keyParentId;
    private String itemType;
    private String code;
    private String name;

    private Integer hospitalCheckupId;
    private Integer hospitalId;
    private Integer checkupYear;

    private Integer bill;

}
