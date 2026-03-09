package kr.co.dsong.ggsj.hospital.vo;


import kr.co.dsong.ggsj.common.vo.BaseVO;
import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper = true)
public class HsuItemsVO extends BaseVO {

    private Integer Id;
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
    private String register;
    private Integer copay;
    private Integer discountBill;
}
