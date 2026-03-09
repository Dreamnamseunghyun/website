package kr.co.dsong.ggsj.reserve.web;

import kr.co.dsong.ggsj.common.ResponseCode;
import kr.co.dsong.ggsj.common.vo.BaseResponseVO;
import kr.co.dsong.ggsj.company.service.CompanyService;
import kr.co.dsong.ggsj.company.vo.CompanyVO;
import kr.co.dsong.ggsj.employee.service.EmployeeService;
import kr.co.dsong.ggsj.employee.vo.EmployeeCheckupVO;
import kr.co.dsong.ggsj.employee.vo.EmployeeVO;
import kr.co.dsong.ggsj.hospital.vo.CenterVO;
import kr.co.dsong.ggsj.reserve.service.ReserveService;
import kr.co.dsong.ggsj.reserve.service.UserReserveService;
import kr.co.dsong.ggsj.reserve.vo.*;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

@Controller
@Slf4j
public class UesrReserveController {

    @Resource
    private UserReserveService userReserveService;

    @Resource
    private ReserveService reserveService;

    @Resource
    private CompanyService companyService;

    @Resource
    private EmployeeService employeeService;

    @RequestMapping(value = "/us/target_information", method = RequestMethod.GET, produces = "text/html")
    public String userTargetInfoView(Model model) throws Exception {
        log.info("");

        List<ReserveVO> reserveList = userReserveService.selectReserveList();

        int checkupNumber = 0;
        for (ReserveVO reserve : reserveList) {
            if (!reserve.getSupportType()) {
                checkupNumber++;
            }
        }

        model.addAttribute("checkupNumber", checkupNumber);
        model.addAttribute("reserveList", reserveList);
        model.addAttribute("copayCompanyCheckupTypeList", userReserveService.selectCopayCompanyCheckupTypeList());

        return "us/target_information";
    }

    @RequestMapping(value = "/us/reserve", method = RequestMethod.GET, produces = "text/html")
    public String userReserveView(@RequestParam Integer userId, Model model) throws Exception {
        log.info("" + userId);

        model.addAttribute("userId", userId);

        String redirect = checkAgree();
        if (redirect != null) {
            return redirect;
        }

        return "us/reserve";
    }

    @RequestMapping(value = "/us/user_info_area", method = RequestMethod.GET, produces = "text/html")
    public String userReserveInfoAreaView(@RequestParam Integer userId, Model model, HttpSession session) throws Exception {
        log.info("" + userId);

        Integer companyId = (Integer) session.getAttribute("sessionTypeId");

        model.addAttribute("userId", userId);

        CompanyVO company = new CompanyVO();
        company.setCompanyId(companyId);
        model.addAttribute("company", companyService.selectCompanyCm(company));

        ReserveVO reserve = new ReserveVO();
        reserve.setUserId(userId);
        model.addAttribute("reserve", userReserveService.selectReserve(reserve));

        return "us/user_info_area";
    }

    @RequestMapping(value = "/us/reserve_agree", method = RequestMethod.GET, produces = "text/html")
    public String userReserveAgreeView(@RequestParam Integer userId, Model model) throws Exception {
        log.info("" + userId);

        model.addAttribute("userId", userId);

        return "us/reserve_agree";
    }

    @RequestMapping(value = "/us/sexual_selection", method = RequestMethod.GET, produces = "text/html")
    public String userSexualSelectionView(@RequestParam(defaultValue = "hospital") String reserveType, @RequestParam Integer userId, Model model) throws Exception {
        log.info("" + userId);

        model.addAttribute("reserveType", reserveType);
        model.addAttribute("userId", userId);

        String redirect = checkSex(reserveType, userId);
        if (redirect != null) {
            return redirect;
        }

        return "us/sexual_selection";
    }

    @RequestMapping(value = "/us/checkup_selection_male", method = RequestMethod.GET, produces = "text/html")
    public String userSelectionMaleView(@RequestParam Integer userId, Model model) {
        log.info("" + userId);

        model.addAttribute("userId", userId);

        return "us/checkup_selection_male";
    }

