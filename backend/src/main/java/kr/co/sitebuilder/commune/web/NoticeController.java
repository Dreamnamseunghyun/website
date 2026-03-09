package kr.co.sitebuilder.commune.web;

import kr.co.sitebuilder.common.service.StorageService;
import kr.co.sitebuilder.common.vo.BaseResponseVO;
import kr.co.sitebuilder.commune.service.NoticeService;
import kr.co.sitebuilder.commune.vo.NoticeVO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@Slf4j
public class NoticeController {

    @Resource
    private NoticeService noticeService;

    @Resource
    private StorageService storageService;

    // region PM
    @RequestMapping(value = "/pm/commune/notice", method = RequestMethod.GET, produces = "text/html")
    public String noticeView() {
        log.info("");

        return "pm/commune/notice/index";
    }

    @RequestMapping(value = "/pm/commune/notice/{noticeId}", method = RequestMethod.GET, produces = "text/html")
    public String noticeReadView(@PathVariable Integer noticeId, Model model) {
        log.info("noticeId: " + noticeId);

        model.addAttribute("noticeId", noticeId);

        return "pm/commune/notice/view";
    }

    @RequestMapping(value = "/pm/commune/notice/create", method = RequestMethod.GET, produces = "text/html")
    public String noticeCreateView() {
        log.info("");

        return "pm/commune/notice/create";
    }

    @RequestMapping(value = "/pm/commune/notice/{noticeId}/edit", method = RequestMethod.GET, produces = "text/html")
    public String noticeEditView(@PathVariable Integer noticeId, Model model) {
        log.info("noticeId: " + noticeId);

        model.addAttribute("noticeId", noticeId);

        return "pm/commune/notice/edit";
    }

    @RequestMapping(value = "/pm/commune/notice", method = RequestMethod.GET, produces = "application/json")
    @ResponseBody
    public BaseResponseVO<List<NoticeVO>> selectNoticeList() throws Exception {
        log.info("");

        return new BaseResponseVO<>(noticeService.selectNoticeList());
    }

    @RequestMapping(value = "/pm/commune/notice/{noticeId}", method = RequestMethod.GET, produces = "application/json")
    @ResponseBody
    public BaseResponseVO<NoticeVO> selectNotice(@PathVariable Integer noticeId) throws Exception {
        log.info("noticeId: " + noticeId);

        NoticeVO vo = new NoticeVO();
        vo.setNoticeId(noticeId);
        vo = noticeService.selectNotice(vo);

        return new BaseResponseVO<>(vo);
    }

    @RequestMapping(value = "/pm/commune/notice", method = RequestMethod.POST, produces = "application/json")
    @ResponseBody
    public BaseResponseVO<NoticeVO> insertNotice(@RequestPart NoticeVO notice, @RequestPart MultipartFile attach) throws Exception {
        log.info("notice: " + notice);

        noticeService.insertNotice(notice);
        if (!attach.isEmpty() && !StringUtils.isEmpty(notice.getAttachFilename())) {
            storageService.putObject(notice.getStorageUrl(notice.getAttachFilename()), attach);
        }

        return new BaseResponseVO<>(notice);
    }

    @RequestMapping(value = "/pm/commune/notice/{noticeId}", method = RequestMethod.POST, produces = "application/json")
    @ResponseBody
    public BaseResponseVO<NoticeVO> updateNotice(@PathVariable Integer noticeId, @RequestPart NoticeVO notice, @RequestPart MultipartFile attach) throws Exception {
        log.info("noticeId: " + noticeId + ", notice: " + notice);

        notice.setNoticeId(noticeId);
        noticeService.updateNotice(notice);

        if (StringUtils.isEmpty(notice.getAttachFilename()) && !StringUtils.isEmpty(notice.getOrgAttachFilename())) {
            storageService.deleteObject(notice.getStorageUrl(notice.getOrgAttachFilename()));
        } else if (!attach.isEmpty()) {
            if (!StringUtils.isEmpty(notice.getOrgAttachFilename())) {
                storageService.deleteObject(notice.getStorageUrl(notice.getOrgAttachFilename()));
            }
            storageService.putObject(notice.getStorageUrl(notice.getAttachFilename()), attach);
        }

        return new BaseResponseVO<>(notice);
    }

    @RequestMapping(value = "/pm/commune/notice/{noticeId}", method = RequestMethod.DELETE, produces = "application/json")
    @ResponseBody
    public BaseResponseVO<Integer> deleteNotice(@PathVariable Integer noticeId) throws Exception {
        log.info("noticeId: " + noticeId);

        NoticeVO vo = new NoticeVO();
        vo.setNoticeId(noticeId);
        noticeService.deleteNotice(vo);

        return new BaseResponseVO<>(noticeId);
    }
    // endregion

