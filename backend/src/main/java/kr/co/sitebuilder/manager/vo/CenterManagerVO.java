package kr.co.sitebuilder.manager.vo;

import com.fasterxml.jackson.annotation.JsonIgnore;
import kr.co.sitebuilder.user.vo.UserVO;
import kr.co.sitebuilder.util.AESCrypto128;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.ToString;

import java.util.List;

@Data
@EqualsAndHashCode(callSuper = true)
@ToString(callSuper = true)
public class CenterManagerVO extends UserVO {

    private Integer centerManagerCompanyId;
    private Integer centerId;
    private Integer hospitalId;
    private String hospitalCenterName;
    private String centerManagerCode;

    //private String centerManagerName;
    @JsonIgnore
    private String centerManagerNameCrypt;

    private Boolean noUse;
    private Boolean notokUrge;
    private String email;
    private String telephone;
    private String mobile;
    private String notes;

    private String centerName;
    private String hospitalName;

    private List<CenterManagerCompanyVO> centerManagerCompany;

    // region centerManagerName
    public String getCenterManagerName() throws Exception {
        //log.info("getEmployeeName" + employeeNameStore);
        AESCrypto128 crypto128 = AESCrypto128.getInstance();
        return crypto128.decrypt(centerManagerNameCrypt);
    }

    public void setCenterManagerName(String centerManagerName) throws Exception {
        AESCrypto128 crypto128 = AESCrypto128.getInstance();
        centerManagerNameCrypt = crypto128.encrypt(centerManagerName);
        //log.info("setEmployeeName " + employeeName + " store " + employeeNameStore);
    }
    // endregion
}
