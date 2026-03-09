package kr.co.dsong.ggsj.scheduler.service.impl;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import kr.co.dsong.ggsj.reserve.service.mapper.ReserveMapper;
import kr.co.dsong.ggsj.scheduler.service.SchedulerService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Date;

//@Profile("prod")
@Service
@Slf4j
public class SchedulerServiceImpl extends EgovAbstractServiceImpl implements SchedulerService {

    @Resource
    private ReserveMapper reserveMapper;

//    @Override
//    @Scheduled(cron = "0 0 0 * * ?")  // cron 형식으로 실행한다
//    public void cronTest() throws Exception {
//        log.info(new Date().toString());
//    }

//    @Override
//    @Scheduled(fixedDelay = 60000)  // fixedDelay: 함수 실행 종료시간으로 부터 정의된 시간만큼 지난 후 다시 함수를 실행한다.(밀리세컨드 단위)
//    public void fixedDelayTest() throws Exception {
//        log.info(new Date().toString());
//        Thread.sleep(7000);
//    }

    @Override
    @Scheduled(fixedRate = 3600000)  // fixedRate: 정의된 시간만큼 매번 함수를 실행한다.(밀리세컨드 단위), 1시간: 3600000
    public void fixedRateTest() throws Exception {
        log.info(new Date().toString());
        reserveMapper.updateAutoCancelReserve();
    }
}
