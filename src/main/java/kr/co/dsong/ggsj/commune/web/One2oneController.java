package kr.co.dsong.ggsj.commune.web;

import kr.co.dsong.ggsj.common.vo.BaseResponseVO;
import kr.co.dsong.ggsj.commune.service.QnaService;
import kr.co.dsong.ggsj.commune.vo.QnaVO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@Slf4j
public class One2oneController {

    @Resource
    private QnaService qnaService;

    // region PM
    @RequestMapping(value = "/pm/commune/one2one", method = RequestMethod.GET, produces = "text/html")
    public String qnaView() {
        log.info("");
        return "pm/commune/one2one/index";
    }

    @RequestMapping(value = "/pm/commune/one2one", method = RequestMethod.GET, produces = "application/json")
    @ResponseBody
    public BaseResponseVO<List<QnaVO>> selectQnaList() throws Exception {
        log.info("");
        return new BaseResponseVO<>(qnaService.selectQnaList());
    }

    @RequestMapping(value = "/pm/commune/one2one/{qnaId}", method = RequestMethod.GET, produces = "text/html")
    public String qnaReadView(@PathVariable Integer qnaId, Model model) {
        log.info("" + qnaId);
        model.addAttribute("qnaId", qnaId);
        return "pm/commune/one2one/view";
    }

    @RequestMapping(value = "/pm/commune/one2one/{qnaId}/edit", method = RequestMethod.GET, produces = "text/html")
    public String qnaEditView(@PathVariable Integer qnaId, Model model) {
        log.info("" + qnaId);
        model.addAttribute("qnaId", qnaId);
        return "pm/commune/one2one/edit";
    }

    @RequestMapping(value = "/pm/commune/one2one/{qnaId}", method = RequestMethod.GET, produces = "application/json")
    @ResponseBody
    public BaseResponseVO<QnaVO> selectQna(@PathVariable Integer qnaId) throws Exception {
        log.info("" + qnaId);

        QnaVO vo = new QnaVO();
        vo.setQnaId(qnaId);
        vo = qnaService.selectQna(vo);

        return new BaseResponseVO<>(vo);
    }

    @RequestMapping(value = "/pm/commune/one2one", method = RequestMethod.POST, produces = "application/json")
    @ResponseBody
    public BaseResponseVO<QnaVO> insertQna(@RequestBody QnaVO vo) throws Exception {
        log.info("" + vo);
        qnaService.insertQna(vo);
        return new BaseResponseVO<>(vo);
    }

    @RequestMapping(value = "/pm/commune/one2one/{qnaId}/edit", method = RequestMethod.PUT, produces = "application/json")
    @ResponseBody
    public BaseResponseVO<QnaVO> updateQna(@PathVariable Integer qnaId, @RequestBody QnaVO vo) throws Exception {
        log.info("" + vo);

        vo.setQnaId(qnaId);
        qnaService.updateQna(vo);

        return new BaseResponseVO<>(vo);
    }

    @RequestMapping(value = "/pm/commune/one2one/{qnaId}", method = RequestMethod.DELETE, produces = "application/json")
    @ResponseBody
    public BaseResponseVO<Integer> deleteQna(@PathVariable Integer qnaId) throws Exception {
        log.info("" + qnaId);

        QnaVO vo = new QnaVO();
        vo.setQnaId(qnaId);
        qnaService.deleteQna(vo);

        return new BaseResponseVO<>(qnaId);
    }
    // endregion

    @RequestMapping(value = "/us/inquiry", method = RequestMethod.GET, produces = "text/html")
    public String qnaUsView(@RequestParam(required = false) Integer qnaId, Model model) {
        log.info("qnaId" + qnaId);

        if (qnaId == null) {
            return "us/inquiry";
        }

        model.addAttribute("qnaId", qnaId);

        return "us/inquiry_view";
    }

    @RequestMapping(value = "/us/inquiry", method = RequestMethod.GET, produces = "application/json")
    @ResponseBody
    public BaseResponseVO<List<QnaVO>> selectUsQnaList(HttpSession session) throws Exception {

        log.info("");
        Integer userId = (Integer) session.getAttribute("sessionUserId");

        return new BaseResponseVO<>(qnaService.selectUsQnaList(userId));
    }

    @RequestMapping(value = "/us/inquiry_edit", method = RequestMethod.GET, produces = "text/html")
    public String qnaUsEditView(HttpSession session, Model model) {
        log.info("");

        Integer userId = (Integer) session.getAttribute("sessionUserId");
        model.addAttribute("userId", userId);

        return "us/inquiry_edit";
    }

    @RequestMapping(value = "/us/inquiry/{qnaId}", method = RequestMethod.GET, produces = "application/json")
    @ResponseBody
    public BaseResponseVO<QnaVO> selectUsQna(@PathVariable Integer qnaId) throws Exception {
        log.info("qnaId: " + qnaId);

        QnaVO vo = new QnaVO();
        vo.setQnaId(qnaId);
        vo = qnaService.selectQna(vo);

        return new BaseResponseVO<>(vo);
    }

    @RequestMapping(value = "/us/inquiry_edit", method = RequestMethod.POST, produces = "application/json")
    @ResponseBody
    public BaseResponseVO<QnaVO> insertUsQna(@RequestBody QnaVO vo) throws Exception {
        log.info("" + vo);

        vo.setUserId(vo.getUserId());
        qnaService.insertUsQna(vo);
        return new BaseResponseVO<>(vo);
    }
}
