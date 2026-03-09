package kr.co.dsong.ggsj.notitok.vo;

import lombok.Data;

import java.util.List;

@Data
public class NotitokAligoTemplateVO {
    private String token;

    private String templtContent;
    private String templtName;
    private String status;
    private String inspStatus;
    private String senderKey;
    private String cdate;
    private String templtCode;

    private List<NotitokAligoButtonVO> buttons;

    //private List<String> comments;
}
