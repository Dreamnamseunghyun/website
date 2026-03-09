package kr.co.dsong.ggsj.reserve.vo;

import kr.co.dsong.ggsj.common.vo.BaseVO;
import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper = true)
public class ReserveItemVO extends BaseVO {

    private Integer reservationId;
    private Integer reservationItemId;
    private Integer checkupContractItemId;
    private String register;
    private Integer copay;
    private Integer discountBill;
    private Integer itemId;
    private String itemCode;
    private String itemName;
    private String itemDesc;
}
