package kr.co.sitebuilder.common;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Property {

    private String version;

    public static final String SESSION_USER_ID = "SESSION_USER_ID";
    public static final String SESSION_PHONE_NUMBER = "SESSION_PHONE_NUMBER";
    public static final String SESSION_E_MAIL = "SESSION_E_MAIL";
    public static final String SESSION_USER_NAME = "SESSION_USER_NAME";
    public static final String SESSION_USER = "SESSION_USER";

}
