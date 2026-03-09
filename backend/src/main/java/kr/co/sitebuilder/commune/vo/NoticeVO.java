package kr.co.sitebuilder.commune.vo;

import com.fasterxml.jackson.annotation.JsonIgnore;
import kr.co.sitebuilder.common.vo.BaseVO;
import kr.co.sitebuilder.util.AESCrypto128;
import lombok.Data;
import lombok.EqualsAndHashCode;
import org.springframework.util.StringUtils;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;

@Data
@EqualsAndHashCode(callSuper = true)
public class NoticeVO extends BaseVO {

    private Integer noticeId;
    private String group;
    private Integer targetId;
    private Integer companyId;
    private String targetName;
    private String title;
    private String contents;
    private boolean topList;
    private Date writedAt;
    private Integer writedUserId;

    //private String writedUserName;
    @JsonIgnore
    private String writedUserNameCrypt;

    private String attachFilename;
    private String orgAttachFilename;

    public String getAttachUrl() {
        if (noticeId == null || StringUtils.isEmpty(attachFilename)) {
            return null;
        }

        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();

        return request.getContextPath() + "/storage/" + getStorageUrl(attachFilename) + "?orgFileName=" + attachFilename;
    }

    public String getStorageUrl(String fileName) {
        String ext = StringUtils.getFilenameExtension(fileName);
        return "notice/" + noticeId + (ext == null ? "" : "." + ext);
    }

    // region loginName
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
