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
public class CompanyManagerVO extends UserVO {

    private Integer companyId;
    private String companyManagerCode;

    //private String companyManagerName;
    @JsonIgnore
    private String companyManagerNameCrypt;

    private Boolean noUse;
    private Boolean contract;
    private Boolean result;
    private Boolean account;
    private String email;
    private String telephone;
    private String mobile;
    private String notes;

    // region centerManagerName
    public String getCompanyManagerName() throws Exception {
        //log.info("getEmployeeName" + employeeNameStore);
        AESCrypto128 crypto128 = AESCrypto128.getInstance();
        return crypto128.decrypt(companyManagerNameCrypt);
    }

    public void setCompanyManagerName(String companyManagerName) throws Exception {
        AESCrypto128 crypto128 = AESCrypto128.getInstance();
        companyManagerNameCrypt = crypto128.encrypt(companyManagerName);
        //log.info("setEmployeeName " + employeeName + " store " + employeeNameStore);
    }
    // endregion
}
