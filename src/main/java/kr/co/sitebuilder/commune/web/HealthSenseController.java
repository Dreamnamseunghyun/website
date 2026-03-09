package kr.co.sitebuilder.commune.web;

import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import kr.co.sitebuilder.common.service.StorageService;
import kr.co.sitebuilder.common.vo.BaseResponseVO;
import kr.co.sitebuilder.commune.service.HealthSenseService;
import kr.co.sitebuilder.commune.vo.HealthSenseVO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import java.util.List;

import static java.lang.Integer.parseInt;

@Controller
@Slf4j
public class HealthSenseController {

    @Resource
    private HealthSenseService healthSenseService;

    @Resource
    private StorageService storageService;

    //region PM
    @RequestMapping(value = "/pm/healthsense", method = RequestMethod.GET, produces = "text/html")
    public String healthSenseView() {
        log.info("");
        return "pm/commune/healthcare/index";
    }

    @RequestMapping(value = "/pm/healthsense/{healthSenseId}", method = RequestMethod.GET, produces = "text/html")
    public String healthSenseReadView(@PathVariable String healthSenseId, Model model) {
        log.info("" + healthSenseId);

        model.addAttribute("healthSenseId", healthSenseId);
        return "pm/commune/healthcare/view";
    }

    @RequestMapping(value = "/pm/healthsense/create", method = RequestMethod.GET, produces = "text/html")
    public String healthSenseCreateView() {
        log.info("");
        return "pm/commune/healthcare/create";
    }

    @RequestMapping(value = "/pm/healthsense/{healthSenseId}/edit", method = RequestMethod.GET, produces = "text/html")
    public String healthSenseEditView(@PathVariable String healthSenseId, Model model) {
        log.info("" + healthSenseId);

        model.addAttribute("healthSenseId", healthSenseId);
        return "pm/commune/healthcare/edit";
    }

    @RequestMapping(value = "/pm/healthsense", method = RequestMethod.GET, produces = "application/json")
    @ResponseBody
    public BaseResponseVO<List<HealthSenseVO>> selectHealthSenseList(HealthSenseVO vo) throws Exception {
        log.info("");

        return new BaseResponseVO<>(healthSenseService.selectHealthSenseList(vo));
    }

    @RequestMapping(value = "/pm/healthsense/{healthSenseId}", method = RequestMethod.GET, produces = "application/json")
    @ResponseBody
    public BaseResponseVO<HealthSenseVO> selectHealthSense(@PathVariable Integer healthSenseId) throws Exception {


        HealthSenseVO vo = new HealthSenseVO();
        vo.setHealthSenseId(healthSenseId);
        vo = healthSenseService.selectHealthSense(vo);

        log.info("" + vo);
        return new BaseResponseVO<>(vo);
    }

    @RequestMapping(value = "/pm/healthsense", method = RequestMethod.POST, produces = "application/json")
    @ResponseBody
    public BaseResponseVO<HealthSenseVO> insertHealthSense(@RequestPart HealthSenseVO healthsense, @RequestPart MultipartFile attach) throws Exception {
        log.info("" + healthsense);

        healthSenseService.insertHealthSense(healthsense);
        if (!attach.isEmpty() && !StringUtils.isEmpty(healthsense.getAttachFilename())) {
            storageService.putObject(healthsense.getStorageUrl(healthsense.getAttachFilename()), attach);
        }

        return new BaseResponseVO<>(healthsense);
    }

    @RequestMapping(value = "/pm/healthsense/{healthSenseId}", method = RequestMethod.POST, produces = "application/json")
    @ResponseBody
    public BaseResponseVO<HealthSenseVO> updateHealthSense(@PathVariable Integer healthSenseId, @RequestPart HealthSenseVO healthsense, @RequestPart MultipartFile attach) throws Exception {
        log.info("" + healthsense);

        healthsense.setHealthSenseId(healthSenseId);
        healthSenseService.updateHealthSense(healthsense);

        if (StringUtils.isEmpty(healthsense.getAttachFilename()) && !StringUtils.isEmpty(healthsense.getOrgAttachFilename())) {
            storageService.deleteObject(healthsense.getStorageUrl(healthsense.getOrgAttachFilename()));
        } else if (!attach.isEmpty()) {
            if (!StringUtils.isEmpty(healthsense.getOrgAttachFilename())) {
                storageService.deleteObject(healthsense.getStorageUrl(healthsense.getOrgAttachFilename()));
            }
            storageService.putObject(healthsense.getStorageUrl(healthsense.getAttachFilename()), attach);
        }

        return new BaseResponseVO<>(healthsense);
    }

    @RequestMapping(value = "/pm/healthsense/{healthSenseId}", method = RequestMethod.DELETE, produces = "application/json")
    @ResponseBody
    public BaseResponseVO<Integer> deleteHealthSense(@PathVariable Integer healthSenseId) throws Exception {
        log.info("noticeId: " + healthSenseId);

        HealthSenseVO vo = new HealthSenseVO();
        vo.setHealthSenseId(healthSenseId);
        healthSenseService.deleteHealthSense(vo);

        return new BaseResponseVO<>(healthSenseId);
    }
    // endregion

    //region US
    @RequestMapping(value = "/us/common_sense", method = RequestMethod.GET, produces = "text/html")
    public String healthSenseView(Model model, String pageNo, HealthSenseVO vo) throws Exception {
        log.info("");

        //pageNo null 泥섎━
        int iPageNo = 0;
        if (pageNo == null) {
            iPageNo = 1;
        } else {
            iPageNo = parseInt(pageNo);
        }

        //?꾩옄?뺣? pagination ?⑥닔
        PaginationInfo paginationInfo = new PaginationInfo();
        //?꾩옱 ?섏씠吏 踰덊샇
        paginationInfo.setCurrentPageNo(iPageNo);
        //???섏씠吏??寃뚯떆臾?嫄댁닔(寃뚯떆臾?5嫄?
        paginationInfo.setRecordCountPerPage(5);
        //??由ъ뒪?몄뿉 寃뚯떆?섎뒗 ?섏씠吏 嫄댁닔(由ъ뒪??5嫄?
        paginationInfo.setPageSize(5);
        //珥?由ъ뒪??嫄댁닔
        paginationInfo.setTotalRecordCount(healthSenseService.totalHealthSenseCount());

        //荑쇰━?먯꽌 ?꾩슂??媛?        int firstRecordIndex = paginationInfo.getFirstRecordIndex();
        int recordCountPerPage = paginationInfo.getRecordCountPerPage();
        vo.setFirstRecordIndex(firstRecordIndex);
        vo.setRecordCountPerPage(recordCountPerPage);

        model.addAttribute("paginationInfo", paginationInfo);
        model.addAttribute("healthSenseList", healthSenseService.selectHealthSenseList(vo));
        return "us/common_sense";
    }

//    @RequestMapping(value = "/us/healthsense", method = RequestMethod.GET, produces = "application/json")
//    @ResponseBody
//    public BaseResponseVO<List<HealthSenseVO>> selectUsHealthSenseList(HealthSenseVO vo) throws Exception {
//        log.info("");
//
//        return new BaseResponseVO<>(healthSenseService.selectHealthSenseList(vo));
//    }
    // endregion
}
