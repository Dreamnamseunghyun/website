package kr.co.dsong.ggsj.result.web;

import kr.co.dsong.ggsj.common.service.StorageService;
import kr.co.dsong.ggsj.common.vo.BaseResponseVO;
import kr.co.dsong.ggsj.common.vo.CommonCompanyVO;
import kr.co.dsong.ggsj.result.service.ResultService;
import kr.co.dsong.ggsj.result.vo.ResultEmployeeVO;
import kr.co.dsong.ggsj.result.vo.ResultVO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.List;

@Controller
@Slf4j
public class ResultController {

    @Resource
    private ResultService resultService;

    @Resource
    private StorageService storageService;

    // region PM
    @RequestMapping(value = "/pm/result", method = RequestMethod.GET, produces = "text/html")
    public String resultIndexView() {
        log.info("");
        return "pm/result/index";
    }

    @RequestMapping(value = "/pm/result/create", method = RequestMethod.GET, produces = "text/html")
    public String resultCreateView() {
        log.info("");
        return "pm/result/create";
    }

    @RequestMapping(value = "/pm/result-lookup", method = RequestMethod.GET, produces = "text/html")
    public String resulLookuptHomeView() {
        log.info("");
        return "pm/result/lookup";
    }

    @RequestMapping(value = "/pm/companylist", method = RequestMethod.GET, produces = "application/json")
    @ResponseBody
    public BaseResponseVO<List<CommonCompanyVO>> selectCompanyList() throws Exception {
        log.info("");

        return new BaseResponseVO<>(resultService.selectCompanyList());
    }

    @RequestMapping(value = "/pm/resultlist", method = RequestMethod.GET, produces = "application/json")
    @ResponseBody
    public BaseResponseVO<List<ResultVO>> selectPmResultList(@RequestParam(required = false) Integer hospitalId, @RequestParam(required = false) Integer companyId, @RequestParam(required = false) Integer checkupYear) throws Exception {
        log.info("");

        return new BaseResponseVO<>(resultService.selectHmResultList(hospitalId, companyId, checkupYear));
    }

    @RequestMapping(value = "/pm/resultlookuplist", method = RequestMethod.GET, produces = "application/json")
    @ResponseBody
    public BaseResponseVO<List<ResultVO>> selectResultCompanyList(@RequestParam(required = false) Integer companyId, @RequestParam(required = false) Integer checkupYear) throws Exception {
        log.info("C,H" + companyId);

        return new BaseResponseVO<>(resultService.selectResultCompanyList(companyId, checkupYear));
    }

    @RequestMapping(value = "/pm/resultcompany", method = RequestMethod.GET, produces = "application/json")
    @ResponseBody
    public BaseResponseVO<List<ResultVO>> selectCheckupResultCompany(@RequestParam(required = false) Integer companyId, @RequestParam(required = false) Integer checkupYear) throws Exception {
        log.info("");

        return new BaseResponseVO<>(resultService.selectCheckupResultCompany(companyId, checkupYear));
    }

    @RequestMapping(value = "/pm/resulthospital", method = RequestMethod.GET, produces = "application/json")
    @ResponseBody
    public BaseResponseVO<List<ResultVO>> selectCheckupResultHospital(@RequestParam(required = false) Integer hospitalId, @RequestParam(required = false) Integer checkupYear) throws Exception {
        log.info("");

        return new BaseResponseVO<>(resultService.selectCheckupResultHospital(hospitalId, checkupYear));
    }

    @RequestMapping(value = "/pm/result", method = RequestMethod.POST, produces = "application/json")
    @ResponseBody
    public BaseResponseVO<ResultVO> insertPmCheckupResult(@RequestPart ResultVO result, @RequestPart MultipartFile openFile) throws Exception {
        log.info("" + result);

        resultService.insertCheckupResult(result);
        if (!openFile.isEmpty() && !StringUtils.isEmpty(result.getFileName())) {
            storageService.putObject(result.getStorageUrl(result.getFileName()), openFile);
        }

        return new BaseResponseVO<>(result);
    }

    @RequestMapping(value = "/pm/select-result", method = RequestMethod.GET, produces = "application/json")
    @ResponseBody
    public BaseResponseVO<List<ResultVO>> selectPmResultLookupList(@RequestParam(required = false) Integer companyId, @RequestParam(required = false) Integer checkupYear) throws Exception {
        log.info("");

        return new BaseResponseVO<>(resultService.selectResultLookupList(companyId, checkupYear, null));
    }

    @RequestMapping(value = "/pm/result/{checkupResultId}", method = RequestMethod.DELETE, produces = "application/json")
    @ResponseBody
    public BaseResponseVO<Integer> deletePmCheckupResult(@PathVariable Integer checkupResultId) throws Exception {
        log.info("" + checkupResultId);

        ResultVO vo = new ResultVO();
        vo.setCheckupResultId(checkupResultId);
        resultService.deleteCheckupResult(vo);

        return new BaseResponseVO<>(checkupResultId);
    }

