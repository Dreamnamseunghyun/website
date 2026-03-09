package kr.co.dsong.ggsj.user.service.mapper;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import kr.co.dsong.ggsj.user.vo.UserVO;

@Mapper
public interface LoginMapper {

    UserVO login(UserVO vo) throws Exception;
}
