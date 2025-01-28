package com.sjc.common.error;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ErrorController {

    @RequestMapping("/error/403")
    public String handle403() {
        return "error/403";  // /jsp/error/403.jsp로 리턴됨
    }

}