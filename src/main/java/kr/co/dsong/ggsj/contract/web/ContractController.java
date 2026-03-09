package kr.co.dsong.ggsj.contract.web;

import kr.co.dsong.ggsj.common.CrudType;
import kr.co.dsong.ggsj.common.vo.BaseResponseVO;
import kr.co.dsong.ggsj.contract.service.ContractService;
import kr.co.dsong.ggsj.contract.vo.CheckupContractReviewVO;
import kr.co.dsong.ggsj.contract.vo.CheckupContractSubTypeVO;
import kr.co.dsong.ggsj.contract.vo.CheckupContractVO;
import kr.co.dsong.ggsj.contract.vo.ContractVO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@Slf4j
public class ContractController {

    @Resource
    private ContractService contractService;

    // region PM
    @RequestMapping(value = "/pm/contract", method = RequestMethod.GET, produces = "text/html")
    public String contractListViewPM() {
        log.info("");

        return "pm/contract/index";
    }

    @RequestMapping(value = "/pm/contract/{companyId}", method = RequestMethod.GET, produces = "text/html")
    public String selectContractListViewPM(@PathVariable Integer companyId) {
        log.info("");

        return "pm/contract/selectindex";
    }

    @RequestMapping(value = "/pm/contract-checkup", method = RequestMethod.GET, produces = "text/html")
    public String contractTypeListViewPM() {
        log.info("");

        return "pm/contract/checkup";
    }

    @RequestMapping(value = "/pm/contract-checkup/create", method = RequestMethod.GET, produces = "text/html")
    public String contractSubTypeCreateViewPM(Model model, @RequestParam Integer checkupContractId, @RequestParam Integer centerId) {
        log.info("");

        model.addAttribute("checkupContractId", checkupContractId);
        model.addAttribute("centerId", centerId);

        /*if (checkupContractId == 0) {
            return "redirect:/common/error404.jsp";
        }*/

        return "pm/contract/create";
    }

    @RequestMapping(value = "/pm/contract-checkup/{checkupContractSubTypeId}", method = RequestMethod.GET, produces = "text/html")
    public String contractSubTypeReadViewPM(@PathVariable Integer checkupContractSubTypeId) {
        log.info("");

        return "pm/contract/view";
    }

    @RequestMapping(value = "/pm/contract-checkup/{checkupContractSubTypeId}/edit", method = RequestMethod.GET, produces = "text/html")
    public String contractSubTypeEditViewPM(@PathVariable Integer checkupContractSubTypeId) {
        log.info("");

        return "pm/contract/edit";
    }


    @RequestMapping(value = "/pm/contract", method = RequestMethod.GET, produces = "application/json")
    @ResponseBody
    public BaseResponseVO<List<ContractVO>> selectContractList(ContractVO vo) throws Exception {
        log.info("");

        return new BaseResponseVO<>(contractService.selectContractList(vo));
    }

    @RequestMapping(value = "/pm/contract/{companyId}", method = RequestMethod.GET, produces = "application/json")
    @ResponseBody
    public BaseResponseVO<List<ContractVO>> selectPmContractList(@PathVariable Integer companyId, ContractVO vo) throws Exception {
        log.info("" + companyId);

        vo.setCompanyId(companyId);
        return new BaseResponseVO<>(contractService.selectContractList(vo));
    }

    @RequestMapping(value = "/pm/contract", method = RequestMethod.POST, produces = "application/json")
    @ResponseBody
    public BaseResponseVO<List<ContractVO>> saveContractList(@RequestBody List<ContractVO> vo) throws Exception {
        log.info("");

        contractService.saveContractList(vo);
        return new BaseResponseVO<>(vo);
    }

    @RequestMapping(value = "/pm/contract-checkup", method = RequestMethod.GET, produces = "application/json")
    @ResponseBody
    public BaseResponseVO<List<CheckupContractVO>> selectPmContractTypeList(CheckupContractVO vo) throws Exception {
        log.info("");

        return new BaseResponseVO<>(contractService.selectPmContractTypeList(vo));
    }

