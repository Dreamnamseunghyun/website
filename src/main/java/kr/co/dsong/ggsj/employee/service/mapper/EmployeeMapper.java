package kr.co.dsong.ggsj.employee.service.mapper;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import kr.co.dsong.ggsj.employee.vo.EmployeeCheckupVO;
import kr.co.dsong.ggsj.employee.vo.EmployeeVO;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface EmployeeMapper {

    List<EmployeeVO> selectEmployeeList(@Param("companyCheckupId") Integer companyCheckupId,
                                        @Param("companyId") Integer companyId,
                                        @Param("checkupYear") Integer checkupYear) throws Exception;

    List<EmployeeVO> selectCmEmployeeList(@Param("userId") Integer userId,
                                          @Param("companyCheckupId") Integer companyCheckupId,
                                          @Param("checkupYear") Integer checkupYear) throws Exception;

    List<EmployeeCheckupVO> selectCmEmployee(@Param("userId") Integer userId) throws Exception;

    EmployeeVO selectEmployee(EmployeeVO vo) throws Exception;

    Integer selectEmployeeUserId(EmployeeVO vo) throws Exception;

    void insertEmployee(EmployeeVO vo) throws Exception;

    void updateEmployee(EmployeeVO vo) throws Exception;

    void deleteEmployee(EmployeeCheckupVO vo) throws Exception;

    void insertEmployeeCheckup(EmployeeCheckupVO vo) throws Exception;

    void updateEmployeeCheckup(EmployeeCheckupVO vo) throws Exception;

    void deleteEmployeeCheckup(EmployeeCheckupVO vo) throws Exception;

    EmployeeVO checkID(EmployeeVO vo) throws Exception;

    Integer findID(EmployeeVO vo) throws Exception;

    Integer findPW(EmployeeVO vo) throws Exception;

    EmployeeCheckupVO selectEmployeeCheckupAgree(EmployeeCheckupVO vo) throws Exception;

    void updateEmployeeCheckupAgree(EmployeeCheckupVO vo) throws Exception;

    EmployeeVO selectUsEmployee(EmployeeVO vo) throws Exception;

    EmployeeVO countTotalEmployee(EmployeeVO vo) throws Exception;

    EmployeeVO countApplyEmployee(EmployeeVO vo) throws Exception;

    EmployeeVO countCheckupEmployee(EmployeeVO vo) throws Exception;

    List<EmployeeVO> selectFamily(EmployeeVO vo) throws Exception;

    void updateMypage(EmployeeVO vo) throws Exception;

    void updateMypageEmployeeCheckup(EmployeeCheckupVO vo) throws Exception;
}
