package kr.co.dsong.ggsj.notitok.service.impl;

import com.fasterxml.jackson.databind.ObjectMapper;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import kr.co.dsong.ggsj.employee.service.mapper.EmployeeMapper;
import kr.co.dsong.ggsj.employee.vo.EmployeeVO;
import kr.co.dsong.ggsj.notitok.service.NotitokService;
import kr.co.dsong.ggsj.notitok.service.mapper.NotitokMapper;
import kr.co.dsong.ggsj.notitok.vo.*;
import kr.co.dsong.ggsj.util.SessionUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.*;
import org.springframework.http.client.HttpComponentsClientHttpRequestFactory;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.HttpStatusCodeException;
import org.springframework.web.client.RestTemplate;

import javax.annotation.Resource;
import java.net.URI;
import java.nio.charset.StandardCharsets;
import java.security.SecureRandom;
import java.util.Calendar;
import java.util.Collections;
import java.util.List;
import java.util.UUID;

@Slf4j
@Service
public class NotitokServiceImpl extends EgovAbstractServiceImpl implements NotitokService {
    private final String ALIGO_HOST = "kakaoapi.aligo.in";
    private final String ALIGO_VERSION = "akv10";
    private final String ALIGO_API_TOKEN = "token/create/30/s/";
    private final String ALIGO_API_TEMPLATE = "template/list/";
    private final String ALIGO_API_SEND = "alimtalk/send/";
    private final String ALIGO_API_HISTORY_DETAIL = "history/detail/";

    private final String ALIGO_APIKEY = "16vuc9my2jjdlqmd5nddw3qqhnrwme9f";
    private final String ALIGO_USERID = "volkkorea";
    private final String ALIGO_USERTEL = "1644-7527";
    private final String ALIGO_SENDERKEY = "369fb3c2e4beb5b3c1c725a06e50f35ca4bc8622";

    //private final int ALIGO_MAX_COUNT = 2;
    private final int ALIGO_MAX_COUNT = 500;

    private final String ALIGO_TEMPLATE_CODE_GUIDE = "TG_0140";
    private final String ALIGO_TEMPLATE_CODE_URGE = "TG_0145";
    private final String ALIGO_TEMPLATE_CODE_CANCEL = "TG_0150";
    private final String ALIGO_TEMPLATE_CODE_OFFER = "TG_0152";
    private final String ALIGO_TEMPLATE_CODE_CHANGE = "TG_0149";
    private final String ALIGO_TEMPLATE_CODE_COMPLETE = "TG_0153";
    private final String ALIGO_TEMPLATE_CODE_FIND = "TG_0154";

    private HttpComponentsClientHttpRequestFactory requestFactory = null;

    @Resource
    private NotitokMapper notitokMapper;

    @Resource
    private EmployeeMapper employeeMapper;

    @Override
    public List<NotitokItemVO> selectUserExceptList(Integer companyId, Integer checkupYear) throws Exception {
        return notitokMapper.selectUserExceptList(companyId, checkupYear);
    }

    @Override
    public List<NotitokItemVO> selectHmExceptList(Integer hospitalId, Integer centerId) throws Exception {
        return notitokMapper.selectHmExceptList(hospitalId, centerId);
    }

    @Override
    public List<NotitokItemVO> selectCheckupInfoList(Integer companyCheckupId) throws Exception {
        return notitokMapper.selectCheckupInfoList(companyCheckupId);
    }

    @Override
    public List<NotitokItemVO> selectUrgeList(Integer companyCheckupId) throws Exception {
        return notitokMapper.selectUrgeList(companyCheckupId);
    }

    @Override
    public NotitokAligoTemplateVO getTemplateCheckupInfo() throws Exception {
        return getNotitokTemplate(ALIGO_TEMPLATE_CODE_GUIDE);
    }

    @Override
    public NotitokAligoTemplateVO getTemplateUrge() throws Exception {
        return getNotitokTemplate(ALIGO_TEMPLATE_CODE_URGE);
    }

