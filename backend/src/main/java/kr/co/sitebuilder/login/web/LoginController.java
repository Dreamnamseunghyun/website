package kr.co.sitebuilder.login.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import kr.co.sitebuilder.common.Property;
import kr.co.sitebuilder.common.vo.BaseResponseVO;
import kr.co.sitebuilder.common.vo.CommonHospitalVO;
import kr.co.sitebuilder.common.vo.SessionUserVO;
import kr.co.sitebuilder.login.vo.LoginVO;
import kr.co.sitebuilder.login.service.LoginService;
import lombok.extern.slf4j.Slf4j;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

@Controller
@Slf4j
public class LoginController {

    @Resource
    private Property property;

    @Resource
    private LoginService loginService;

    @RequestMapping(value = "/api/test", method = RequestMethod.GET)
    @ResponseBody
    public String test() {
        return "ok";
    }

    @RequestMapping(value = "/api/login", method = RequestMethod.POST, produces = "application/json")
    @ResponseBody
    public LoginVO login(@RequestBody LoginVO loginVO, HttpSession session) throws Exception {

        LoginVO result = loginService.login(loginVO);

        if (result.isSuccess()) {
            session.setAttribute("LOGIN_USER", result.getName());
        }

        return result;
    }

    @RequestMapping(value = "/api/login", method = RequestMethod.POST, produces = "application/json")
    @ResponseBody
    public LoginVO login(@RequestBody LoginVO loginVO, Model model, HttpSession session) {
        log.info("로그인 성공");

        model.addAttribute("version", property.getVersion());

        LoginVO result = new LoginVO();

        String id = loginVO.getId();
        String password = loginVO.getPassword();

        System.out.println("id = " + id);
        System.out.println("password = " + password);

        session.setAttribute("LOGIN_USER", loginVO);

        return result;
    }

    @RequestMapping(value = "/logout", method = RequestMethod.GET, produces = "text/html")
    public String logoutView(@RequestHeader(required = false) String referer, HttpSession session) {
        log.info("referer: " + referer);

        String sessionUserType = (String) session.getAttribute("sessionUserType");
        log.info("sessionUserType: " + sessionUserType);

        session.invalidate();

        if (sessionUserType == null) {
            if (referer == null) {
                return "redirect:/us";
            }

            if (referer.endsWith("/pm") || referer.contains("/pm/") || referer.contains("/pm?")) {
                return "redirect:/pm/login";
            }
            if (referer.endsWith("/hm") || referer.contains("/hm/") || referer.contains("/hm?")) {
                return "redirect:/hm/login";
            }
            if (referer.endsWith("/cm") || referer.contains("/cm/") || referer.contains("/cm?")) {
                return "redirect:/cm/login";
            }

            return "redirect:/us";
        }

        if ("US".equals(sessionUserType)) {
            return "redirect:/us";
        }

        return "redirect:/" + sessionUserType.toLowerCase() + "/login";
    }
}
