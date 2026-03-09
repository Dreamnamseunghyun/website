package kr.co.sitebuilder.employee.service.impl;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import kr.co.sitebuilder.company.service.mapper.CompanyMapper;
import kr.co.sitebuilder.company.vo.CompanyCheckupVO;
import kr.co.sitebuilder.company.vo.CompanyVO;
import kr.co.sitebuilder.employee.service.EmployeeService;
import kr.co.sitebuilder.employee.service.mapper.EmployeeMapper;
import kr.co.sitebuilder.employee.vo.EmployeeCheckupVO;
import kr.co.sitebuilder.employee.vo.EmployeeVO;
import kr.co.sitebuilder.reserve.service.mapper.UserReserveMapper;
import kr.co.sitebuilder.reserve.vo.ReserveVO;
import kr.co.sitebuilder.user.service.mapper.UserMapper;
import kr.co.sitebuilder.util.SessionUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.util.ObjectUtils;
import org.springframework.util.StringUtils;

import javax.annotation.Resource;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

@Slf4j
@Service
public class EmployeeServiceImpl extends EgovAbstractServiceImpl implements EmployeeService {

    @Resource
    private BCryptPasswordEncoder bCryptPasswordEncoder;

    @Resource
    private UserMapper userMapper;

    @Resource
    private EmployeeMapper employeeMapper;

    @Resource
    private CompanyMapper companyMapper;

    @Resource
    private UserReserveMapper userReserveMapper;

    @Override
    public List<EmployeeVO> selectEmployeeList(Integer companyCheckupId, Integer companyId, Integer checkupYear) throws Exception {
        return employeeMapper.selectEmployeeList(companyCheckupId, companyId, checkupYear);
    }

    @Override
    public List<EmployeeVO> selectCmEmployeeList(Integer userId, Integer companyCheckupId, Integer checkupYear) throws Exception {
        return employeeMapper.selectCmEmployeeList(userId, companyCheckupId, checkupYear);
    }

    @Override
    public List<EmployeeCheckupVO> selectCmEmployee(Integer userId) throws Exception {
        return employeeMapper.selectCmEmployee(userId);
    }

    @Override
    public EmployeeVO selectEmployee(EmployeeVO vo) throws Exception {
        return employeeMapper.selectEmployee(vo);
    }

    @Override
    public void insertEmployee(EmployeeVO vo) throws Exception {
        CompanyVO company = new CompanyVO();
        company.setCompanyId(vo.getCompanyId());
        company = companyMapper.selectCompany(company);

        insertEmployee(vo, company);
    }

    @Override
    public void insertEmployeeCheckup(EmployeeCheckupVO vo) throws Exception {
        Boolean notokGuide = vo.getNotokGuide();
        Boolean notokReserve = vo.getNotokReserve();
        Boolean notokUrge = vo.getNotokUrge();
        Integer userId = SessionUtil.getInteger("sessionUserId");

        if (!notokGuide && !notokReserve && !notokUrge) {
            vo.setNotokUpdatedAt(null);
            vo.setNotokUpdatedUserId(null);
        } else {
            vo.setNotokUpdatedAt(new Date());
            vo.setNotokUpdatedUserId(userId);
        }
        employeeMapper.insertEmployeeCheckup(vo);
    }

    @Override
    public void updateEmployee(EmployeeVO vo) throws Exception {
        if (vo.getMyself() != null && vo.getMyself() != 1) {
            vo.setMyself(null);
        }
        employeeMapper.updateEmployee(vo);

        vo.getEmployeeCheckup().setUserId(vo.getUserId());

        EmployeeCheckupVO orgCheckupVO = employeeMapper.selectEmployee(vo).getEmployeeCheckup();
        EmployeeCheckupVO newCheckupVO = vo.getEmployeeCheckup();
        if (orgCheckupVO.getNotokGuide() != newCheckupVO.getNotokGuide()
                || orgCheckupVO.getNotokReserve() != newCheckupVO.getNotokReserve()
                || orgCheckupVO.getNotokUrge() != newCheckupVO.getNotokUrge()) {

            newCheckupVO.setNotokUpdatedAt(Calendar.getInstance().getTime());
            newCheckupVO.setNotokUpdatedUserId(SessionUtil.getInteger("sessionUserId"));
        }

        employeeMapper.updateEmployeeCheckup(vo.getEmployeeCheckup());
    }