    @Override
    public void notitokSendCheckupGuide(List<NotitokUSSentVO> voList) throws Exception {

        NotitokAligoTemplateVO templateVO = getNotitokTemplate(ALIGO_TEMPLATE_CODE_GUIDE);
        if (templateVO == null) {
            return;
        }

        String messageId;
        Integer sessionUserId = SessionUtil.getInteger("sessionUserId");
        String strButtons = new ObjectMapper().writeValueAsString(templateVO.getButtons());

        int pages = voList.size() / ALIGO_MAX_COUNT;

        for (int idx = 0; idx < pages; idx++) {
            messageId = UUID.randomUUID().toString();
            List<NotitokUSSentVO> subVoList = voList.subList(idx * ALIGO_MAX_COUNT, (idx + 1) * ALIGO_MAX_COUNT);

            notitokMapper.insertNotitokUsSentCheckupInfo(
                    messageId, sessionUserId,
                    templateVO.getTempltContent(), subVoList
            );

            subVoList = notitokMapper.selectNotitokUsSentCheckupInfo(messageId);

            RestTemplate restTemplate = new RestTemplate(getHttpRequestFactory());

            // Header
            HttpHeaders headers = new HttpHeaders();
            headers.add("Host", ALIGO_HOST);
            headers.setAccept(Collections.singletonList(MediaType.APPLICATION_JSON));
            headers.setContentType(new MediaType(MediaType.APPLICATION_FORM_URLENCODED, StandardCharsets.UTF_8));

            // Body
            MultiValueMap<String, String> bodies = new LinkedMultiValueMap<>();
            bodies.add("apikey", ALIGO_APIKEY);
            bodies.add("userid", ALIGO_USERID);
            bodies.add("token", templateVO.getToken());
            bodies.add("senderkey", ALIGO_SENDERKEY);

            bodies.add("tpl_code", templateVO.getTempltCode());
            bodies.add("sender", ALIGO_USERTEL);
            //bodies.add("senddate", "");
            bodies.add("failover", "Y");
            bodies.add("testMode", "N");

            for (int i = 0; i < subVoList.size(); i++) {
                NotitokUSSentVO vo = subVoList.get(i);

                bodies.add("receiver_" + (i + 1), vo.getMobile());
                bodies.add("recvname_" + (i + 1), vo.getRecvName());
                bodies.add("subject_" + (i + 1), "검사실시안내");
                bodies.add("message_" + (i + 1), vo.getMessage());
                bodies.add("button_" + (i + 1), "{\"button\":" + strButtons + "}");
                // failover
                bodies.add("fsubject_" + (i + 1), "검사실시안내");
                bodies.add("fmessage_" + (i + 1), vo.getMessage());
            }

            URI url = URI.create("https://" + ALIGO_HOST + "/" + ALIGO_VERSION + "/" + ALIGO_API_SEND);

            RequestEntity<MultiValueMap<String, String>> requestEntity = new RequestEntity<>(bodies, headers, HttpMethod.POST, url);
            ResponseEntity<NotitokAligoSendInfoList> responseEntity;

            try {
                responseEntity = restTemplate.exchange(requestEntity, NotitokAligoSendInfoList.class);
            } catch (HttpStatusCodeException e) {
                NotitokAligoSendInfoList vo = new ObjectMapper().readValue(e.getResponseBodyAsString(), NotitokAligoSendInfoList.class);
                responseEntity = new ResponseEntity<>(vo, e.getStatusCode());
            }

            NotitokAligoSendInfoList sendInfoVO = responseEntity.getBody();

            // update mid
            if (sendInfoVO.getInfo().getMid() != null) {
                notitokMapper.updateNotitokUsSentCheckupInfo(messageId, sendInfoVO.getInfo().getMid());
            }
        }

        if ((voList.size() % ALIGO_MAX_COUNT) > 0) {
            messageId = UUID.randomUUID().toString();
            List<NotitokUSSentVO> subVoList = voList.subList(ALIGO_MAX_COUNT * pages, voList.size());

            notitokMapper.insertNotitokUsSentCheckupInfo(
                    messageId, sessionUserId,
                    templateVO.getTempltContent(), subVoList
            );

            subVoList = notitokMapper.selectNotitokUsSentCheckupInfo(messageId);

            RestTemplate restTemplate = new RestTemplate(getHttpRequestFactory());

            // Header
            HttpHeaders headers = new HttpHeaders();
            headers.add("Host", ALIGO_HOST);
            headers.setAccept(Collections.singletonList(MediaType.APPLICATION_JSON));
            headers.setContentType(new MediaType(MediaType.APPLICATION_FORM_URLENCODED, StandardCharsets.UTF_8));

            // Body
            MultiValueMap<String, String> bodies = new LinkedMultiValueMap<>();
            bodies.add("apikey", ALIGO_APIKEY);
            bodies.add("userid", ALIGO_USERID);
            bodies.add("token", templateVO.getToken());
            bodies.add("senderkey", ALIGO_SENDERKEY);

            bodies.add("tpl_code", templateVO.getTempltCode());
            bodies.add("sender", ALIGO_USERTEL);
            //bodies.add("senddate", "");
            bodies.add("failover", "Y");
            bodies.add("testMode", "N");

            for (int i = 0; i < subVoList.size(); i++) {
                NotitokUSSentVO vo = subVoList.get(i);

                bodies.add("receiver_" + (i + 1), vo.getMobile());
                bodies.add("recvname_" + (i + 1), vo.getRecvName());
                bodies.add("subject_" + (i + 1), "검사실시안내");
                bodies.add("message_" + (i + 1), vo.getMessage());
                bodies.add("button_" + (i + 1), "{\"button\":" + strButtons + "}");
                // failover
                bodies.add("fsubject_" + (i + 1), "검사실시안내");
                bodies.add("fmessage_" + (i + 1), vo.getMessage());
            }

            URI url = URI.create("https://" + ALIGO_HOST + "/" + ALIGO_VERSION + "/" + ALIGO_API_SEND);

            RequestEntity<MultiValueMap<String, String>> requestEntity = new RequestEntity<>(bodies, headers, HttpMethod.POST, url);
            ResponseEntity<NotitokAligoSendInfoList> responseEntity;

            try {
                responseEntity = restTemplate.exchange(requestEntity, NotitokAligoSendInfoList.class);
            } catch (HttpStatusCodeException e) {
                NotitokAligoSendInfoList vo = new ObjectMapper().readValue(e.getResponseBodyAsString(), NotitokAligoSendInfoList.class);
                responseEntity = new ResponseEntity<>(vo, e.getStatusCode());
            }

            NotitokAligoSendInfoList sendInfoVO = responseEntity.getBody();

            // update mid
            if (sendInfoVO.getInfo().getMid() != null) {
                notitokMapper.updateNotitokUsSentCheckupInfo(messageId, sendInfoVO.getInfo().getMid());
            }
        }
    }

