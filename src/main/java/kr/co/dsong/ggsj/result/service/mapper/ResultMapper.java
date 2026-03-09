package kr.co.dsong.ggsj.result.service.mapper;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import kr.co.dsong.ggsj.common.vo.CommonCompanyVO;
import kr.co.dsong.ggsj.result.vo.ResultEmployeeVO;
import kr.co.dsong.ggsj.result.vo.ResultItemVO;
import kr.co.dsong.ggsj.result.vo.ResultVO;
import org.apache.ibatis.annotations.Param;

import java.util.Date;
import java.util.List;

@Mapper
public interface ResultMapper {

    List<ResultVO> selectResultList(@Param("hospitalId") Integer hospitalId, @Param("companyId") Integer companyId) throws Exception;

    List<ResultVO> selectResultCompanyList(@Param("companyId") Integer companyId, @Param("checkupYear") Integer checkupYear) throws Exception;

    List<ResultVO> selectResultHospitalList(@Param("hospitalId") Integer hospitalId, @Param("checkupYear") Integer checkupYear) throws Exception;

    List<ResultVO> selectHmResultList(@Param("hospitalId") Integer hospitalId, @Param("companyId") Integer companyId, @Param("checkupYear") Integer checkupYear) throws Exception;

    List<ResultVO> selectExcelDownloadList(@Param("hospitalId") Integer hospitalId, @Param("companyId") Integer companyId, @Param("checkupYear") Integer checkupYear, @Param("resultDateBegin") Date resultDateBegin, @Param("resultDateEnd") Date resultDateEnd) throws Exception;

    List<ResultVO> selectResultLookupList(@Param("companyId") Integer companyId, @Param("checkupYear") Integer checkupYear, @Param("hospitalId") Integer hospitalId) throws Exception;

    List<CommonCompanyVO> selectCompanyList() throws Exception;

    List<ResultVO> selectCheckupResult(@Param("checkupResultEmployeeId") Integer checkupResultEmployeeId, @Param("companyId") Integer companyId, @Param("checkupYear") Integer checkupYear) throws Exception;

    List<CommonCompanyVO> selectHmCompanyList(@Param("userId") Integer userId) throws Exception;

    List<ResultVO> selectCheckupResultCompany(@Param("companyId") Integer companyId, @Param("checkupYear") Integer checkupYear) throws Exception;

    List<ResultVO> selectCheckupResultHospital(@Param("hospitalId") Integer hospitalId, @Param("checkupYear") Integer checkupYear) throws Exception;

    ResultVO selectCheckupedAt(@Param("employeeCode") String employeeCode) throws Exception;

    List<ResultVO> selectHmIndexResultList(@Param("userId") Integer userId, @Param("checkupYear") Integer checkupYear, @Param("companyId") Integer companyId) throws Exception;

    List<ResultVO> selectUsResultList(@Param("userId") Integer userId) throws Exception;

    void insertCheckupResult(ResultVO vo) throws Exception;

    void insertCheckupResultEmployee(ResultEmployeeVO vo) throws Exception;

    void updateCheckupResultEmployee(ResultEmployeeVO vo) throws Exception;

    void insertCheckupResultItem(ResultItemVO vo) throws Exception;

    void deleteCheckupResult(ResultVO vo) throws Exception;

    void insertDeleteCheckupResultEmployee(ResultEmployeeVO vo) throws Exception;

    void deleteCheckupResultEmployee(ResultEmployeeVO vo) throws Exception;

    void deleteResultEmployee(ResultEmployeeVO vo) throws Exception;

    void deleteCheckupResultItem(ResultItemVO vo) throws Exception;
}
