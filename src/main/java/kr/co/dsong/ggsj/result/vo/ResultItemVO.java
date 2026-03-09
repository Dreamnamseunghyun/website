package kr.co.dsong.ggsj.result.vo;

import kr.co.dsong.ggsj.common.vo.BaseVO;
import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper = true)
public class ResultItemVO extends BaseVO {

    private Integer checkupResultId;
    private Integer checkupResultItemId;
    private Integer checkupResultEmployeeId;
    private String itemCode;
    private String itemCategory;
    private String itemName;
    private String count;
    private String resultValue;
}
