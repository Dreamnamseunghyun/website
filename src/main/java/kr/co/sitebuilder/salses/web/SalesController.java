package kr.co.sitebuilder.salses.web;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@Slf4j
public class SalesController {
    @RequestMapping(value = "/{userType}/sales", method = RequestMethod.GET, produces = "text/html")
    public String costHomeView(@PathVariable String userType) {
        log.info("");
        return userType + "/sales/index";
    }
}
