package kr.co.sitebuilder.companyarchive.vo;

import kr.co.sitebuilder.common.vo.BaseVO;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.util.Date;
import java.util.List;

@Data
@EqualsAndHashCode(callSuper = true)
public class CompanyArchiveVO extends BaseVO {

    private Integer companyArchiveId;
    private Integer checkupContractId;
    private String title;
    private Integer type;
    private Date registeredAt;
    private Date sentAt;
    private Integer companyArchiveFileId;
    private String archiveFilename;
    private Integer hospitalId;
    private String hospitalName;
    private Integer companyId;
    private String companyName;
    private String checkupYear;

    private List<CompanyArchiveFileVO> companyArchiveFiles;
}