    @RequestMapping(value = "/us/checkup_selection_female", method = RequestMethod.GET, produces = "text/html")
    public String userSelectionFemaleView(@RequestParam Integer userId, Model model) {
        log.info("" + userId);

        model.addAttribute("userId", userId);

        return "us/checkup_selection_female";
    }

    @RequestMapping(value = "/us/reserve_checkup", method = RequestMethod.GET, produces = "text/html")
    public String userReserveCheckupView(
            @RequestParam(defaultValue = "hospital") String reserveType,
            @RequestParam Integer userId,
            @RequestParam(required = false) String itemIds,
            @RequestParam(required = false) String itemNames,
            Model model
    ) throws Exception {
        log.info("" + userId);

        model.addAttribute("reserveType", reserveType);
        model.addAttribute("userId", userId);
        model.addAttribute("itemIds", itemIds);
        model.addAttribute("itemNames", itemNames);

        ReserveVO reserve = new ReserveVO();
        reserve.setUserId(userId);
        model.addAttribute("reserve", userReserveService.selectReserve(reserve));

        return "us/reserve_checkup";
    }

    @RequestMapping(value = "/us/ex_item_selection_package_option", method = RequestMethod.GET, produces = "text/html")
    public String userPackageCompareView(@RequestParam(defaultValue = "hospital") String reserveType, ReserveVO vo, Model model) throws Exception {
        log.info("" + vo);

        model.addAttribute("reserveType", reserveType);
        model.addAttribute("userId", vo.getUserId());
        model.addAttribute("itemIds", vo.getItemIds());
        model.addAttribute("centerId", vo.getCenterId());
        model.addAttribute("checkupContractSubTypeId", vo.getCheckupContractSubTypeId());
        model.addAttribute("specialCheckup", vo.getSpecialCheckup());
        model.addAttribute("sido", vo.getSido());
        model.addAttribute("sigungu", vo.getSigungu());
        model.addAttribute("centerName", vo.getCenterName());

        model.addAttribute("checkupItemClasses", userReserveService.selectCheckupItemClassList());

        return "us/ex_item_selection_package_option";
    }

    @RequestMapping(value = "/us/ex_item_selection_package", method = RequestMethod.GET, produces = "text/html")
    public String userPackageSelectOptionView(@RequestParam(defaultValue = "hospital") String reserveType, ReserveVO vo, Model model) throws Exception {
        log.info("" + vo);

        model.addAttribute("reserveType", reserveType);
        model.addAttribute("userId", vo.getUserId());
        model.addAttribute("centerId", vo.getCenterId());
        model.addAttribute("checkupContractSubTypeId", vo.getCheckupContractSubTypeId());
        model.addAttribute("reserve", userReserveService.selectReserve(vo));

        List<CheckupRegisterVO> checkupRegisters = userReserveService.selectCheckupRegisterList(vo);
        model.addAttribute("checkupRegisters", checkupRegisters);

        List<Integer> selectedCheckupContractItemIds = new ArrayList<>();

        StringBuilder selectedItemMessages = new StringBuilder();
        if (!StringUtils.isEmpty(vo.getItemIds())) {
            for (CheckupRegisterVO checkupRegister : checkupRegisters) {
                for (CheckupItemClassVO checkupItemClass : checkupRegister.getCheckupItemClasses()) {
                    for (CheckupItemCategoryVO checkupItemCategory : checkupItemClass.getCheckupItemCategories()) {
                        for (CheckupItemVO checkupItem : checkupItemCategory.getCheckupItems()) {
                            if (vo.getItemIdList().contains(checkupItem.getItemId())) {
                                selectedItemMessages.append("※ 선택하신 병원은 고객님께서 희망하신 ").append(checkupItem.getItemName()).append(" 검사가 ").append(checkupRegister.getRegisterName()).append("에 포함되어 있습니다.<br/>");
                                selectedCheckupContractItemIds.add(checkupItem.getCheckupContractItemId());
                            }
                        }
                    }
                }
            }
        }

        model.addAttribute("selectedItemMessages", selectedItemMessages.toString());
        model.addAttribute("selectedCheckupContractItemIds", selectedCheckupContractItemIds);

        return "us/ex_item_selection_package";
    }

