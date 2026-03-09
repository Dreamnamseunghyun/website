package kr.co.sitebuilder.user.service;

import kr.co.sitebuilder.user.vo.UserVO;

public interface LoginService {

    UserVO login(UserVO vo) throws Exception;
}
