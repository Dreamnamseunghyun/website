package kr.co.sitebuilder.companyarchive.service.impl;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import kr.co.sitebuilder.companyarchive.service.CompanyArchiveService;
import kr.co.sitebuilder.companyarchive.service.mapper.CompanyArchiveMapper;
import kr.co.sitebuilder.companyarchive.vo.CompanyArchiveFileVO;
import kr.co.sitebuilder.companyarchive.vo.CompanyArchiveVO;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class CompanyArchiveServiceImpl extends EgovAbstractServiceImpl implements CompanyArchiveService {

    @Resource
    private CompanyArchiveMapper companyArchiveMapper;

    @Override
    public List<CompanyArchiveVO> selectCompanyArchiveList(Integer type) throws Exception {
        return companyArchiveMapper.selectCompanyArchiveList(type);
    }

    @Override
    public List<CompanyArchiveVO> selectHmCompanyArchiveList(Integer type, Integer hospitalId, Integer userId) throws Exception {
        return companyArchiveMapper.selectHmCompanyArchiveList(type, hospitalId, userId);
    }

    @Override
    public List<CompanyArchiveVO> selectCmCompanyArchiveList(Integer type, Integer companyId, Integer userId) throws Exception {
        return companyArchiveMapper.selectCmCompanyArchiveList(type, companyId, userId);
    }

    @Override
    public void insertCompanyArchive(CompanyArchiveVO vo) throws Exception {
        companyArchiveMapper.insertCompanyArchive(vo);

        for (CompanyArchiveFileVO companyArchiveFileVO : vo.getCompanyArchiveFiles()) {
            companyArchiveFileVO.setCompanyArchiveId(vo.getCompanyArchiveId());
            companyArchiveMapper.insertCompanyArchiveFile(companyArchiveFileVO);
        }
    }

    @Override
    public void deleteCompanyArchive(CompanyArchiveVO vo) throws Exception {
        companyArchiveMapper.deleteCompanyArchive(vo);
    }

    @Override
    public void updateCompanyArchive(CompanyArchiveVO vo) throws Exception {
        companyArchiveMapper.updateCompanyArchive(vo);
    }
}
