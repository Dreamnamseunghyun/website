package kr.co.dsong.ggsj.company.web;

import kr.co.dsong.ggsj.common.service.StorageService;
import kr.co.dsong.ggsj.common.vo.BaseResponseVO;
import kr.co.dsong.ggsj.company.service.CompanyService;
import kr.co.dsong.ggsj.company.vo.CompanyCheckupVO;
import kr.co.dsong.ggsj.company.vo.CompanyIndexVO;
import kr.co.dsong.ggsj.company.vo.CompanyVO;
import kr.co.dsong.ggsj.manager.vo.PlatformManagerVO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@Slf4j
public class CompanyController {
    @Resource
    private CompanyService companyService;

    @Resource
    private StorageService storageService;

    // region PM
    @RequestMapping(value = "/pm/company", method = RequestMethod.GET, produces = "text/html")
    public String companyListView() {
        log.info("");

        return "pm/company/index";
    }

    @RequestMapping(value = "/pm/company/{checkupYear}/{companyId}", method = RequestMethod.GET, produces = "text/html")
    public String companyReadView(@PathVariable Integer companyId, @PathVariable Integer checkupYear, Model model) {
        log.info("companyId: " + companyId + checkupYear);

        model.addAttribute("companyId", companyId);
        model.addAttribute("checkupYear", checkupYear);

        return "pm/company/view";
    }

    @RequestMapping(value = "/pm/company/create", method = RequestMethod.GET, produces = "text/html")
    public String companyCreateView() {
        log.info("");

        return "pm/company/create";
    }

    @RequestMapping(value = "/pm/company/{checkupYear}/{companyId}/edit", method = RequestMethod.GET, produces = "text/html")
    public String companyEditView(@PathVariable Integer companyId, @PathVariable Integer checkupYear, Model model) {
        log.info("companyId: " + companyId);

        model.addAttribute("companyId", companyId);
        model.addAttribute("checkupYear", checkupYear);

        return "pm/company/edit";
    }

    @RequestMapping(value = "/pm/company/{checkupYear}/{companyId}/checkup/create", method = RequestMethod.GET, produces = "text/html")
    public String companyCheckupCreateView(@PathVariable Integer companyId, @PathVariable Integer checkupYear, Model model) {
        log.info("companyId: " + companyId + checkupYear);

        model.addAttribute("companyId", companyId);
        model.addAttribute("checkupYear", checkupYear);

        return "pm/company/create_checkup";
    }

    @RequestMapping(value = "/pm/company", method = RequestMethod.GET, produces = "application/json")
    @ResponseBody
    public BaseResponseVO<List<CompanyVO>> selectCompanyList(@RequestParam(required = false) Integer checkupYear) throws Exception {
        log.info("");

        return new BaseResponseVO<>(companyService.selectCompanyList(checkupYear));
    }

    @RequestMapping(value = "/pm/salesmanager", method = RequestMethod.GET, produces = "application/json")
    @ResponseBody
    public BaseResponseVO<List<CompanyCheckupVO>> salesManagerList() throws Exception {
        log.info("");

        return new BaseResponseVO<>(companyService.salesManagerList());
    }

    @RequestMapping(value = "/pm/assistmanager", method = RequestMethod.GET, produces = "application/json")
    @ResponseBody
    public BaseResponseVO<List<CompanyCheckupVO>> assistManagerList() throws Exception {
        log.info("");

        return new BaseResponseVO<>(companyService.assistManagerList());
    }

    @RequestMapping(value = "/pm/company/{checkupYear}/{companyId}", method = RequestMethod.GET, produces = "application/json")
    @ResponseBody
    public BaseResponseVO<CompanyVO> selectCompany(@PathVariable Integer companyId, @PathVariable Integer checkupYear) throws Exception {
        log.info("companyId: " + companyId + checkupYear);

        CompanyVO vo = new CompanyVO();
        vo.setCompanyId(companyId);
        vo.setCheckupYear(checkupYear);
        vo = companyService.selectCompany(vo);

        return new BaseResponseVO<>(vo);
    }

