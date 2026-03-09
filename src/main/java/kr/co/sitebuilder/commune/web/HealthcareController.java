package kr.co.sitebuilder.commune.web;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@Slf4j
public class HealthcareController {

    // region PM
    @RequestMapping(value = "/pm/commune/healthcare", method = RequestMethod.GET, produces = "text/html")
    public String healthcareIndexView() {
        log.info("");
        return "pm/commune/healthcare/index";
    }

    @RequestMapping(value = "/pm/commune/healthcare/create", method = RequestMethod.GET, produces = "text/html")
    public String healthcareCreateView() {
        log.info("");
        return "pm/commune/healthcare/create";
    }

    @RequestMapping(value = "/pm/commune/healthcare/{Id}/edit", method = RequestMethod.GET, produces = "text/html")
    public String healthcareEditView() {
        log.info("");
        return "pm/commune/healthcare/edit";
    }

    @RequestMapping(value = "/pm/commune/healthcare/{Id}", method = RequestMethod.GET, produces = "text/html")
    public String healthcareView() {
        log.info("");
        return "pm/commune/healthcare/view";
    }
    // endregion
}
