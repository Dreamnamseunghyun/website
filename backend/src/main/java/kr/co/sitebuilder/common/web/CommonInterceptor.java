package kr.co.sitebuilder.common.web;

import java.util.HashMap;
import java.util.Map;

import kr.co.sitebuilder.common.Property;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fasterxml.jackson.databind.ObjectMapper;

@Slf4j
public class CommonInterceptor extends HandlerInterceptorAdapter {

    @Resource
    private Property property;

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        HttpSession session = request.getSession(false);
        String requestUri = request.getRequestURI();

        boolean isLogin = session != null
            && session.getAttribute(Property.SESSION_USER_ID) != null;

        if (isLogin) {
            return true;
        }

        if (requestUri.startsWith("/api/")) {
            response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
            response.setContentType("application/json; charset=UTF-8");

            Map<String, Object> resultMap = new HashMap<String, Object>();
            resultMap.put("success", false);
            resultMap.put("message", "로그인이 필요합니다.");

            ObjectMapper objectMapper = new ObjectMapper();
            response.getWriter().write(objectMapper.writeValueAsString(resultMap));
            return false;
        }

        response.sendRedirect(request.getContextPath() + "/us/login");
        return false;
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
        super.postHandle(request, response, handler, modelAndView);

        if (modelAndView != null) {
            modelAndView.addObject("version", property.getVersion());
        }
    }
}
