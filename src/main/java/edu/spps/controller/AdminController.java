package edu.spps.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import edu.spps.model.TeacherModel;
import edu.spps.service.AdminService;

@Controller
public class AdminController {

	@Autowired
	AdminService adminservice;

	@GetMapping("/addteacher")
	public String showAddTeacherPage() {
		return "AddTeacher";
	}

	@PostMapping("/addteacher")
	public String addTeacher(TeacherModel model) {

		adminservice.addTeacher(model);

		return "redirect:/addteacher";
	}

}
