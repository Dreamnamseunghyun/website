package kr.co.sitebuilder.hospital.web;

import kr.co.sitebuilder.common.service.StorageService;
import kr.co.sitebuilder.common.vo.BaseResponseVO;
import kr.co.sitebuilder.hospital.service.HospitalService;
import kr.co.sitebuilder.hospital.vo.CenterVO;
import kr.co.sitebuilder.hospital.vo.HospitalCheckupVO;
import kr.co.sitebuilder.hospital.vo.HospitalVO;
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
public class HospitalController {
    @Resource
    private HospitalService hospitalService;

    @Resource
    private StorageService storageService;

    // region PM
    @RequestMapping(value = "/pm/hospital", method = RequestMethod.GET, produces = "text/html")
    public String centerListView() {
        log.info("");
        return "pm/hospital/index";
    }

    @RequestMapping(value = "/pm/hospital/create", method = RequestMethod.GET, produces = "text/html")
    public String hospitalCreateView() {
        log.info("centerCreateView");
        return "pm/hospital/create";
    }

    @RequestMapping(value = "/pm/center/{hospitalId}/create", method = RequestMethod.GET, produces = "text/html")
    public String centerCreateView(@PathVariable String hospitalId, Model model) {
        log.info("hospitalId: " + hospitalId);

        model.addAttribute("hospitalId", hospitalId);
        return "pm/hospital/center_create";
    }

    @RequestMapping(value = "/pm/center/{centerId}", method = RequestMethod.GET, produces = "text/html")
    public String centerReadView(@PathVariable String centerId, Model model) {
        log.info("centerId: " + centerId);

        model.addAttribute("centerId", centerId);
        return "pm/hospital/view";
    }

    @RequestMapping(value = {"/pm/center/{centerId}/info"}, method = RequestMethod.GET, produces = "text/html")
    public String centerInfoView(@PathVariable("centerId") Integer centerId, Model model) {
        log.info("centerId" + centerId);

        model.addAttribute("centerId", centerId);
        return "pm/hospital/info";
    }

    @RequestMapping(value = "/pm/center/{centerId}/edit", method = RequestMethod.GET, produces = "text/html")
    public String centerEditView(@PathVariable("centerId") Integer centerId, Model model) {
        log.info("centerId: " + centerId);

        model.addAttribute("centerId", centerId);
        return "pm/hospital/edit";
    }

    @RequestMapping(value = "/pm/hospital/{hospitalId}/checkup/{checkupYear}", method = RequestMethod.GET, produces = "text/html")
    public String hospitalCheckupView(@PathVariable("hospitalId") Integer hospitalId, @PathVariable("checkupYear") Integer checkupYear, Model model) {
        log.info("hospitalId: " + hospitalId + " checkupYear : " + checkupYear);

        model.addAttribute("hospitalId", hospitalId);
        model.addAttribute("checkupYear", checkupYear);

        return "pm/hospital/checkup";
    }


    @RequestMapping(value = "/pm/hospital", method = RequestMethod.GET, produces = "application/json")
    @ResponseBody
    public BaseResponseVO<List<CenterVO>> selectHospitalList() throws Exception {

        Integer hospitalId = null;
        log.info("" + hospitalId);
        return new BaseResponseVO<>(hospitalService.selectCenterList(hospitalId));
    }

    @RequestMapping(value = "/pm/hospital/{hospitalId}/create", method = RequestMethod.GET, produces = "application/json")
    @ResponseBody
    public BaseResponseVO<HospitalVO> createHospital(@PathVariable Integer hospitalId) throws Exception {
        log.info("" + hospitalId);

        HospitalVO vo = new HospitalVO();
        vo.setHospitalId(hospitalId);
        vo = hospitalService.selectHospital(vo);

        return new BaseResponseVO<>(vo);
    }

    @RequestMapping(value = "/pm/hospital/{hospitalId}", method = RequestMethod.GET, produces = "application/json")
    @ResponseBody
    public BaseResponseVO<HospitalVO> selectHospital(@PathVariable Integer hospitalId) throws Exception {
        log.info("" + hospitalId);

        HospitalVO vo = new HospitalVO();
        vo.setHospitalId(hospitalId);
        vo = hospitalService.selectHospital(vo);

        return new BaseResponseVO<>(vo);
    }

    @RequestMapping(value = "/pm/hospital", method = RequestMethod.POST, produces = "application/json")
    @ResponseBody
    public BaseResponseVO<CenterVO> insertHospital(@RequestPart CenterVO hospital, @RequestPart MultipartFile ci) throws Exception {
        log.info("" + hospital);

        hospitalService.insertHospital(hospital);

        if (!ci.isEmpty() && !StringUtils.isEmpty(hospital.getCiFilename())) {
            storageService.putObject(hospital.getStorageUrl(hospital.getCiFilename()), ci);
        }

        hospitalService.insertCenter(hospital);

        return new BaseResponseVO<>(hospital);
    }

