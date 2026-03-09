package kr.co.sitebuilder.common.vo;

import com.fasterxml.jackson.annotation.JsonIgnore;
import kr.co.sitebuilder.common.CrudType;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;

public class BaseVO {

    @JsonIgnore
    private Integer sessionUserId = null;

    public CrudType _crudType = CrudType.SELECT;

    protected void setSessionUserId(Integer sessionUserId) {
        this.sessionUserId = sessionUserId;
    }

    public Integer getSessionUserId() {
        if (sessionUserId != null) {
            return sessionUserId;
        }

        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
        return (Integer) request.getSession().getAttribute("sessionUserId");
    }
}
