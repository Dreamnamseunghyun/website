package kr.co.dsong.ggsj.hospital.vo;

import kr.co.dsong.ggsj.common.vo.BaseVO;
import lombok.Data;
import lombok.EqualsAndHashCode;
import org.springframework.util.StringUtils;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;

@Data
@EqualsAndHashCode(callSuper = true)
public class HospitalVO extends BaseVO {

    private Integer hospitalId;
    private String hospitalCode;
    private String hospitalName;
    private String BusinessNo;

    private String homepage;

    private String ciFilename;
    private String orgCiFilename;

    //center
    private CenterVO center;

    public String getCiUrl() {
        if (hospitalId == null || StringUtils.isEmpty(ciFilename)) {
            return null;
        }

        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
        return request.getContextPath() + "/storage/" + getStorageUrl(ciFilename);
    }

    public String getStorageUrl(String fileName) {
        String ext = StringUtils.getFilenameExtension(fileName);

        return "hospital/" + hospitalId + (ext == null ? "" : "." + ext);
    }
}
