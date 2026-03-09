package kr.co.sitebuilder.scheduler.service.impl;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import kr.co.sitebuilder.reserve.service.mapper.ReserveMapper;
import kr.co.sitebuilder.scheduler.service.SchedulerService;
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
//    @Scheduled(cron = "0 0 0 * * ?")  // cron ?뺤떇?쇰줈 ?ㅽ뻾?쒕떎
//    public void cronTest() throws Exception {
//        log.info(new Date().toString());
//    }

//    @Override
//    @Scheduled(fixedDelay = 60000)  // fixedDelay: ?⑥닔 ?ㅽ뻾 醫낅즺?쒓컙?쇰줈 遺???뺤쓽???쒓컙留뚰겮 吏?????ㅼ떆 ?⑥닔瑜??ㅽ뻾?쒕떎.(諛由ъ꽭而⑤뱶 ?⑥쐞)
//    public void fixedDelayTest() throws Exception {
//        log.info(new Date().toString());
//        Thread.sleep(7000);
//    }

    @Override
    @Scheduled(fixedRate = 3600000)  // fixedRate: ?뺤쓽???쒓컙留뚰겮 留ㅻ쾲 ?⑥닔瑜??ㅽ뻾?쒕떎.(諛由ъ꽭而⑤뱶 ?⑥쐞), 1?쒓컙: 3600000
    public void fixedRateTest() throws Exception {
        log.info(new Date().toString());
        reserveMapper.updateAutoCancelReserve();
    }
}
