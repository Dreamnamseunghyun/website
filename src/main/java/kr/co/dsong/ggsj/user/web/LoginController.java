package kr.co.dsong.ggsj.user.web;

import kr.co.dsong.ggsj.common.Property;
import kr.co.dsong.ggsj.common.ResponseCode;
import kr.co.dsong.ggsj.common.vo.BaseResponseVO;
import kr.co.dsong.ggsj.user.service.LoginService;
import kr.co.dsong.ggsj.user.vo.UserVO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

@Controller
@Slf4j
public class LoginController {

    @Resource
    private Property property;

    @Resource
    private LoginService loginService;

    @RequestMapping(value = "/{userType}/login", method = RequestMethod.GET, produces = "text/html")
    public String loginView(@PathVariable String userType, Model model, HttpSession session) {
        log.info("");

        model.addAttribute("version", property.getVersion());

        String sessionUserType = (String) session.getAttribute("sessionUserType");
        if (sessionUserType == null) {
            return userType + "/login";
        }

        return "redirect:/" + sessionUserType.toLowerCase();
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

    @RequestMapping(value = "/{userType}/login", method = RequestMethod.POST, produces = "application/json")
    @ResponseBody
    public BaseResponseVO<UserVO> login(@PathVariable String userType, @RequestBody UserVO vo, HttpSession session) throws Exception {
        log.info("");

        BaseResponseVO<UserVO> response;

        vo.setUserType(userType.toUpperCase());
        UserVO user = loginService.login(vo);

        if (user == null) {
            response = new BaseResponseVO<>(null, ResponseCode.FAIL, "일치하는 회원정보가 없습니다.");
        } else {
            session.setAttribute("sessionUserId", user.getUserId());
            session.setAttribute("sessionUserType", user.getUserType());

            session.setAttribute("sessionLoginId", user.getLoginId());
            session.setAttribute("sessionLoginName", user.getLoginName());
            session.setAttribute("sessionTypeId", user.getTypeId());
            session.setAttribute("sessionSubTypeId", user.getSubTypeId());
            response = new BaseResponseVO<>(user);
        }

        return response;
    }
}
