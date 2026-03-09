package kr.co.sitebuilder.manager.web;

import kr.co.sitebuilder.common.vo.BaseResponseVO;
import kr.co.sitebuilder.manager.service.ManagerService;
import kr.co.sitebuilder.manager.vo.*;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

@Controller
@Slf4j
public class ManagerController {

    @Resource
    private ManagerService managerService;

    @RequestMapping(value = "/pm/manager", method = RequestMethod.GET, produces = "text/html")
    public String managerView() {
        log.info("");
        return "pm/manager/index";
    }

    @RequestMapping(value = "/pm/companymanager/{userId}", method = RequestMethod.GET, produces = "text/html")
    public String cmView(@PathVariable("userId") Integer userId, Model model) {
        log.info("userId: " + userId);
        model.addAttribute("userId", userId);
        return "pm/manager/cmview";
    }

    @RequestMapping(value = "/pm/manager/{userId}/companyedit", method = RequestMethod.GET, produces = "text/html")
    public String cmEditView(@PathVariable("userId") Integer userId, Model model) {
        log.info("cmEditView userId: " + userId);
        model.addAttribute("userId", userId);
        return "pm/manager/cmedit";
    }

    @RequestMapping(value = "/pm/hospitalmanager/{userId}", method = RequestMethod.GET, produces = "text/html")
    public String hmView(@PathVariable("userId") Integer userId, Model model) {
        log.info("pmView userId: " + userId);
        model.addAttribute("userId", userId);
        return "pm/manager/hmview";
    }

    @RequestMapping(value = "/pm/manager/{userId}/hospitaledit", method = RequestMethod.GET, produces = "text/html")
    public String hmEditView(@PathVariable("userId") Integer userId, Model model) {
        log.info("hmEditView userId: " + userId);
        model.addAttribute("userId", userId);

        return "pm/manager/hmedit";
    }

    @RequestMapping(value = "/pm/pmmanager/{userId}", method = RequestMethod.GET, produces = "text/html")
    public String pmView(@PathVariable("userId") Integer userId, Model model) {
        log.info("pmEditView userId: " + userId);
        model.addAttribute("userId", userId);
        return "pm/manager/pmview";
    }

    @RequestMapping(value = "/pm/manager/{userId}/pmedit", method = RequestMethod.GET, produces = "text/html")
    public String pmEditView(@PathVariable("userId") Integer userId, Model model) {
        log.info("pmEditView userId: " + userId);
        model.addAttribute("userId", userId);
        return "pm/manager/pmedit";
    }

    @RequestMapping(value = "/pm/manager/companycreate", method = RequestMethod.GET, produces = "text/html")
    public String managerCompanyCreateView() {
        log.info("");
        return "pm/manager/companycreate";
    }

    @RequestMapping(value = "/pm/manager/hospitalcreate", method = RequestMethod.GET, produces = "text/html")
    public String managerHospitalCreateView() {
        log.info("");
        return "pm/manager/hospitalcreate";
    }

    @RequestMapping(value = "/pm/manager/platformcreate", method = RequestMethod.GET, produces = "text/html")
    public String managerPlatformCreateView() {
        log.info("");
        return "pm/manager/platformcreate";
    }

    @RequestMapping(value = "/pm/manager", method = RequestMethod.GET, produces = "application/json")
    @ResponseBody
    public BaseResponseVO<List<ManagerVO>> selectManagerList() throws Exception {
        log.info("");

        return new BaseResponseVO<>(managerService.selectManagerList());
    }

    @RequestMapping(value = "/pm/centermanager", method = RequestMethod.GET, produces = "application/json")
    @ResponseBody
    public BaseResponseVO<List<CenterManagerVO>> centerManagerList() throws Exception {
        log.info("");

        return new BaseResponseVO<>(managerService.centerManagerList());
    }

    @RequestMapping(value = "/pm/manager/reset", method = RequestMethod.PUT, produces = "application/json")
    @ResponseBody
    public BaseResponseVO<ManagerVO> resetPw(@RequestBody ManagerVO vo) throws Exception {
        log.info("");

        managerService.resetPw(vo);

        return new BaseResponseVO<>(vo);
    }

    @RequestMapping(value = "/pm/manager/hospital/{userId}", method = RequestMethod.GET, produces = "application/json")
    @ResponseBody
    public BaseResponseVO<CenterManagerVO> selectCenterManager(@PathVariable("userId") Integer userId, HttpServletResponse response) throws Exception {
        log.info("" + userId);
        CenterManagerVO vo = new CenterManagerVO();
        vo.setUserId(userId);
        vo = managerService.selectCenterManager(vo);

        return new BaseResponseVO<>(vo);
    }

    @RequestMapping(value = "/pm/manager/company/{userId}", method = RequestMethod.GET, produces = "application/json")
    @ResponseBody
    public BaseResponseVO<CompanyManagerVO> selectCompanyManager(@PathVariable("userId") Integer userId) throws Exception {
        log.info("" + userId);

        CompanyManagerVO vo = new CompanyManagerVO();
        vo.setUserId(userId);
        vo = managerService.selectCompanyManager(vo);

        return new BaseResponseVO<>(vo);
    }

