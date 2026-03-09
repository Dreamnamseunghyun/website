package kr.co.sitebuilder.reserve.vo;

import kr.co.sitebuilder.common.vo.BaseVO;
import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper = true)
public class CheckupItemVO extends BaseVO {

    private Integer itemId;
    private String itemCode;
    private String itemName;
    private String itemDesc;

    private Integer checkupContractItemId;
    private String checkupContractItemMemo;
    private String register;
    private Integer copay;
    private Integer discountBill;
    private Integer bill;
}
