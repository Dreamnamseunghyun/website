package kr.co.dsong.ggsj.contract.vo;

import kr.co.dsong.ggsj.common.vo.BaseVO;
import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper = true)
public class CheckupContractItemVO extends BaseVO {
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

    private Integer checkupContractItemId;
    private Integer checkupContractSubTypeId;
    private String checkupContractItemMemo;
    private String register;
    private Integer copay;
    private Integer discountBill;
}
