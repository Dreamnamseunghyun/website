package kr.co.dsong.ggsj.notitok.vo;

import com.fasterxml.jackson.annotation.JsonIgnore;
import kr.co.dsong.ggsj.common.vo.BaseVO;
import kr.co.dsong.ggsj.util.AESCrypto128;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.util.Date;

@Data
@EqualsAndHashCode(callSuper = true)
public class NotitokUSSentVO extends BaseVO {
    private Integer notitokUsSentId;
    private String messageId;
    private Integer sentUserId;
    private Date sentAt;
    private Integer messageType;
    private Integer employeeCheckupId;

    //private String recvName;
    @JsonIgnore
    private String recvNameCrypt;

    private String mobile;
    private Date birth;
    private Integer pwType;

    private Long mid;
    private String message;
    private String data;
    private Date createdAt;
    private Integer createdUserId;

    private Integer userId;
    private String employeeCode;
    private String employeeNo;
    private Integer companyId;
    private String companyName;

    // region recvName
    public String getRecvName() throws Exception {
        //log.info("getEmployeeName" + employeeNameStore);
        AESCrypto128 crypto128 = AESCrypto128.getInstance();
        return crypto128.decrypt(recvNameCrypt);
    }

    public void setRecvName(String recvName) throws Exception {
        AESCrypto128 crypto128 = AESCrypto128.getInstance();
        recvNameCrypt = crypto128.encrypt(recvName);
        //log.info("setEmployeeName " + employeeName + " store " + employeeNameStore);
    }
    // endregion
}
