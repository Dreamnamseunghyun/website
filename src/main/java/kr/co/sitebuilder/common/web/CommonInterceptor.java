package kr.co.sitebuilder.common.web;

import kr.co.sitebuilder.common.Property;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@Slf4j
public class CommonInterceptor extends HandlerInterceptorAdapter {

    @Resource
    private Property property;

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        HttpSession session = request.getSession();
        Integer sessionUserId = (Integer) session.getAttribute("sessionUserId");
        String sessionUserType = (String) session.getAttribute("sessionUserType");

        if (sessionUserId == null || sessionUserType == null) {
            if (request.getHeader("Accept").contains("text/html")) {
                if (request.getServletPath().startsWith("/pm")) {
                    response.sendRedirect(request.getContextPath() + "/pm/login");
                } else if (request.getServletPath().startsWith("/hm")) {
                    response.sendRedirect(request.getContextPath() + "/hm/login");
                } else if (request.getServletPath().startsWith("/cm")) {
                    response.sendRedirect(request.getContextPath() + "/cm/login");
                } else {
                    response.sendRedirect(request.getContextPath() + "/us/login");
                }
            } else {
                // login?????섏뼱 ?덉쓣 寃쎌슦 UNAUTHORIZED status
                response.setStatus(HttpStatus.UNAUTHORIZED.value());
            }

            return false;
        }

        // pm/cm/hm 沅뚰븳 泥댄겕
        if (!request.getServletPath().startsWith("/storage/") &&  // storage ??pm/cm/hm 沅뚰븳泥댄겕 ?덊븿
                !request.getServletPath().startsWith("/" + sessionUserType.toLowerCase())
        ) {
            if (request.getHeader("Accept").contains("text/html")) {
                response.sendRedirect(request.getContextPath() + "/" + sessionUserType.toLowerCase());
            } else {
                // 沅뚰븳 ?녿뒗 寃쎌슦 FORBIDDEN status
                response.setStatus(HttpStatus.FORBIDDEN.value());
            }

            return false;
        }

        return super.preHandle(request, response, handler);
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
        super.postHandle(request, response, handler, modelAndView);

        if (modelAndView != null) {
            modelAndView.addObject("version", property.getVersion());
        }
    }
}
