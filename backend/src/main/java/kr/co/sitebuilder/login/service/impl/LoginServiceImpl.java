package kr.co.sitebuilder.login.service.impl;

import javax.annotation.Resource;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import kr.co.sitebuilder.login.service.LoginService;
import kr.co.sitebuilder.login.service.mapper.LoginMapper;
import kr.co.sitebuilder.login.vo.LoginVO;

@Service("loginService")
public class LoginServiceImpl implements LoginService {

    @Resource(name = "loginMapper")
    private LoginMapper loginMapper;

    @Resource(name = "passwordEncoder")
    private BCryptPasswordEncoder passwordEncoder;

    @Override
    public LoginVO login(LoginVO loginVO) throws Exception {
        LoginVO dbUser = loginMapper.selectUserById(loginVO.getId());

        if (dbUser == null) {
            return null;
        }

        boolean isMatched = passwordEncoder.matches(
            loginVO.getPassword(),
            dbUser.getPassword()
        );

        if (!isMatched) {
            return null;
        }

        return dbUser;
    }

    @Override
    public int registerUser(LoginVO loginVO) throws Exception {
        String encodedPassword = passwordEncoder.encode(loginVO.getPassword());
        loginVO.setPassword(encodedPassword);

        return loginMapper.insertUser(loginVO);
    }
}
