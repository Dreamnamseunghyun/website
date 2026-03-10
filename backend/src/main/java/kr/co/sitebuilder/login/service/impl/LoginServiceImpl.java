package kr.co.sitebuilder.login.service.impl;

import javax.annotation.Resource;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import kr.co.sitebuilder.login.vo.LoginVO;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import kr.co.sitebuilder.login.service.LoginService;
import kr.co.sitebuilder.login.service.mapper.LoginMapper;
import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class LoginServiceImpl extends EgovAbstractServiceImpl implements LoginService {

    @Resource
    private BCryptPasswordEncoder bCryptPasswordEncoder;

    @Resource
    LoginMapper loginMapper;

    @Override
    public LoginVO login(LoginVO vo) throws Exception {
        LoginVO user = loginMapper.login(vo);

        if (bCryptPasswordEncoder.matches(vo.getPassword(), user.getPassword())) {
            if (user != null) {

                user.setSuccess(true);
                user.setMessage("로그인 성공");

                return user;

            } else {

                LoginVO result = new LoginVO();
                result.setSuccess(false);
                result.setMessage("아이디 또는 비밀번호 오류");

                return result;
            }
        }

        return null;
    }
}
