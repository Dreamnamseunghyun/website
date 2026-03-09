package kr.co.dsong.ggsj.employee.web;

import kr.co.dsong.ggsj.common.ResponseCode;
import kr.co.dsong.ggsj.common.vo.BaseResponseVO;
import kr.co.dsong.ggsj.employee.service.EmployeeService;
import kr.co.dsong.ggsj.employee.vo.EmployeeCheckupVO;
import kr.co.dsong.ggsj.employee.vo.EmployeeVO;
import kr.co.dsong.ggsj.notitok.service.NotitokService;
import kr.co.dsong.ggsj.notitok.vo.NotitokUSSentVO;
import kr.co.dsong.ggsj.reserve.service.UserReserveService;
import kr.co.dsong.ggsj.reserve.vo.ReserveVO;
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
public class EmployeeController {

    @Resource
    private EmployeeService employeeService;

    @Resource
    private UserReserveService userReserveService;

    @Resource
    private NotitokService notitokService;

    // region PM
    @RequestMapping(value = "/pm/employee", method = RequestMethod.GET, produces = "text/html")
    public String employeeView(@RequestParam(required = false) Integer companyId, @RequestParam(required = false) Integer checkupYear, Model model) {
        log.info("");

        model.addAttribute("companyId", companyId);
        model.addAttribute("checkupYear", checkupYear);

        return "pm/employee/index";
    }

    @RequestMapping(value = "/pm/employee/batch", method = RequestMethod.GET, produces = "text/html")
    public String employeeBatchView() {
        log.info("");

        return "pm/employee/batch";
    }

    @RequestMapping(value = "/pm/employee/create", method = RequestMethod.GET, produces = "text/html")
    public String employeeCreateView() {
        log.info("");

        return "pm/employee/create";
    }

    @RequestMapping(value = "/pm/employee/{employeeCheckupId}", method = RequestMethod.GET, produces = "text/html")
    public String employeeReadView(@PathVariable Integer employeeCheckupId, Model model) {
        log.info("employeeCheckupId: " + employeeCheckupId);

        model.addAttribute("employeeCheckupId", employeeCheckupId);
        return "pm/employee/view";
    }

    @RequestMapping(value = "/pm/employee/{employeeCheckupId}/edit", method = RequestMethod.GET, produces = "text/html")
    public String employeeEditView(@PathVariable Integer employeeCheckupId, Model model) {
        log.info("employeeCheckupId: " + employeeCheckupId);

        model.addAttribute("employeeCheckupId", employeeCheckupId);
        return "pm/employee/edit";
    }

    @RequestMapping(value = "/pm/employee", method = RequestMethod.GET, produces = "application/json")
    @ResponseBody
    public BaseResponseVO<List<EmployeeVO>> selectEmployeeList(
            @RequestParam(required = false) Integer companyCheckupId,
            @RequestParam(required = false) Integer companyId,
            @RequestParam(required = false) Integer checkupYear
    ) throws Exception {
        log.info("");

        if (checkupYear == null) {
            checkupYear = Calendar.getInstance().get(Calendar.YEAR);
        }

        return new BaseResponseVO<>(employeeService.selectEmployeeList(companyCheckupId, companyId, checkupYear));
    }

    @RequestMapping(value = "/pm/employee/{employeeCheckupId}", method = RequestMethod.GET, produces = "application/json")
    @ResponseBody
    public BaseResponseVO<EmployeeVO> selectEmployee(@PathVariable Integer employeeCheckupId) throws Exception {
        log.info("" + employeeCheckupId);

        EmployeeVO vo = new EmployeeVO();
        vo.setEmployeeCheckup(new EmployeeCheckupVO());
        vo.getEmployeeCheckup().setEmployeeCheckupId(employeeCheckupId);
        vo = employeeService.selectEmployee(vo);

        return new BaseResponseVO<>(vo);
    }

    @RequestMapping(value = "/pm/employee", method = RequestMethod.POST, produces = "application/json")
    @ResponseBody
    public BaseResponseVO<EmployeeVO> insertEmployee(@RequestBody EmployeeVO vo) throws Exception {
        log.info("" + vo);

        employeeService.insertEmployee(vo);
        return new BaseResponseVO<>(vo);
    }

