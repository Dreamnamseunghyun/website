package kr.co.sitebuilder.util;

import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;

public class SessionUtil {

    public static Integer getInteger(String attribute) {
        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
        return (Integer) request.getSession().getAttribute(attribute);
    }

    public static Long getLong(String attribute) {
        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
        return (Long) request.getSession().getAttribute(attribute);
    }

    public static Float getFloat(String attribute) {
        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
        return (Float) request.getSession().getAttribute(attribute);
    }

    public static Double getDouble(String attribute) {
        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
        return (Double) request.getSession().getAttribute(attribute);
    }

    public static String getString(String attribute) {
        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
        return (String) request.getSession().getAttribute(attribute);
    }

    public static Object getObject(String attribute) {
        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
        return request.getSession().getAttribute(attribute);
    }
}
