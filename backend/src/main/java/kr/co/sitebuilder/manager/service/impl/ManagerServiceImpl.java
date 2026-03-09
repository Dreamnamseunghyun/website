package kr.co.sitebuilder.manager.service.impl;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import kr.co.sitebuilder.common.CrudType;
import kr.co.sitebuilder.manager.service.ManagerService;
import kr.co.sitebuilder.manager.service.mapper.ManagerMapper;
import kr.co.sitebuilder.manager.vo.*;
import kr.co.sitebuilder.user.service.mapper.UserMapper;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
@Slf4j
public class ManagerServiceImpl extends EgovAbstractServiceImpl implements ManagerService {

    @Resource
    private BCryptPasswordEncoder bCryptPasswordEncoder;

    @Resource
    private UserMapper userMapper;

    @Resource
    private ManagerMapper managerMapper;

    @Override
    public List<ManagerVO> selectManagerList() throws Exception {
        return managerMapper.selectManagerList();
    }

    @Override
    public CenterManagerVO selectCenterManager(CenterManagerVO vo) throws Exception {

        vo = managerMapper.selectCenterManager(vo);

        CenterManagerCompanyVO centerManagerCompany = new CenterManagerCompanyVO();
        centerManagerCompany.setUserId(vo.getUserId());
        centerManagerCompany.setCenterId(vo.getCenterId());

        vo.setCenterManagerCompany(managerMapper.selectCenterManagerCompany(centerManagerCompany));

        return vo;
    }

    @Override
    public PlatformManagerVO selectPlatformManager(PlatformManagerVO vo) throws Exception {
        return managerMapper.selectPlatformManager(vo);
    }

    @Override
    public CompanyManagerVO selectCompanyManager(CompanyManagerVO vo) throws Exception {
        return managerMapper.selectCompanyManager(vo);
    }

    @Override
    public List<CenterManagerVO> centerManagerList() throws Exception {
        return managerMapper.centerManagerList();
    }

    @Override
    public void insertCenterManager(CenterManagerVO vo) throws Exception {
        vo.setUserType("HM");
        String initPw = vo.getMobile();
        initPw = initPw.substring(initPw.length() - 4);

        log.info("initPw: " + initPw);

        vo.setUserPw(bCryptPasswordEncoder.encode(initPw));

        userMapper.insertUser(vo);
        managerMapper.insertCenterManager(vo);

        for (CenterManagerCompanyVO centerManagerCompanyVO : vo.getCenterManagerCompany()) {
            if (centerManagerCompanyVO._crudType == CrudType.INSERT) {
                centerManagerCompanyVO.setCenterId(vo.getCenterId());
                centerManagerCompanyVO.setUserId(vo.getUserId());
                managerMapper.insertCenterManagerCompany(centerManagerCompanyVO);
            }
        }
    }

    @Override
    public void updateCenterManager(CenterManagerVO vo) throws Exception {
        managerMapper.updateCenterManager(vo);

        for (CenterManagerCompanyVO centerManagerCompanyVO : vo.getCenterManagerCompany()) {
            switch (centerManagerCompanyVO._crudType) {
                case INSERT:
                    centerManagerCompanyVO.setCenterId(vo.getCenterId());
                    centerManagerCompanyVO.setUserId(vo.getUserId());
                    managerMapper.insertCenterManagerCompany(centerManagerCompanyVO);
                    break;
                case UPDATE:
                    managerMapper.updateCenterManagerCompany(centerManagerCompanyVO);
                    break;
                case REMOVE:
                    managerMapper.deleteCenterManagerCompany(centerManagerCompanyVO);
                    break;
                default:
                    break;
            }
        }
    }

    @Override
    public void deleteHospitalManager(ManagerVO vo) throws Exception {
        managerMapper.deleteHospitalManager(vo);
    }

    @Override
    public void insertCompanyManager(CompanyManagerVO vo) throws Exception {
        vo.setUserType("CM");
        String initPw = vo.getMobile();
        initPw = initPw.substring(initPw.length() - 4);

        log.info("initPw: " + initPw);

        vo.setUserPw(bCryptPasswordEncoder.encode(initPw));

        userMapper.insertUser(vo);
        managerMapper.insertCompanyManager(vo);
    }

    @Override
    public void updateCompanyManager(CompanyManagerVO vo) throws Exception {
        managerMapper.updateCompanyManager(vo);
    }

    @Override
    public void resetPw(ManagerVO vo) throws Exception {
        String initPw = vo.getMobile();
        initPw = initPw.substring(initPw.length() - 4);

        log.info("initPw: " + initPw);

        vo.setUserPw(bCryptPasswordEncoder.encode(initPw));

        userMapper.updateUserPw(vo);
    }

    @Override
    public void deleteCompanyManager(ManagerVO vo) throws Exception {
        managerMapper.deleteCompanyManager(vo);
    }

    @Override
    public void insertPlatformManager(PlatformManagerVO vo) throws Exception {
        vo.setUserType("PM");
        String initPw = vo.getMobile();
        initPw = initPw.substring(initPw.length() - 4);

        log.info("initPw: " + initPw);

        vo.setUserPw(bCryptPasswordEncoder.encode(initPw));

        userMapper.insertUser(vo);
        managerMapper.insertPlatformManager(vo);
    }

    @Override
    public void updatePlatformManager(PlatformManagerVO vo) throws Exception {
        managerMapper.updatePlatformManager(vo);
    }

    @Override
    public void deletePlatformManager(ManagerVO vo) throws Exception {
        managerMapper.deletePlatformManager(vo);
    }

    @Override
    public void insertCenterManagerCompany(CenterManagerCompanyVO vo) throws Exception {
        managerMapper.insertCenterManagerCompany(vo);
    }

    @Override
    public void deleteCenterManagerCompany(CenterManagerCompanyVO vo) throws Exception {
        managerMapper.deleteCenterManagerCompany(vo);
    }
}
