package kr.co.sitebuilder.notitok.vo;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.ToString;

import java.util.List;

@Data
@EqualsAndHashCode(callSuper = true)
@ToString(callSuper = true)
public class NotitokAligoTemplateListVO extends NotitokAuthAligoVO {
    private List<NotitokAligoTemplateVO> list;
}
