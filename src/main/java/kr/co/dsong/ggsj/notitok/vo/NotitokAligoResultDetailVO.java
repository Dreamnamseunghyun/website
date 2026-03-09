package kr.co.dsong.ggsj.notitok.vo;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper = true)
public class NotitokAligoResultDetailVO extends NotitokAligoVO {
    private String msgid;
    private String type;
    private String sender;
    private String phone;
    private Integer status;
    private String reqdate;
    private String sentdate;
    private String rsltdate;
    private String reportdate;
    private String rslt;
    private String rslt_message;
    private String message;
    private String button_json;
    private String tpl_code;
    private String senderKey;
    private String smid;
}