    @RequestMapping(value = "/pm/result/{checkupResultEmployeeId}/employee", method = RequestMethod.DELETE, produces = "application/json")
    @ResponseBody
    public BaseResponseVO<Integer> deletePmResultEmployee(@PathVariable Integer checkupResultEmployeeId) throws Exception {
        log.info("" + checkupResultEmployeeId);

        ResultEmployeeVO vo = new ResultEmployeeVO();
        vo.setCheckupResultEmployeeId(checkupResultEmployeeId);
        resultService.deleteResultEmployee(vo);

        return new BaseResponseVO<>(checkupResultEmployeeId);
    }

    @RequestMapping(value = "/pm/resulte-companyexcel", method = RequestMethod.GET, produces = "application/json")
    @ResponseBody
    public BaseResponseVO<List<ResultVO>> selectCompanyExcelDownloadList(@RequestParam(required = false) Integer companyId, @RequestParam(required = false) Integer checkupYear, @RequestParam(required = false) Date resultDateBegin, @RequestParam(required = false) Date resultDateEnd) throws Exception {
        log.info("");

        return new BaseResponseVO<>(resultService.selectExcelDownloadList(null, companyId, checkupYear, resultDateBegin, resultDateEnd));
    }

    @RequestMapping(value = "/pm/result-employee", method = RequestMethod.GET, produces = "application/json")
    @ResponseBody
    public BaseResponseVO<List<ResultVO>> selectCheckupResult(@RequestParam(required = false) Integer checkupResultEmployeeId, @RequestParam(required = false) Integer companyId, @RequestParam(required = false) Integer checkupYear) throws Exception {
        log.info("");

        return new BaseResponseVO<>(resultService.selectCheckupResult(checkupResultEmployeeId, companyId, checkupYear));
    }

    @RequestMapping(value = "/pm/resulte-hospitalexcel", method = RequestMethod.GET, produces = "application/json")
    @ResponseBody
    public BaseResponseVO<List<ResultVO>> selectHospitalExcelDownloadList(@RequestParam(required = false) Integer hospitalId, @RequestParam(required = false) Integer checkupYear, @RequestParam(required = false) Date resultDateBegin, @RequestParam(required = false) Date resultDateEnd) throws Exception {
        log.info("");

        return new BaseResponseVO<>(resultService.selectExcelDownloadList(hospitalId, null, checkupYear, resultDateBegin, resultDateEnd));
    }
    // endregion

    // region HM
    @RequestMapping(value = "/hm/result", method = RequestMethod.GET, produces = "text/html")
    public String hospitalResultIndexView() {
        log.info("");
        return "hm/result/index";
    }

    @RequestMapping(value = "/hm/result/create", method = RequestMethod.GET, produces = "text/html")
    public String hospitalResultCreateView() {
        log.info("");
        return "hm/result/create";
    }

    @RequestMapping(value = "/hm/result-lookup", method = RequestMethod.GET, produces = "text/html")
    public String hospitalResultLookuptHomeView() {
        log.info("");
        return "hm/result/lookup";
    }

    @RequestMapping(value = "/hm/result", method = RequestMethod.GET, produces = "application/json")
    @ResponseBody
    public BaseResponseVO<List<ResultVO>> selectHmIndexResultList(HttpSession session, @RequestParam(required = false) Integer checkupYear, @RequestParam(required = false) Integer companyId) throws Exception {
        log.info("");
        Integer userId = (Integer) session.getAttribute("sessionUserId");

        return new BaseResponseVO<>(resultService.selectHmIndexResultList(userId, checkupYear, companyId));
    }

    @RequestMapping(value = "/hm/companylist", method = RequestMethod.GET, produces = "application/json")
    @ResponseBody
    public BaseResponseVO<List<CommonCompanyVO>> selectHmCompanyList(HttpSession session) throws Exception {
        log.info("");
        Integer userId = (Integer) session.getAttribute("sessionUserId");
        log.info("" + userId);

        return new BaseResponseVO<>(resultService.selectHmCompanyList(userId));
    }

    @RequestMapping(value = "/hm/resultlist", method = RequestMethod.GET, produces = "application/json")
    @ResponseBody
    public BaseResponseVO<List<ResultVO>> selectHmResultList(@RequestParam(required = false) Integer companyId, @RequestParam(required = false) Integer checkupYear, HttpSession session) throws Exception {
        log.info("");
        Integer hospitalId = (Integer) session.getAttribute("sessionTypeId");

        return new BaseResponseVO<>(resultService.selectHmResultList(hospitalId, companyId, checkupYear));
    }

