package kr.co.sitebuilder.notitok.web;

import com.fasterxml.jackson.databind.ObjectMapper;
import kr.co.sitebuilder.common.ResponseCode;
import kr.co.sitebuilder.common.vo.BaseResponseVO;
import kr.co.sitebuilder.common.vo.BaseVO;
import kr.co.sitebuilder.notitok.service.NotitokService;
import kr.co.sitebuilder.notitok.vo.*;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.*;
import org.springframework.http.client.HttpComponentsClientHttpRequestFactory;
import org.springframework.stereotype.Controller;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.client.HttpStatusCodeException;
import org.springframework.web.client.RestTemplate;

import javax.annotation.Resource;
import java.net.URI;
import java.nio.charset.StandardCharsets;
import java.util.Collections;
import java.util.List;

@Controller
@Slf4j
public class NotitokController {
    @Resource
    private NotitokService notitokService;

    private final String ALIGO_HOST = "kakaoapi.aligo.in";
    private final String ALIGO_VERSION = "akv10";
    private final String ALIGO_APIKEY = "16vuc9my2jjdlqmd5nddw3qqhnrwme9f";
    private final String ALIGO_USERID = "volkkorea";
    private final String ALIGO_SENDERKEY = "369fb3c2e4beb5b3c1c725a06e50f35ca4bc8622";

    private final String ALIGO_API_TOKEN = "token/create/30/s/";
    private final String ALIGO_API_TEMPLATE = "template/list/";
    private final String ALIGO_API_SEND = "alimtalk/send/";
    private final String ALIGO_API_HISTORY_DETAIL = "history/detail/";

    private HttpComponentsClientHttpRequestFactory requestFactory = null;

    // region ALIGO API
    private HttpComponentsClientHttpRequestFactory getHttpRequestFactory() {
        if (requestFactory == null) {
            requestFactory = new HttpComponentsClientHttpRequestFactory();
            requestFactory.setConnectTimeout(5000);
        }

        return requestFactory;
    }

