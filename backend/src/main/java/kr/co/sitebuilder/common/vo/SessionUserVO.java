package kr.co.sitebuilder.common.vo;

import java.io.Serializable;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class SessionUserVO implements Serializable {

    private static final long serialVersionUID = 1L;

    private String id;

    private String phoneNumber;

    private String eMail;

    private String name;

}