    @RequestMapping(value = "/hm/resultcheckup", method = RequestMethod.GET, produces = "application/json")
    @ResponseBody
    public BaseResponseVO<ResultVO> selectHmCheckupedAt(@RequestParam(required = false) String employeeCode) throws Exception {
        log.info("" + employeeCode);

        return new BaseResponseVO<>(resultService.selectCheckupedAt(employeeCode));
    }

    @RequestMapping(value = "/hm/resulte-excel", method = RequestMethod.GET, produces = "application/json")
    @ResponseBody
    public BaseResponseVO<List<ResultVO>> selectExcelDownloadList(@RequestParam(required = false) Integer companyId, @RequestParam(required = false) Integer checkupYear, @RequestParam(required = false) Date resultDateBegin, @RequestParam(required = false) Date resultDateEnd, HttpSession session) throws Exception {
        log.info("");
        Integer hospitalId = (Integer) session.getAttribute("sessionTypeId");

        return new BaseResponseVO<>(resultService.selectExcelDownloadList(hospitalId, companyId, checkupYear, resultDateBegin, resultDateEnd));
    }

    @RequestMapping(value = "/hm/select-result", method = RequestMethod.GET, produces = "application/json")
    @ResponseBody
    public BaseResponseVO<List<ResultVO>> selectResultLookupList(@RequestParam(required = false) Integer companyId, @RequestParam(required = false) Integer checkupYear, HttpSession session) throws Exception {
        log.info("");

        Integer hospitalId = (Integer) session.getAttribute("sessionTypeId");

        return new BaseResponseVO<>(resultService.selectResultLookupList(companyId, checkupYear, hospitalId));
    }

    @RequestMapping(value = "/hm/result", method = RequestMethod.POST, produces = "application/json")
    @ResponseBody
    public BaseResponseVO<ResultVO> insertHmCheckupResult(@RequestPart ResultVO result, @RequestPart MultipartFile openFile, HttpSession session) throws Exception {
        log.info("" + result);
        Integer hospitalId = (Integer) session.getAttribute("sessionTypeId");
        result.setHospitalId(hospitalId);

        resultService.insertCheckupResult(result);
        if (!openFile.isEmpty() && !StringUtils.isEmpty(result.getFileName())) {
            storageService.putObject(result.getStorageUrl(result.getFileName()), openFile);
        }

        return new BaseResponseVO<>(result);
    }

    @RequestMapping(value = "/hm/resultemployee", method = RequestMethod.POST, produces = "application/json")
    @ResponseBody
    public BaseResponseVO<ResultEmployeeVO> insertHmCheckupResultEmployee(@RequestBody ResultEmployeeVO vo) throws Exception {
        log.info("");

        resultService.insertCheckupResultEmployee(vo);

        return new BaseResponseVO<>(vo);
    }

    @RequestMapping(value = "/hm/result/{checkupResultId}", method = RequestMethod.DELETE, produces = "application/json")
    @ResponseBody
    public BaseResponseVO<Integer> deleteCheckupResult(@PathVariable Integer checkupResultId) throws Exception {
        log.info("" + checkupResultId);

        ResultVO vo = new ResultVO();
        vo.setCheckupResultId(checkupResultId);
        resultService.deleteCheckupResult(vo);

        return new BaseResponseVO<>(checkupResultId);
    }

    @RequestMapping(value = "/hm/result/{checkupResultEmployeeId}/employee", method = RequestMethod.DELETE, produces = "application/json")
    @ResponseBody
    public BaseResponseVO<Integer> deleteResultEmployee(@PathVariable Integer checkupResultEmployeeId) throws Exception {
        log.info("" + checkupResultEmployeeId);

        ResultEmployeeVO vo = new ResultEmployeeVO();
        vo.setCheckupResultEmployeeId(checkupResultEmployeeId);
        resultService.deleteResultEmployee(vo);

        return new BaseResponseVO<>(checkupResultEmployeeId);
    }

//     endregion

    // region US
    @RequestMapping(value = "/us/check_result", method = RequestMethod.GET, produces = "text/html")
    public String checkResultView() throws Exception {
        log.info("");

        return "us/check_result";
    }

    @RequestMapping(value = "/us/result_report", method = RequestMethod.GET, produces = "text/html")
    public String selectUsResultListView(Model model, HttpSession session) throws Exception {
        log.info("");

//        ResultEmployeeVO resultEmployee = (ResultEmployeeVO) vo.getResultEmployees();
        Integer userId = (Integer) session.getAttribute("sessionUserId");
        model.addAttribute("resultItems", resultService.selectUsResultList(userId));

        return "us/result_report";
    }

    @RequestMapping(value = "/us/result", method = RequestMethod.GET, produces = "application/json")
    @ResponseBody
    public BaseResponseVO<List<ResultVO>> selectUsResultList(HttpSession session) throws Exception {
        log.info("");

        Integer userId = (Integer) session.getAttribute("sessionUserId");

        return new BaseResponseVO<>(resultService.selectUsResultList(userId));
    }
    // endregion
}
