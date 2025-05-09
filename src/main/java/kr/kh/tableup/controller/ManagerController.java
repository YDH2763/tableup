package kr.kh.tableup.controller;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import kr.kh.tableup.model.vo.RestaurantManagerVO;
import kr.kh.tableup.model.vo.RestaurantVO;
import kr.kh.tableup.service.ManagerService;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;





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
		return "manager/main";
	}
	

	@GetMapping("/login")
	public String manager_login(Model model) {
		model.addAttribute("url", "/login");
		return "manager/login";
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
	
	@GetMapping("/restaurant")
	public String restaurantPage(Model model ,Principal principal) {
		String managerName=principal.getName();
		RestaurantManagerVO manager = managerService.getManagerId(managerName);
		//해당 매니저의 매장 외래키를 가져옴
		int rm_num=manager.getRm_no();
		RestaurantVO restaurant =managerService.selectRestaurant(rm_num);
		
		System.out.println(manager);
		System.out.println(restaurant);
		
		model.addAttribute("manager", manager);
		model.addAttribute("restaurant", restaurant);
		model.addAttribute("url", "/restaurant");
		return "/manager/restaurant";
	}
	
}
