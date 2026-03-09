package kr.co.sitebuilder.notitok.vo;

import lombok.Data;
import lombok.EqualsAndHashCode;

import java.util.List;

@Data
@EqualsAndHashCode(callSuper = true)
public class NotitokAligoResultList extends NotitokAligoVO {
    private List<NotitokAligoResultDetailVO> list;
    private Integer currentPage;
    private Integer totalPage;
    private Integer totalCount;
}
