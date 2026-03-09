package kr.co.dsong.ggsj.contract.vo;

import com.fasterxml.jackson.annotation.JsonIgnore;
import kr.co.dsong.ggsj.common.vo.BaseVO;
import kr.co.dsong.ggsj.util.AESCrypto128;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.ToString;

import java.util.Date;

@Data
@EqualsAndHashCode(callSuper = true)
@ToString(callSuper = true)
public class CheckupContractReviewVO extends BaseVO {

    private Integer checkupContractSubTypeId;
    private Integer checkupContractReviewId;
    private String review;
    private Date writedAt;

    //private String registeredUserName;
    @JsonIgnore
    private String registeredUserNameCrypt;
    //private String writedUserName;
    @JsonIgnore
    private String writedUserNameCrypt;


    // region managerName
    public String getRegisteredUserName() throws Exception {
        //log.info("getEmployeeName" + employeeNameStore);
        AESCrypto128 crypto128 = AESCrypto128.getInstance();
        return crypto128.decrypt(registeredUserNameCrypt);
    }

    public void setRegisteredUserName(String registeredUserName) throws Exception {
        AESCrypto128 crypto128 = AESCrypto128.getInstance();
        registeredUserNameCrypt = crypto128.encrypt(registeredUserName);
        //log.info("setEmployeeName " + employeeName + " store " + employeeNameStore);
    }
    // endregion

    // region managerName
    public String getWritedUserName() throws Exception {
        //log.info("getEmployeeName" + employeeNameStore);
        AESCrypto128 crypto128 = AESCrypto128.getInstance();
        return crypto128.decrypt(writedUserNameCrypt);
    }

    public void setWritedUserName(String writedUserName) throws Exception {
        AESCrypto128 crypto128 = AESCrypto128.getInstance();
        writedUserNameCrypt = crypto128.encrypt(writedUserName);
        //log.info("setEmployeeName " + employeeName + " store " + employeeNameStore);
    }
    // endregion
}