    public String getNotitokToken() throws Exception {
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
        log.info("" + url);

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

    public NotitokAligoTemplateVO getNotitokTemplate(String tpl_code) throws Exception {
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

    @RequestMapping(value = "/pm/notitokinfo", method = RequestMethod.GET, produces = "text/html")
    public String notitokCheckupInfoView() {
        log.info("");
        return "pm/notitok/index";
    }

    @RequestMapping(value = "/pm/notitokreserve", method = RequestMethod.GET, produces = "text/html")
    public String notitokReserveView() {
        log.info("");
        return "pm/notitok/reserve";
    }

    @RequestMapping(value = "/pm/notitokencouragement", method = RequestMethod.GET, produces = "text/html")
    public String notitokEncouragementView() {
        log.info("");
        return "pm/notitok/encouragement";
    }

    @RequestMapping(value = "/pm/notitoknonereserve", method = RequestMethod.GET, produces = "text/html")
    public String notitokNoneReserveView() {
        log.info("");
        return "pm/notitok/nonereserve";
    }

    @RequestMapping(value = "/pm/user-except", method = RequestMethod.GET, produces = "text/html")
    public String userExceptView() {
        log.info("");
        return "pm/notitok/user_except";
    }

    @RequestMapping(value = "/pm/hm-except", method = RequestMethod.GET, produces = "text/html")
    public String hmExceptView() {
        log.info("");
        return "pm/notitok/hm_except";
    }

    @RequestMapping(value = "/pm/checkup-info", method = RequestMethod.GET, produces = "text/html")
    public String checkupInfoView() {
        log.info("");
        return "pm/notitok/checkup-info";
    }

    @RequestMapping(value = "/pm/urge", method = RequestMethod.GET, produces = "text/html")
    public String urgeView() {
        log.info("");
        return "pm/notitok/urge";
    }

    @RequestMapping(value = "/pm/notitok/template", method = RequestMethod.GET, produces = "application/json")
    @ResponseBody
    public ResponseEntity<NotitokAligoTemplateListVO> notitokSelectTemplateList() throws Exception {
        log.info("");

        String token = getNotitokToken();

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
        bodies.add("token", token);
        bodies.add("senderkey", ALIGO_SENDERKEY);

        URI url = URI.create("https://" + ALIGO_HOST + "/" + ALIGO_VERSION + "/" + ALIGO_API_TEMPLATE);
        log.info("" + url);

        RequestEntity<MultiValueMap<String, String>> requestEntity = new RequestEntity<>(bodies, headers, HttpMethod.POST, url);

        ResponseEntity<NotitokAligoTemplateListVO> responseEntity;

        try {
            responseEntity = restTemplate.exchange(requestEntity, NotitokAligoTemplateListVO.class);
        } catch (HttpStatusCodeException e) {
            NotitokAligoTemplateListVO vo = new ObjectMapper().readValue(e.getResponseBodyAsString(), NotitokAligoTemplateListVO.class);
            responseEntity = new ResponseEntity<>(vo, e.getStatusCode());
        }

        NotitokAligoTemplateListVO vo = responseEntity.getBody();

        log.info("code : " + vo.getCode() + ", message : " + vo.getMessage());
        log.info(vo.toString());

        return responseEntity;
    }

    @RequestMapping(value = "/pm/notitok/send/checkupguide", method = RequestMethod.POST, produces = "application/json")
    @ResponseBody
    public BaseResponseVO<List<NotitokUSSentVO>> notitokSendCheckupGuide(@RequestBody List<NotitokUSSentVO> voList) throws Exception {
        log.info("");

        notitokService.notitokSendCheckupGuide(voList);

        return new BaseResponseVO<>(voList);
    }

    @RequestMapping(value = "/pm/notitok/send/urge", method = RequestMethod.POST, produces = "application/json")
    @ResponseBody
    public BaseResponseVO<List<NotitokUSSentVO>> notitokSendUrge(@RequestBody List<NotitokUSSentVO> voList) throws Exception {
        log.info("");

        notitokService.notitokSendUrge(voList);

        return new BaseResponseVO<>(voList);
    }

    @RequestMapping(value = "/pm/notitok/result", method = RequestMethod.GET, produces = "application/json")
    @ResponseBody
    public BaseResponseVO<BaseVO> notitokResult() throws Exception {
        log.info("");

        String strToken = getNotitokToken();
        String strMid = "272345218";
        String strLimit = "500";


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
        bodies.add("token", strToken);
        bodies.add("mid", strMid);
        bodies.add("limit", strLimit);

        URI url = URI.create("https://" + ALIGO_HOST + "/" + ALIGO_VERSION + "/" + ALIGO_API_HISTORY_DETAIL);

        RequestEntity<MultiValueMap<String, String>> requestEntity = new RequestEntity<>(bodies, headers, HttpMethod.POST, url);
        ResponseEntity<NotitokAligoResultList> responseEntity;

        try {
            responseEntity = restTemplate.exchange(requestEntity, NotitokAligoResultList.class);
        } catch (HttpStatusCodeException e) {
            NotitokAligoResultList vo = new ObjectMapper().readValue(e.getResponseBodyAsString(), NotitokAligoResultList.class);
            responseEntity = new ResponseEntity<>(vo, e.getStatusCode());
        }

        NotitokAligoResultList vo = responseEntity.getBody();

        log.info("code : " + vo.getCode() + ", message : " + vo.getMessage());
        log.info(vo.toString());

        return new BaseResponseVO<>(null, ResponseCode.FAIL, "?쇱튂?섎뒗 ?뚯썝?뺣낫媛 ?놁뒿?덈떎.");
    }

    @RequestMapping(value = "/pm/user-except", method = RequestMethod.GET, produces = "application/json")
    @ResponseBody
    public BaseResponseVO<List<NotitokItemVO>> selectUserExceptList(@RequestParam(required = false) Integer companyId, @RequestParam(required = false) Integer checkupYear) throws Exception {
        log.info("" + companyId);

        return new BaseResponseVO<>(notitokService.selectUserExceptList(companyId, checkupYear));
    }

    @RequestMapping(value = "/pm/hm-except", method = RequestMethod.GET, produces = "application/json")
    @ResponseBody
    public BaseResponseVO<List<NotitokItemVO>> selectHmExceptList(@RequestParam(required = false) Integer hospitalId, @RequestParam(required = false) Integer centerId) throws Exception {
        log.info("");

        return new BaseResponseVO<>(notitokService.selectHmExceptList(hospitalId, centerId));
    }

    @RequestMapping(value = "/pm/checkup-info", method = RequestMethod.GET, produces = "application/json")
    @ResponseBody
    public BaseResponseVO<List<NotitokItemVO>> selectCheckupInfoList(@RequestParam(required = false) Integer companyCheckupId) throws Exception {
        log.info("" + companyCheckupId);

        return new BaseResponseVO<>(notitokService.selectCheckupInfoList(companyCheckupId));
    }

    @RequestMapping(value = "/pm/urge", method = RequestMethod.GET, produces = "application/json")
    @ResponseBody
    public BaseResponseVO<List<NotitokItemVO>> selectUrgeList(@RequestParam(required = false) Integer companyCheckupId) throws Exception {
        log.info("" + companyCheckupId);

        return new BaseResponseVO<>(notitokService.selectUrgeList(companyCheckupId));
    }

    @RequestMapping(value = "/pm/template/checkup-info", method = RequestMethod.GET, produces = "application/json")
    @ResponseBody
    public BaseResponseVO<NotitokAligoTemplateVO> getTemplateCheckupInfo() throws Exception {
        log.info("");

        return new BaseResponseVO<>(notitokService.getTemplateCheckupInfo());
    }

    @RequestMapping(value = "/pm/template/urge", method = RequestMethod.GET, produces = "application/json")
    @ResponseBody
    public BaseResponseVO<NotitokAligoTemplateVO> getTemplateUrge() throws Exception {
        log.info("");

        return new BaseResponseVO<>(notitokService.getTemplateUrge());
    }
}
