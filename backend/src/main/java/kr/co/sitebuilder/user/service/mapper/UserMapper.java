package kr.co.sitebuilder.user.service.mapper;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import kr.co.sitebuilder.user.vo.UserVO;

@Mapper
public interface UserMapper {

    void insertUser(UserVO vo) throws Exception;

    void updateUserPw(UserVO vo) throws Exception;

    void deleteUser(UserVO vo) throws Exception;
}
