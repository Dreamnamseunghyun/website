package kr.co.sitebuilder.auth.web.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/auth")
public class AuthController {

    @PostMapping(value = "/login", produces = MediaType.APPLICATION_JSON_VALUE)
    public Map<String, Object> login(@RequestBody Map<String, Object> request) {
        Map<String, Object> result = new HashMap<>();

        String email = String.valueOf(request.get("email"));
        String password = String.valueOf(request.get("password"));

        if ("admin@test.com".equals(email) && "1234".equals(password)) {
            result.put("success", true);
            result.put("message", "로그인 성공");
        } else {
            result.put("success", false);
            result.put("message", "이메일 또는 비밀번호가 올바르지 않습니다.");
        }

        return result;
    }
}
