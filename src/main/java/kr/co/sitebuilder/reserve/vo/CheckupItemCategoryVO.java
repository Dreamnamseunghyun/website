package kr.co.sitebuilder.reserve.vo;

import kr.co.sitebuilder.common.vo.BaseVO;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.util.List;

@Data
@EqualsAndHashCode(callSuper = true)
public class CheckupItemCategoryVO extends BaseVO {

    private Integer itemCategoryId;
    private String itemCategoryCode;
    private String itemCategoryName;

    private List<CheckupItemVO> checkupItems;
}
