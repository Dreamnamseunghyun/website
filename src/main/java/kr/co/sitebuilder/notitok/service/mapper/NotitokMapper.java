package kr.co.sitebuilder.notitok.service.mapper;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import kr.co.sitebuilder.notitok.vo.NotitokItemVO;
import kr.co.sitebuilder.notitok.vo.NotitokUSSentVO;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface NotitokMapper {

    List<NotitokItemVO> selectUserExceptList(@Param("companyId") Integer companyId, @Param("checkupYear") Integer checkupYear) throws Exception;

    List<NotitokItemVO> selectHmExceptList(@Param("hospitalId") Integer hospitalId, @Param("centerId") Integer centerId) throws Exception;

    List<NotitokItemVO> selectCheckupInfoList(@Param("companyCheckupId") Integer companyCheckupId) throws Exception;

    List<NotitokItemVO> selectUrgeList(@Param("companyCheckupId") Integer companyCheckupId) throws Exception;

    void insertNotitokUsSentCheckupInfo(@Param("messageId") String messageId,
                                        @Param("sessionUserId") Integer sessionUserId,
                                        @Param("message") String message,
                                        @Param("voList") List<NotitokUSSentVO> voList) throws Exception;

    List<NotitokUSSentVO> selectNotitokUsSentCheckupInfo(@Param("messageId") String messageId) throws Exception;

    void updateNotitokUsSentCheckupInfo(@Param("messageId") String messageId,
                                        @Param("mid") Long mid) throws Exception;

    void insertNotitokUsSentUrge(@Param("messageId") String messageId,
                                 @Param("sessionUserId") Integer sessionUserId,
                                 @Param("message") String message,
                                 @Param("voList") List<NotitokUSSentVO> voList) throws Exception;

    List<NotitokUSSentVO> selectNotitokUsSentUrge(@Param("messageId") String messageId) throws Exception;

    void updateNotitokUsSentUrge(@Param("messageId") String messageId,
                                 @Param("mid") Long mid) throws Exception;

    void insertNotitokUsSentReserveOffer(@Param("messageId") String messageId,
                                         @Param("sessionUserId") Integer sessionUserId,
                                         @Param("message") String message,
                                         @Param("reservationId") Integer reservationId) throws Exception;

    NotitokUSSentVO selectNotitokUsSentReserveOffer(@Param("messageId") String messageId) throws Exception;

    void updateNotitokUsSentReserveOffer(@Param("messageId") String messageId,
                                         @Param("mid") Long mid) throws Exception;

    void insertNotitokUsSentReserveComplete(@Param("messageId") String messageId,
                                            @Param("sessionUserId") Integer sessionUserId,
                                            @Param("message") String message,
                                            @Param("reservationIds") List<Integer> reservationIds) throws Exception;

    List<NotitokUSSentVO> selectNotitokUsSentReserveComplete(@Param("messageId") String messageId) throws Exception;

    void updateNotitokUsSentReserveComplete(@Param("messageId") String messageId,
                                            @Param("mid") Long mid) throws Exception;

    void insertNotitokUsSentReserveChange(@Param("messageId") String messageId,
                                          @Param("sessionUserId") Integer sessionUserId,
                                          @Param("message") String message,
                                          @Param("reservationId") Integer reservationId) throws Exception;

    NotitokUSSentVO selectNotitokUsSentReserveChange(@Param("messageId") String messageId) throws Exception;

    void updateNotitokUsSentReserveChange(@Param("messageId") String messageId,
                                          @Param("mid") Long mid) throws Exception;

    void insertNotitokUsSentReserveCancel(@Param("messageId") String messageId,
                                          @Param("sessionUserId") Integer sessionUserId,
                                          @Param("message") String message,
                                          @Param("reservationId") Integer reservationId) throws Exception;

    NotitokUSSentVO selectNotitokUsSentReserveCancel(@Param("messageId") String messageId) throws Exception;

    void updateNotitokUsSentReserveCancel(@Param("messageId") String messageId,
                                          @Param("mid") Long mid) throws Exception;

    void insertNotitokUsSentFind(@Param("messageId") String messageId,
                                 @Param("employeeCheckupId") Integer employeeCheckupId,
                                 @Param("employeeName") String employeeName,
                                 @Param("mobile") String mobile,
                                 @Param("message") String message,
                                 @Param("data") String data) throws Exception;

    NotitokUSSentVO selectNotitokUsSentFind(@Param("messageId") String messageId) throws Exception;

    void updateNotitokUsSentFind(@Param("messageId") String messageId,
                                 @Param("mid") Long mid) throws Exception;

    void insertNotitokUsSentFindPw(@Param("messageId") String messageId,
                                   @Param("employeeCheckupId") Integer employeeCheckupId,
                                   @Param("employeeName") String employeeName,
                                   @Param("mobile") String mobile,
                                   @Param("message") String message,
                                   @Param("data") String data) throws Exception;

    NotitokUSSentVO selectNotitokUsSentFindPw(@Param("messageId") String messageId) throws Exception;

    void updateNotitokUsSentFindPw(@Param("messageId") String messageId,
                                   @Param("mid") Long mid) throws Exception;

    NotitokUSSentVO notitokCheck(NotitokUSSentVO vo) throws Exception;

    NotitokUSSentVO checkDataPw(NotitokUSSentVO vo) throws Exception;

}