    @RequestMapping(value = "/pm/employee/{employeeCheckupId}", method = RequestMethod.PUT, produces = "application/json")
    @ResponseBody
    public BaseResponseVO<EmployeeVO> updateEmployee(@PathVariable Integer employeeCheckupId, @RequestBody EmployeeVO vo) throws Exception {
        log.info("" + vo);

        //vo.setEmployeeCheckupId(employeeCheckupId);
        vo.getEmployeeCheckup().setEmployeeCheckupId(employeeCheckupId);
        employeeService.updateEmployee(vo);

        return new BaseResponseVO<>(vo);
    }

    @RequestMapping(value = "/pm/employee/{employeeCheckupId}", method = RequestMethod.DELETE, produces = "application/json")
    @ResponseBody
    public BaseResponseVO<Integer> deleteEmployee(@PathVariable Integer employeeCheckupId) throws Exception {
        log.info("" + employeeCheckupId);

        EmployeeCheckupVO vo = new EmployeeCheckupVO();
//        vo.setEmployeeCheckup(new EmployeeCheckupVO());
//        vo.getEmployeeCheckup().setEmployeeCheckupId(employeeCheckupId);
        vo.setEmployeeCheckupId(employeeCheckupId);
        employeeService.deleteEmployee(vo);

        return new BaseResponseVO<>(employeeCheckupId);
    }

    @RequestMapping(value = {"/pm/employee/reset", "/us/employee/reset"}, method = RequestMethod.POST, produces = "application/json")
    @ResponseBody
    public BaseResponseVO<EmployeeVO> resetPw(@RequestBody EmployeeVO vo) throws Exception {
        log.info("");

        employeeService.resetPw(vo);

        return new BaseResponseVO<>(vo);
    }

    @RequestMapping(value = "/pm/employee/check", method = RequestMethod.GET, produces = "application/json")
    @ResponseBody
    public BaseResponseVO<EmployeeVO> checkID(EmployeeVO vo) throws Exception {
        log.info("" + vo);

        return new BaseResponseVO<>(employeeService.checkID(vo));
    }

    @RequestMapping(value = "/pm/employee/batch", method = RequestMethod.POST, produces = "application/json")
    @ResponseBody
    public BaseResponseVO<List<EmployeeVO>> saveEmployeeList(@RequestBody List<EmployeeVO> vo) throws Exception {
        log.info("");

        employeeService.saveEmployeeList(vo);

        return new BaseResponseVO<>(vo);
    }
    // endregion

    // region CM
    @RequestMapping(value = "/cm/employee", method = RequestMethod.GET, produces = "text/html")
    public String companyEmployeeView() {
        log.info("");

        return "cm/employee/index";
    }

    @RequestMapping(value = "/cm/employee/batch", method = RequestMethod.GET, produces = "text/html")
    public String companyEmployeeBatchView() {
        log.info("");

        return "cm/employee/batch";
    }

    @RequestMapping(value = "/cm/employee/create", method = RequestMethod.GET, produces = "text/html")
    public String companyEmployeeCreateView() {
        log.info("");

        return "cm/employee/create";
    }


    @RequestMapping(value = "/cm/employee/{employeeCheckupId}", method = RequestMethod.GET, produces = "text/html")
    public String companyEmployeeReadView(@PathVariable Integer employeeCheckupId, Model model) {
        log.info("employeeCheckupId: " + employeeCheckupId);

        model.addAttribute("employeeCheckupId", employeeCheckupId);
        return "cm/employee/view";
    }

    @RequestMapping(value = "/cm/employee/{employeeCheckupId}/edit", method = RequestMethod.GET, produces = "text/html")
    public String companyEmployeeEditView(@PathVariable Integer employeeCheckupId, Model model) {
        log.info("employeeCheckupId: " + employeeCheckupId);

        model.addAttribute("employeeCheckupId", employeeCheckupId);
        return "cm/employee/edit";
    }

