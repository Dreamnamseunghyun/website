package kr.co.dsong.ggsj.notitok.vo;

import lombok.Data;

@Data
public class NotitokAligoSendInfoVO {
    private String type;
    private Long mid;
    private Float current;
    private Float unit;
    private Float total;
    private Integer scnt;
    private Integer fcnt;
}
