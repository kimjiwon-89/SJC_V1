package com.sjc.SJC_V1.custom.user;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.sjc.SJC_V1.model.Users;

@RestController
@RequestMapping("/users")
public class UserCont {

    @Autowired
    private UserService userService;
    
    @RequestMapping("/main")
    public ModelAndView main() {
    	ModelAndView mv = new ModelAndView();
    	List<Users> users = userService.getAllUsers();
    	mv.addObject("users", users);
    	mv.addObject("viewName", "custom/user/users");
    	mv.setViewName("layout/common_layout");
    	return mv;
    }
    

    @RequestMapping("/users")
    public ModelAndView getUsers() {
        ModelAndView mv = new ModelAndView();
        List<Users> users = userService.getAllUsers();
        mv.addObject("users", users);
        
        mv.setViewName("custom/user/users"); // JSP 파일 경로 설정
        // 모델 데이터 추가
        mv.addObject("message", "Hello, users!");
        return mv;
    }

//    @RequestMapping("/add")
    @PostMapping("/add")
	public ResponseEntity<Users> updateUser(@ModelAttribute Users userDetails) {
		userService.updateUser(userDetails);
		return ResponseEntity.ok(userDetails);
	}
    
//    @GetMapping
//    public List<User> getAllUsers() {
//        return userService.getAllUsers();
//    }

//    @GetMapping("/{id}")
//    public ResponseEntity<User> getUserById(@PathVariable Long id) {
//        Optional<User> user = userService.getUserById(id);
//        return user.map(ResponseEntity::ok).orElseGet(() -> ResponseEntity.notFound().build());
//    }
//
//    @PutMapping("/{id}")
//    public ResponseEntity<User> updateUser(@PathVariable Long id, @RequestBody User userDetails) {
//        User updatedUser = userService.updateUser(id, userDetails);
//        return ResponseEntity.ok(updatedUser);
//    }
//
//    @DeleteMapping("/{id}")
//    public ResponseEntity<Void> deleteUser(@PathVariable Long id) {
//        userService.deleteUser(id);
//        return ResponseEntity.noContent().build();
//    }
}