    @Override
    public void updateEmployeeCheckup(EmployeeCheckupVO vo) throws Exception {
        employeeMapper.updateEmployeeCheckup(vo);
    }

    @Override
    public void deleteEmployee(EmployeeCheckupVO vo) throws Exception {
        employeeMapper.deleteEmployee(vo);
    }

    @Override
    public void deleteEmployeeCheckup(EmployeeCheckupVO vo) throws Exception {
        employeeMapper.deleteEmployeeCheckup(vo);
    }

    @Override
    public void resetPw(EmployeeVO vo) throws Exception {
        CompanyVO company = new CompanyVO();
        company.setCompanyId(vo.getCompanyId());
        company = companyMapper.selectCompany(company);

        vo.setUserPw(initPw(vo, company.getPwType()));

        userMapper.updateUserPw(vo);
    }

    @Override
    public EmployeeVO checkID(EmployeeVO vo) throws Exception {
        return employeeMapper.checkID(vo);
    }

    @Override
    public void saveEmployeeList(List<EmployeeVO> vo) throws Exception {
        if (!ObjectUtils.isEmpty(vo)) {
            CompanyVO company = new CompanyVO();
            company.setCompanyId(vo.get(0).getCompanyId());
            company = companyMapper.selectCompany(company);

            for (EmployeeVO employee : vo) {
                employee.getEmployeeCheckup().setNotokGuide(false);
                employee.getEmployeeCheckup().setNotokReserve(false);
                employee.getEmployeeCheckup().setNotokUrge(false);

                insertEmployee(employee, company);
            }
        }
    }

    @Override
    public Boolean isEmployeeCheckupAgree() throws Exception {
        EmployeeCheckupVO vo = new EmployeeCheckupVO();
        vo.setCheckupYear(Calendar.getInstance().get(Calendar.YEAR));

        EmployeeCheckupVO employeeCheckup = employeeMapper.selectEmployeeCheckupAgree(vo);
        if (employeeCheckup == null) {
            return null;
        }

        return employeeCheckup.getTermsOfUse() && employeeCheckup.getPrivacyPolicy() && employeeCheckup.getCollectionAndUse();
    }

    @Override
    public void updateEmployeeCheckupAgree(EmployeeCheckupVO vo) throws Exception {
        employeeMapper.updateEmployeeCheckupAgree(vo);
    }

    @Override
    public EmployeeVO selectUsEmployee(EmployeeVO vo) throws Exception {
        vo.setCompanyId(SessionUtil.getInteger("sessionTypeId"));
        vo.setEmployeeCode(SessionUtil.getString("sessionLoginId"));

        return employeeMapper.selectUsEmployee(vo);
    }

    @Override
    public EmployeeVO countTotalEmployee(EmployeeVO vo) throws Exception {
        return employeeMapper.countTotalEmployee(vo);
    }

    @Override
    public EmployeeVO countApplyEmployee(EmployeeVO vo) throws Exception {
        return employeeMapper.countApplyEmployee(vo);
    }

    @Override
    public EmployeeVO countCheckupEmployee(EmployeeVO vo) throws Exception {
        return employeeMapper.countCheckupEmployee(vo);
    }

    @Override
    public void updateMypage(EmployeeVO vo) throws Exception {
        if (!StringUtils.isEmpty(vo.getUserPw())) {
            vo.setUserPw(bCryptPasswordEncoder.encode(vo.getUserPw()));
            userMapper.updateUserPw(vo);
        }

        if (vo.getReservationId() == null) {
            if (vo.getEmployeeCheckup() != null && vo.getEmployeeCheckup().getEmployeeCheckupId() != null && vo.getEmployeeCheckup().getCompanyCheckupTypeId() != null) {
                vo.getEmployeeCheckup().setUserId(vo.getUserId());
                employeeMapper.updateMypageEmployeeCheckup(vo.getEmployeeCheckup());
            }
        } else {
            ReserveVO reserve = new ReserveVO();
            reserve.setReservationId(vo.getReservationId());
            reserve.setReservationName(vo.getEmployeeName());
            reserve.setBirth(vo.getBirth());
            reserve.setEmail(vo.getEmail());
            reserve.setMobile(vo.getMobile());
            reserve.setZipcode(vo.getZipcode());
            reserve.setAddress1(vo.getAddress1());
            reserve.setAddress2(vo.getAddress2());

            userReserveMapper.updateReserve(reserve);
        }

        employeeMapper.updateMypage(vo);
    }

