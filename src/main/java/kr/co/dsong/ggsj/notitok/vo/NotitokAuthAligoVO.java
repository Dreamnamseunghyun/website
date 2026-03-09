package kr.co.dsong.ggsj.notitok.vo;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper = true)
public class NotitokAuthAligoVO extends NotitokAligoVO {
    private String token;
    private String urlencode;
}
