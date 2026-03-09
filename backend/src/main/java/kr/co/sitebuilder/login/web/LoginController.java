package kr.co.sitebuilder.login.web;

import java.util.HashMap;
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
import kr.co.sitebuilder.common.vo.SessionUserVO;
import kr.co.sitebuilder.login.service.LoginService;
import kr.co.sitebuilder.login.vo.LoginVO;
import lombok.extern.slf4j.Slf4j;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

@Controller
@Slf4j
public class LoginController {

    @Resource
    private Property property;

    @RequestMapping(value = "/api/login", method = RequestMethod.GET, produces = "text/html")
    public String loginView(@PathVariable String userType, Model model, HttpSession session) {
        log.info("로그인 성공");

        model.addAttribute("version", property.getVersion());

        // if (userInfo == null) {
        //     resultMap.put("success", false);
        //     resultMap.put("message", "아이디 또는 비밀번호가 올바르지 않습니다.");
        //     return resultMap;
        // }
        //
        // session.setAttribute(Property.SESSION_USER_ID, userInfo.getId());
        // session.setAttribute(Property.SESSION_PHONE_NUMBER, userInfo.getPhoneNumber());
        // session.setAttribute(Property.SESSION_E_MAIL, userInfo.getEmail());
        // session.setAttribute(Property.SESSION_USER_NAME, userInfo.getName());
        //
        // SessionUserVO sessionUser = new SessionUserVO();
        // sessionUser.setId(userInfo.getId());
        // sessionUser.setPhoneNumber(userInfo.getPhoneNumber());
        // sessionUser.setEmail(userInfo.getEmail());
        // sessionUser.setName(userInfo.getName());
        //
        // session.setAttribute(Property.SESSION_USER, sessionUser);
        //
        // resultMap.put("success", true);
        // resultMap.put("message", "로그인 성공");
        // resultMap.put("id", userInfo.getId());
        // resultMap.put("phoneNumber", userInfo.getPhoneNumber());
        // resultMap.put("eMail", userInfo.getEmail());
        // resultMap.put("name", userInfo.getName());

        // String sessionUserType = (String) session.getAttribute("sessionUserType");
        // if (sessionUserType == null) {
        //     return userType + "/login";
        // }

        return "/login";
        // return "redirect:/" + sessionUserType.toLowerCase();
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