    @RequestMapping(value = "/cm/employee", method = RequestMethod.GET, produces = "application/json")
    @ResponseBody
    public BaseResponseVO<List<EmployeeVO>> companySelectEmployeeList(
            @RequestParam(required = false) Integer companyId,
            @RequestParam(required = false) Integer companyCheckupId,
            @RequestParam(required = false) Integer checkupYear,
            HttpSession session
    ) throws Exception {
        log.info("");

        Integer userId = (Integer) session.getAttribute("sessionUserId");
        if (checkupYear == null) {
            checkupYear = Calendar.getInstance().get(Calendar.YEAR);
        }

        return new BaseResponseVO<>(employeeService.selectCmEmployeeList(userId, companyCheckupId, checkupYear));
    }

    @RequestMapping(value = "/cm/employee/0", method = RequestMethod.GET, produces = "application/json")
    @ResponseBody
    public BaseResponseVO<List<EmployeeCheckupVO>> companySelectEmployee(@RequestParam(required = false) Integer companyId, HttpSession session) throws Exception {
        log.info("");

        Integer userId = (Integer) session.getAttribute("sessionUserId");

        return new BaseResponseVO<>(employeeService.selectCmEmployee(userId));
    }

    @RequestMapping(value = "/cm/employee/{employeeCheckupId}", method = RequestMethod.GET, produces = "application/json")
    @ResponseBody
    public BaseResponseVO<EmployeeVO> companySelectEmployee(@PathVariable Integer employeeCheckupId) throws Exception {
        log.info("" + employeeCheckupId);

        EmployeeVO vo = new EmployeeVO();
        vo.setEmployeeCheckup(new EmployeeCheckupVO());
        vo.getEmployeeCheckup().setEmployeeCheckupId(employeeCheckupId);
        vo = employeeService.selectEmployee(vo);

        return new BaseResponseVO<>(vo);
    }

    @RequestMapping(value = "/cm/employee", method = RequestMethod.POST, produces = "application/json")
    @ResponseBody
    public BaseResponseVO<EmployeeVO> companyInsertEmployee(@RequestBody EmployeeVO vo) throws Exception {
        log.info("" + vo);

        employeeService.insertEmployee(vo);
        return new BaseResponseVO<>(vo);
    }

    @RequestMapping(value = "/cm/employee/{employeeCheckupId}", method = RequestMethod.PUT, produces = "application/json")
    @ResponseBody
    public BaseResponseVO<EmployeeVO> companyUpdateEmployee(@PathVariable Integer employeeCheckupId, @RequestBody EmployeeVO vo) throws Exception {
        log.info("" + vo);

        vo.getEmployeeCheckup().setEmployeeCheckupId(employeeCheckupId);
        employeeService.updateEmployee(vo);

        return new BaseResponseVO<>(vo);
    }

    @RequestMapping(value = "/cm/employee/{employeeCheckupId}", method = RequestMethod.DELETE, produces = "application/json")
    @ResponseBody
    public BaseResponseVO<Integer> companyDeleteEmployee(@PathVariable Integer employeeCheckupId) throws Exception {
        log.info("" + employeeCheckupId);

        EmployeeCheckupVO vo = new EmployeeCheckupVO();
        vo.setEmployeeCheckupId(employeeCheckupId);
        employeeService.deleteEmployee(vo);

        return new BaseResponseVO<>(employeeCheckupId);
    }

    @RequestMapping(value = "/cm/employee/count", method = RequestMethod.GET, produces = "application/json")
    @ResponseBody
    public BaseResponseVO<EmployeeVO> countTotalEmployee(HttpSession session) throws Exception {


        Integer companyId = (Integer) session.getAttribute("sessionTypeId");

        EmployeeVO total = new EmployeeVO();
        total.setCompanyId(companyId);

        EmployeeVO vo = new EmployeeVO();

        vo.setTotalCount(employeeService.countTotalEmployee(total).getTotalCount());
        vo.setApplyCount(employeeService.countApplyEmployee(total).getApplyCount());
        vo.setCheckupCount(employeeService.countCheckupEmployee(total).getCheckupCount());

        log.info("" + vo);

        return new BaseResponseVO<>(vo);
    }
    // endregion

