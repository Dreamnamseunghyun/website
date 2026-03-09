package kr.co.dsong.ggsj.commune.web;

import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import kr.co.dsong.ggsj.common.service.StorageService;
import kr.co.dsong.ggsj.common.vo.BaseResponseVO;
import kr.co.dsong.ggsj.commune.service.HealthSenseService;
import kr.co.dsong.ggsj.commune.vo.HealthSenseVO;
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

        //pageNo null 처리
        int iPageNo = 0;
        if (pageNo == null) {
            iPageNo = 1;
        } else {
            iPageNo = parseInt(pageNo);
        }

        //전자정부 pagination 함수
        PaginationInfo paginationInfo = new PaginationInfo();
        //현재 페이지 번호
        paginationInfo.setCurrentPageNo(iPageNo);
        //한 페이지당 게시물 건수(게시물 5건)
        paginationInfo.setRecordCountPerPage(5);
        //한 리스트에 게시되는 페이지 건수(리스트 5건)
        paginationInfo.setPageSize(5);
        //총 리스트 건수
        paginationInfo.setTotalRecordCount(healthSenseService.totalHealthSenseCount());

        //쿼리에서 필요한 값
        int firstRecordIndex = paginationInfo.getFirstRecordIndex();
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
