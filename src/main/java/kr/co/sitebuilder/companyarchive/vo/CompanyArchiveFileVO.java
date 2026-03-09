package kr.co.sitebuilder.companyarchive.vo;

import kr.co.sitebuilder.common.vo.BaseVO;
import lombok.Data;
import lombok.EqualsAndHashCode;
import org.springframework.util.StringUtils;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;

@Data
@EqualsAndHashCode(callSuper = true)
public class CompanyArchiveFileVO extends BaseVO {

    private Integer companyArchiveFileId;
    private Integer companyArchiveId;
    private String archiveFilename;

    private String orgFilename;

    public String getAttachUrl() {
        if (companyArchiveFileId == null || StringUtils.isEmpty(archiveFilename)) {
            return null;
        }

        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();

        return request.getContextPath() + "/storage/" + getStorageUrl(archiveFilename) + "?orgFileName=" + archiveFilename;
    }

    public String getStorageUrl(String fileName) {
        String ext = StringUtils.getFilenameExtension(fileName);
        return "archive/" + companyArchiveFileId + (ext == null ? "" : "." + ext);
    }
}
