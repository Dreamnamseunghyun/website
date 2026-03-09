package kr.co.sitebuilder.user.service.impl;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import kr.co.sitebuilder.user.service.LoginService;
import kr.co.sitebuilder.user.service.mapper.LoginMapper;
import kr.co.sitebuilder.user.vo.UserVO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
@Slf4j
public class LoginServiceImpl extends EgovAbstractServiceImpl implements LoginService {

    @Resource
    private BCryptPasswordEncoder bCryptPasswordEncoder;

    @Resource
    LoginMapper loginMapper;

    @Override
    public UserVO login(UserVO vo) throws Exception {
        UserVO user = loginMapper.login(vo);

        if (bCryptPasswordEncoder.matches(vo.getPassword(), user.getPassword())) {
            return user;
        }

        return null;
    }
}