    // region US
    @RequestMapping(value = "/us/family", method = RequestMethod.GET, produces = "application/json")
    @ResponseBody
    public BaseResponseVO<List<EmployeeVO>> selectFamily() throws Exception {
        log.info("");

        return new BaseResponseVO<>(employeeService.selectFamily());
    }

    @RequestMapping(value = "/us/family", method = RequestMethod.POST, produces = "application/json")
    @ResponseBody
    public BaseResponseVO<EmployeeVO> insertFamily(@RequestBody EmployeeVO vo) throws Exception {
        log.info("" + vo);

        EmployeeVO employee = employeeService.insertFamily(vo);
        if (employee == null) {
            return new BaseResponseVO<>(vo, ResponseCode.FAIL, "이미 등록된 가족입니다.");
        }

        return new BaseResponseVO<>(vo);
    }

    @RequestMapping(value = "/us/mypage", method = RequestMethod.GET, produces = "text/html")
    public String selectMypage(@RequestParam Integer userId, Model model) throws Exception {
        log.info("" + userId);

        model.addAttribute("userId", userId);

        EmployeeVO vo = new EmployeeVO();
        vo.setUserId(userId);
        model.addAttribute("employee", employeeService.selectUsEmployee(vo));
        model.addAttribute("copayCompanyCheckupTypeList", userReserveService.selectCopayCompanyCheckupTypeList());

        ReserveVO reserve = new ReserveVO();
        reserve.setUserId(userId);
        model.addAttribute("reserve", userReserveService.selectReserve(reserve));

        return "us/mypage";
    }

    @RequestMapping(value = "/us/edit", method = RequestMethod.POST, produces = "application/json")
    @ResponseBody
    public BaseResponseVO<EmployeeVO> updateMypage(@RequestBody EmployeeVO vo) throws Exception {
        log.info("" + vo);

        employeeService.updateMypage(vo);

        return new BaseResponseVO<>(vo);
    }
    // endregion

    // region find ID/PW
    @RequestMapping(value = "/us/find_id", method = RequestMethod.GET, produces = "text/html")
    public String userFindId() {
        log.info("");

        return "us/find_id";
    }

    @RequestMapping(value = "/us/find_password", method = RequestMethod.GET, produces = "text/html")
    public String userFindPassword() {
        log.info("");

        return "us/find_password";
    }

    @RequestMapping(value = "/us/find/id", method = RequestMethod.GET, produces = "application/json")
    @ResponseBody
    public BaseResponseVO<String> findID(@RequestParam String employeeName, @RequestParam String mobile) throws Exception {
        log.info("");

        EmployeeVO vo = new EmployeeVO();
        vo.setEmployeeName(employeeName);
        vo.setMobile(mobile);

        return new BaseResponseVO<>(notitokService.notitokSendFind(vo));
    }

    @RequestMapping(value = "/us/find/pw", method = RequestMethod.GET, produces = "application/json")
    @ResponseBody
    public BaseResponseVO<String> findPW(@RequestParam String employeeCode, @RequestParam String employeeName, @RequestParam String mobile) throws Exception {
        log.info("");

        EmployeeVO vo = new EmployeeVO();
        vo.setEmployeeCode(employeeCode);
        vo.setEmployeeName(employeeName);
        vo.setMobile(mobile);

        return new BaseResponseVO<>(notitokService.notitokSendFindPw(vo));
    }

    @RequestMapping(value = "/us/find/data", method = RequestMethod.GET, produces = "application/json")
    @ResponseBody
    public BaseResponseVO<NotitokUSSentVO> checkData(NotitokUSSentVO vo) throws Exception {
        log.info("" + vo);

        return new BaseResponseVO<>(notitokService.notitokCheck(vo));
    }

    @RequestMapping(value = "/us/find/data_pw", method = RequestMethod.GET, produces = "application/json")
    @ResponseBody
    public BaseResponseVO<NotitokUSSentVO> checkDataPw(NotitokUSSentVO vo) throws Exception {
        log.info("" + vo);

        return new BaseResponseVO<>(notitokService.checkDataPw(vo));
    }
    // endregion

}
