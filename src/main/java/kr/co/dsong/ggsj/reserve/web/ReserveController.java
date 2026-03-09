package kr.co.dsong.ggsj.reserve.web;

import kr.co.dsong.ggsj.common.vo.BaseResponseVO;
import kr.co.dsong.ggsj.reserve.service.ReserveService;
import kr.co.dsong.ggsj.reserve.vo.DayOffVO;
import kr.co.dsong.ggsj.reserve.vo.ReserveVO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@Slf4j
public class ReserveController {

    @Resource
    private ReserveService reserveService;

    // region PM
    @RequestMapping(value = "/pm/reserve", method = RequestMethod.GET, produces = "text/html")
    public String reserveView() {
        log.info("");
        return "pm/reserve/index";
    }

    @RequestMapping(value = "/pm/reserve/view/{reservationId}", method = RequestMethod.GET, produces = "text/html")
    public String reserveReadView(@PathVariable Integer reservationId, Model model) {
        log.info("");

        model.addAttribute("reservationId", reservationId);
        return "pm/reserve/view";
    }

    @RequestMapping(value = "/pm/reserve/{reservationId}/edit", method = RequestMethod.GET, produces = "text/html")
    public String reserveEditView(@PathVariable Integer reservationId, Model model) {
        log.info("" + reservationId);

        model.addAttribute("reservationId", reservationId);

        return "pm/reserve/edit";
    }

    @RequestMapping(value = "/pm/cancel-reserve", method = RequestMethod.GET, produces = "text/html")
    public String cancelReserveView() {
        log.info("");
        return "pm/reserve/cancel_reserve";
    }

    @RequestMapping(value = "/pm/non-reserve", method = RequestMethod.GET, produces = "text/html")
    public String nonReserveView() {
        log.info("");
        return "pm/reserve/non_reserve";
    }

    @RequestMapping(value = "/pm/day-off", method = RequestMethod.GET, produces = "text/html")
    public String dayOffView(@RequestParam(required = false) Integer centerId, Model model) {
        log.info("");

        model.addAttribute("centerId", centerId);

        return "pm/reserve/day_off";
    }

    @RequestMapping(value = "/pm/reserve", method = RequestMethod.POST, produces = "application/json")
    @ResponseBody
    public BaseResponseVO<List<ReserveVO>> updateReserve(@RequestBody List<ReserveVO> vo) throws Exception {
        log.info("" + vo);

        return new BaseResponseVO<>(reserveService.updateReserve(vo));
    }

    @RequestMapping(value = "/pm/cancel-reserve", method = RequestMethod.POST, produces = "application/json")
    @ResponseBody
    public BaseResponseVO<List<ReserveVO>> updateCancelReserve(@RequestBody List<ReserveVO> vo) throws Exception {
        log.info("" + vo);

        return new BaseResponseVO<>(reserveService.updateCancelReserve(vo));
    }

    @RequestMapping(value = "/pm/reserve-edit", method = RequestMethod.POST, produces = "application/json")
    @ResponseBody
    public BaseResponseVO<ReserveVO> updateReserveNotes(@RequestBody ReserveVO vo, HttpSession session) throws Exception {
        log.info("" + vo);

        Integer sessionUserId = (Integer) session.getAttribute("sessionUserId");
        vo.setUserId(sessionUserId);
        reserveService.updateReserveNotes(vo);

        return new BaseResponseVO<>(vo);
    }

    @RequestMapping(value = "/pm/day-off", method = RequestMethod.GET, produces = "application/json")
    @ResponseBody
    public BaseResponseVO<List<DayOffVO>> selectDayOffList(@RequestParam(required = false) Integer centerId) throws Exception {
        log.info("" + centerId);

        return new BaseResponseVO<>(reserveService.selectDayOffList(centerId));
    }

    @RequestMapping(value = "/pm/day-off", method = RequestMethod.POST, produces = "application/json")
    @ResponseBody
    public BaseResponseVO<List<DayOffVO>> saveDayOff(@RequestBody List<DayOffVO> vo) throws Exception {
        log.info("" + vo);

        reserveService.SaveDayOff(vo);
        return new BaseResponseVO<>(vo);
    }

    @RequestMapping(value = "/pm/copy-day-off", method = RequestMethod.POST, produces = "application/json")
    @ResponseBody
    public BaseResponseVO<DayOffVO> copyDayOff(@RequestBody DayOffVO vo) throws Exception {
        log.info("" + vo);

        reserveService.copyDayOff(vo);
        return new BaseResponseVO<>(vo);
    }

