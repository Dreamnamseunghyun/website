package kr.co.dsong.ggsj.salses.web;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@Slf4j
public class CompanyKeepController {
    @RequestMapping(value = "/{userType}/companykeep", method = RequestMethod.GET, produces = "text/html")
    public String companyKeepHomeView(@PathVariable String userType) {
        log.info("");
        return userType + "/companykeep/index";
    }
}
