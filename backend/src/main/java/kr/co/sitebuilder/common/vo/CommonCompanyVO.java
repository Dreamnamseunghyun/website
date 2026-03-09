package kr.co.sitebuilder.common.vo;

import lombok.Data;

import java.util.Date;

@Data
public class CommonCompanyVO {

    private Integer companyId;
    private String companyCode;
    private String companyName;
    private String businessNo;
    private String idPlaceHolder;
    private Integer pwType;
    private Boolean noUse;
    private Boolean useNotiTalk;
    private String ciUrl;

    private Integer companyCheckupId;
    private Integer checkupYear;
    private Date checkupDateBegin;
    private Date checkupDateEnd;
    private Date reserveDateBegin;
    private Date reserveDateEnd;
}