    @RequestMapping(value = "/pm/reserve", method = RequestMethod.GET, produces = "application/json")
    @ResponseBody
    public BaseResponseVO<List<ReserveVO>> selectReserveList(ReserveVO vo) throws Exception {
        log.info("" + vo);

        return new BaseResponseVO<>(reserveService.selectReserveList(vo));
    }

    @RequestMapping(value = "/pm/cancel-reserve", method = RequestMethod.GET, produces = "application/json")
    @ResponseBody
    public BaseResponseVO<List<ReserveVO>> selectCancelReserveList(ReserveVO vo) throws Exception {
        log.info("");

        return new BaseResponseVO<>(reserveService.selectCancelReserveList(vo));
    }

    @RequestMapping(value = "/pm/non-reserve", method = RequestMethod.GET, produces = "application/json")
    @ResponseBody
    public BaseResponseVO<List<ReserveVO>> selectNonReserveList(@RequestParam(required = false) Integer companyCheckupId) throws Exception {
        log.info("" + companyCheckupId);

        return new BaseResponseVO<>(reserveService.selectNonReserveList(companyCheckupId));
    }

    @RequestMapping(value = "/pm/reserve/{reservationId}", method = RequestMethod.GET, produces = "application/json")
    @ResponseBody
    public BaseResponseVO<ReserveVO> selectReserve(@PathVariable("reservationId") Integer reservationId) throws Exception {
        log.info("" + reservationId);

        ReserveVO vo = new ReserveVO();
        vo.setReservationId(reservationId);
        vo = reserveService.selectReserve(vo);

        return new BaseResponseVO<>(reserveService.selectReserve(vo));
    }

    @RequestMapping(value = {"/pm/reserve/manager", "/hm/reserve/manager", "/cm/reserve/manager"}, method = RequestMethod.GET, produces = "application/json")
    @ResponseBody
    public BaseResponseVO<List<ReserveVO>> selectReserveManager(ReserveVO vo, HttpSession session) throws Exception {
        log.info("" + vo);
        if (vo.getCompanyId() == null) {
            Integer companyId = (Integer) session.getAttribute("sessionTypeId");
            vo.setCompanyId(companyId);
        }

        return new BaseResponseVO<>(reserveService.selectReserveManager(vo));
    }

    @RequestMapping(value = "/pm/cancelnamelist", method = RequestMethod.GET, produces = "application/json")
    @ResponseBody
    public BaseResponseVO<List<ReserveVO>> selectCancelNameList() throws Exception {
        log.info("");

        return new BaseResponseVO<>(reserveService.selectCancelNameList());
    }

    // endregion

    // region CM
    @RequestMapping(value = "/cm/reserve", method = RequestMethod.GET, produces = "text/html")
    public String companyReserveView() {
        log.info("");
        return "cm/reserve/index";
    }

    @RequestMapping(value = "/cm/reserve/view/{reservationId}", method = RequestMethod.GET, produces = "text/html")
    public String reserveCmReadView(@PathVariable Integer reservationId, Model model) {
        log.info("");

        model.addAttribute("reservationId", reservationId);
        return "cm/reserve/view";
    }

    @RequestMapping(value = "/cm/cancel-reserve", method = RequestMethod.GET, produces = "text/html")
    public String companyCancelReserveView() {
        log.info("");
        return "cm/reserve/cancel_reserve";
    }

    @RequestMapping(value = "/cm/non-reserve", method = RequestMethod.GET, produces = "text/html")
    public String companyNonReserveView() {
        log.info("");
        return "cm/reserve/non_reserve";
    }

    @RequestMapping(value = "/cm/reserve", method = RequestMethod.GET, produces = "application/json")
    @ResponseBody
    public BaseResponseVO<List<ReserveVO>> selectCmReserveList(ReserveVO vo, HttpSession session) throws Exception {
        log.info("");

        Integer companyId = (Integer) session.getAttribute("sessionTypeId");
        vo.setCompanyId(companyId);

        return new BaseResponseVO<>(reserveService.selectCmReserveList(vo));
    }

