package kr.co.sitebuilder.login.web;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import kr.co.sitebuilder.login.service.LoginService;
import kr.co.sitebuilder.login.vo.LoginVO;

@RestController
public class LoginController {

    @Resource(name = "loginService")
    private LoginService loginService;

    @RequestMapping("/api/login")
    @ResponseBody
    public Map<String, Object> login(@RequestBody LoginVO loginVO, HttpSession session) throws Exception {
        Map<String, Object> resultMap = new HashMap<String, Object>();

        LoginVO userInfo = loginService.login(loginVO);

        if (userInfo != null) {
            session.setAttribute("SESSION_USER_ID", userInfo.getId());
            session.setAttribute("SESSION_PHONE_NUMBER", userInfo.getPhoneNumber());
            session.setAttribute("SESSION_E_MAIL", userInfo.geteMail());
            session.setAttribute("SESSION_USER_NAME", userInfo.getName());

            resultMap.put("success", true);
            resultMap.put("message", "로그인 성공");
            resultMap.put("id", userInfo.getId());
            resultMap.put("phoneNumber", userInfo.getPhoneNumber());
            resultMap.put("eMail", userInfo.geteMail());
            resultMap.put("name", userInfo.getName());
        } else {
            resultMap.put("success", false);
            resultMap.put("message", "아이디 또는 비밀번호가 올바르지 않습니다.");
        }

        return resultMap;
    }

    @RequestMapping("/api/logout")
    @ResponseBody
    public Map<String, Object> logout(HttpSession session) throws Exception {
        Map<String, Object> resultMap = new HashMap<String, Object>();

        session.invalidate();

        resultMap.put("success", true);
        resultMap.put("message", "로그아웃 되었습니다.");

        return resultMap;
    }
}
