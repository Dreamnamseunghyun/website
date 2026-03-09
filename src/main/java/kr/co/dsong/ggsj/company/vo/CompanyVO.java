package kr.co.dsong.ggsj.company.vo;

import kr.co.dsong.ggsj.common.vo.BaseVO;
import kr.co.dsong.ggsj.manager.vo.CompanyManagerVO;
import lombok.Data;
import lombok.EqualsAndHashCode;
import org.springframework.util.StringUtils;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Data
@EqualsAndHashCode(callSuper = true)
public class CompanyVO extends BaseVO {

    private Integer companyId;
    private String companyCode;
    private String companyName;
    private String businessNo;
    private String idPlaceHolder;
    private Integer pwType;
    private Boolean noUse;
    private Boolean useNotiTalk;
    private Integer accountUserId;
    private Integer salesUserId;
    private Integer adminUserId;

    private Integer checkCode;
    private Integer userId;
    private Integer checkupYear;

    private String ciFilename;
    private String orgCiFilename;

    private List<CompanyManagerVO> contractManager;
    private List<CompanyManagerVO> accountManager;
    private List<CompanyManagerVO> resultManager;

    // checkup
    private CompanyCheckupVO companyCheckup;

    public String getCiUrl() {
        if (companyId == null || StringUtils.isEmpty(ciFilename)) {
            return null;
        }

        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();

        return request.getContextPath() + "/storage/" + getStorageUrl(ciFilename);
    }

    public String getStorageUrl(String fileName) {
        String ext = StringUtils.getFilenameExtension(fileName);
        return "company/" + companyId + (ext == null ? "" : "." + ext);
    }
}
