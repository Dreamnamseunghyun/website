package kr.co.sitebuilder.user.service.mapper;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import kr.co.sitebuilder.user.vo.UserVO;

@Mapper
public interface LoginMapper {

    UserVO login(UserVO vo) throws Exception;
}
