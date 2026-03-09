package kr.co.sitebuilder.employee.vo;

import com.fasterxml.jackson.annotation.JsonIgnore;
import kr.co.sitebuilder.user.vo.UserVO;
import kr.co.sitebuilder.util.AESCrypto128;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.ToString;
import lombok.extern.slf4j.Slf4j;

import java.util.Date;

@Slf4j
@Data
@EqualsAndHashCode(callSuper = true)
@ToString(callSuper = true)
public class EmployeeVO extends UserVO {

    private Integer companyId;
    private String companyName;
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

    //private String familyName;
    @JsonIgnore
    private String familyNameCrypt;

    private Integer totalCount;
    private Integer applyCount;
    private Integer checkupCount;

    private Integer checkupYear;
    private Integer checkId;

    private Integer userId;
    private EmployeeCheckupVO employeeCheckup;

    private Integer reservationId;

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

    // region familyName
    public String getFamilyName() throws Exception {
        //log.info("getFamilyName" + familyNameStore);
        AESCrypto128 crypto128 = AESCrypto128.getInstance();
        return crypto128.decrypt(familyNameCrypt);
    }

    public void setFamilyName(String familyName) throws Exception {
        AESCrypto128 crypto128 = AESCrypto128.getInstance();
        familyNameCrypt = crypto128.encrypt(familyName);
        //log.info("setFamilyName " + familyName + " store " + familyNameStore);
    }
    // endregion
}