    @RequestMapping(value = "/pm/contract-checkup/create", method = RequestMethod.GET, produces = "application/json")
    @ResponseBody
    public BaseResponseVO<CheckupContractSubTypeVO> selectPmCheckupContractSubTypeCreate(CheckupContractSubTypeVO vo) throws Exception {
        log.info("");

        return new BaseResponseVO<>(contractService.selectPmCheckupContractSubTypeCreate(vo));
    }

    @RequestMapping(value = "/pm/contract-checkup", method = RequestMethod.POST, produces = "application/json")
    @ResponseBody
    public BaseResponseVO<CheckupContractSubTypeVO> savePmCheckupContractSubType(@RequestBody CheckupContractSubTypeVO vo) throws Exception {
        log.info("");

        contractService.savePmCheckupContractSubType(vo);
        return new BaseResponseVO<>(vo);
    }

    @RequestMapping(value = "/pm/contract-checkup/{checkupContractSubTypeId}", method = RequestMethod.GET, produces = "application/json")
    @ResponseBody
    public BaseResponseVO<CheckupContractSubTypeVO> selectPmCheckupContractSubType(CheckupContractSubTypeVO vo) throws Exception {
        log.info("");

        return new BaseResponseVO<>(contractService.selectPmCheckupContractSubType(vo));
    }

    @RequestMapping(value = "/pm/contract-review", method = RequestMethod.POST, produces = "application/json")
    @ResponseBody
    public BaseResponseVO<CheckupContractReviewVO> insertCheckupContractReview(@RequestBody CheckupContractReviewVO vo) throws Exception {
        log.info("");
        contractService.insertCheckupContractReview(vo);

        return new BaseResponseVO<>(vo);
    }

    @RequestMapping(value = "/pm/contract-checkup/{checkupContractSubTypeId}", method = RequestMethod.DELETE, produces = "application/json")
    @ResponseBody
    public BaseResponseVO<Integer> deletePmCheckupContractSubType(CheckupContractSubTypeVO vo) throws Exception {
        log.info("");

        vo._crudType = CrudType.REMOVE;
        contractService.savePmCheckupContractSubType(vo);

        return new BaseResponseVO<>(vo.getCheckupContractSubTypeId());
    }
    // endregion

    // region CM
    @RequestMapping(value = "/cm/contract", method = RequestMethod.GET, produces = "text/html")
    public String contractListViewCM(HttpSession session) {
        log.info("");

        Integer companyId = (Integer) session.getAttribute("sessionTypeId");

        return "cm/contract/index";
    }

    @RequestMapping(value = "/cm/contract", method = RequestMethod.GET, produces = "application/json")
    @ResponseBody
    public BaseResponseVO<List<ContractVO>> selectCmContractList(ContractVO vo, HttpSession session) throws Exception {
        log.info("");

        Integer companyId = (Integer) session.getAttribute("sessionTypeId");
        vo.setCompanyId(companyId);

        return new BaseResponseVO<>(contractService.selectCmContractList(vo));
    }
    // endregion

    // region HM
    @RequestMapping(value = "/hm/contract-checkup", method = RequestMethod.GET, produces = "text/html")
    public String contractTypeListViewHM() {
        log.info("");

        return "hm/contract/checkup";
    }

    @RequestMapping(value = "/hm/contract-checkup/create", method = RequestMethod.GET, produces = "text/html")
    public String contractSubTypeCreateViewHM(Model model, @RequestParam Integer checkupContractId, @RequestParam Integer centerId) {
        log.info("");

        model.addAttribute("checkupContractId", checkupContractId);
        model.addAttribute("centerId", centerId);

        /*if (checkupContractId == 0) {
            return "redirect:/common/error404.jsp";
        }*/

        return "hm/contract/create";
    }