    @Override
    public void notitokSendUrge(List<NotitokUSSentVO> voList) throws Exception {

        NotitokAligoTemplateVO templateVO = getNotitokTemplate(ALIGO_TEMPLATE_CODE_URGE);
        if (templateVO == null) {
            return;
        }

        String messageId;
        Integer sessionUserId = SessionUtil.getInteger("sessionUserId");
        String strButtons = new ObjectMapper().writeValueAsString(templateVO.getButtons());

        int pages = voList.size() / ALIGO_MAX_COUNT;

        for (int idx = 0; idx < pages; idx++) {
            messageId = UUID.randomUUID().toString();
            List<NotitokUSSentVO> subVoList = voList.subList(idx * ALIGO_MAX_COUNT, (idx + 1) * ALIGO_MAX_COUNT);

            notitokMapper.insertNotitokUsSentUrge(
                    messageId, sessionUserId,
                    templateVO.getTempltContent(), subVoList
            );

            subVoList = notitokMapper.selectNotitokUsSentUrge(messageId);

            RestTemplate restTemplate = new RestTemplate(getHttpRequestFactory());

            // Header
            HttpHeaders headers = new HttpHeaders();
            headers.add("Host", ALIGO_HOST);
            headers.setAccept(Collections.singletonList(MediaType.APPLICATION_JSON));
            headers.setContentType(new MediaType(MediaType.APPLICATION_FORM_URLENCODED, StandardCharsets.UTF_8));

            // Body
            MultiValueMap<String, String> bodies = new LinkedMultiValueMap<>();
            bodies.add("apikey", ALIGO_APIKEY);
            bodies.add("userid", ALIGO_USERID);
            bodies.add("token", templateVO.getToken());
            bodies.add("senderkey", ALIGO_SENDERKEY);

            bodies.add("tpl_code", templateVO.getTempltCode());
            bodies.add("sender", ALIGO_USERTEL);
            //bodies.add("senddate", "");
            bodies.add("failover", "Y");
            bodies.add("testMode", "N");

            for (int i = 0; i < subVoList.size(); i++) {
                NotitokUSSentVO vo = subVoList.get(i);

                bodies.add("receiver_" + (i + 1), vo.getMobile());
                bodies.add("recvname_" + (i + 1), vo.getRecvName());
                bodies.add("subject_" + (i + 1), "미예약자 관리");
                bodies.add("message_" + (i + 1), vo.getMessage());
                bodies.add("button_" + (i + 1), "{\"button\":" + strButtons + "}");
                // failover
                bodies.add("fsubject_" + (i + 1), "미예약자 관리");
                bodies.add("fmessage_" + (i + 1), vo.getMessage());
            }

            URI url = URI.create("https://" + ALIGO_HOST + "/" + ALIGO_VERSION + "/" + ALIGO_API_SEND);

            RequestEntity<MultiValueMap<String, String>> requestEntity = new RequestEntity<>(bodies, headers, HttpMethod.POST, url);
            ResponseEntity<NotitokAligoSendInfoList> responseEntity;

            try {
                responseEntity = restTemplate.exchange(requestEntity, NotitokAligoSendInfoList.class);
            } catch (HttpStatusCodeException e) {
                NotitokAligoSendInfoList vo = new ObjectMapper().readValue(e.getResponseBodyAsString(), NotitokAligoSendInfoList.class);
                responseEntity = new ResponseEntity<>(vo, e.getStatusCode());
            }

            NotitokAligoSendInfoList sendInfoVO = responseEntity.getBody();

            // update mid
            if (sendInfoVO.getInfo().getMid() != null) {
                notitokMapper.updateNotitokUsSentUrge(messageId, sendInfoVO.getInfo().getMid());
            }
        }

        if ((voList.size() % ALIGO_MAX_COUNT) > 0) {
            messageId = UUID.randomUUID().toString();
            List<NotitokUSSentVO> subVoList = voList.subList(ALIGO_MAX_COUNT * pages, voList.size());

            notitokMapper.insertNotitokUsSentUrge(
                    messageId, sessionUserId,
                    templateVO.getTempltContent(), subVoList
            );

            subVoList = notitokMapper.selectNotitokUsSentUrge(messageId);

            RestTemplate restTemplate = new RestTemplate(getHttpRequestFactory());

            // Header
            HttpHeaders headers = new HttpHeaders();
            headers.add("Host", ALIGO_HOST);
            headers.setAccept(Collections.singletonList(MediaType.APPLICATION_JSON));
            headers.setContentType(new MediaType(MediaType.APPLICATION_FORM_URLENCODED, StandardCharsets.UTF_8));

            // Body
            MultiValueMap<String, String> bodies = new LinkedMultiValueMap<>();
            bodies.add("apikey", ALIGO_APIKEY);
            bodies.add("userid", ALIGO_USERID);
            bodies.add("token", templateVO.getToken());
            bodies.add("senderkey", ALIGO_SENDERKEY);

            bodies.add("tpl_code", templateVO.getTempltCode());
            bodies.add("sender", ALIGO_USERTEL);
            //bodies.add("senddate", "");
            bodies.add("failover", "Y");
            bodies.add("testMode", "N");

            for (int i = 0; i < subVoList.size(); i++) {
                NotitokUSSentVO vo = subVoList.get(i);

                bodies.add("receiver_" + (i + 1), vo.getMobile());
                bodies.add("recvname_" + (i + 1), vo.getRecvName());
                bodies.add("subject_" + (i + 1), "미예약자 관리");
                bodies.add("message_" + (i + 1), vo.getMessage());
                bodies.add("button_" + (i + 1), "{\"button\":" + strButtons + "}");
                // failover
                bodies.add("fsubject_" + (i + 1), "미예약자 관리");
                bodies.add("fmessage_" + (i + 1), vo.getMessage());
            }

            URI url = URI.create("https://" + ALIGO_HOST + "/" + ALIGO_VERSION + "/" + ALIGO_API_SEND);

            RequestEntity<MultiValueMap<String, String>> requestEntity = new RequestEntity<>(bodies, headers, HttpMethod.POST, url);
            ResponseEntity<NotitokAligoSendInfoList> responseEntity;

            try {
                responseEntity = restTemplate.exchange(requestEntity, NotitokAligoSendInfoList.class);
            } catch (HttpStatusCodeException e) {
                NotitokAligoSendInfoList vo = new ObjectMapper().readValue(e.getResponseBodyAsString(), NotitokAligoSendInfoList.class);
                responseEntity = new ResponseEntity<>(vo, e.getStatusCode());
            }

            NotitokAligoSendInfoList sendInfoVO = responseEntity.getBody();

            // update mid
            if (sendInfoVO.getInfo().getMid() != null) {
                notitokMapper.updateNotitokUsSentUrge(messageId, sendInfoVO.getInfo().getMid());
            }
        }
    }

