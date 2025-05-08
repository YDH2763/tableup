package kr.kh.tableup.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import kr.kh.tableup.model.vo.RestaurantManagerVO;
import kr.kh.tableup.service.ManagerService;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestBody;





@Controller
@RequestMapping("/manager")
public class ManagerController {
	
	@Autowired
	ManagerService managerService;

	@Autowired
  PasswordEncoder passwordEncoder;

	@GetMapping("main")
	public String manager(Model model) {
		model.addAttribute("url","/main");
		return "/manager/main";
	}
	

	@GetMapping("/login")
	public String manager_login(Model model) {
		model.addAttribute("url", "/login");
		return "manager/login";
	}

	
	@PostMapping("/login")
	public String login(@RequestParam String rm_username,
											@RequestParam String rm_password,
											@RequestParam(required = false) String rememberMe,
											Model model) {
			return "redirect:/manager/main"; 
	}


	@GetMapping("/signup")
	public String manager_signup(Model model) {
		model.addAttribute("url", "/signup");
		return "/manager/signup";
	}
	
	@PostMapping("/signup")
	public String postMethodName(RestaurantManagerVO rm) {
		rm.setRm_pw(passwordEncoder.encode(rm.getRm_pw()));
		managerService.insertManager(rm);
		return "redirect:/manager/login";
	}
	
	
}
