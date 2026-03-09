package kr.co.dsong.ggsj.home.web;

import kr.co.dsong.ggsj.reserve.service.UserReserveService;
import kr.co.dsong.ggsj.reserve.vo.ReserveVO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

@Controller
@Slf4j
public class HomeController {

    @Resource
    private UserReserveService userReserveService;

    @RequestMapping(value = "/pm", method = RequestMethod.GET, produces = "text/html")
    public String platformManagerHomeView() {
        log.info("");
        return "pm/index";
    }

    @RequestMapping(value = "/cm", method = RequestMethod.GET, produces = "text/html")
    public String companyManagerHomeView() {
        log.info("");
        return "cm/index";
    }

    @RequestMapping(value = "/hm", method = RequestMethod.GET, produces = "text/html")
    public String hospitalManagerHomeView() {
        log.info("");
        return "hm/index";
    }

    @RequestMapping(value = "/us", method = RequestMethod.GET, produces = "text/html")
    public String userHomeView() {
        log.info("");
        return "redirect:/us/index.html";
    }

    @RequestMapping(value = "/us/index", method = RequestMethod.GET, produces = "text/html")
    public String userIndexView() {
        log.info("");
        return "us/index";
    }

    // TODO: 임시 url 연결 나중에 삭제 예정
    @RequestMapping(value = "/us/header", method = RequestMethod.GET, produces = "text/html")
    public String userHeaderView(Model model, HttpSession session) throws Exception {
        log.info("");

        Integer sessionUserId = (Integer) session.getAttribute("sessionUserId");

        if (sessionUserId != null) {
            ReserveVO reserve = new ReserveVO();
            reserve.setUserId(sessionUserId);

            model.addAttribute("reserve", userReserveService.selectReserve(reserve));
        }

        return "us/header";
    }
}