    @RequestMapping(value = "/cm/cancel-reserve", method = RequestMethod.GET, produces = "application/json")
    @ResponseBody
    public BaseResponseVO<List<ReserveVO>> selectCmCancelReserveList(ReserveVO vo, HttpSession session) throws Exception {
        log.info("");

        Integer companyId = (Integer) session.getAttribute("sessionTypeId");
        vo.setCompanyId(companyId);

        return new BaseResponseVO<>(reserveService.selectCmCancelReserveList(vo));
    }

    @RequestMapping(value = "/cm/non-reserve", method = RequestMethod.GET, produces = "application/json")
    @ResponseBody
    public BaseResponseVO<List<ReserveVO>> selectCmNonReserveList(ReserveVO vo, HttpSession session) throws Exception {
        log.info("");

        Integer companyId = (Integer) session.getAttribute("sessionTypeId");
        Integer userId = (Integer) session.getAttribute("sessionUserId");
        vo.setCompanyId(companyId);
        vo.setUserId(userId);

        return new BaseResponseVO<>(reserveService.selectCmNonReserveList(vo));
    }

    @RequestMapping(value = "/cm/reserve/{reservationId}", method = RequestMethod.GET, produces = "application/json")
    @ResponseBody
    public BaseResponseVO<ReserveVO> selectCmReserve(@PathVariable("reservationId") Integer reservationId) throws Exception {
        log.info("" + reservationId);

        ReserveVO vo = new ReserveVO();
        vo.setReservationId(reservationId);
        vo = reserveService.selectReserve(vo);

        return new BaseResponseVO<>(reserveService.selectReserve(vo));
    }

    @RequestMapping(value = "/cm/reserve-edit", method = RequestMethod.POST, produces = "application/json")
    @ResponseBody
    public BaseResponseVO<ReserveVO> updateCmReserveNotes(@RequestBody ReserveVO vo, HttpSession session) throws Exception {
        log.info("" + vo);

        Integer sessionUserId = (Integer) session.getAttribute("sessionUserId");
        vo.setUserId(sessionUserId);
        reserveService.updateReserveNotes(vo);

        return new BaseResponseVO<>(vo);
    }

    @RequestMapping(value = "/cm/cancelnamelist", method = RequestMethod.GET, produces = "application/json")
    @ResponseBody
    public BaseResponseVO<List<ReserveVO>> selectCmCancelNameList() throws Exception {
        log.info("");

        return new BaseResponseVO<>(reserveService.selectCancelNameList());
    }
    // endregion

    // region HM
    @RequestMapping(value = "/hm/reserve", method = RequestMethod.GET, produces = "text/html")
    public String hospitalReserveView() {
        log.info("");

        return "hm/reserve/index";
    }

    @RequestMapping(value = "/hm/reserve/view/{reservationId}", method = RequestMethod.GET, produces = "text/html")
    public String hospitalReserveReadView(@PathVariable Integer reservationId, Model model) {
        log.info("" + reservationId);

        model.addAttribute("reservationId", reservationId);

        return "hm/reserve/view";
    }

    @RequestMapping(value = "/hm/reserve/{reservationId}/edit", method = RequestMethod.GET, produces = "text/html")
    public String hospitalReserveEditView(@PathVariable Integer reservationId, Model model) {
        log.info("" + reservationId);

        model.addAttribute("reservationId", reservationId);

        return "hm/reserve/edit";
    }

    @RequestMapping(value = "/hm/cancel-reserve", method = RequestMethod.GET, produces = "text/html")
    public String hospitalCancelReserveView() {
        log.info("");
        return "hm/reserve/cancel_reserve";
    }

    @RequestMapping(value = "/hm/day-off", method = RequestMethod.GET, produces = "text/html")
    public String hospitalDayOffView(@RequestParam(required = false) Integer centerId, Model model) {
        log.info("");

        model.addAttribute("centerId", centerId);

        return "hm/reserve/day_off";
    }

    @RequestMapping(value = "/hm/reserve", method = RequestMethod.POST, produces = "application/json")
    @ResponseBody
    public BaseResponseVO<List<ReserveVO>> hospitalUpdateReserve(@RequestBody List<ReserveVO> vo) throws Exception {
        log.info("" + vo);

        return new BaseResponseVO<>(reserveService.updateReserve(vo));
    }

