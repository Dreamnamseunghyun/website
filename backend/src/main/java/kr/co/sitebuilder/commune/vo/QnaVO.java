package kr.co.sitebuilder.commune.vo;

import com.fasterxml.jackson.annotation.JsonIgnore;
import kr.co.sitebuilder.common.vo.BaseVO;
import kr.co.sitebuilder.util.AESCrypto128;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.util.Date;

@Data
@EqualsAndHashCode(callSuper = true)
public class QnaVO extends BaseVO {

    private Integer qnaId;
    private String title;
    private String question;
    private Date questionAt;
    private Integer userId;
    private String answer;
    private Integer answerId;
    private Date answerAt;
    private Boolean answerCheck;

    //private String employeeName;
    @JsonIgnore
    private String employeeNameCrypt;

    private String companyName;

    private Integer category;

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
