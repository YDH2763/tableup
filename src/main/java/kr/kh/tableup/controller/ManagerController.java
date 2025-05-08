package kr.kh.tableup.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import kr.kh.tableup.model.vo.RestaurantManagerVO;
import kr.kh.tableup.service.ManagerService;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;




@Controller
@RequestMapping("/manager")
public class ManagerController {
	
	@Autowired
	ManagerService managerService;

	@Autowired
  PasswordEncoder passwordEncoder;

	@GetMapping("/manager_login")
	public String manager_login(Model model) {
		model.addAttribute("url", "/manager_login");
		return "/manager/manager_login";
	}
	

	@GetMapping("/manager_signup")
	public String manager_signup(Model model) {
		model.addAttribute("url", "/manager_signup");
		return "/manager/manager_signup";
	}
	
	@PostMapping("/manager_signup")
	public String postMethodName(RestaurantManagerVO rm) {
		rm.setRm_pw(passwordEncoder.encode(rm.getRm_pw()));
		managerService.insertManager(rm);
		return "redirect:/manager/manager_login";
	}
	
	
}
