package kr.co.sitebuilder.result.vo;

import com.fasterxml.jackson.annotation.JsonIgnore;
import kr.co.sitebuilder.common.vo.BaseVO;
import kr.co.sitebuilder.util.AESCrypto128;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.util.Date;
import java.util.List;

@Data
@EqualsAndHashCode(callSuper = true)
public class ResultEmployeeVO extends BaseVO {

    private Integer checkupResultEmployeeId;
    private Integer checkupResultId;
    private Integer employeeCheckupId;
    private Integer centerId;
    private Integer centerCode;
    private String employeeCode;
    private Integer checkupYear;
    private String companyCode;

    //private String employeeName;
    @JsonIgnore
    private String employeeNameCrypt;

    private Integer hospitalCode;
    private Date birth;
    private String sex;
    private Date checkupedAt;
    private Date employeeRegisteredAt;
    private String review;

    private List<ResultItemVO> resultItems;

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
}
