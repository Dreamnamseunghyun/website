package kr.co.dsong.ggsj.user.service;

import kr.co.dsong.ggsj.user.vo.UserVO;

public interface LoginService {

    UserVO login(UserVO vo) throws Exception;
}