    @RequestMapping(value = "/hm/cancel-reserve", method = RequestMethod.POST, produces = "application/json")
    @ResponseBody
    public BaseResponseVO<List<ReserveVO>> hospitalUpdateCancelReserve(@RequestBody List<ReserveVO> vo) throws Exception {
        log.info("" + vo);

        return new BaseResponseVO<>(reserveService.updateCancelReserve(vo));
    }

    @RequestMapping(value = "/hm/reserve/notes", method = RequestMethod.PUT, produces = "application/json")
    @ResponseBody
    public BaseResponseVO<ReserveVO> hospitalUpdateReserveNotes(@RequestBody ReserveVO vo) throws Exception {
        log.info("" + vo);

        reserveService.updateReserveNotes(vo);

        return new BaseResponseVO<>(vo);
    }

    @RequestMapping(value = "/hm/day-off", method = RequestMethod.GET, produces = "application/json")
    @ResponseBody
    public BaseResponseVO<List<DayOffVO>> hospitalSelectDayOffList(@RequestParam(required = false) Integer centerId) throws Exception {
        log.info("" + centerId);

        return new BaseResponseVO<>(reserveService.selectDayOffList(centerId));
    }

    @RequestMapping(value = "/hm/day-off", method = RequestMethod.POST, produces = "application/json")
    @ResponseBody
    public BaseResponseVO<List<DayOffVO>> hospitalSaveDayOff(@RequestBody List<DayOffVO> vo) throws Exception {
        log.info("" + vo);

        reserveService.SaveDayOff(vo);
        return new BaseResponseVO<>(vo);
    }

    @RequestMapping(value = "/hm/copy-day-off", method = RequestMethod.POST, produces = "application/json")
    @ResponseBody
    public BaseResponseVO<DayOffVO> hospitalCopyDayOff(@RequestBody DayOffVO vo, HttpSession session) throws Exception {
        log.info("" + vo);

        Integer hospitalId = (Integer) session.getAttribute("sessionTypeId");

        vo.setHospitalId(hospitalId);

        reserveService.copyDayOff(vo);
        return new BaseResponseVO<>(vo);
    }

    @RequestMapping(value = "/hm/reserve", method = RequestMethod.GET, produces = "application/json")
    @ResponseBody
    public BaseResponseVO<List<ReserveVO>> hospitalSelectReserveList(ReserveVO vo, HttpSession session) throws Exception {
        log.info("" + vo);

        Integer hospitalId = (Integer) session.getAttribute("sessionTypeId");

        vo.setHospitalId(hospitalId);

        return new BaseResponseVO<>(reserveService.selectHmReserveList(vo));
    }

    @RequestMapping(value = "/hm/cancel-reserve", method = RequestMethod.GET, produces = "application/json")
    @ResponseBody
    public BaseResponseVO<List<ReserveVO>> hospitalSelectCancelReserveList(ReserveVO vo, HttpSession session) throws Exception {
        log.info("");

        Integer hospitalId = (Integer) session.getAttribute("sessionTypeId");
        vo.setHospitalId(hospitalId);

        return new BaseResponseVO<>(reserveService.selectCancelReserveList(vo));
    }

    @RequestMapping(value = "/hm/reserve/{reservationId}", method = RequestMethod.GET, produces = "application/json")
    @ResponseBody
    public BaseResponseVO<ReserveVO> hospitalSelectReserve(@PathVariable("reservationId") Integer reservationId) throws Exception {
        log.info("");

        ReserveVO vo = new ReserveVO();
        vo.setReservationId(reservationId);
        vo = reserveService.selectReserve(vo);

        return new BaseResponseVO<>(reserveService.selectReserve(vo));
    }

    @RequestMapping(value = "/hm/cancelnamelist", method = RequestMethod.GET, produces = "application/json")
    @ResponseBody
    public BaseResponseVO<List<ReserveVO>> hospitalSelectCancelNameList() throws Exception {
        log.info("");

        return new BaseResponseVO<>(reserveService.selectCancelNameList());
    }

    @RequestMapping(value = "/hm/reserve/centerlist", method = RequestMethod.GET, produces = "application/json")
    @ResponseBody
    public BaseResponseVO<List<ReserveVO>> reserveCenterList(ReserveVO vo, HttpSession session) throws Exception {
        log.info("" + vo);

        Integer hospitalId = (Integer) session.getAttribute("sessionTypeId");

        vo.setHospitalId(hospitalId);

        return new BaseResponseVO<>(reserveService.reserveCenterList(vo));
    }
    // endregion
}
