package edu.spps.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import edu.spps.model.StudentModel;
import edu.spps.model.SubjectModel;
import edu.spps.model.TeacherModel;
import edu.spps.service.AdminService;
import edu.spps.service.TeacherService;

@Controller
public class AdminController {

	@Autowired
	AdminService adminservice;
	@Autowired
	TeacherService teacherService;

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

	@GetMapping("/editteacher")
	public String editTeacher(@RequestParam("id") int id, Model model) {

		TeacherModel teacher = adminservice.getTeacherById(id);
		List<SubjectModel> subjects = adminservice.getAllSubjects();

		model.addAttribute("teacher", teacher);
		model.addAttribute("subjects", subjects);

		return "editteacher";
	}

	@PostMapping("/updateteacher")
	public String updateTeacher(TeacherModel teacher) {

		adminservice.updateTeacher(teacher);

		return "redirect:/viewteachers";
	}

	@GetMapping("/searchteacher")
	public String searchTeacher(@RequestParam("keyword") String keyword, Model model) {
		List<TeacherModel> teacherList = adminservice.searchTeacher(keyword);
		model.addAttribute("teachers", teacherList);

		return "ViewTeacher";
	}

	// View Student
	@GetMapping("/viewStudents")
	public String viewStudent(Model model) {
		List<StudentModel> studentList = adminservice.getAllStudents();
		model.addAttribute("students", studentList);
		return "ViewStud";
	}
}