    @Override
    public EmployeeVO insertFamily(EmployeeVO vo) throws Exception {
        vo.setCompanyId(SessionUtil.getInteger("sessionTypeId"));
        vo.setEmployeeCode(SessionUtil.getString("sessionLoginId"));
        vo.setMyself(null);

        Integer userId = employeeMapper.selectEmployeeUserId(vo);

        if (userId == null) {
            CompanyVO company = new CompanyVO();
            company.setCompanyId(vo.getCompanyId());
            company.setCompanyCheckup(new CompanyCheckupVO());
            company.getCompanyCheckup().setCheckupYear(Calendar.getInstance().get(Calendar.YEAR));
            company = companyMapper.selectCompanyCm(company);

            vo.setUserId(SessionUtil.getInteger("sessionUserId"));
            EmployeeVO employee = employeeMapper.selectUsEmployee(vo);

            vo.setUserType("US");
            vo.setUserPw(initPw(vo, company.getPwType()));
            userMapper.insertUser(vo);

            vo.setEmployeeNo(employee.getEmployeeNo());
            employeeMapper.insertEmployee(vo);

            vo.getEmployeeCheckup().setUserId(vo.getUserId());
            vo.getEmployeeCheckup().setVip(false);
            vo.getEmployeeCheckup().setSupportType(1);
            vo.getEmployeeCheckup().setSpecialCheckup(false);
            vo.getEmployeeCheckup().setCompanyCheckupId(company.getCompanyCheckup().getCompanyCheckupId());
            vo.getEmployeeCheckup().setNotokGuide(false);
            vo.getEmployeeCheckup().setNotokReserve(false);
            vo.getEmployeeCheckup().setNotokUrge(false);
            vo.getEmployeeCheckup().setNotokUpdatedAt(Calendar.getInstance().getTime());

            employeeMapper.insertEmployeeCheckup(vo.getEmployeeCheckup());

            return vo;
        }

        return null;
    }

    @Override
    public List<EmployeeVO> selectFamily() throws Exception {
        EmployeeVO vo = new EmployeeVO();
        vo.setCompanyId(SessionUtil.getInteger("sessionTypeId"));
        vo.setEmployeeCode(SessionUtil.getString("sessionLoginId"));

        return employeeMapper.selectFamily(vo);
    }

    private void insertEmployee(EmployeeVO employee, CompanyVO company) throws Exception {
        if (employee.getMyself() != null && employee.getMyself() != 1) {
            employee.setMyself(null);
        }

        Integer userId = employeeMapper.selectEmployeeUserId(employee);

        if (userId == null) {
            employee.setUserType("US");
            employee.setUserPw(initPw(employee, company.getPwType()));
            userMapper.insertUser(employee);

            log.info("" + employee);

            employeeMapper.insertEmployee(employee);
        } else {
            employee.setUserId(userId);
            employeeMapper.updateEmployee(employee);
        }

        employee.getEmployeeCheckup().setUserId(employee.getUserId());
        employeeMapper.insertEmployeeCheckup(employee.getEmployeeCheckup());
    }

    private String initPw(EmployeeVO vo, Integer pwType) {
        String pw = null;

        switch (pwType) {
            case 0: //?몃뱶??1?먮━
                pw = vo.getMobile();
                break;
            case 1: // ?ъ썝踰덊샇
                pw = vo.getEmployeeNo();
                break;
            case 2: // ?앸뀈?붿씪
                SimpleDateFormat transFormat = new SimpleDateFormat("yyyyMMdd");
                pw = transFormat.format(vo.getBirth());
                break;
        }

        if (StringUtils.isEmpty(pw)) {
            SimpleDateFormat transFormat = new SimpleDateFormat("yyyyMMdd");
            pw = transFormat.format(vo.getBirth());
        }

        log.info(pw);

        return bCryptPasswordEncoder.encode(pw);
    }
}
