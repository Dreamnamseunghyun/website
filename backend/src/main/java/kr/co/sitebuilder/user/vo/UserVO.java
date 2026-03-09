package kr.co.sitebuilder.user.vo;

import java.io.Serializable;
import java.time.LocalDateTime;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class UserVO implements Serializable {

    private static final long serialVersionUID = 1L;

    private Long userSeq;

    private String id;
    private String password;
    private String name;

    private String phoneNumber;
    private String eMail;

    private String birth;

    private String admin;

    private LocalDateTime createdAt;
    private String createdUser;

    private LocalDateTime updatedAt;
    private String updatedUser;

    private LocalDateTime deletedAt;
    private String deletedUser;

}