    public String notitokSendFind(EmployeeVO employee) throws Exception {
        NotitokAligoTemplateVO templateVO = getNotitokTemplate(ALIGO_TEMPLATE_CODE_FIND);
        if (templateVO == null) {
            return null;
        }

        employee.setCheckupYear(Calendar.getInstance().get(Calendar.YEAR));

        Integer employeeCheckupId = employeeMapper.findID(employee);
        if (employeeCheckupId == null) {
            return null;
        }

        SecureRandom random = new SecureRandom();
        String num = String.valueOf(random.nextInt(899999) + 100000);
//        log.info("number " + num);

        String messageId = UUID.randomUUID().toString();

        templateVO.setTempltContent(templateVO.getTempltContent().replace("#{인증번호}", num));

        notitokMapper.insertNotitokUsSentFind(
                messageId, employeeCheckupId, employee.getEmployeeNameCrypt(), employee.getMobile(),
                templateVO.getTempltContent(), num
        );

        RestTemplate restTemplate = new RestTemplate(getHttpRequestFactory());

        // Header
        HttpHeaders headers = new HttpHeaders();
        headers.add("Host", ALIGO_HOST);
        headers.setAccept(Collections.singletonList(MediaType.APPLICATION_JSON));
        headers.setContentType(new MediaType(MediaType.APPLICATION_FORM_URLENCODED, StandardCharsets.UTF_8));

        // Body
        MultiValueMap<String, String> bodies = new LinkedMultiValueMap<>();
        bodies.add("apikey", ALIGO_APIKEY);
        bodies.add("userid", ALIGO_USERID);
        bodies.add("token", templateVO.getToken());
        bodies.add("senderkey", ALIGO_SENDERKEY);

        bodies.add("tpl_code", templateVO.getTempltCode());
        bodies.add("sender", ALIGO_USERTEL);
        //bodies.add("senddate", "");
        bodies.add("failover", "Y");
        bodies.add("testMode", "N");

        bodies.add("receiver_1", employee.getMobile());
        bodies.add("recvname_1", employee.getEmployeeName());
        bodies.add("subject_1", "인증번호");
        bodies.add("message_1", templateVO.getTempltContent());
        // failover
        bodies.add("fsubject_1", "인증번호");
        bodies.add("fmessage_1", templateVO.getTempltContent());

        URI url = URI.create("https://" + ALIGO_HOST + "/" + ALIGO_VERSION + "/" + ALIGO_API_SEND);

        RequestEntity<MultiValueMap<String, String>> requestEntity = new RequestEntity<>(bodies, headers, HttpMethod.POST, url);
        ResponseEntity<NotitokAligoSendInfoList> responseEntity;

        try {
            responseEntity = restTemplate.exchange(requestEntity, NotitokAligoSendInfoList.class);
        } catch (HttpStatusCodeException e) {
            NotitokAligoSendInfoList voList = new ObjectMapper().readValue(e.getResponseBodyAsString(), NotitokAligoSendInfoList.class);
            responseEntity = new ResponseEntity<>(voList, e.getStatusCode());
        }

        NotitokAligoSendInfoList sendInfoVO = responseEntity.getBody();

        // update mid
        if (sendInfoVO.getInfo().getMid() != null) {
            notitokMapper.updateNotitokUsSentFind(messageId, sendInfoVO.getInfo().getMid());
        }

        if (sendInfoVO.getCode() == 0) {
            return messageId;
        } else {
            return null;
        }
    }

    public String notitokSendFindPw(EmployeeVO employee) throws Exception {
        NotitokAligoTemplateVO templateVO = getNotitokTemplate(ALIGO_TEMPLATE_CODE_FIND);
        if (templateVO == null) {
            return null;
        }

        employee.setCheckupYear(Calendar.getInstance().get(Calendar.YEAR));

        Integer employeeCheckupId = employeeMapper.findPW(employee);
        if (employeeCheckupId == null) {
            return null;
        }

        SecureRandom random = new SecureRandom();
        String num = String.valueOf(random.nextInt(899999) + 100000);
//        log.info("number " + num);

        String messageId = UUID.randomUUID().toString();

        templateVO.setTempltContent(templateVO.getTempltContent().replace("#{인증번호}", num));

        notitokMapper.insertNotitokUsSentFindPw(
                messageId, employeeCheckupId, employee.getEmployeeNameCrypt(), employee.getMobile(),
                templateVO.getTempltContent(), num
        );

        RestTemplate restTemplate = new RestTemplate(getHttpRequestFactory());

        // Header
        HttpHeaders headers = new HttpHeaders();
        headers.add("Host", ALIGO_HOST);
        headers.setAccept(Collections.singletonList(MediaType.APPLICATION_JSON));
        headers.setContentType(new MediaType(MediaType.APPLICATION_FORM_URLENCODED, StandardCharsets.UTF_8));

        // Body
        MultiValueMap<String, String> bodies = new LinkedMultiValueMap<>();
        bodies.add("apikey", ALIGO_APIKEY);
        bodies.add("userid", ALIGO_USERID);
        bodies.add("token", templateVO.getToken());
        bodies.add("senderkey", ALIGO_SENDERKEY);

        bodies.add("tpl_code", templateVO.getTempltCode());
        bodies.add("sender", ALIGO_USERTEL);
        //bodies.add("senddate", "");
        bodies.add("failover", "Y");
        bodies.add("testMode", "N");

        bodies.add("receiver_1", employee.getMobile());
        bodies.add("recvname_1", employee.getEmployeeName());
        bodies.add("subject_1", "인증번호");
        bodies.add("message_1", templateVO.getTempltContent());
        // failover
        bodies.add("fsubject_1", "인증번호");
        bodies.add("fmessage_1", templateVO.getTempltContent());

        URI url = URI.create("https://" + ALIGO_HOST + "/" + ALIGO_VERSION + "/" + ALIGO_API_SEND);

        RequestEntity<MultiValueMap<String, String>> requestEntity = new RequestEntity<>(bodies, headers, HttpMethod.POST, url);
        ResponseEntity<NotitokAligoSendInfoList> responseEntity;

        try {
            responseEntity = restTemplate.exchange(requestEntity, NotitokAligoSendInfoList.class);
        } catch (HttpStatusCodeException e) {
            NotitokAligoSendInfoList voList = new ObjectMapper().readValue(e.getResponseBodyAsString(), NotitokAligoSendInfoList.class);
            responseEntity = new ResponseEntity<>(voList, e.getStatusCode());
        }

        NotitokAligoSendInfoList sendInfoVO = responseEntity.getBody();

        // update mid
        if (sendInfoVO.getInfo().getMid() != null) {
            notitokMapper.updateNotitokUsSentFindPw(messageId, sendInfoVO.getInfo().getMid());
        }

        if (sendInfoVO.getCode() == 0) {
            return messageId;
        } else {
            return null;
        }
    }

