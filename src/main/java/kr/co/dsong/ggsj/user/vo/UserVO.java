package kr.co.dsong.ggsj.user.vo;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonProperty;
import kr.co.dsong.ggsj.common.vo.BaseVO;
import kr.co.dsong.ggsj.util.AESCrypto128;
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

    // employee 로그인 시에만 사용
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