    @RequestMapping(value = "/pm/center/{hospital}", method = RequestMethod.POST, produces = "application/json")
    @ResponseBody
    public BaseResponseVO<CenterVO> insertCenter(@RequestBody CenterVO vo) throws Exception {
        log.info("" + vo);

        hospitalService.insertCenter(vo);

        return new BaseResponseVO<>(vo);
    }

    @RequestMapping(value = "/pm/hospital/{hospitalId}/checkup/{checkupYear}", method = RequestMethod.GET, produces = "application/json")
    @ResponseBody
    public BaseResponseVO<HospitalCheckupVO> selectHospitalCheckup(@PathVariable("hospitalId") Integer hospitalId, @PathVariable("checkupYear") Integer checkupYear) throws Exception {
        log.info("selectHospitalCheckup hospitalId: " + hospitalId + " checkupYear : " + checkupYear);

        HospitalCheckupVO vo = new HospitalCheckupVO();
        vo.setHospitalId(hospitalId);
        vo.setCheckupYear(checkupYear);
        vo = hospitalService.selectHospitalCheckup(vo);

        return new BaseResponseVO<>(vo);
    }

    @RequestMapping(value = "/pm/hospital/{hospitalId}/checkup/{checkupYear}", method = RequestMethod.POST, produces = "application/json")
    @ResponseBody
    public BaseResponseVO<HospitalCheckupVO> insertHospitalCheckup(@PathVariable("hospitalId") Integer hospitalId, @PathVariable("checkupYear") Integer checkupYear, @RequestBody HospitalCheckupVO vo) throws Exception {
        log.info("selectHospitalCheckup hospitalId: " + hospitalId + " checkupYear : " + checkupYear);
        log.info("" + vo);

        vo.setHospitalId(hospitalId);
        vo.setCheckupYear(checkupYear);
        hospitalService.insertHospitalCheckup(vo);

        return new BaseResponseVO<>(vo);
    }

    @RequestMapping(value = "/pm/tabs", method = RequestMethod.GET, produces = "application/json")
    @ResponseBody
    public BaseResponseVO<List<CenterVO>> tabsCenter(CenterVO vo) throws Exception {
        log.info("");

        return new BaseResponseVO<>(hospitalService.tabsCenter(vo));
    }

    @RequestMapping(value = "/pm/hospital/{hospitalId}/checkup/{checkupYear}/copy", method = RequestMethod.POST, produces = "application/json")
    @ResponseBody
    public BaseResponseVO<HospitalCheckupVO> copyHospitalCheckup(@PathVariable("hospitalId") Integer hospitalId, @PathVariable("checkupYear") Integer checkupYear) throws Exception {
        log.info("hospitalId: " + hospitalId + " checkupYear : " + checkupYear);

        HospitalCheckupVO vo = new HospitalCheckupVO();
        vo.setHospitalId(hospitalId);
        vo.setCheckupYear(checkupYear);
        hospitalService.copyHospitalCheckup(vo);

        return new BaseResponseVO<>(vo);
    }
    // endregion

    // region HM
    @RequestMapping(value = "hm/hospital", method = RequestMethod.GET, produces = "text/html")
    public String HmCenterListView() {
        log.info("");
        return "hm/hospital/index";
    }

    @RequestMapping(value = "/hm/center/0", method = RequestMethod.GET, produces = "text/html")
    public String HmCenterReadView() {
        log.info("");

        return "hm/hospital/view";
    }

    @RequestMapping(value = "/hm/center/0/create", method = RequestMethod.GET, produces = "text/html")
    public String HmCenterCreateView(Model model, HttpSession session) {

        Integer hospitalId = (Integer) session.getAttribute("sessionTypeId");
        log.info("hospitalId: " + hospitalId);

        model.addAttribute("hospitalId", hospitalId);
        return "hm/hospital/center_create";
    }

    @RequestMapping(value = "/hm/center/{centerId}", method = RequestMethod.GET, produces = "text/html")
    public String HmCenterReadView(@PathVariable String centerId, Model model) {
        log.info("centerId: " + centerId);

        model.addAttribute("centerId", centerId);
        return "hm/hospital/view";
    }

    @RequestMapping(value = "/hm/center/{centerId}/info", method = RequestMethod.GET, produces = "text/html")
    public String HmCenterInfoView(@PathVariable("centerId") Integer centerId, Model model) {
        log.info("centerId: " + centerId);

        model.addAttribute("centerId", centerId);
        return "hm/hospital/info";
    }

    @RequestMapping(value = "/hm/center/{centerId}/edit", method = RequestMethod.GET, produces = "text/html")
    public String HmCenterEditView(@PathVariable("centerId") Integer centerId, Model model) {
        log.info("centerId: " + centerId);

        model.addAttribute("centerId", centerId);
        return "hm/hospital/edit";
    }

