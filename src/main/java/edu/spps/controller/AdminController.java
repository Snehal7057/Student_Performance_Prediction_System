package edu.spps.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import edu.spps.model.SubjectModel;
import edu.spps.model.TeacherModel;
import edu.spps.service.AdminService;

@Controller
public class AdminController {

	@Autowired
	AdminService adminservice;

	@GetMapping("/")
	public String home() {

		return "home";
	}

	@GetMapping("/admin")
	public String adminDashboard() {

//		List<SubjectModel> subjectList = adminservice.getAllSubjects();
//		model.addAttribute("subjects", subjectList);

		return "AdminDashboard";
	}

	@GetMapping("/addteacher")

	public String showAddTeacherPage(Model model) {
		List<SubjectModel> subjectList = adminservice.getAllSubjects();
		model.addAttribute("subjects", subjectList);
		return "AddTeacher";
	}

	@PostMapping("/addteacher")
	public String addTeacher(TeacherModel model, Model m) {

		adminservice.addTeacher(model);

		List<SubjectModel> subjectList = adminservice.getAllSubjects();
		m.addAttribute("subjects", subjectList);

		return "redirect:/viewteachers";
	}

	@GetMapping("/viewteachers")
	public String viewAllTeacher(Model mod) {

		List<TeacherModel> teacherList = adminservice.getAllTeacher();
		mod.addAttribute("teachers", teacherList);

		return "ViewTeacher";
	}

	@GetMapping("/deleteteacher")
	public String deleteTeacher(@RequestParam("id") int id) {

		adminservice.deleteTeacher(id);

		return "redirect:/viewteachers";
	}
}