    @Override
    public NotitokUSSentVO notitokCheck(NotitokUSSentVO vo) throws Exception {

        return notitokMapper.notitokCheck(vo);
    }

    @Override
    public NotitokUSSentVO checkDataPw(NotitokUSSentVO vo) throws Exception {

        return notitokMapper.checkDataPw(vo);
    }

    public void notitokSendReserveOffer(Integer reservationId) throws Exception {
        NotitokAligoTemplateVO templateVO = getNotitokTemplate(ALIGO_TEMPLATE_CODE_OFFER);
        if (templateVO == null) {
            return;
        }

        String messageId = UUID.randomUUID().toString();

        Integer sessionUserId = SessionUtil.getInteger("sessionUserId");
        String strButtons = new ObjectMapper().writeValueAsString(templateVO.getButtons());

        /*if (vo.getReservationState() == 1) { // 신청
        };*/
        notitokMapper.insertNotitokUsSentReserveOffer(
                messageId, sessionUserId,
                templateVO.getTempltContent(), reservationId
        );

        NotitokUSSentVO vo = notitokMapper.selectNotitokUsSentReserveOffer(messageId);
        if (vo == null) {
            // employee_checkup.notok_reserve = 0 조건에 해당하지 않는 경우
            return;
        }

        RestTemplate restTemplate = new RestTemplate(getHttpRequestFactory());

        // Header
        HttpHeaders headers = new HttpHeaders();
        headers.add("Host", ALIGO_HOST);
        headers.setAccept(Collections.singletonList(MediaType.APPLICATION_JSON));
        headers.setContentType(new MediaType(MediaType.APPLICATION_FORM_URLENCODED, StandardCharsets.UTF_8));

        // Body
        MultiValueMap<String, String> bodies = new LinkedMultiValueMap<>();
        bodies.add("apikey", ALIGO_APIKEY);
        bodies.add("userid", ALIGO_USERID);
        bodies.add("token", templateVO.getToken());
        bodies.add("senderkey", ALIGO_SENDERKEY);

        bodies.add("tpl_code", templateVO.getTempltCode());
        bodies.add("sender", ALIGO_USERTEL);
        //bodies.add("senddate", "");
        bodies.add("failover", "Y");
        bodies.add("testMode", "N");

        bodies.add("receiver_1", vo.getMobile());
        bodies.add("recvname_1", vo.getRecvName());
        bodies.add("subject_1", "예약 신청");
        bodies.add("message_1", vo.getMessage());
        bodies.add("button_1", "{\"button\":" + strButtons + "}");
        // failover
        bodies.add("fsubject_1", "예약 신청");
        bodies.add("fmessage_1", vo.getMessage());

        URI url = URI.create("https://" + ALIGO_HOST + "/" + ALIGO_VERSION + "/" + ALIGO_API_SEND);

        RequestEntity<MultiValueMap<String, String>> requestEntity = new RequestEntity<>(bodies, headers, HttpMethod.POST, url);
        ResponseEntity<NotitokAligoSendInfoList> responseEntity;

        try {
            responseEntity = restTemplate.exchange(requestEntity, NotitokAligoSendInfoList.class);
        } catch (HttpStatusCodeException e) {
            NotitokAligoSendInfoList voList = new ObjectMapper().readValue(e.getResponseBodyAsString(), NotitokAligoSendInfoList.class);
            responseEntity = new ResponseEntity<>(voList, e.getStatusCode());
        }

        NotitokAligoSendInfoList sendInfoVO = responseEntity.getBody();

        // update mid
        if (sendInfoVO.getInfo().getMid() != null) {
            notitokMapper.updateNotitokUsSentReserveOffer(messageId, sendInfoVO.getInfo().getMid());
        }
    }

