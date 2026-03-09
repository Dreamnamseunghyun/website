package kr.co.dsong.ggsj.notitok.vo;

import com.fasterxml.jackson.annotation.JsonIgnore;
import kr.co.dsong.ggsj.common.vo.BaseVO;
import kr.co.dsong.ggsj.util.AESCrypto128;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.util.Date;

@Data
@EqualsAndHashCode(callSuper = true)
public class NotitokItemVO extends BaseVO {
    private Integer userId;
    private Integer companyId;
    private Integer checkupYear;
    private Integer employeeCheckupId;
    private String employeeCode;

    //private String employeeName;
    @JsonIgnore
    private String employeeNameCrypt;

    private Boolean noUse;
    private String employeeNo;
    private Integer myself;
    private Date birth;
    private String sex;
    private String email;
    private String mobile;
    private String zipcode;
    private String address1;
    private String address2;
    private String depart;
    private String title;
    private Boolean notokGuide;
    private Boolean notokReserve;
    private Boolean notokUrge;
    private Boolean checkGuide;
    private Date notokUpdatedAt;

    private String hospitalName;
    private String centerName;
    private String centerManagerCode;

    //private String CenterManagerName;
    @JsonIgnore
    private String centerManagerNameCrypt;

    private String telephone;

    // region employeeName
    public String getEmployeeName() throws Exception {
        //log.info("getEmployeeName" + employeeNameStore);
        AESCrypto128 crypto128 = AESCrypto128.getInstance();
        return crypto128.decrypt(employeeNameCrypt);
    }

    public void setEmployeeName(String employeeName) throws Exception {
        AESCrypto128 crypto128 = AESCrypto128.getInstance();
        employeeNameCrypt = crypto128.encrypt(employeeName);
        //log.info("setEmployeeName " + employeeName + " store " + employeeNameStore);
    }
    // endregion

    // region CenterManagerName
    public String getCenterManagerName() throws Exception {
        //log.info("getEmployeeName" + employeeNameStore);
        AESCrypto128 crypto128 = AESCrypto128.getInstance();
        return crypto128.decrypt(centerManagerNameCrypt);
    }

    public void setCenterManagerName(String CenterManagerName) throws Exception {
        AESCrypto128 crypto128 = AESCrypto128.getInstance();
        centerManagerNameCrypt = crypto128.encrypt(CenterManagerName);
        //log.info("setEmployeeName " + employeeName + " store " + employeeNameStore);
    }
    // endregion
}
