package kr.co.dsong.ggsj.manager.vo;

import com.fasterxml.jackson.annotation.JsonIgnore;
import kr.co.dsong.ggsj.user.vo.UserVO;
import kr.co.dsong.ggsj.util.AESCrypto128;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.ToString;

@Data
@EqualsAndHashCode(callSuper = true)
@ToString(callSuper = true)
public class ManagerVO extends UserVO {

    private String groupName;
    private String managerCode;

    //private String managerName;
    @JsonIgnore
    private String managerNameCrypt;

    private String mobile;
    private String telephone;
    private String email;
    private Integer userId;
    private Boolean noUse;
    private Boolean sales;
    private Boolean admin;
    private Boolean excutive;
    private Boolean outsales;
    private Boolean result;
    private Boolean contract;
    private Boolean account;
    private Boolean reserve;

    // region managerName
    public String getManagerName() throws Exception {
        //log.info("getEmployeeName" + employeeNameStore);
        AESCrypto128 crypto128 = AESCrypto128.getInstance();
        return crypto128.decrypt(managerNameCrypt);
    }

    public void setManagerName(String managerName) throws Exception {
        AESCrypto128 crypto128 = AESCrypto128.getInstance();
        managerNameCrypt = crypto128.encrypt(managerName);
        //log.info("setEmployeeName " + employeeName + " store " + employeeNameStore);
    }
    // endregion
}