    public void notitokSendReserveComplete(List<Integer> reservationIds) throws Exception {
        NotitokAligoTemplateVO templateVO = getNotitokTemplate(ALIGO_TEMPLATE_CODE_COMPLETE);
        if (templateVO == null) {
            return;
        }

        String messageId;
        Integer sessionUserId = SessionUtil.getInteger("sessionUserId");
        String strButtons = new ObjectMapper().writeValueAsString(templateVO.getButtons());

        int pages = reservationIds.size() / ALIGO_MAX_COUNT;

        for (int idx = 0; idx < pages; idx++) {
            messageId = UUID.randomUUID().toString();
            List<Integer> subReservationIds = reservationIds.subList(idx * ALIGO_MAX_COUNT, (idx + 1) * ALIGO_MAX_COUNT);

            notitokMapper.insertNotitokUsSentReserveComplete(
                    messageId, sessionUserId,
                    templateVO.getTempltContent(), subReservationIds
            );

            List<NotitokUSSentVO> subVoList = notitokMapper.selectNotitokUsSentReserveComplete(messageId);

            RestTemplate restTemplate = new RestTemplate(getHttpRequestFactory());

            // Header
            HttpHeaders headers = new HttpHeaders();
            headers.add("Host", ALIGO_HOST);
            headers.setAccept(Collections.singletonList(MediaType.APPLICATION_JSON));
            headers.setContentType(new MediaType(MediaType.APPLICATION_FORM_URLENCODED, StandardCharsets.UTF_8));

            // Body
            MultiValueMap<String, String> bodies = new LinkedMultiValueMap<>();
            bodies.add("apikey", ALIGO_APIKEY);
            bodies.add("userid", ALIGO_USERID);
            bodies.add("token", templateVO.getToken());
            bodies.add("senderkey", ALIGO_SENDERKEY);

            bodies.add("tpl_code", templateVO.getTempltCode());
            bodies.add("sender", ALIGO_USERTEL);
            //bodies.add("senddate", "");
            bodies.add("failover", "Y");
            bodies.add("testMode", "N");

            for (int i = 0; i < subVoList.size(); i++) {
                NotitokUSSentVO vo = subVoList.get(i);

                bodies.add("receiver_" + (i + 1), vo.getMobile());
                bodies.add("recvname_" + (i + 1), vo.getRecvName());
                bodies.add("subject_" + (i + 1), "예약확정");
                bodies.add("message_" + (i + 1), vo.getMessage());
                bodies.add("button_" + (i + 1), "{\"button\":" + strButtons + "}");
                // failover
                bodies.add("fsubject_" + (i + 1), "예약확정");
                bodies.add("fmessage_" + (i + 1), vo.getMessage());
            }

            URI url = URI.create("https://" + ALIGO_HOST + "/" + ALIGO_VERSION + "/" + ALIGO_API_SEND);

            RequestEntity<MultiValueMap<String, String>> requestEntity = new RequestEntity<>(bodies, headers, HttpMethod.POST, url);
            ResponseEntity<NotitokAligoSendInfoList> responseEntity;

            try {
                responseEntity = restTemplate.exchange(requestEntity, NotitokAligoSendInfoList.class);
            } catch (HttpStatusCodeException e) {
                NotitokAligoSendInfoList vo = new ObjectMapper().readValue(e.getResponseBodyAsString(), NotitokAligoSendInfoList.class);
                responseEntity = new ResponseEntity<>(vo, e.getStatusCode());
            }

            NotitokAligoSendInfoList sendInfoVO = responseEntity.getBody();

            // update mid
            if (sendInfoVO.getInfo().getMid() != null) {
                notitokMapper.updateNotitokUsSentReserveComplete(messageId, sendInfoVO.getInfo().getMid());
            }
        }

        if ((reservationIds.size() % ALIGO_MAX_COUNT) > 0) {
            messageId = UUID.randomUUID().toString();
            List<Integer> subReservationIds = reservationIds.subList(ALIGO_MAX_COUNT * pages, reservationIds.size());

            notitokMapper.insertNotitokUsSentReserveComplete(
                    messageId, sessionUserId,
                    templateVO.getTempltContent(), subReservationIds
            );

            List<NotitokUSSentVO> subVoList = notitokMapper.selectNotitokUsSentReserveComplete(messageId);

            RestTemplate restTemplate = new RestTemplate(getHttpRequestFactory());

            // Header
            HttpHeaders headers = new HttpHeaders();
            headers.add("Host", ALIGO_HOST);
            headers.setAccept(Collections.singletonList(MediaType.APPLICATION_JSON));
            headers.setContentType(new MediaType(MediaType.APPLICATION_FORM_URLENCODED, StandardCharsets.UTF_8));

            // Body
            MultiValueMap<String, String> bodies = new LinkedMultiValueMap<>();
            bodies.add("apikey", ALIGO_APIKEY);
            bodies.add("userid", ALIGO_USERID);
            bodies.add("token", templateVO.getToken());
            bodies.add("senderkey", ALIGO_SENDERKEY);

            bodies.add("tpl_code", templateVO.getTempltCode());
            bodies.add("sender", ALIGO_USERTEL);
            //bodies.add("senddate", "");
            bodies.add("failover", "Y");
            bodies.add("testMode", "N");

            for (int i = 0; i < subVoList.size(); i++) {
                NotitokUSSentVO vo = subVoList.get(i);

                bodies.add("receiver_" + (i + 1), vo.getMobile());
                bodies.add("recvname_" + (i + 1), vo.getRecvName());
                bodies.add("subject_" + (i + 1), "미예약자 관리");
                bodies.add("message_" + (i + 1), vo.getMessage());
                bodies.add("button_" + (i + 1), "{\"button\":" + strButtons + "}");
                // failover
                bodies.add("fsubject_" + (i + 1), "미예약자 관리");
                bodies.add("fmessage_" + (i + 1), vo.getMessage());
            }

            URI url = URI.create("https://" + ALIGO_HOST + "/" + ALIGO_VERSION + "/" + ALIGO_API_SEND);

            RequestEntity<MultiValueMap<String, String>> requestEntity = new RequestEntity<>(bodies, headers, HttpMethod.POST, url);
            ResponseEntity<NotitokAligoSendInfoList> responseEntity;

            try {
                responseEntity = restTemplate.exchange(requestEntity, NotitokAligoSendInfoList.class);
            } catch (HttpStatusCodeException e) {
                NotitokAligoSendInfoList vo = new ObjectMapper().readValue(e.getResponseBodyAsString(), NotitokAligoSendInfoList.class);
                responseEntity = new ResponseEntity<>(vo, e.getStatusCode());
            }

            NotitokAligoSendInfoList sendInfoVO = responseEntity.getBody();

            // update mid
            if (sendInfoVO.getInfo().getMid() != null) {
                notitokMapper.updateNotitokUsSentReserveComplete(messageId, sendInfoVO.getInfo().getMid());
            }
        }
    }

