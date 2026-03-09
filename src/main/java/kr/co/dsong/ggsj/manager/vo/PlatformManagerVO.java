package kr.co.dsong.ggsj.manager.vo;

import com.fasterxml.jackson.annotation.JsonIgnore;
import kr.co.dsong.ggsj.user.vo.UserVO;
import kr.co.dsong.ggsj.util.AESCrypto128;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.util.List;

@Data
@EqualsAndHashCode(callSuper = true)
public class PlatformManagerVO extends UserVO {

    private String platformManagerCode;

    //private String platformManagerName;
    @JsonIgnore
    private String platformManagerNameCrypt;

    private Boolean noUse;
    private Boolean sales;
    private Boolean admin;
    private Boolean executive;
    private Boolean outsales;
    private String email;
    private String telephone;
    private String mobile;
    private String notes;

    private List<PlatformManagerVO> salesManager;
    private List<PlatformManagerVO> adminManager;

    // region platformManagerName
    public String getPlatformManagerName() throws Exception {
        //log.info("getEmployeeName" + employeeNameStore);
        AESCrypto128 crypto128 = AESCrypto128.getInstance();
        return crypto128.decrypt(platformManagerNameCrypt);
    }

    public void setPlatformManagerName(String platformManagerName) throws Exception {
        AESCrypto128 crypto128 = AESCrypto128.getInstance();
        platformManagerNameCrypt = crypto128.encrypt(platformManagerName);
        //log.info("setEmployeeName " + employeeName + " store " + employeeNameStore);
    }
    // endregion
}
