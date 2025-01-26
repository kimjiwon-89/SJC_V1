package com.sjc.system.user;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@RestController
@RequestMapping("/user")
public class UserCont {

	private static final Logger logger = LoggerFactory.getLogger(UserCont.class);

    @Autowired
    private UserService userService;

    @RequestMapping("myList")
    public ModelAndView myList() {
        ModelAndView mv = new ModelAndView();
        mv.addObject("viewName", "/user/myList");
        mv.setViewName("layout/system_layout");
        return mv;
    }


}