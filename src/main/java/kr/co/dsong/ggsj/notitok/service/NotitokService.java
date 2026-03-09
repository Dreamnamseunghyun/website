package kr.co.dsong.ggsj.notitok.service;

import kr.co.dsong.ggsj.employee.vo.EmployeeVO;
import kr.co.dsong.ggsj.notitok.vo.NotitokAligoTemplateVO;
import kr.co.dsong.ggsj.notitok.vo.NotitokItemVO;
import kr.co.dsong.ggsj.notitok.vo.NotitokUSSentVO;

import java.util.List;

public interface NotitokService {

    List<NotitokItemVO> selectUserExceptList(Integer companyId, Integer checkupYear) throws Exception;

    List<NotitokItemVO> selectHmExceptList(Integer hospitalId, Integer centerId) throws Exception;

    List<NotitokItemVO> selectCheckupInfoList(Integer companyCheckupId) throws Exception;

    List<NotitokItemVO> selectUrgeList(Integer companyCheckupId) throws Exception;

    void notitokSendCheckupGuide(List<NotitokUSSentVO> voList) throws Exception;

    void notitokSendUrge(List<NotitokUSSentVO> voList) throws Exception;

    void notitokSendReserveOffer(Integer reservationId) throws Exception;

    void notitokSendReserveComplete(List<Integer> reservationIds) throws Exception;

    void notitokSendReserveChange(Integer reservationId) throws Exception;

    void notitokSendReserveCancel(Integer reservationId) throws Exception;

    String notitokSendFind(EmployeeVO employee) throws Exception;

    String notitokSendFindPw(EmployeeVO employee) throws Exception;

    NotitokUSSentVO notitokCheck(NotitokUSSentVO vo) throws Exception;

    NotitokUSSentVO checkDataPw(NotitokUSSentVO vo) throws Exception;

    NotitokAligoTemplateVO getTemplateCheckupInfo() throws Exception;

    NotitokAligoTemplateVO getTemplateUrge() throws Exception;
}
