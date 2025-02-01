package com.sjc.saju;

import jakarta.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeCont {
     
    @GetMapping("/")
    public String home(HttpServletRequest request, Model model) {
        model.addAttribute("request", request);
        System.out.println("home");
//        return "index";
        return "layout/common_layout";
    }
}
