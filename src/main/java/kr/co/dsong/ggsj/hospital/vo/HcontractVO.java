package kr.co.dsong.ggsj.hospital.vo;


import com.fasterxml.jackson.annotation.JsonIgnore;
import kr.co.dsong.ggsj.common.vo.BaseVO;
import kr.co.dsong.ggsj.manager.vo.CenterManagerVO;
import kr.co.dsong.ggsj.util.AESCrypto128;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.util.List;

@Data
@EqualsAndHashCode(callSuper = true)
public class HcontractVO extends BaseVO {

    private Integer centerManagerCompanyId;
    private Integer hospitalId;
    private Integer centerId;
    private String hospitalName;
    private String centerName;
    private String companyName;
    private Integer companyId;
    private Integer checkupYear;
    private Integer companyCheckupId;

    //    private String contractManagerName;
    @JsonIgnore
    private String contractManagerNameCrypt;

    //    private String reserveManagerName;
    @JsonIgnore
    private String reserveManagerNameCrypt;

    //    private String resultManagerName;
    @JsonIgnore
    private String resultManagerNameCrypt;

    private String contractManagerEmail;
    private String reserveManagerEmail;
    private String resultManagerEmail;
    private String contractManagerTelephone;
    private String reserveManagerTelephone;
    private String resultManagerTelephone;
    private String contractManagerMobile;
    private String reserveManagerMobile;
    private String resultManagerMobile;

    private List<CenterManagerVO> contractManager;
    private List<CenterManagerVO> reserveManager;
    private List<CenterManagerVO> resultManager;

    private List<HcontractVO> hcontracts;

    // region contractManagerName
    public String getContractManagerName() throws Exception {
        //log.info("getEmployeeName" + employeeNameStore);
        AESCrypto128 crypto128 = AESCrypto128.getInstance();
        return crypto128.decrypt(contractManagerNameCrypt);
    }

    public void setContractManagerName(String contractManagerName) throws Exception {
        AESCrypto128 crypto128 = AESCrypto128.getInstance();
        contractManagerNameCrypt = crypto128.encrypt(contractManagerName);
        //log.info("setEmployeeName " + employeeName + " store " + employeeNameStore);
    }

    // endregion
    // region reserveManagerName
    public String getReserveManagerName() throws Exception {
        //log.info("getEmployeeName" + employeeNameStore);
        AESCrypto128 crypto128 = AESCrypto128.getInstance();
        return crypto128.decrypt(reserveManagerNameCrypt);
    }

    public void setReserveManagerName(String reserveManagerName) throws Exception {
        AESCrypto128 crypto128 = AESCrypto128.getInstance();
        reserveManagerNameCrypt = crypto128.encrypt(reserveManagerName);
        //log.info("setEmployeeName " + employeeName + " store " + employeeNameStore);
    }

    // endregion
    // region resultManagerName
    public String getResultManagerName() throws Exception {
        //log.info("getEmployeeName" + employeeNameStore);
        AESCrypto128 crypto128 = AESCrypto128.getInstance();
        return crypto128.decrypt(resultManagerNameCrypt);
    }

    public void setResultManagerName(String resultManagerName) throws Exception {
        AESCrypto128 crypto128 = AESCrypto128.getInstance();
        resultManagerNameCrypt = crypto128.encrypt(resultManagerName);
        //log.info("setEmployeeName " + employeeName + " store " + employeeNameStore);
    }
    // endregion
}