    @RequestMapping(value = "/pm/company", method = RequestMethod.POST, produces = "application/json")
    @ResponseBody
    public BaseResponseVO<CompanyVO> insertCompany(@RequestPart CompanyVO company, @RequestPart MultipartFile ci) throws Exception {
        log.info("company: " + company);

        companyService.insertCompany(company);
        if (!ci.isEmpty() && !StringUtils.isEmpty(company.getCiFilename())) {
            storageService.putObject(company.getStorageUrl(company.getCiFilename()), ci);
        }

        return new BaseResponseVO<>(company);
    }

    @RequestMapping(value = "/pm/company/{companyId}", method = RequestMethod.POST, produces = "application/json")
    @ResponseBody
    public BaseResponseVO<CompanyVO> updateCompany(@PathVariable Integer companyId, @RequestPart CompanyVO company, @RequestPart MultipartFile ci) throws Exception {
        log.info("companyId: " + companyId + ", company: " + company);

        company.setCompanyId(companyId);
        companyService.updateCompany(company);

        if (StringUtils.isEmpty(company.getCiFilename()) && !StringUtils.isEmpty(company.getOrgCiFilename())) {
            storageService.deleteObject(company.getStorageUrl(company.getOrgCiFilename()));
        } else if (!ci.isEmpty()) {
            if (!StringUtils.isEmpty(company.getOrgCiFilename())) {
                storageService.deleteObject(company.getStorageUrl(company.getOrgCiFilename()));
            }
            storageService.putObject(company.getStorageUrl(company.getCiFilename()), ci);
        }

        return new BaseResponseVO<>(company);
    }

    @RequestMapping(value = "/pm/company/{companyId}/ci", method = RequestMethod.DELETE, produces = "application/json")
    @ResponseBody
    public BaseResponseVO<CompanyVO> deleteCompanyCi(@PathVariable Integer companyId) throws Exception {
        log.info("companyId: " + companyId);

        CompanyVO vo = new CompanyVO();
        vo.setCompanyId(companyId);

        CompanyVO company = companyService.deleteCompanyCi(vo);
        storageService.deleteObject(company.getCiFilename());

        return new BaseResponseVO<>(company);
    }

    @RequestMapping(value = "/pm/company/{companyId}", method = RequestMethod.DELETE, produces = "application/json")
    @ResponseBody
    public BaseResponseVO<Integer> deleteCompany(@PathVariable Integer companyId) throws Exception {
        log.info("companyId: " + companyId);

        CompanyVO vo = new CompanyVO();
        vo.setCompanyId(companyId);
        companyService.deleteCompany(vo);

        return new BaseResponseVO<>(companyId);
    }

    @RequestMapping(value = "/pm/company/{companyId}/checkup", method = RequestMethod.POST, produces = "application/json")
    @ResponseBody
    public BaseResponseVO<CompanyCheckupVO> insertCompanyCheckup(@PathVariable Integer companyId, @RequestBody CompanyCheckupVO vo) throws Exception {
        log.info("companyId: " + companyId + ", vo: " + vo);

        vo.setCompanyId(companyId);
        companyService.insertCompanyCheckup(vo);

        return new BaseResponseVO<>(vo);
    }

    @RequestMapping(value = "/pm/platformmanagerlist", method = RequestMethod.GET, produces = "application/json")
    @ResponseBody
    public BaseResponseVO<List<PlatformManagerVO>> selectPlatformManagerList() throws Exception {
        log.info("");

        return new BaseResponseVO<>(companyService.selectPlatformManagerList());
    }

    @RequestMapping(value = "/pm/company/check", method = RequestMethod.GET, produces = "application/json")
    @ResponseBody
    public BaseResponseVO<CompanyVO> checkCode(CompanyVO vo) throws Exception {
        log.info("" + vo);

        return new BaseResponseVO<>(companyService.checkCode(vo));
    }

