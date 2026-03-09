package kr.co.dsong.ggsj.employee.service;

import kr.co.dsong.ggsj.employee.vo.EmployeeCheckupVO;
import kr.co.dsong.ggsj.employee.vo.EmployeeVO;

import java.util.List;

public interface EmployeeService {

    List<EmployeeVO> selectEmployeeList(Integer companyCheckupId, Integer companyId, Integer checkupYear) throws Exception;

    List<EmployeeVO> selectCmEmployeeList(Integer userId, Integer companyCheckupId, Integer checkupYear) throws Exception;

    List<EmployeeCheckupVO> selectCmEmployee(Integer userId) throws Exception;

    EmployeeVO selectEmployee(EmployeeVO vo) throws Exception;

    void insertEmployee(EmployeeVO vo) throws Exception;

    void updateEmployee(EmployeeVO vo) throws Exception;

    void resetPw(EmployeeVO vo) throws Exception;

    EmployeeVO checkID(EmployeeVO vo) throws Exception;

    void saveEmployeeList(List<EmployeeVO> vo) throws Exception;

    void deleteEmployee(EmployeeCheckupVO vo) throws Exception;

    void insertEmployeeCheckup(EmployeeCheckupVO vo) throws Exception;

    void updateEmployeeCheckup(EmployeeCheckupVO vo) throws Exception;

    void deleteEmployeeCheckup(EmployeeCheckupVO vo) throws Exception;

    Boolean isEmployeeCheckupAgree() throws Exception;

    void updateEmployeeCheckupAgree(EmployeeCheckupVO vo) throws Exception;

    EmployeeVO selectUsEmployee(EmployeeVO vo) throws Exception;

    EmployeeVO countTotalEmployee(EmployeeVO vo) throws Exception;

    EmployeeVO countApplyEmployee(EmployeeVO vo) throws Exception;

    EmployeeVO countCheckupEmployee(EmployeeVO vo) throws Exception;

    void updateMypage(EmployeeVO vo) throws Exception;

    EmployeeVO insertFamily(EmployeeVO vo) throws Exception;

    List<EmployeeVO> selectFamily() throws Exception;
}