    @RequestMapping(value = "/pm/manager/pm/{userId}", method = RequestMethod.GET, produces = "application/json")
    @ResponseBody
    public BaseResponseVO<PlatformManagerVO> selectPlatformManager(@PathVariable("userId") Integer userId) throws Exception {
        log.info("" + userId);

        PlatformManagerVO vo = new PlatformManagerVO();
        vo.setUserId(userId);
        vo = managerService.selectPlatformManager(vo);

        return new BaseResponseVO<>(vo);
    }

//    @RequestMapping(value = "/pm/{userId}", method = RequestMethod.GET, produces = "application/json")
//    @ResponseBody
//    public BaseResponseVO<PlatformManagerVO> selectPlatformManagerView(@PathVariable("userId") Integer userId) throws Exception {
//        log.info("" + userId);
//
//        PlatformManagerVO vo = new PlatformManagerVO();
//        vo.setUserId(userId);
//        vo = managerService.selectPlatformManager(vo);
//
//        return new BaseResponseVO<>(vo);
//    }

    @RequestMapping(value = "/pm/manager/pmcreate", method = RequestMethod.POST, produces = "application/json")
    @ResponseBody
    public BaseResponseVO<PlatformManagerVO> insertPlatformManager(@RequestBody PlatformManagerVO vo) throws Exception {
        log.info("" + vo);

        managerService.insertPlatformManager(vo);
        return new BaseResponseVO<>(vo);
    }

    @RequestMapping(value = "/pm/manager/companycreate", method = RequestMethod.POST, produces = "application/json")
    @ResponseBody
    public BaseResponseVO<CompanyManagerVO> insertCompanyManager(@RequestBody CompanyManagerVO vo) throws Exception {
        log.info("" + vo);

        managerService.insertCompanyManager(vo);
        return new BaseResponseVO<>(vo);
    }

    @RequestMapping(value = "/pm/manager/hospitalcreate", method = RequestMethod.POST, produces = "application/json")
    @ResponseBody
    public BaseResponseVO<CenterManagerVO> insertCenterManager(@RequestBody CenterManagerVO vo) throws Exception {
        log.info("" + vo);

        managerService.insertCenterManager(vo);
        return new BaseResponseVO<>(vo);
    }

    @RequestMapping(value = "/pm/manager/cmccreate", method = RequestMethod.POST, produces = "application/json")
    @ResponseBody
    public BaseResponseVO<CenterManagerCompanyVO> insertCenterManagerCompany(@RequestBody CenterManagerCompanyVO vo) throws Exception {
        log.info("" + vo);

        managerService.insertCenterManagerCompany(vo);
        return new BaseResponseVO<>(vo);
    }

    @RequestMapping(value = "/pm/manager/{userId}/pmedit", method = RequestMethod.PUT, produces = "application/json")
    @ResponseBody
    public BaseResponseVO<PlatformManagerVO> updatePlatformManager(@PathVariable Integer userId, @RequestBody PlatformManagerVO vo) throws Exception {
        log.info("" + vo);

        vo.setUserId(userId);
        managerService.updatePlatformManager(vo);

        return new BaseResponseVO<>(vo);
    }

    @RequestMapping(value = "/pm/manager/{userId}/companyedit", method = RequestMethod.PUT, produces = "application/json")
    @ResponseBody
    public BaseResponseVO<CompanyManagerVO> updateCompanyManager(@PathVariable Integer userId, @RequestBody CompanyManagerVO vo) throws Exception {
        log.info("" + vo);

        vo.setUserId(userId);
        managerService.updateCompanyManager(vo);

        return new BaseResponseVO<>(vo);
    }

    @RequestMapping(value = "/pm/manager/{userId}/hospitaledit", method = RequestMethod.PUT, produces = "application/json")
    @ResponseBody
    public BaseResponseVO<CenterManagerVO> updateCenterManager(@PathVariable Integer userId, @RequestBody CenterManagerVO vo) throws Exception {
        log.info("" + vo);

        vo.setUserId(userId);
        managerService.updateCenterManager(vo);

        return new BaseResponseVO<>(vo);
    }

    @RequestMapping(value = "/pm/manager/{userId}/company", method = RequestMethod.DELETE, produces = "application/json")
    @ResponseBody
    public BaseResponseVO<Integer> deleteCompanyManager(@PathVariable Integer userId) throws Exception {
        log.info("userId: " + userId);

        ManagerVO vo = new ManagerVO();
        vo.setUserId(userId);
        managerService.deleteCompanyManager(vo);

        return new BaseResponseVO<>(userId);
    }

    @RequestMapping(value = "/pm/manager/{userId}/hospital", method = RequestMethod.DELETE, produces = "application/json")
    @ResponseBody
    public BaseResponseVO<Integer> deleteHospitalManager(@PathVariable Integer userId) throws Exception {
        log.info("" + userId);

        ManagerVO vo = new ManagerVO();
        vo.setUserId(userId);
        managerService.deleteHospitalManager(vo);

        return new BaseResponseVO<>(userId);
    }

    @RequestMapping(value = "/pm/manager/{userId}/pm", method = RequestMethod.DELETE, produces = "application/json")
    @ResponseBody
    public BaseResponseVO<Integer> deletePlatformManager(@PathVariable Integer userId) throws Exception {
        log.info("" + userId);

        ManagerVO vo = new ManagerVO();
        vo.setUserId(userId);
        managerService.deletePlatformManager(vo);

        return new BaseResponseVO<>(userId);
    }

    @RequestMapping(value = "/pm/manager/{centerManagerCompanyId}/hospitaledit", method = RequestMethod.DELETE, produces = "application/json")
    @ResponseBody
    public BaseResponseVO<Integer> deleteCenterManagerCompany(@PathVariable Integer centerManagerCompanyId) throws Exception {
        log.info("" + centerManagerCompanyId);

        CenterManagerCompanyVO vo = new CenterManagerCompanyVO();
        vo.setCenterManagerCompanyId((centerManagerCompanyId));
        managerService.deleteCenterManagerCompany(vo);

        return new BaseResponseVO<>(centerManagerCompanyId);
    }
}