    // endregion

    // region CM
    @RequestMapping(value = "/cm/company/0", method = RequestMethod.GET, produces = "text/html")
    public String companyReadView() {
        log.info("");

        return "cm/company/view";
    }

    @RequestMapping(value = "/cm/platformmanagerlist", method = RequestMethod.GET, produces = "application/json")
    @ResponseBody
    public BaseResponseVO<List<PlatformManagerVO>> selectCmPlatformManagerList() throws Exception {
        log.info("");

        return new BaseResponseVO<>(companyService.selectPlatformManagerList());
    }

    @RequestMapping(value = "/cm/company/0/edit", method = RequestMethod.GET, produces = "text/html")
    public String companyEditView() {
        log.info("");

        return "cm/company/edit";
    }

    @RequestMapping(value = "/cm/company/0", method = RequestMethod.GET, produces = "application/json")
    @ResponseBody
    public BaseResponseVO<CompanyVO> selectCompanyCm(HttpSession session) throws Exception {
        log.info("");

        Integer companyId = (Integer) session.getAttribute("sessionTypeId");

        CompanyVO vo = new CompanyVO();
        vo.setCompanyId(companyId);
        vo = companyService.selectCompanyCm(vo);

        return new BaseResponseVO<>(vo);
    }

    @RequestMapping(value = "/cm/company/0", method = RequestMethod.POST, produces = "application/json")
    @ResponseBody
    public BaseResponseVO<CompanyVO> updateCompany(@RequestPart CompanyVO company, @RequestPart MultipartFile ci, HttpSession session) throws Exception {
        log.info("company: " + company);

        Integer companyId = (Integer) session.getAttribute("sessionTypeId");

        company.setCompanyId(companyId);
        companyService.updateCompany(company);

        if (StringUtils.isEmpty(company.getCiFilename()) && !StringUtils.isEmpty(company.getOrgCiFilename())) {
            storageService.deleteObject(company.getStorageUrl(company.getOrgCiFilename()));
        } else if (!ci.isEmpty()) {
            if (!StringUtils.isEmpty(company.getOrgCiFilename())) {
                storageService.deleteObject(company.getStorageUrl(company.getOrgCiFilename()));
            }
            storageService.putObject(company.getStorageUrl(company.getCiFilename()), ci);
        }

        return new BaseResponseVO<>(company);
    }

    @RequestMapping(value = "/cm/company/checkup", method = RequestMethod.GET, produces = "application/json")
    @ResponseBody
    public BaseResponseVO<List<CompanyIndexVO>> selectCompanyIndexList(HttpSession session) throws Exception {
        Integer userId = (Integer) session.getAttribute("sessionUserId");

        CompanyIndexVO vo = new CompanyIndexVO();
        vo.setUserId(userId);
        return new BaseResponseVO<>(companyService.selectCompanyIndexList(vo));
    }

    @RequestMapping(value = "/cm/company/subcheckup", method = RequestMethod.GET, produces = "application/json")
    @ResponseBody
    public BaseResponseVO<List<CompanyIndexVO>> selectCompanyIndexSubList(HttpSession session) throws Exception {
        Integer userId = (Integer) session.getAttribute("sessionUserId");

        CompanyIndexVO vo = new CompanyIndexVO();
        vo.setUserId(userId);
        return new BaseResponseVO<>(companyService.selectCompanyIndexSubList(vo));
    }

    @RequestMapping(value = "/cm/company/count", method = RequestMethod.GET, produces = "application/json")
    @ResponseBody
    public BaseResponseVO<List<CompanyIndexVO>> selectCompanyIndexCount(HttpSession session) throws Exception {
        Integer userId = (Integer) session.getAttribute("sessionUserId");

        CompanyIndexVO vo = new CompanyIndexVO();
        vo.setUserId(userId);
        return new BaseResponseVO<>(companyService.selectCompanyIndexCount(vo));
    }
    // endregion
}
