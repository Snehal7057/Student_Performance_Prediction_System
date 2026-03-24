package edu.spps.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import edu.spps.service.AdminService;
import edu.spps.service.TeacherService;

@Controller
public class LoginController {
	@Autowired
	AdminService adminservice;
	@Autowired
	TeacherService teacherService;

	@GetMapping("/")
	public String home() {

		return "LandingPage";
	}

	@GetMapping("/login")
	public String login() {
		return "login";
	}

	@GetMapping("/dashboard")
	public String dashboard(Authentication auth) {

		String role = auth.getAuthorities().iterator().next().getAuthority();

		if (role.equals("ROLE_ADMIN"))
			return "redirect:/admin/dashboard";
		else if (role.equals("ROLE_TEACHER"))
			return "redirect:/teacher/dashboard";
		else
			return "redirect:/student/dashboard";
	}

}