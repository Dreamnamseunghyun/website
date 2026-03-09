package kr.co.sitebuilder.user.vo;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonProperty;
import kr.co.sitebuilder.common.vo.BaseVO;
import kr.co.sitebuilder.util.AESCrypto128;
import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper = true)
public class UserVO extends BaseVO {

    private Integer userId;
    private String userType;

    @JsonProperty(access = JsonProperty.Access.WRITE_ONLY)
    private String userPw;

    private String loginId;

    //private String loginName;
    @JsonIgnore
    private String loginNameCrypt;

    private Integer typeId;
    private Integer subTypeId;

    // employee 濡쒓렇???쒖뿉留??ъ슜
    private String companyCode;

    // region loginName
    public String getLoginName() throws Exception {
        //log.info("getEmployeeName" + employeeNameStore);
        AESCrypto128 crypto128 = AESCrypto128.getInstance();
        return crypto128.decrypt(loginNameCrypt);
    }

    public void setLoginName(String loginName) throws Exception {
        AESCrypto128 crypto128 = AESCrypto128.getInstance();
        loginNameCrypt = crypto128.encrypt(loginName);
        //log.info("setEmployeeName " + employeeName + " store " + employeeNameStore);
    }
    // endregion
}
