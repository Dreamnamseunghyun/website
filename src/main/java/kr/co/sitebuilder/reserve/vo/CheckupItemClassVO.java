package kr.co.sitebuilder.reserve.vo;

import kr.co.sitebuilder.common.vo.BaseVO;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.util.List;

@Data
@EqualsAndHashCode(callSuper = true)
public class CheckupItemClassVO extends BaseVO {

    private Integer itemClassId;
    private String itemClassCode;
    private String itemClassName;

    private List<CheckupItemCategoryVO> checkupItemCategories;

    public Integer getItemCount() {
        int count = 0;
        for (CheckupItemCategoryVO checkupItemCategory : checkupItemCategories) {
            count += checkupItemCategory.getCheckupItems().size();
        }

        return count;
    }
}
