package kr.co.sitebuilder.login.service;

import kr.co.sitebuilder.login.vo.LoginVO;

public interface LoginService {

    LoginVO login(LoginVO loginVO) throws Exception;

    int registerUser(LoginVO loginVO) throws Exception;
}
