package kr.co.dsong.ggsj.commune.vo;

import kr.co.dsong.ggsj.common.vo.BaseVO;
import lombok.Data;
import lombok.EqualsAndHashCode;
import org.springframework.util.StringUtils;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;


@Data
@EqualsAndHashCode(callSuper = true)
public class HealthSenseVO extends BaseVO {

    private Integer healthSenseId;
    private String title;
    private String linkUrl;
    private String attachFilename;
    private Date writedAt;
    private Integer writedUserId;

    private String ciFilename;
    private String orgAttachFilename;

    private Integer firstRecordIndex;
    private Integer recordCountPerPage;

    public String getAttachUrl() {
        if (healthSenseId == null || StringUtils.isEmpty(attachFilename)) {
            return null;
        }

        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();

        return request.getContextPath() + "/storage/" + getStorageUrl(attachFilename) + "?orgFileName=" + attachFilename;
    }

    public String getStorageUrl(String fileName) {
        String ext = StringUtils.getFilenameExtension(fileName);
        return "healthsense/" + healthSenseId + (ext == null ? "" : "." + ext);
    }
}