    // region HM
    @RequestMapping(value = "/hm/commune/notice", method = RequestMethod.GET, produces = "text/html")
    public String hospitalView() {
        log.info("");

        return "hm/commune/notice/index";
    }

    @RequestMapping(value = "/hm/commune/notice/{noticeId}", method = RequestMethod.GET, produces = "text/html")
    public String hospitalNoticeReadView(@PathVariable Integer noticeId, Model model) {
        log.info("noticeId: " + noticeId);

        model.addAttribute("noticeId", noticeId);

        return "hm/commune/notice/view";
    }

    @RequestMapping(value = "/hm/commune/notice", method = RequestMethod.GET, produces = "application/json")
    @ResponseBody
    public BaseResponseVO<List<NoticeVO>> hospitalSelectNoticeList(HttpSession session) throws Exception {
        log.info("");

        Integer userId = (Integer) session.getAttribute("sessionUserId");

        return new BaseResponseVO<>(noticeService.hospitalNoticeList(userId));
    }

    @RequestMapping(value = "/hm/commune/notice/{noticeId}", method = RequestMethod.GET, produces = "application/json")
    @ResponseBody
    public BaseResponseVO<NoticeVO> hospitalSelectNotice(@PathVariable Integer noticeId) throws Exception {
        log.info("noticeId: " + noticeId);

        NoticeVO vo = new NoticeVO();
        vo.setNoticeId(noticeId);
        vo = noticeService.selectNotice(vo);

        return new BaseResponseVO<>(vo);
    }
    // endregion

    // region CM
    @RequestMapping(value = "/cm/commune/notice", method = RequestMethod.GET, produces = "text/html")
    public String companyView() {
        log.info("");

        return "cm/commune/notice/index";
    }

    @RequestMapping(value = "/cm/commune/notice/{noticeId}", method = RequestMethod.GET, produces = "text/html")
    public String companyNoticeReadView(@PathVariable Integer noticeId, Model model) {
        log.info("noticeId: " + noticeId);

        model.addAttribute("noticeId", noticeId);

        return "cm/commune/notice/view";
    }

    @RequestMapping(value = "/cm/commune/notice", method = RequestMethod.GET, produces = "application/json")
    @ResponseBody
    public BaseResponseVO<List<NoticeVO>> companySelectNoticeList(HttpSession session) throws Exception {
        log.info("");

        Integer userId = (Integer) session.getAttribute("sessionUserId");

        return new BaseResponseVO<>(noticeService.companyNoticeList(userId));
    }

    @RequestMapping(value = "/cm/commune/notice/{noticeId}", method = RequestMethod.GET, produces = "application/json")
    @ResponseBody
    public BaseResponseVO<NoticeVO> companySelectNotice(@PathVariable Integer noticeId) throws Exception {
        log.info("noticeId: " + noticeId);

        NoticeVO vo = new NoticeVO();
        vo.setNoticeId(noticeId);
        vo = noticeService.selectNotice(vo);

        return new BaseResponseVO<>(vo);
    }
    // endregion

    // region US
    @RequestMapping(value = "/us/notice", method = RequestMethod.GET, produces = "text/html")
    public String noticeUsView(@RequestParam(required = false) Integer noticeId, Model model) {
        log.info("noticeId: " + noticeId);

        if (noticeId == null) {
            return "us/notice";
        }

        model.addAttribute("noticeId", noticeId);

        return "us/notice_write";
    }

    @RequestMapping(value = "/us/notice", method = RequestMethod.GET, produces = "application/json")
    @ResponseBody
    public BaseResponseVO<List<NoticeVO>> selectUsNoticeList(HttpSession session) throws Exception {
        log.info("");

        Integer companyId = (Integer) session.getAttribute("sessionTypeId");

        return new BaseResponseVO<>(noticeService.selectUsNoticeList(companyId));
    }

    @RequestMapping(value = "/us/notice/{noticeId}", method = RequestMethod.GET, produces = "application/json")
    @ResponseBody
    public BaseResponseVO<List<NoticeVO>> userSelectNotice(@PathVariable Integer noticeId, HttpSession session) throws Exception {
        log.info("noticeId: " + noticeId);

        Integer companyId = (Integer) session.getAttribute("sessionTypeId");

        NoticeVO vo = new NoticeVO();
        vo.setNoticeId(noticeId);
        vo.setCompanyId(companyId);
        List<NoticeVO> noticeList = noticeService.selectNoticeWith(vo);

        return new BaseResponseVO<>(noticeList);
    }
    // endregion

}