    @RequestMapping(value = "/us/reserve_checkup_date", method = RequestMethod.GET, produces = "text/html")
    public String userPackageSelectDateView(@RequestParam(defaultValue = "hospital") String reserveType, ReserveVO vo, Model model) throws Exception {
        log.info("" + vo);

        model.addAttribute("reserveType", reserveType);
        model.addAttribute("userId", vo.getUserId());
        model.addAttribute("centerId", vo.getCenterId());
        model.addAttribute("reserve", userReserveService.selectReserve(vo));

        return "us/reserve_checkup_date";
    }

    @RequestMapping(value = "/us/ex_item_final_confirm", method = RequestMethod.GET, produces = "text/html")
    public String userReserveFinalConfirmView(@RequestParam(defaultValue = "hospital") String reserveType, ReserveVO vo, Model model) throws Exception {
        log.info("" + vo);

        model.addAttribute("reserveType", reserveType);
        model.addAttribute("userId", vo.getUserId());
        model.addAttribute("reservationId", vo.getReservationId());
        model.addAttribute("employee", getEmployee(vo.getUserId()));
        model.addAttribute("reserve", userReserveService.selectReserve(vo));

        return "us/ex_item_final_confirm";
    }

    @RequestMapping(value = "/us/edit_information", method = RequestMethod.GET, produces = "text/html")
    public String userReserveEditInfo(ReserveVO vo, Model model) throws Exception {
        log.info("" + vo);

        model.addAttribute("reserve", userReserveService.selectReserve(vo));

        return "us/edit_information";
    }

    @RequestMapping(value = "/us/check_information", method = RequestMethod.GET, produces = "text/html")
    public String userReserveCheckInfo(ReserveVO vo, Model model) throws Exception {
        log.info("" + vo);

        model.addAttribute("reserve", userReserveService.selectReserve(vo));

        return "us/check_information";
    }

    @RequestMapping(value = "/us/cancel_information", method = RequestMethod.GET, produces = "text/html")
    public String userReserveCancelInfo(ReserveVO vo, Model model) throws Exception {
        log.info("" + vo);

        model.addAttribute("reserve", userReserveService.selectReserve(vo));

        return "us/cancel_information";
    }

    @RequestMapping(value = "/us/agree", method = RequestMethod.POST, produces = "application/json")
    @ResponseBody
    public BaseResponseVO<EmployeeCheckupVO> agree(@RequestBody EmployeeCheckupVO vo) throws Exception {
        log.info("" + vo);

        vo.setCheckupYear(Calendar.getInstance().get(Calendar.YEAR));
        employeeService.updateEmployeeCheckupAgree(vo);

        return new BaseResponseVO<>(vo);
    }

    @RequestMapping(value = "/us/reserve", method = RequestMethod.POST, produces = "application/json")
    @ResponseBody
    public BaseResponseVO<ReserveVO> insertUserReserve(@RequestBody ReserveVO vo) throws Exception {
        log.info("" + vo);

        EmployeeVO employee = getEmployee(vo.getUserId());
        if (employee == null) {
            return new BaseResponseVO<>(vo, ResponseCode.FAIL);
        }

        userReserveService.insertReserve(vo);

        return new BaseResponseVO<>(vo);
    }

    @RequestMapping(value = "/us/reserve/{reservationId}", method = RequestMethod.PUT, produces = "application/json")
    @ResponseBody
    public BaseResponseVO<ReserveVO> updateUserReserve(@PathVariable Integer reservationId, @RequestBody ReserveVO vo) throws Exception {
        log.info("reservationId: " + reservationId);
        log.info("vo: " + vo);

        ReserveVO reserve = new ReserveVO();
        reserve.setReservationId(reservationId);


        if (vo.getDesiredAt() != null || (vo.getSelectedItemIds() != null && vo.getSelectedItemIds().size() > 0)) {
            if (vo.getReservationState() == 1) {
                reserve.setReservationState(1);
            } else if (vo.getReservationState() == 3) {
                reserve.setReservationState(3);
            } else if (vo.getReservationState() == 5) {
                reserve.setReservationState(3);
            } else if (vo.getReservationState() == 2) {
                reserve.setReservationState(3);
            }
        }

        reserve.setDesiredAt(vo.getDesiredAt());
        reserve.setSelectedItemIds(vo.getSelectedItemIds());

        reserve.setEmployeeNotes(vo.getEmployeeNotes());

        userReserveService.updateReserve(reserve);

        return new BaseResponseVO<>(reserve);
    }