    @RequestMapping(value = "/hm/hospital/0/checkup/{checkupYear}", method = RequestMethod.GET, produces = "text/html")
    public String HmHospitalCheckupView() {
        log.info("");

        return "hm/hospital/checkup";
    }

    @RequestMapping(value = "/hm/hospital", method = RequestMethod.GET, produces = "application/json")
    @ResponseBody
    public BaseResponseVO<List<CenterVO>> HmSelectHospitalList(HttpSession session) throws Exception {

        Integer hospitalId = (Integer) session.getAttribute("sessionTypeId");
        log.info("" + hospitalId);
        return new BaseResponseVO<>(hospitalService.selectCenterList(hospitalId));
    }

    @RequestMapping(value = "/hm/checkupDate", method = RequestMethod.GET, produces = "application/json")
    @ResponseBody
    public BaseResponseVO<List<CenterVO>> SelectCheckupDateList(CenterVO vo, HttpSession session) throws Exception {
        log.info("" + vo);

        Integer hospitalId = (Integer) session.getAttribute("sessionTypeId");

        vo.setHospitalId(hospitalId);

        return new BaseResponseVO<>(hospitalService.selectCheckupDateList(vo));
    }

    @RequestMapping(value = "/hm/center/0/create", method = RequestMethod.GET, produces = "application/json")
    @ResponseBody
    public BaseResponseVO<HospitalVO> HmCreateHospital(HttpSession session) throws Exception {
        log.info("");

        Integer hospitalId = (Integer) session.getAttribute("sessionTypeId");

        HospitalVO vo = new HospitalVO();
        vo.setHospitalId(hospitalId);
        vo = hospitalService.selectHospital(vo);

        return new BaseResponseVO<>(vo);
    }

    @RequestMapping(value = "/hm/hospital/0/checkup/{checkupYear}", method = RequestMethod.GET, produces = "application/json")
    @ResponseBody
    public BaseResponseVO<HospitalCheckupVO> HmSelectHospitalCheckup(@PathVariable("checkupYear") Integer checkupYear, HttpSession session) throws Exception {
        Integer hospitalId = (Integer) session.getAttribute("sessionTypeId");

        log.info("selectHospitalCheckup hospitalId: " + hospitalId + " checkupYear : " + checkupYear);

        HospitalCheckupVO vo = new HospitalCheckupVO();
        vo.setHospitalId(hospitalId);
        vo.setCheckupYear(checkupYear);
        vo = hospitalService.selectHospitalCheckup(vo);

        return new BaseResponseVO<>(vo);
    }

    @RequestMapping(value = "/hm/center/0", method = RequestMethod.POST, produces = "application/json")
    @ResponseBody
    public BaseResponseVO<CenterVO> HmInsertCenter(@RequestBody CenterVO vo, HttpSession session) throws Exception {
        log.info("" + vo);

        Integer hospitalId = (Integer) session.getAttribute("sessionTypeId");

        vo.setHospitalId(hospitalId);
        hospitalService.insertCenter(vo);
        hospitalService.updateHospital(vo);
        return new BaseResponseVO<>(vo);
    }

    @RequestMapping(value = "/hm/hospital/0/checkup/{checkupYear}", method = RequestMethod.POST, produces = "application/json")
    @ResponseBody
    public BaseResponseVO<HospitalCheckupVO> HmInsertHospitalCheckup(@PathVariable("checkupYear") Integer checkupYear, @RequestBody HospitalCheckupVO vo, HttpSession session) throws Exception {
        Integer hospitalId = (Integer) session.getAttribute("sessionTypeId");

        log.info("selectHospitalCheckup hospitalId: " + hospitalId + " checkupYear : " + checkupYear);
        log.info("" + vo);

        vo.setHospitalId(hospitalId);
        vo.setCheckupYear(checkupYear);
        hospitalService.insertHospitalCheckup(vo);

        return new BaseResponseVO<>(vo);
    }

    @RequestMapping(value = "/hm/tabs", method = RequestMethod.GET, produces = "application/json")
    @ResponseBody
    public BaseResponseVO<List<CenterVO>> hmTabsCenter(CenterVO vo) throws Exception {
        log.info("");

        return new BaseResponseVO<>(hospitalService.tabsCenter(vo));
    }
    // endregion

    // region US
    @RequestMapping(value = "/us/hospital_detail_list", method = RequestMethod.GET, produces = "text/html")
    public String UsCenterInfoView(@RequestParam Integer centerId, Model model) throws Exception {
        log.info("centerId: " + centerId);

        CenterVO vo = new CenterVO();
        vo.setCenterId(centerId);
        vo = hospitalService.selectCenter(vo);

        model.addAttribute("center", vo);
        return "us/hospital_detail_list";
    }
    // endregion

