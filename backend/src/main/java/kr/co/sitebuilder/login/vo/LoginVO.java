package kr.co.sitebuilder.login.vo;

import java.io.Serializable;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class LoginVO implements Serializable {

    private static final long serialVersionUID = 1L;

    private Long userSeq;
    private String id;
    private String password;
    private String name;
    private String phoneNumber;
    private String email;
    private String birth;
    private String admin;
}
