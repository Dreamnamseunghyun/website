package kr.co.dsong.ggsj.result.vo;

import com.fasterxml.jackson.annotation.JsonIgnore;
import kr.co.dsong.ggsj.common.vo.BaseVO;
import kr.co.dsong.ggsj.util.AESCrypto128;
import lombok.Data;
import lombok.EqualsAndHashCode;
import org.springframework.util.StringUtils;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.List;

@Data
@EqualsAndHashCode(callSuper = true)
public class ResultVO extends BaseVO {

    private Integer checkupResultId;
    private Integer checkupResultEmployeeId;
    private Integer companyCheckupId;
    private Integer hospitalId;
    private String hospitalCode;
    private String hospitalName;
    private String hospitalCenterName;

    private Integer companyId;
    private String companyCode;
    private String companyName;

    private Integer centerId;
    private String centerCode;
    private String centerName;

    private String employeeCode;

    //private String employeeName;
    @JsonIgnore
    private String employeeNameCrypt;

    private Integer employeeCheckupId;

    private Date birth;
    private String sex;
    private Date checkupedAt;
    private Date desiredAt;

    private Integer checkupYear;
    private Date confirmedAt;
    private Date registeredAt;
    private Date employeeRegisteredAt;
    private String fileName;
    private Integer count;
    private Integer checkupCount;
    private String review;

    private Date companyCheckupDateBegin;
    private Date companyCheckupDateEnd;
    private Date hospitalCheckupDateBegin;
    private Date hospitalCheckupDateEnd;

    private Date resultDateBegin;
    private Date resultDateEnd;

    private Integer userId;
    private String orgFilename;

    private List<ResultEmployeeVO> resultEmployees;
    private List<ResultVO> result;

    public String getAttachUrl() {
        if (checkupResultId == null || StringUtils.isEmpty(fileName)) {
            return null;
        }

        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();

        return request.getContextPath() + "/storage/" + getStorageUrl(fileName) + "?orgFileName=" + fileName;
    }

    public String getStorageUrl(String fileName) {
        String ext = StringUtils.getFilenameExtension(fileName);
        return "result/" + checkupResultId + (ext == null ? "" : "." + ext);
    }

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
