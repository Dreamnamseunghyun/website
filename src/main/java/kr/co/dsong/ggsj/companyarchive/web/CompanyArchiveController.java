package kr.co.dsong.ggsj.companyarchive.web;

import kr.co.dsong.ggsj.common.service.StorageService;
import kr.co.dsong.ggsj.common.vo.BaseResponseVO;
import kr.co.dsong.ggsj.companyarchive.service.CompanyArchiveService;
import kr.co.dsong.ggsj.companyarchive.vo.CompanyArchiveFileVO;
import kr.co.dsong.ggsj.companyarchive.vo.CompanyArchiveVO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@Slf4j
public class CompanyArchiveController {

    @Resource
    private CompanyArchiveService companyArchiveService;

    @Resource
    private StorageService storageService;

    // region PM
    @RequestMapping(value = "/pm/companyarchive", method = RequestMethod.GET, produces = "text/html")
    public String companyArchiveListView() {
        log.info("");

        return "pm/companyarchive/index";
    }

    @RequestMapping(value = "/pm/companyarchive/{type}", method = RequestMethod.GET, produces = "application/json")
    @ResponseBody

    public BaseResponseVO<List<CompanyArchiveVO>> selectCompanyArchiveList(@PathVariable Integer type) throws Exception {
        log.info("" + type);

        return new BaseResponseVO<>(companyArchiveService.selectCompanyArchiveList(type));
    }

    @RequestMapping(value = "/pm/companyarchive/{companyArchiveId}", method = RequestMethod.POST, produces = "application/json")
    @ResponseBody
    public BaseResponseVO<CompanyArchiveVO> deletePmCompanyArchive(@PathVariable Integer companyArchiveId) throws Exception {
        log.info("" + companyArchiveId);

        CompanyArchiveVO vo = new CompanyArchiveVO();
        vo.setCompanyArchiveId(companyArchiveId);

        companyArchiveService.deleteCompanyArchive(vo);
        return new BaseResponseVO<>(vo);
    }

    @RequestMapping(value = "/pm/companyarchive/{type}/sent", method = RequestMethod.POST, produces = "application/json")
    @ResponseBody
    public BaseResponseVO<CompanyArchiveVO> updateCompanyArchive(@PathVariable Integer type) throws Exception {
        log.info("" + type);

        CompanyArchiveVO companyArchive = new CompanyArchiveVO();
        companyArchive.setType(type);
        companyArchiveService.updateCompanyArchive(companyArchive);

        return new BaseResponseVO<>(companyArchive);
    }

    // endregion

    // region CM
    @RequestMapping(value = "/cm/companyarchive", method = RequestMethod.GET, produces = "text/html")
    public String companyCmArchiveListView() {
        log.info("");

        return "cm/companyarchive/index";
    }

    @RequestMapping(value = "/cm/companyarchive/{type}", method = RequestMethod.GET, produces = "application/json")
    @ResponseBody

    public BaseResponseVO<List<CompanyArchiveVO>> selectCmCompanyArchiveList(@PathVariable Integer type, HttpSession session) throws Exception {
        log.info("");

        Integer companyId = (Integer) session.getAttribute("sessionTypeId");
        Integer userId = (Integer) session.getAttribute("sessionUserId");

        return new BaseResponseVO<>(companyArchiveService.selectCmCompanyArchiveList(type, companyId, userId));
    }
    // endregion

    // region HM
    @RequestMapping(value = "/hm/companyarchive", method = RequestMethod.GET, produces = "text/html")
    public String companyHmArchiveListView() {
        log.info("");

        return "hm/companyarchive/index";
    }

    @RequestMapping(value = "/hm/companyarchive/{type}", method = RequestMethod.GET, produces = "application/json")
    @ResponseBody
    public BaseResponseVO<List<CompanyArchiveVO>> selectHmCompanyArchiveList(@PathVariable Integer type, HttpSession session) throws Exception {

        Integer hospitalId = (Integer) session.getAttribute("sessionTypeId");
        Integer userId = (Integer) session.getAttribute("sessionUserId");
        log.info("" + hospitalId);
        return new BaseResponseVO<>(companyArchiveService.selectHmCompanyArchiveList(type, hospitalId, userId));
    }

    @RequestMapping(value = "/hm/companyarchive", method = RequestMethod.POST, produces = "application/json")
    @ResponseBody
    public BaseResponseVO<CompanyArchiveVO> insertCompanyArchive(@RequestPart CompanyArchiveVO companyArchive, @RequestPart(required = false) MultipartFile archive, HttpSession session) throws Exception {
        log.info("" + companyArchive);
        Integer hospitalId = (Integer) session.getAttribute("sessionTypeId");
        companyArchive.setHospitalId(hospitalId);

        companyArchiveService.insertCompanyArchive(companyArchive);
        for (CompanyArchiveFileVO companyArchiveFile : companyArchive.getCompanyArchiveFiles()) {
            if (!archive.isEmpty() && !StringUtils.isEmpty(companyArchiveFile.getArchiveFilename())) {
                storageService.putObject(companyArchiveFile.getStorageUrl(companyArchiveFile.getArchiveFilename()), archive);
            }
        }

        return new BaseResponseVO<>(companyArchive);
    }

    @RequestMapping(value = "/hm/companyarchive/{companyArchiveId}", method = RequestMethod.POST, produces = "application/json")
    @ResponseBody
    public BaseResponseVO<CompanyArchiveVO> deleteCompanyArchive(@PathVariable Integer companyArchiveId) throws Exception {
        log.info("" + companyArchiveId);

        CompanyArchiveVO vo = new CompanyArchiveVO();
        vo.setCompanyArchiveId(companyArchiveId);

        companyArchiveService.deleteCompanyArchive(vo);
        return new BaseResponseVO<>(vo);
    }
    // endregion
}
