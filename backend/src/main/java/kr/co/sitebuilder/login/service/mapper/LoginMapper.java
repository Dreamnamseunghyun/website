package kr.co.sitebuilder.login.service.mapper;

import org.apache.ibatis.annotations.Mapper;

import kr.co.sitebuilder.login.vo.LoginVO;

@Mapper
public interface LoginMapper {

    LoginVO selectUserById(String id) throws Exception;

    int insertUser(LoginVO loginVO) throws Exception;
}

