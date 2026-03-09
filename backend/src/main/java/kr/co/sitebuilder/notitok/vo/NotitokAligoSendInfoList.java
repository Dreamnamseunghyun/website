package kr.co.sitebuilder.notitok.vo;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper = true)
public class NotitokAligoSendInfoList extends NotitokAligoVO {
    private NotitokAligoSendInfoVO info;
}
