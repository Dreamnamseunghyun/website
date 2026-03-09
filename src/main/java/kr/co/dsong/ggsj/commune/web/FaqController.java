package kr.co.dsong.ggsj.commune.web;

import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import kr.co.dsong.ggsj.common.vo.BaseResponseVO;
import kr.co.dsong.ggsj.commune.service.FaqService;
import kr.co.dsong.ggsj.commune.vo.FaqVO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.List;

import static java.lang.Integer.parseInt;

@Controller
@Slf4j
public class FaqController {

    @Resource
    private FaqService faqService;

    // region PM
    @RequestMapping(value = "/pm/commune/faq", method = RequestMethod.GET, produces = "text/html")
    public String faqView() {
        log.info("");
        return "pm/commune/faq/index";
    }

    @RequestMapping(value = "/pm/commune/faq/{faqId}", method = RequestMethod.GET, produces = "text/html")
    public String faqReadView(@PathVariable String faqId, Model model) {
        log.info("faqId: " + faqId);

        model.addAttribute("faqId", faqId);
        return "pm/commune/faq/view";
    }

    @RequestMapping(value = "/pm/commune/faq/create", method = RequestMethod.GET, produces = "text/html")
    public String faqCreateView() {
        log.info("");
        return "pm/commune/faq/create";
    }

    @RequestMapping(value = "/pm/commune/faq/{faqId}/edit", method = RequestMethod.GET, produces = "text/html")
    public String faqEditView(@PathVariable String faqId, Model model) {
        log.info("faqId: " + faqId);

        model.addAttribute("faqId", faqId);
        return "pm/commune/faq/edit";
    }

    @RequestMapping(value = "/pm/commune/faq", method = RequestMethod.POST, produces = "application/json")
    @ResponseBody
    public BaseResponseVO<FaqVO> insertFaq(@RequestBody FaqVO vo) throws Exception {
        log.info("" + vo);

        faqService.insertFaq(vo);
        return new BaseResponseVO<>(vo);
    }

    @RequestMapping(value = "/pm/commune/faq/{faqId}", method = RequestMethod.PUT, produces = "application/json")
    @ResponseBody
    public BaseResponseVO<FaqVO> updateFaq(@PathVariable Integer faqId, @RequestBody FaqVO vo) throws Exception {
        log.info("" + vo);

        vo.setFaqId(faqId);
        faqService.updateFaq(vo);

        return new BaseResponseVO<>(vo);
    }

    @RequestMapping(value = "/pm/commune/faq/{faqId}", method = RequestMethod.DELETE, produces = "application/json")
    @ResponseBody
    public BaseResponseVO<Integer> deleteFaq(@PathVariable Integer faqId) throws Exception {
        log.info("faqId: " + faqId);

        FaqVO vo = new FaqVO();
        vo.setFaqId(faqId);
        faqService.deleteFaq(vo);

        return new BaseResponseVO<>(faqId);
    }

    // endregion

    // region US
    @RequestMapping(value = "/us/faq", method = RequestMethod.GET, produces = "text/html")
    public String faqUsView(Model model, FaqVO vo, String pageNo) throws Exception {
        log.info("");

        if (StringUtils.isEmpty(vo.getCategory())) {
            vo.setCategory("RESERVE");
        }
//pageNo null 처리
        int iPageNo = 0;
        if(pageNo == null) {
            iPageNo = 1;
        }else{
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
        paginationInfo.setTotalRecordCount(faqService.totalFaqCount(vo));

        //쿼리에서 필요한 값
        int firstRecordIndex = paginationInfo.getFirstRecordIndex();
        int recordCountPerPage = paginationInfo.getRecordCountPerPage();
        vo.setFirstRecordIndex(firstRecordIndex);
        vo.setRecordCountPerPage(recordCountPerPage);

        model.addAttribute("paginationInfo", paginationInfo);
        model.addAttribute("category", vo.getCategory());
        model.addAttribute("faqList", faqService.selectFaqList(vo));

        return "us/faq";
    }
    // endregion

    // region COMMON
    @RequestMapping(value = {"/pm/commune/faq", "/us/commune/faq"}, method = RequestMethod.GET, produces = "application/json")
    @ResponseBody
    public BaseResponseVO<List<FaqVO>> selectFaqList() throws Exception {
        log.info("");
        return new BaseResponseVO<>(faqService.selectFaqList(null));
    }

    @RequestMapping(value = {"/pm/commune/faq/{faqId}", "/us/commune/faq/{faqId}"}, method = RequestMethod.GET, produces = "application/json")
    @ResponseBody
    public BaseResponseVO<FaqVO> selectFaq(@PathVariable Integer faqId) throws Exception {
        log.info("faqId: " + faqId);

        FaqVO vo = new FaqVO();
        vo.setFaqId(faqId);
        vo = faqService.selectFaq(vo);

        return new BaseResponseVO<>(vo);
    }
    // endregion
}
