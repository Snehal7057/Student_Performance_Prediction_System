package edu.spps.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import edu.spps.model.AdminModel;
import edu.spps.model.StudentModel;
import edu.spps.model.SubjectModel;
import edu.spps.model.TeacherModel;
import edu.spps.service.AdminService;
import edu.spps.service.TeacherService;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class AdminController {

	@Autowired
	AdminService adminservice;
	@Autowired
	TeacherService teacherService;

	@GetMapping("/")
	public String home() {

		return "LandingPage";
	}

	@GetMapping("/admin")
	public String adminDashboard(Model model) {

		List<SubjectModel> subjectList = adminservice.getAllSubjects();
		model.addAttribute("subjects", subjectList);

		return "AdminDashboard";
	}

	@GetMapping("/welcome")
	public String welcomePage() {
		return "Welcome"; // Spring will resolve to /WEB-INF/views/Welcome.jsp
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

		return "redirect:/admin";
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

		return "redirect:/admin";
	}

	@GetMapping("/searchteacher")
	public String searchTeacher(@RequestParam("keyword") String keyword, Model model) {
		List<TeacherModel> teacherList = adminservice.searchTeacher(keyword);
		model.addAttribute("teachers", teacherList);

		return "ViewTeacher";
	}

	// View Student
	@GetMapping("admin/viewStudent")
	public String viewStudent(Model model) {
		List<StudentModel> studentList = teacherService.getAllStudents();
		model.addAttribute("students", studentList);
		return "ViewStud";
	}

	/*
	 * //search student
	 * 
	 * @GetMapping("admin/searchStudent") public String
	 * searchStudent(HttpServletRequest request, Model model) { String
	 * word=request.getParameter("word");
	 * 
	 * List<StudentModel> studentList = (word == null || word.isEmpty()) ?
	 * adminservice.getAllStudents() : adminservice.searchStudent(word);
	 * 
	 * model.addAttribute("students", studentList); model.addAttribute("word",
	 * word); return "ViewStud"; }
	 */

	// delete student
	@GetMapping("/admin/deleteStudent")
	public String deleteStudent(@RequestParam("id") int studentId) {
		teacherService.deleteStudent(studentId);
		return "redirect:/admin/viewStudent";
	}

	// search student
	@GetMapping("admin/searchStudent")
	public String searchStudent(HttpServletRequest request, Model model) {
		String word = request.getParameter("word");

		List<StudentModel> studentList = (word == null || word.isEmpty()) ? adminservice.getAllStudents()
				: adminservice.searchStudent(word);

		model.addAttribute("students", studentList);
		model.addAttribute("word", word);
		return "ViewStud";
	}

	@GetMapping("/changeTeacherStatus")
	public String changeTeacherStatus(@RequestParam("id") int id, @RequestParam("status") String status) {

		adminservice.updateTeacherStatus(id, status);
		return "redirect:/viewteachers";
	}

	@GetMapping("/editAdminProfile")
	public String editAdminProfile(HttpSession session, Model model) {

		AdminModel admin = (AdminModel) session.getAttribute("admin");

		model.addAttribute("admin", admin);

		return "EditAdminProfile";
	}

	@PostMapping("/updateAdminProfileData")
	public String updateAdminProfile(AdminModel admin, HttpSession session) {

		if (admin.getId() == 0) {
			return "redirect:/admin"; // avoid crash
		}

		adminservice.updateAdmin(admin);

		session.setAttribute("admin", admin);

		return "redirect:/admin";
	}
}