    public void notitokSendReserveChange(Integer reservationId) throws Exception {
        NotitokAligoTemplateVO templateVO = getNotitokTemplate(ALIGO_TEMPLATE_CODE_CHANGE);
        if (templateVO == null) {
            return;
        }

        String messageId = UUID.randomUUID().toString();

        Integer sessionUserId = SessionUtil.getInteger("sessionUserId");
        String strButtons = new ObjectMapper().writeValueAsString(templateVO.getButtons());

        /*if (vo.getReservationState() == 1) { // 신청
        };*/
        notitokMapper.insertNotitokUsSentReserveChange(
                messageId, sessionUserId,
                templateVO.getTempltContent(), reservationId
        );

        NotitokUSSentVO vo = notitokMapper.selectNotitokUsSentReserveChange(messageId);
        if (vo == null) {
            // employee_checkup.notok_reserve = 0 조건에 해당하지 않는 경우
            return;
        }

        RestTemplate restTemplate = new RestTemplate(getHttpRequestFactory());

        // Header
        HttpHeaders headers = new HttpHeaders();
        headers.add("Host", ALIGO_HOST);
        headers.setAccept(Collections.singletonList(MediaType.APPLICATION_JSON));
        headers.setContentType(new MediaType(MediaType.APPLICATION_FORM_URLENCODED, StandardCharsets.UTF_8));

        // Body
        MultiValueMap<String, String> bodies = new LinkedMultiValueMap<>();
        bodies.add("apikey", ALIGO_APIKEY);
        bodies.add("userid", ALIGO_USERID);
        bodies.add("token", templateVO.getToken());
        bodies.add("senderkey", ALIGO_SENDERKEY);

        bodies.add("tpl_code", templateVO.getTempltCode());
        bodies.add("sender", ALIGO_USERTEL);
        //bodies.add("senddate", "");
        bodies.add("failover", "Y");
        bodies.add("testMode", "N");

        bodies.add("receiver_1", vo.getMobile());
        bodies.add("recvname_1", vo.getRecvName());
        bodies.add("subject_1", "예약 변경");
        bodies.add("message_1", vo.getMessage());
        bodies.add("button_1", "{\"button\":" + strButtons + "}");
        // failover
        bodies.add("fsubject_1", "예약 변경");
        bodies.add("fmessage_1", vo.getMessage());

        URI url = URI.create("https://" + ALIGO_HOST + "/" + ALIGO_VERSION + "/" + ALIGO_API_SEND);

        RequestEntity<MultiValueMap<String, String>> requestEntity = new RequestEntity<>(bodies, headers, HttpMethod.POST, url);
        ResponseEntity<NotitokAligoSendInfoList> responseEntity;

        try {
            responseEntity = restTemplate.exchange(requestEntity, NotitokAligoSendInfoList.class);
        } catch (HttpStatusCodeException e) {
            NotitokAligoSendInfoList voList = new ObjectMapper().readValue(e.getResponseBodyAsString(), NotitokAligoSendInfoList.class);
            responseEntity = new ResponseEntity<>(voList, e.getStatusCode());
        }

        NotitokAligoSendInfoList sendInfoVO = responseEntity.getBody();

        // update mid
        if (sendInfoVO.getInfo().getMid() != null) {
            notitokMapper.updateNotitokUsSentReserveChange(messageId, sendInfoVO.getInfo().getMid());
        }
    }

