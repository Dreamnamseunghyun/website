package kr.co.dsong.ggsj.hospital.web;

import kr.co.dsong.ggsj.common.vo.BaseResponseVO;
import kr.co.dsong.ggsj.hospital.service.HcontractService;
import kr.co.dsong.ggsj.hospital.service.HsubcontractService;
import kr.co.dsong.ggsj.hospital.vo.HcontractVO;
import kr.co.dsong.ggsj.hospital.vo.HsubcontractVO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.Calendar;
import java.util.List;

@Controller
@Slf4j
public class HcontractController {
    @Resource
    private HsubcontractService hsubcontractService;

    @Resource
    private HcontractService hcontractService;

    // region PM
    @RequestMapping(value = "/pm/hcontract", method = RequestMethod.GET, produces = "text/html")
    public String HcontractHomeView() {
        log.info("");
        return "pm/hcontract/index";
    }

    @RequestMapping(value = "/pm/hospital/{hospitalId}/hcontract", method = RequestMethod.GET, produces = "text/html")
    public String HcontractView(@PathVariable String hospitalId, Model model) {
        log.info("");

        model.addAttribute("hospitalId: " + hospitalId);
        return "pm/hcontract/index";
    }

    @RequestMapping(value = "/pm/hospital/{hospitalId}/hcontract", method = RequestMethod.GET, produces = "application/json")
    @ResponseBody
    public BaseResponseVO<List<HcontractVO>> selectHcontract(@PathVariable Integer hospitalId, @RequestParam(required = false) Integer checkupYear) throws Exception {
        log.info("" + hospitalId);

        HcontractVO vo = new HcontractVO();
        vo.setHospitalId(hospitalId);
        if (checkupYear == null) {
            checkupYear = Calendar.getInstance().get(Calendar.YEAR);
        }
        vo.setCheckupYear(checkupYear);

        return new BaseResponseVO<>(hcontractService.selectHcontract(vo));
    }

    @RequestMapping(value = "/pm/hsubcontract-view/{checkupContractSubTypeId}", method = RequestMethod.GET, produces = "application/json")
    @ResponseBody
    public BaseResponseVO<HsubcontractVO> selectHsubcontract(@PathVariable Integer checkupContractSubTypeId) throws Exception {
        log.info("" + checkupContractSubTypeId);

        HsubcontractVO vo = new HsubcontractVO();
        vo.setCheckupContractSubTypeId(checkupContractSubTypeId);
        vo = hsubcontractService.selectHsub(vo);

        return new BaseResponseVO<>(vo);
    }

    @RequestMapping(value = "/pm/hsubcontract/{centerId}/create/{companyCheckupTypeId}", method = RequestMethod.GET, produces = "application/json")
    @ResponseBody
    public BaseResponseVO<HsubcontractVO> selectCreateHsubcontract(@PathVariable Integer centerId, @PathVariable Integer companyCheckupTypeId) throws Exception {
        log.info("" + centerId);

        HsubcontractVO vo = new HsubcontractVO();
        vo.setCenterId(centerId);
        vo.setCompanyCheckupTypeId(companyCheckupTypeId);
        vo = hsubcontractService.selectHsub(vo);

        return new BaseResponseVO<>(vo);
    }

    @RequestMapping(value = "/pm/hsubcontract/{centerId}/create/{companyCheckupTypeId}", method = RequestMethod.POST, produces = "application/json")
    @ResponseBody
    public BaseResponseVO<HsubcontractVO> insertCheckupContractSub(@PathVariable Integer centerId, @PathVariable Integer companyCheckupTypeId, HsubcontractVO vo) throws Exception {
        log.info("" + centerId);
        hsubcontractService.insertCheckupContractSub(vo);
        return new BaseResponseVO<>(vo);
    }
    // endregion

    // region HM
    @RequestMapping(value = "/hm/hospital/0/hcontract", method = RequestMethod.GET, produces = "text/html")
    public String HcontractView(Model model, HttpSession session) {
        log.info("");

        Integer hospitalId = (Integer) session.getAttribute("sessionTypeId");
        model.addAttribute("hospitalId: " + hospitalId);
        return "hm/hcontract/index";
    }

    @RequestMapping(value = "/hm/hospital/0/hcontract", method = RequestMethod.GET, produces = "application/json")
    @ResponseBody
    public BaseResponseVO<List<HcontractVO>> selectHcontract(HttpSession session) throws Exception {
        Integer hospitalId = (Integer) session.getAttribute("sessionTypeId");
        log.info("" + hospitalId);

        HcontractVO vo = new HcontractVO();
        vo.setHospitalId(hospitalId);

        return new BaseResponseVO<>(hcontractService.selectHcontract(vo));
    }
    // endregion
}
