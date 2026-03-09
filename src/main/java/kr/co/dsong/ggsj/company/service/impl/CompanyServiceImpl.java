package kr.co.dsong.ggsj.company.service.impl;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import kr.co.dsong.ggsj.company.service.CompanyService;
import kr.co.dsong.ggsj.company.service.mapper.CompanyMapper;
import kr.co.dsong.ggsj.company.vo.CompanyCheckupTypeVO;
import kr.co.dsong.ggsj.company.vo.CompanyCheckupVO;
import kr.co.dsong.ggsj.company.vo.CompanyIndexVO;
import kr.co.dsong.ggsj.company.vo.CompanyVO;
import kr.co.dsong.ggsj.manager.vo.PlatformManagerVO;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class CompanyServiceImpl extends EgovAbstractServiceImpl implements CompanyService {

    @Resource
    private CompanyMapper companyMapper;

    @Override
    public List<CompanyVO> selectCompanyList(Integer checkupYear) throws Exception {
        return companyMapper.selectCompanyList(checkupYear);
    }

    @Override
    public List<CompanyCheckupVO> salesManagerList() throws Exception {
        return companyMapper.salesManagerList();
    }

    @Override
    public List<CompanyCheckupVO> assistManagerList() throws Exception {
        return companyMapper.assistManagerList();
    }

    @Override
    public List<PlatformManagerVO> selectPlatformManagerList() throws Exception {
        return companyMapper.selectPlatformManagerList();
    }

    @Override
    public CompanyVO selectCompany(CompanyVO vo) throws Exception {
        return companyMapper.selectCompany(vo);
    }

    @Override
    public CompanyVO selectCompanyCm(CompanyVO vo) throws Exception {
        return companyMapper.selectCompanyCm(vo);
    }

    @Override
    public void insertCompany(CompanyVO vo) throws Exception {
        companyMapper.insertCompany(vo);

        vo.getCompanyCheckup().setCompanyId(vo.getCompanyId());
        companyMapper.insertCompanyCheckup(vo.getCompanyCheckup());

        for (CompanyCheckupTypeVO companyCheckupTypeVO : vo.getCompanyCheckup().getCompanyCheckupTypes()) {
            companyCheckupTypeVO.setCompanyCheckupId(vo.getCompanyCheckup().getCompanyCheckupId());
            companyMapper.insertCompanyCheckupType(companyCheckupTypeVO);
        }
    }

    @Override
    public void updateCompany(CompanyVO vo) throws Exception {
        companyMapper.updateCompany(vo);
        companyMapper.updateCompanyCheckup(vo.getCompanyCheckup());

        for (CompanyCheckupTypeVO companyCheckupTypeVO : vo.getCompanyCheckup().getCompanyCheckupTypes()) {
            switch (companyCheckupTypeVO._crudType) {
                case INSERT:
                    companyCheckupTypeVO.setCompanyCheckupId(vo.getCompanyCheckup().getCompanyCheckupId());
                    companyMapper.insertCompanyCheckupType(companyCheckupTypeVO);
                    break;
                case UPDATE:
                    companyMapper.updateCompanyCheckupType(companyCheckupTypeVO);
                    break;
                case REMOVE:
                    companyMapper.deleteCompanyCheckupType(companyCheckupTypeVO);
                    break;
                default:
                    break;
            }
        }
    }

    @Override
    public CompanyVO deleteCompanyCi(CompanyVO vo) throws Exception {
        CompanyVO company = companyMapper.selectCompany(vo);
        companyMapper.deleteCompanyCi(vo);

        return company;
    }

    @Override
    public void deleteCompany(CompanyVO vo) throws Exception {
        companyMapper.deleteCompany(vo);
    }


    @Override
    public void insertCompanyCheckup(CompanyCheckupVO vo) throws Exception {
        companyMapper.insertCompanyCheckup(vo);

        for (CompanyCheckupTypeVO companyCheckupTypeVO : vo.getCompanyCheckupTypes()) {
            companyCheckupTypeVO.setCompanyCheckupId(vo.getCompanyCheckupId());
            companyMapper.insertCompanyCheckupType(companyCheckupTypeVO);
        }
    }

    @Override
    public void updateCompanyCheckup(CompanyCheckupVO vo) throws Exception {
        companyMapper.updateCompanyCheckup(vo);

        for (CompanyCheckupTypeVO companyCheckupTypeVO : vo.getCompanyCheckupTypes()) {
            switch (companyCheckupTypeVO._crudType) {
                case INSERT:
                    companyCheckupTypeVO.setCompanyCheckupId(vo.getCompanyCheckupId());
                    companyMapper.insertCompanyCheckupType(companyCheckupTypeVO);
                    break;
                case UPDATE:
                    companyMapper.updateCompanyCheckupType(companyCheckupTypeVO);
                    break;
                case REMOVE:
                    companyMapper.deleteCompanyCheckupType(companyCheckupTypeVO);
                    break;
                default:
                    break;
            }
        }
    }

    @Override
    public void deleteCompanyCheckup(CompanyCheckupVO vo) throws Exception {
        companyMapper.deleteCompanyCheckup(vo);
    }

    @Override
    public CompanyVO checkCode(CompanyVO vo) throws Exception {
        return companyMapper.checkCode(vo);
    }

    @Override
    public List<CompanyIndexVO> selectCompanyIndexList(CompanyIndexVO vo) throws Exception {
        return companyMapper.selectCompanyIndexList(vo);
    }

    @Override
    public List<CompanyIndexVO> selectCompanyIndexSubList(CompanyIndexVO vo) throws Exception {
        return companyMapper.selectCompanyIndexSubList(vo);
    }

    @Override
    public List<CompanyIndexVO> selectCompanyIndexCount(CompanyIndexVO vo) throws Exception {
        return companyMapper.selectCompanyIndexCount(vo);
    }
}
