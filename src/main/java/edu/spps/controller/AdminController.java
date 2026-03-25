package edu.spps.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import edu.spps.ml.WekaPredictionService;
import edu.spps.model.AdminModel;
import edu.spps.model.PerformanceModel;
import edu.spps.model.PredictionModel;
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
	@Autowired
	private WekaPredictionService wekaService;

	@GetMapping("/admin/dashboard")
	public String adminDashboard(Model model) {

		List<SubjectModel> subjectList = adminservice.getAllSubjects();
		model.addAttribute("subjects", subjectList);

		return "AdminDashboard";
	}

	@GetMapping("/welcome")
	public String welcomePage() {
		return "Welcome";
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

		return "redirect:/admin/dashboard";
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

	@GetMapping("/admin/editteacher")
	public String editTeacher(@RequestParam("id") int id, Model model) {

		TeacherModel teacher = adminservice.getTeacherById(id);
		List<SubjectModel> subjects = adminservice.getAllSubjects();

		model.addAttribute("teacher", teacher);
		model.addAttribute("subjects", subjects);

		return "editteacher";
	}

	@PostMapping("/admin/updateteacher")
	public String updateTeacher(TeacherModel teacher) {

		adminservice.updateTeacher(teacher);

		return "redirect:/admin/dashboard";
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
			return "redirect:/admin";
		}

		adminservice.updateAdmin(admin);

		session.setAttribute("admin", admin);

		return "redirect:/admin";
	}

	// ADMIN - Predict Page
	@GetMapping("/admin/predictStudent")
	public String adminPredictPage(Model model) {
		model.addAttribute("students", teacherService.getAllStudents());
		return "PredictPerformance";
	}

	// ADMIN - Predict Submit
	@PostMapping("/admin/predictAuto")
	public String adminPredictAuto(@RequestParam("studentId") int studentId, Model model) {

		PerformanceModel p = teacherService.getAvgPerformance(studentId);
		if (p == null) {
			model.addAttribute("msg", "⚠️ No previous data present for this student!");
			model.addAttribute("students", teacherService.getAllStudents());
			model.addAttribute("showResult", false);
			return "PredictPerformance";
		}

		double result = wekaService.predict(studentId, p.getAttendance(), p.getStudy_hours(), p.getAssessment(),
				p.getParticipation());

		if (result < 0) {
			model.addAttribute("msg", "⚠️ Already Predicted for this month!");
			model.addAttribute("showResult", false);
		} else {
			model.addAttribute("msg", "✅ Prediction Done");
			model.addAttribute("result", result);
			model.addAttribute("showResult", true); // show result
		}

		model.addAttribute("students", teacherService.getAllStudents());
		return "PredictPerformance";
	}

	// ADMIN - View Predictions
	@GetMapping("/admin/viewPredictions")
	public String adminViewPredictions(Model model) {

		List<PredictionModel> list = teacherService.getAllPrediction();
		model.addAttribute("predictions", list);

		return "ViewPrediction";
	}
}