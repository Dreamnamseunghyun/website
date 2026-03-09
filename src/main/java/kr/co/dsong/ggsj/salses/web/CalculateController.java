package kr.co.dsong.ggsj.salses.web;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@Slf4j
public class CalculateController {

    @RequestMapping(value = "/{userType}/calculate", method = RequestMethod.GET, produces = "text/html")
    public String calculateHomeView(@PathVariable String userType) {
        log.info("");
        return userType + "/calculate/index";
    }
}
