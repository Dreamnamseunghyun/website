package kr.co.sitebuilder.common.web;

import com.fasterxml.jackson.databind.ObjectMapper;
import kr.co.sitebuilder.common.ListType;
import kr.co.sitebuilder.common.service.CommonService;
import kr.co.sitebuilder.common.vo.*;
import kr.co.sitebuilder.company.vo.CompanyVO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.RequestEntity;
import org.springframework.http.ResponseEntity;
import org.springframework.http.client.HttpComponentsClientHttpRequestFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.HttpStatusCodeException;
import org.springframework.web.client.RestTemplate;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.net.URI;
import java.net.URLEncoder;
import java.util.Calendar;
import java.util.List;

@Controller
@Slf4j
public class CommonController {

    @Resource
    private CommonService commonService;

    @RequestMapping(value = "/common/company", method = RequestMethod.GET, produces = "application/json")
    @ResponseBody
//    public BaseResponseVO<List<CommonCompanyVO>> selectCompanyList(@RequestParam(value = "listType", defaultValue = "ALL") ListType listType, HttpSession session) throws Exception {
    public BaseResponseVO<List<CommonCompanyVO>> selectCompanyList(@RequestParam(defaultValue = "YEAR") ListType listType, @RequestParam(required = false) Integer year, HttpSession session) throws Exception {
        log.info("");

//        String sessionUserType = (String) session.getAttribute("sessionUserType");
        if (year == null) {
            year = Calendar.getInstance().get(Calendar.YEAR);
        }

        return new BaseResponseVO<>(commonService.selectCompanyList(listType, year));
    }

    @RequestMapping(value = "/common/companycheckuptype", method = RequestMethod.GET, produces = "application/json")
    @ResponseBody
    public BaseResponseVO<List<CommonCompanyCheckupTypeVO>> selectCompanyCheckupTypeList(
            @RequestParam(required = false) Integer companyCheckupId,
            @RequestParam(required = false) Integer companyId,
            @RequestParam(required = false) Integer checkupYear
    ) throws Exception {
        log.info("");

        if (checkupYear == null) {
            checkupYear = Calendar.getInstance().get(Calendar.YEAR);
        }

        return new BaseResponseVO<>(commonService.selectCompanyCheckupTypeList(companyCheckupId, companyId, checkupYear));
    }

    @RequestMapping(value = "/common/hospital", method = RequestMethod.GET, produces = "application/json")
    @ResponseBody
    public BaseResponseVO<List<CommonHospitalVO>> selectHospitalList() throws Exception {
        log.info("");

        return new BaseResponseVO<>(commonService.selectHospitalList());
    }

    @RequestMapping(value = "/common/center", method = RequestMethod.GET, produces = "application/json")
    @ResponseBody
    public BaseResponseVO<List<CommonCenterVO>> selectCenterList() throws Exception {
        log.info("");

        return new BaseResponseVO<>(commonService.selectCenterList());
    }

    @RequestMapping(value = "/common/centercheck", method = RequestMethod.GET, produces = "application/json")
    @ResponseBody
    public BaseResponseVO<List<CommonCenterVO>> checkCenterList(@RequestParam(required = false) Integer hospitalId) throws Exception {
        log.info("" + hospitalId);

        return new BaseResponseVO<>(commonService.checkCenterList(hospitalId));
    }

    @RequestMapping(value = "/common/centercodecheck", method = RequestMethod.GET, produces = "application/json")
    @ResponseBody
    public BaseResponseVO<List<CommonCenterVO>> checkCenterCodeList(@RequestParam(required = false) Integer hospitalCode, @RequestParam(required = false) Integer centerCode) throws Exception {
        log.info("");

        return new BaseResponseVO<>(commonService.checkCenterCodeList(hospitalCode, centerCode));
    }

    @RequestMapping(value = "/common/center/address", method = RequestMethod.GET, produces = "application/json")
    @ResponseBody
    public BaseResponseVO<List<AddressVO>> selectCenterAddress() throws Exception {
        log.info("");

        return new BaseResponseVO<>(commonService.selectCenterAddress());
    }

    @RequestMapping(value = "/common/company/login-place-holder", method = RequestMethod.GET, produces = "application/json")
    @ResponseBody
    public BaseResponseVO<CompanyVO> selectCompanyLoginPlaceHolder(@RequestParam String companyCode) throws Exception {
        log.info("");

        return new BaseResponseVO<>(commonService.selectCompanyLoginPlaceHolder(companyCode));
    }

    @RequestMapping(value = "/common/kakao/search", method = RequestMethod.GET, produces = "application/json")
    @ResponseBody
    public ResponseEntity<KakaoSearchVO> apiKakaoSearch(@RequestParam String address) throws Exception {
        log.info("");

        HttpHeaders headers = new HttpHeaders();
        headers.set("Authorization", "KakaoAK 05737f19136f40778413b0e46d6cb2af");

        String query = "?query=" + URLEncoder.encode(address, "UTF-8");

        HttpComponentsClientHttpRequestFactory httpComponentsClientHttpRequestFactory = new HttpComponentsClientHttpRequestFactory();
        httpComponentsClientHttpRequestFactory.setConnectTimeout(5000);
        RestTemplate restTemplate = new RestTemplate(httpComponentsClientHttpRequestFactory);

        URI url = URI.create("https://dapi.kakao.com/v2/local/search/address.json" + query);
        RequestEntity<String> requestEntity = new RequestEntity<>(headers, HttpMethod.GET, url);

        ResponseEntity<KakaoSearchVO> responseEntity;

        try {
            responseEntity = restTemplate.exchange(requestEntity, KakaoSearchVO.class);
        } catch (HttpStatusCodeException e) {
            KakaoSearchVO vo = new ObjectMapper().readValue(e.getResponseBodyAsString(), KakaoSearchVO.class);
            responseEntity = new ResponseEntity<>(vo, e.getStatusCode());
        }

        log.info(responseEntity.getBody().toString());

        return responseEntity;
    }
}