    // region CM

    @RequestMapping(value = "/cm/hospitallist", method = RequestMethod.GET, produces = "application/json")
    @ResponseBody
    public BaseResponseVO<List<CenterVO>> selectCmHospitalList(CenterVO vo, HttpSession session) throws Exception {
        log.info("");
        Integer companyId = (Integer) session.getAttribute("sessionTypeId");
        vo.setCompanyId(companyId);

        return new BaseResponseVO<>(hospitalService.selectCmHospitalList(vo));
    }

    // endregion

    // region COMMON
    @RequestMapping(value = {"/pm/center", "/hm/center"}, method = RequestMethod.GET, produces = "application/json")
    @ResponseBody
    public BaseResponseVO<List<CenterVO>> selectCenterList(HttpSession session) throws Exception {
        log.info("");

        Integer hospitalId = (Integer) session.getAttribute("sessionTypeId");

        return new BaseResponseVO<>(hospitalService.selectCenterList(hospitalId));
    }

    @RequestMapping(value = {"/pm/center/{centerId}", "/hm/center/{centerId}"}, method = RequestMethod.GET, produces = "application/json")
    @ResponseBody
    public BaseResponseVO<CenterVO> selectCenter(@PathVariable Integer centerId) throws Exception {
        log.info("" + centerId);

        CenterVO vo = new CenterVO();
        vo.setCenterId(centerId);
        vo = hospitalService.selectCenter(vo);

        return new BaseResponseVO<>(vo);
    }

    @RequestMapping(value = {"/pm/center/{centerId}/0", "/hm/center/{centerId}/0"}, method = RequestMethod.POST, produces = "application/json")
    @ResponseBody
    public BaseResponseVO<CenterVO> updateCenter(@PathVariable Integer centerId, @RequestPart CenterVO hospital, @RequestPart MultipartFile ci) throws Exception {
        log.info("centerId: " + centerId + "hospital: " + hospital);

        hospital.setCenterId(centerId);
        hospitalService.updateCenter(hospital);
        hospitalService.updateHospital(hospital);

        if (StringUtils.isEmpty(hospital.getCiFilename()) && !StringUtils.isEmpty(hospital.getOrgCiFilename())) {
            storageService.deleteObject(hospital.getStorageUrl(hospital.getOrgCiFilename()));
        } else if (!ci.isEmpty()) {
            if (!StringUtils.isEmpty(hospital.getOrgCiFilename())) {
                storageService.deleteObject(hospital.getStorageUrl(hospital.getOrgCiFilename()));
            }
            storageService.putObject(hospital.getStorageUrl(hospital.getCiFilename()), ci);
        }

        return new BaseResponseVO<>(hospital);
    }

    @RequestMapping(value = {"/pm/center/{centerId}/adv", "/hm/center/{centerId}/adv"}, method = RequestMethod.POST, produces = "application/json")
    @ResponseBody
    public BaseResponseVO<CenterVO> updateAdv(@PathVariable Integer centerId, @RequestPart CenterVO center, @RequestPart("centerAdv[]") List<MultipartFile> centerAdvs) throws Exception {
        log.info("centerId: " + centerId + "center: " + center);

        center.setCenterId(centerId);
        hospitalService.updateCenter(center);
        hospitalService.updateHospital(center);

        for (int i = 0; i < 6; i++) {
            if (StringUtils.isEmpty(center.getCenterAdvFilename(i + 1, false)) && !StringUtils.isEmpty(center.getCenterAdvFilename(i + 1, true))) {
                storageService.deleteObject(center.getCenterAdvStorageUrl(center.getCenterAdvFilename(i + 1, true), i + 1));
            } else if (!centerAdvs.get(i).isEmpty()) {
                if (!StringUtils.isEmpty(center.getCenterAdvFilename(i + 1, true))) {
                    storageService.deleteObject(center.getCenterAdvStorageUrl(center.getCenterAdvFilename(i + 1, true), i + 1));
                }
                storageService.putObject(center.getCenterAdvStorageUrl(center.getCenterAdvFilename(i + 1, false), i + 1), centerAdvs.get(i));
            }
        }

        return new BaseResponseVO<>(center);
    }

    @RequestMapping(value = {"/pm/center/{centerId}", "/cm/center/{centerId}"}, method = RequestMethod.DELETE, produces = "application/json")
    @ResponseBody
    public BaseResponseVO<Integer> deleteCenter(@PathVariable Integer centerId) throws Exception {
        log.info("centerId: " + centerId);

        CenterVO vo = new CenterVO();
        vo.setHospitalId(centerId);
        hospitalService.deleteCenter(vo);
        hospitalService.deleteHospital(vo);

        return new BaseResponseVO<>(centerId);
    }
    // endregion
}