    @RequestMapping(value = "/hm/contract-checkup/{checkupContractSubTypeId}", method = RequestMethod.GET, produces = "text/html")
    public String contractSubTypeReadViewHM(@PathVariable Integer checkupContractSubTypeId) {
        log.info("");

        return "hm/contract/view";
    }

    @RequestMapping(value = "/hm/contract-checkup/{checkupContractSubTypeId}/edit", method = RequestMethod.GET, produces = "text/html")
    public String contractSubTypeEditViewHM(@PathVariable Integer checkupContractSubTypeId) {
        log.info("");

        return "hm/contract/edit";
    }

    @RequestMapping(value = "/hm/contract-checkup", method = RequestMethod.GET, produces = "application/json")
    @ResponseBody
    public BaseResponseVO<List<CheckupContractVO>> selectHmContractTypeList(CheckupContractVO vo, HttpSession session) throws Exception {
        log.info("");
        Integer hospitalId = (Integer) session.getAttribute("sessionTypeId");
        vo.setHospitalId(hospitalId);

        return new BaseResponseVO<>(contractService.selectHmContractTypeList(vo));
    }

    @RequestMapping(value = "/hm/contract-checkupindex", method = RequestMethod.GET, produces = "application/json")
    @ResponseBody
    public BaseResponseVO<List<CheckupContractSubTypeVO>> selectHmCheckupContractSubType(CheckupContractSubTypeVO vo, HttpSession session) throws Exception {
        log.info("");
        Integer hospitalId = (Integer) session.getAttribute("sessionTypeId");
        vo.setHospitalId(hospitalId);

        return new BaseResponseVO<>(contractService.selectHmCheckupContractSubType(vo));
    }

    @RequestMapping(value = "/hm/contract-checkup/create", method = RequestMethod.GET, produces = "application/json")
    @ResponseBody
    public BaseResponseVO<CheckupContractSubTypeVO> selectHmCheckupContractSubTypeCreate(CheckupContractSubTypeVO vo, HttpSession session) throws Exception {
        log.info("");
        Integer hospitalId = (Integer) session.getAttribute("sessionTypeId");
        vo.setHospitalId(hospitalId);

        return new BaseResponseVO<>(contractService.selectPmCheckupContractSubTypeCreate(vo));
    }

    @RequestMapping(value = "/hm/contract-checkup", method = RequestMethod.POST, produces = "application/json")
    @ResponseBody
    public BaseResponseVO<CheckupContractSubTypeVO> saveHmCheckupContractSubType(@RequestBody CheckupContractSubTypeVO vo) throws Exception {
        log.info("");

        contractService.savePmCheckupContractSubType(vo);
        return new BaseResponseVO<>(vo);
    }

    @RequestMapping(value = "/hm/contract-review", method = RequestMethod.POST, produces = "application/json")
    @ResponseBody
    public BaseResponseVO<CheckupContractReviewVO> insertHmCheckupContractReview(@RequestBody CheckupContractReviewVO vo) throws Exception {
        log.info("");
        contractService.insertCheckupContractReview(vo);

        return new BaseResponseVO<>(vo);
    }

    @RequestMapping(value = "/hm/contract-checkup/{checkupContractSubTypeId}", method = RequestMethod.GET, produces = "application/json")
    @ResponseBody
    public BaseResponseVO<CheckupContractSubTypeVO> selectHmCheckupContractSubType(CheckupContractSubTypeVO vo) throws Exception {
        log.info("");

        return new BaseResponseVO<>(contractService.selectPmCheckupContractSubType(vo));
    }

    @RequestMapping(value = "/hm/contract-checkup/{checkupContractSubTypeId}", method = RequestMethod.DELETE, produces = "application/json")
    @ResponseBody
    public BaseResponseVO<Integer> deleteHmCheckupContractSubType(CheckupContractSubTypeVO vo) throws Exception {
        log.info("");

        vo._crudType = CrudType.REMOVE;
        contractService.savePmCheckupContractSubType(vo);

        return new BaseResponseVO<>(vo.getCheckupContractSubTypeId());
    }
    // endregion

}
