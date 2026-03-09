package kr.co.dsong.ggsj.result.service;

import kr.co.dsong.ggsj.common.vo.CommonCompanyVO;
import kr.co.dsong.ggsj.result.vo.ResultEmployeeVO;
import kr.co.dsong.ggsj.result.vo.ResultVO;

import java.util.Date;
import java.util.List;

public interface ResultService {
    List<ResultVO> selectResultList(Integer hospitalId, Integer companyId) throws Exception;

    List<ResultVO> selectResultCompanyList(Integer companyId, Integer checkupYear) throws Exception;

    List<ResultVO> selectResultHospitalList(Integer hospitalId, Integer checkupYear) throws Exception;

    List<ResultVO> selectHmResultList(Integer hospitalId, Integer companyId, Integer checkupYear) throws Exception;

    List<ResultVO> selectExcelDownloadList(Integer hospitalId, Integer companyId, Integer checkupYear, Date resultDateBegin, Date resultDateEnd) throws Exception;

    List<ResultVO> selectResultLookupList(Integer companyId, Integer checkupYear, Integer hospitalId) throws Exception;

    ResultVO selectCheckupedAt(String employeeCode) throws Exception;

    List<CommonCompanyVO> selectCompanyList() throws Exception;

    List<ResultVO> selectCheckupResult(Integer checkupResultEmployeeId, Integer companyId, Integer checkupYear) throws Exception;

    List<CommonCompanyVO> selectHmCompanyList(Integer userId) throws Exception;

    List<ResultVO> selectCheckupResultCompany(Integer companyId, Integer checkupYear) throws Exception;

    List<ResultVO> selectCheckupResultHospital(Integer hospitalId, Integer checkupYear) throws Exception;

    List<ResultVO> selectHmIndexResultList(Integer userId, Integer checkupYear, Integer companyId) throws Exception;

    void insertCheckupResult(ResultVO vo) throws Exception;

    void insertCheckupResultEmployee(ResultEmployeeVO vo) throws Exception;

    void deleteCheckupResult(ResultVO vo) throws Exception;

    void deleteResultEmployee(ResultEmployeeVO vo) throws Exception;

    List<ResultVO> selectUsResultList(Integer userId) throws Exception;
}
