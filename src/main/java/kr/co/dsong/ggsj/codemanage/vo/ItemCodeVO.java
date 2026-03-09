package kr.co.dsong.ggsj.codemanage.vo;

import kr.co.dsong.ggsj.common.vo.BaseVO;
import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper = true)
public class ItemCodeVO extends BaseVO {

    private Integer id;
    private Integer keyId;
    private Integer parentId;
    private Integer keyParentId;
    private Integer refMmin;
    private Integer refMmax;
    private Integer refFmin;
    private Integer refFmax;

    private String code;
    private String name;
    private String refUnit;

    private String itemDesc;
    private String itemType;

    private Boolean resultUse;
    private Boolean noUse;
}
