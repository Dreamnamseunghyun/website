package kr.co.sitebuilder.hospital.vo;

import kr.co.sitebuilder.common.vo.BaseVO;
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
public class CenterVO extends BaseVO {

    private Integer companyId;
    private String companyName;

    private Date checkupDateBegin;
    private Date checkupDateEnd;
    private Date reserveDateBegin;
    private Date reserveDateEnd;

    private Integer hospitalId;
    private String hospitalCode;
    private String hospitalName;
    private String businessNo;
    private String hospitalCenterName;

    private List<String> contractManagerNames;
    private List<String> reserveManagerNames;
    private List<String> resultManagerNames;

    private Integer centerId;
    private String centerCode;
    private String centerName;
    private Boolean head;
    private String telephone;
    private String homepage;
    private String zipcode;
    private String sido;
    private String sigungu;
    private String address1;
    private String address2;
    private String locationDesc;
    private Integer grade;
    private Integer preday;
    private Boolean ableCt;
    private Boolean ableMri;
    private Boolean ablePark;
    private Boolean ableSoup;
    private Boolean ableSatur;
    private Boolean ableSpecial;
    private Boolean ableAm;
    private Date receiptNormalBegin;
    private Date receiptNormalEnd;
    private Date receiptNormalPmBegin;
    private Date receiptNormalPmEnd;
    private Date receiptSaturBegin;
    private Date receiptSaturEnd;
    private Boolean noUse;
    private String notes;
    private String advertisement;

    private String ciFilename;
    private String orgCiFilename;

    private String centerList;

    private List<HsubcontractVO> hsubcontracts;

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


    private String centerAdvFilename1;
    private String centerAdvFilename2;
    private String centerAdvFilename3;
    private String centerAdvFilename4;
    private String centerAdvFilename5;
    private String centerAdvFilename6;

    private String orgCenterAdvFilename1;
    private String orgCenterAdvFilename2;
    private String orgCenterAdvFilename3;
    private String orgCenterAdvFilename4;
    private String orgCenterAdvFilename5;
    private String orgCenterAdvFilename6;

    public String getCenterAdvFilename(int index, boolean isOriginal) {
        switch (index) {
            case 1:
                return isOriginal ? orgCenterAdvFilename1 : centerAdvFilename1;
            case 2:
                return isOriginal ? orgCenterAdvFilename2 : centerAdvFilename2;
            case 3:
                return isOriginal ? orgCenterAdvFilename3 : centerAdvFilename3;
            case 4:
                return isOriginal ? orgCenterAdvFilename4 : centerAdvFilename4;
            case 5:
                return isOriginal ? orgCenterAdvFilename5 : centerAdvFilename5;
            case 6:
                return isOriginal ? orgCenterAdvFilename6 : centerAdvFilename6;
        }
        return null;
    }

    public String getCenterAdvUrl1() {
        return getCenterAdvUrl(centerAdvFilename1, 1);
    }

    public String getCenterAdvUrl2() {
        return getCenterAdvUrl(centerAdvFilename2, 2);
    }

    public String getCenterAdvUrl3() {
        return getCenterAdvUrl(centerAdvFilename3, 3);
    }

    public String getCenterAdvUrl4() {
        return getCenterAdvUrl(centerAdvFilename4, 4);
    }

    public String getCenterAdvUrl5() {
        return getCenterAdvUrl(centerAdvFilename5, 5);
    }

    public String getCenterAdvUrl6() {
        return getCenterAdvUrl(centerAdvFilename6, 6);
    }

    private String getCenterAdvUrl(String fileName, int index) {
        if (centerId == null || StringUtils.isEmpty(fileName)) {
            return null;
        }

        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
        return request.getContextPath() + "/storage/" + getCenterAdvStorageUrl(fileName, index);
    }

    public String getCenterAdvStorageUrl(String fileName, int index) {
        String ext = StringUtils.getFilenameExtension(fileName);

        return "center/" + centerId + '-' + index + (ext == null ? "" : "." + ext);
    }
}