    @RequestMapping(value = "/us/reserve/cancel", method = RequestMethod.POST, produces = "application/json")
    @ResponseBody
    public BaseResponseVO<ReserveVO> cancelUserReserve(@RequestBody ReserveVO vo) throws Exception {
        log.info("" + vo);

        ReserveVO reserve = new ReserveVO();
        reserve.setReservationId(vo.getReservationId());
        reserve.setReservationState(0);
        reserve.setEmployeeNotes(vo.getEmployeeNotes());

        userReserveService.updateReserve(reserve);

        return new BaseResponseVO<>(reserve);
    }

    @RequestMapping(value = "/us/reserve-center", method = RequestMethod.GET, produces = "application/json")
    @ResponseBody
    public BaseResponseVO<List<CenterVO>> selectUserReserveCenter(ReserveVO vo) throws Exception {
        log.info("" + vo);
        return new BaseResponseVO<>(userReserveService.selectCenterList(vo));
    }

    @RequestMapping(value = "/us/checkup-contract-item", method = RequestMethod.GET, produces = "application/json")
    @ResponseBody
    public BaseResponseVO<List<CheckupItemVO>> selectUserCheckupContractItemList(ReserveVO vo) throws Exception {
        log.info("" + vo);
        return new BaseResponseVO<>(userReserveService.selectCheckupContractItemList(vo));
    }

    @RequestMapping(value = "/us/checkup-register", method = RequestMethod.GET, produces = "application/json")
    @ResponseBody
    public BaseResponseVO<List<CheckupRegisterVO>> selectUserCheckupRegisterList(ReserveVO vo) throws Exception {
        log.info("" + vo);
        return new BaseResponseVO<>(userReserveService.selectCheckupRegisterList(vo));
    }

    @RequestMapping(value = "/us/day-off", method = RequestMethod.GET, produces = "application/json")
    @ResponseBody
    public BaseResponseVO<List<DayOffVO>> selectDayOffList(@RequestParam Integer centerId) throws Exception {
        log.info("" + centerId);
        return new BaseResponseVO<>(reserveService.selectDayOffList(centerId));
    }

    private String checkAgree() throws Exception {
        Boolean isEmployeeCheckupAgree = employeeService.isEmployeeCheckupAgree();

        if (isEmployeeCheckupAgree == null) {
            return "redirect:/us";
        } else if (!isEmployeeCheckupAgree) {
            return "redirect:/us/reserve_agree.html";
        }

        return null;
    }

    private String checkSex(String reserveType, Integer userId) throws Exception {
        EmployeeVO employee = getEmployee(userId);
        if (employee == null) {
            return "redirect:/us";
        }

        if (!StringUtils.isEmpty(employee.getSex())) {
            ReserveVO reserve = new ReserveVO();
            reserve.setUserId(userId);
            reserve.setSex(employee.getSex());
            userReserveService.insertReserve(reserve);

            if ("hospital".equals(reserveType)) {
                return "redirect:/us/reserve_checkup.html";
            } else if ("date".equals(reserveType)) {
                return "redirect:/us/reserve_checkup_date.html";
            } else if ("item".equals(reserveType)) {
                if ("M".equals(employee.getSex())) {
                    return "redirect:/us/checkup_selection_male.html";
                } else {
                    return "redirect:/us/checkup_selection_female.html";
                }
            } else {
                return "redirect:/us";
            }
        }

        return null;
    }

    private EmployeeVO getEmployee(Integer userId) throws Exception {
        EmployeeVO employee = new EmployeeVO();
        employee.setUserId(userId);
        return employeeService.selectUsEmployee(employee);
    }
}
