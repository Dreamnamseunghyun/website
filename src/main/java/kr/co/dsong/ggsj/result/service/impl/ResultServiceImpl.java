package kr.co.dsong.ggsj.result.service.impl;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import kr.co.dsong.ggsj.common.vo.CommonCompanyVO;
import kr.co.dsong.ggsj.result.service.ResultService;
import kr.co.dsong.ggsj.result.service.mapper.ResultMapper;
import kr.co.dsong.ggsj.result.vo.ResultEmployeeVO;
import kr.co.dsong.ggsj.result.vo.ResultItemVO;
import kr.co.dsong.ggsj.result.vo.ResultVO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;

@Service
@Slf4j
public class ResultServiceImpl extends EgovAbstractServiceImpl implements ResultService {

    @Resource
    private ResultMapper resultMapper;

    @Override
    public List<ResultVO> selectResultList(Integer hospitalId, Integer companyId) throws Exception {
        return resultMapper.selectResultList(hospitalId, companyId);
    }

    @Override
    public List<ResultVO> selectResultCompanyList(Integer companyId, Integer checkupYear) throws Exception {
        return resultMapper.selectResultCompanyList(companyId, checkupYear);
    }

    @Override
    public List<ResultVO> selectResultHospitalList(Integer hospitalId, Integer checkupYear) throws Exception {
        return resultMapper.selectResultHospitalList(hospitalId, checkupYear);
    }

    @Override
    public List<ResultVO> selectHmResultList(Integer hospitalId, Integer companyId, Integer checkupYear) throws Exception {
        return resultMapper.selectHmResultList(hospitalId, companyId, checkupYear);
    }

    @Override
    public List<ResultVO> selectExcelDownloadList(Integer hospitalId, Integer companyId, Integer checkupYear, Date resultDateBegin, Date resultDateEnd) throws Exception {
        return resultMapper.selectExcelDownloadList(hospitalId, companyId, checkupYear, resultDateBegin, resultDateEnd);
    }

    @Override
    public List<ResultVO> selectResultLookupList(Integer companyId, Integer checkupYear, Integer hospitalId) throws Exception {
        return resultMapper.selectResultLookupList(companyId, checkupYear, hospitalId);
    }

    @Override
    public ResultVO selectCheckupedAt(String employeeCode) throws Exception {
        return resultMapper.selectCheckupedAt(employeeCode);
    }

    @Override
    public List<CommonCompanyVO> selectCompanyList() throws Exception {
        return resultMapper.selectCompanyList();
    }

    @Override
    public List<ResultVO> selectCheckupResult(Integer checkupResultEmployeeId, Integer companyId, Integer checkupYear) throws Exception {
        return resultMapper.selectCheckupResult(checkupResultEmployeeId, companyId, checkupYear);
    }

    @Override
    public List<CommonCompanyVO> selectHmCompanyList(Integer userId) throws Exception {
        return resultMapper.selectHmCompanyList(userId);
    }

    @Override
    public List<ResultVO> selectCheckupResultCompany(Integer companyId, Integer checkupYear) throws Exception {
        return resultMapper.selectCheckupResultCompany(companyId, checkupYear);
    }

    @Override
    public List<ResultVO> selectCheckupResultHospital(Integer hospitalId, Integer checkupYear) throws Exception {
        return resultMapper.selectCheckupResultHospital(hospitalId, checkupYear);
    }

    @Override
    public List<ResultVO> selectHmIndexResultList(Integer userId, Integer checkupYear, Integer companyId) throws Exception {
        return resultMapper.selectHmIndexResultList(userId, checkupYear, companyId);
    }

    @Override
    public void insertCheckupResult(ResultVO vo) throws Exception {
        resultMapper.insertCheckupResult(vo);

        for (ResultEmployeeVO resultEmployeeVO : vo.getResultEmployees()) {
            resultEmployeeVO.setCheckupResultId(vo.getCheckupResultId());
            resultEmployeeVO.setEmployeeCheckupId(resultEmployeeVO.getEmployeeCheckupId());
            resultEmployeeVO.setEmployeeCode(resultEmployeeVO.getEmployeeCode());
            resultMapper.insertDeleteCheckupResultEmployee(resultEmployeeVO);
            resultMapper.insertCheckupResultEmployee(resultEmployeeVO);

            for (ResultItemVO resultItemVO : resultEmployeeVO.getResultItems()) {
                resultItemVO.setCheckupResultEmployeeId(resultEmployeeVO.getCheckupResultEmployeeId());
                resultMapper.insertCheckupResultItem(resultItemVO);
            }
        }
    }

    @Override
    public void insertCheckupResultEmployee(ResultEmployeeVO vo) throws Exception {
        for (ResultItemVO resultItemVO : vo.getResultItems()) {
            resultItemVO.setCheckupResultEmployeeId(vo.getCheckupResultEmployeeId());
            resultMapper.insertCheckupResultItem(resultItemVO);
        }
    }

    @Override
    public void deleteCheckupResult(ResultVO vo) throws Exception {
        resultMapper.deleteCheckupResult(vo);

        ResultEmployeeVO resultEmployee = new ResultEmployeeVO();
        resultEmployee.setCheckupResultId(vo.getCheckupResultId());
        resultMapper.deleteCheckupResultEmployee(resultEmployee);
    }

    @Override
    public void deleteResultEmployee(ResultEmployeeVO vo) throws Exception {
        resultMapper.deleteResultEmployee(vo);
    }

    @Override
    public List<ResultVO> selectUsResultList(Integer userId) throws Exception {
        return resultMapper.selectUsResultList(userId);
    }
}