    public void notitokSendReserveCancel(Integer reservationId) throws Exception {
        NotitokAligoTemplateVO templateVO = getNotitokTemplate(ALIGO_TEMPLATE_CODE_CANCEL);
        if (templateVO == null) {
            return;
        }

        String messageId = UUID.randomUUID().toString();

        Integer sessionUserId = SessionUtil.getInteger("sessionUserId");
        String strButtons = new ObjectMapper().writeValueAsString(templateVO.getButtons());

        /*if (vo.getReservationState() == 1) { // 신청
        };*/
        notitokMapper.insertNotitokUsSentReserveCancel(
                messageId, sessionUserId,
                templateVO.getTempltContent(), reservationId
        );

        NotitokUSSentVO vo = notitokMapper.selectNotitokUsSentReserveCancel(messageId);
        if (vo == null) {
            // employee_checkup.notok_reserve = 0 조건에 해당하지 않는 경우
            return;
        }

        RestTemplate restTemplate = new RestTemplate(getHttpRequestFactory());

        // Header
        HttpHeaders headers = new HttpHeaders();
        headers.add("Host", ALIGO_HOST);
        headers.setAccept(Collections.singletonList(MediaType.APPLICATION_JSON));
        headers.setContentType(new MediaType(MediaType.APPLICATION_FORM_URLENCODED, StandardCharsets.UTF_8));

        // Body
        MultiValueMap<String, String> bodies = new LinkedMultiValueMap<>();
        bodies.add("apikey", ALIGO_APIKEY);
        bodies.add("userid", ALIGO_USERID);
        bodies.add("token", templateVO.getToken());
        bodies.add("senderkey", ALIGO_SENDERKEY);

        bodies.add("tpl_code", templateVO.getTempltCode());
        bodies.add("sender", ALIGO_USERTEL);
        //bodies.add("senddate", "");
        bodies.add("failover", "Y");
        bodies.add("testMode", "N");

        bodies.add("receiver_1", vo.getMobile());
        bodies.add("recvname_1", vo.getRecvName());
        bodies.add("subject_1", "예약 변경");
        bodies.add("message_1", vo.getMessage());
        bodies.add("button_1", "{\"button\":" + strButtons + "}");
        // failover
        bodies.add("fsubject_1", "예약 변경");
        bodies.add("fmessage_1", vo.getMessage());

        URI url = URI.create("https://" + ALIGO_HOST + "/" + ALIGO_VERSION + "/" + ALIGO_API_SEND);

        RequestEntity<MultiValueMap<String, String>> requestEntity = new RequestEntity<>(bodies, headers, HttpMethod.POST, url);
        ResponseEntity<NotitokAligoSendInfoList> responseEntity;

        try {
            responseEntity = restTemplate.exchange(requestEntity, NotitokAligoSendInfoList.class);
        } catch (HttpStatusCodeException e) {
            NotitokAligoSendInfoList voList = new ObjectMapper().readValue(e.getResponseBodyAsString(), NotitokAligoSendInfoList.class);
            responseEntity = new ResponseEntity<>(voList, e.getStatusCode());
        }

        NotitokAligoSendInfoList sendInfoVO = responseEntity.getBody();

        // update mid
        if (sendInfoVO.getInfo().getMid() != null) {
            notitokMapper.updateNotitokUsSentReserveCancel(messageId, sendInfoVO.getInfo().getMid());
        }
    }

    // region ALIGO API
    private HttpComponentsClientHttpRequestFactory getHttpRequestFactory() {
        if (requestFactory == null) {
            requestFactory = new HttpComponentsClientHttpRequestFactory();
            requestFactory.setConnectTimeout(5000);
        }

        return requestFactory;
    }

    private String getNotitokToken() throws Exception {
        RestTemplate restTemplate = new RestTemplate(getHttpRequestFactory());

        // Header
        HttpHeaders headers = new HttpHeaders();
        headers.add("Host", ALIGO_HOST);
        headers.add("Accept", MediaType.APPLICATION_JSON_VALUE);
        headers.add("Content-Type", MediaType.APPLICATION_FORM_URLENCODED_VALUE + ";charset=UTF-8");

        // Body
        MultiValueMap<String, String> bodies = new LinkedMultiValueMap<>();
        bodies.add("apikey", ALIGO_APIKEY);
        bodies.add("userid", ALIGO_USERID);

        URI url = URI.create("https://" + ALIGO_HOST + "/" + ALIGO_VERSION + "/" + ALIGO_API_TOKEN);

        RequestEntity<MultiValueMap<String, String>> requestEntity = new RequestEntity<>(bodies, headers, HttpMethod.POST, url);
        ResponseEntity<NotitokAuthAligoVO> responseEntity;

        try {
            responseEntity = restTemplate.exchange(requestEntity, NotitokAuthAligoVO.class);
        } catch (HttpStatusCodeException e) {
            NotitokAuthAligoVO vo = new ObjectMapper().readValue(e.getResponseBodyAsString(), NotitokAuthAligoVO.class);
            responseEntity = new ResponseEntity<>(vo, e.getStatusCode());
        }

        NotitokAuthAligoVO vo = responseEntity.getBody();

        return vo.getToken();
    }

    private NotitokAligoTemplateVO getNotitokTemplate(String tpl_code) throws Exception {
        log.info("");

        String strToken = getNotitokToken();

        RestTemplate restTemplate = new RestTemplate(getHttpRequestFactory());

        // Header
        HttpHeaders headers = new HttpHeaders();
        headers.add("Host", ALIGO_HOST);
        headers.add("Accept", MediaType.APPLICATION_JSON_VALUE);
        headers.add("Content-Type", MediaType.APPLICATION_FORM_URLENCODED_VALUE + ";charset=UTF-8");

        // Body
        MultiValueMap<String, String> bodies = new LinkedMultiValueMap<>();
        bodies.add("apikey", ALIGO_APIKEY);
        bodies.add("userid", ALIGO_USERID);
        bodies.add("token", strToken);
        bodies.add("senderkey", ALIGO_SENDERKEY);
        bodies.add("tpl_code", tpl_code);

        URI url = URI.create("https://" + ALIGO_HOST + "/" + ALIGO_VERSION + "/" + ALIGO_API_TEMPLATE);

        RequestEntity<MultiValueMap<String, String>> requestEntity = new RequestEntity<>(bodies, headers, HttpMethod.POST, url);
        ResponseEntity<NotitokAligoTemplateListVO> responseEntity;

        try {
            responseEntity = restTemplate.exchange(requestEntity, NotitokAligoTemplateListVO.class);
        } catch (HttpStatusCodeException e) {
            NotitokAligoTemplateListVO vo = new ObjectMapper().readValue(e.getResponseBodyAsString(), NotitokAligoTemplateListVO.class);
            responseEntity = new ResponseEntity<>(vo, e.getStatusCode());
        }

        NotitokAligoTemplateListVO vo = responseEntity.getBody();

        //log.info("code : " + vo.getCode() + ", message : " + vo.getMessage());
        //log.info(vo.toString());

        if (vo.getList().size() > 0) {
            vo.getList().get(0).setToken(strToken);
            return vo.getList().get(0);
        } else {
            return null;
        }
    }
    // endregion
}
