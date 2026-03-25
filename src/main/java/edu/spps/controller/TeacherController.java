package edu.spps.controller;

import java.io.File;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import edu.spps.ml.WekaPredictionService;
import edu.spps.model.PerformanceModel;
import edu.spps.model.PredictionModel;
import edu.spps.model.StudentModel;
import edu.spps.model.StudyMaterialModel;
import edu.spps.model.SubjectModel;
import edu.spps.model.TeacherModel;
import edu.spps.service.AdminService;
import edu.spps.service.TeacherService;
import jakarta.servlet.http.HttpServletRequest;

@Controller
public class TeacherController {
	@Autowired
	AdminService adminservice;
	@Autowired
	TeacherService teacherService;
	@Autowired
	private WekaPredictionService wekaService;

	// Teacher Dashboard
	@GetMapping("/teacher/dashboard")
	public String teacherDashboard() {
		return "TeacherDashboard";
	}

	// Add Student
	@GetMapping("/addStudent")
	public String addStudent(Model model) {
		List<StudentModel> studentList = teacherService.getAllStudents();
		model.addAttribute("students", studentList);
		return "AddStudent";
	}

	// Save Student
	@PostMapping("/addStudent")
	public String saveStudent(StudentModel model, Model m) {
		boolean status = teacherService.addStudent(model);
		if (status) {
			m.addAttribute("msg", "Student Added Successfully");
		} else {
			m.addAttribute("msg", "Student Not Added");
		}
		return "AddStudent";
	}

	// View Student
	@GetMapping("teacher/viewStudent")
	public String viewStudent(Model model) {
		List<StudentModel> studentList = teacherService.getAllStudents();
		model.addAttribute("students", studentList);
		return "ViewStudent";
	}

	// Delete Student
	@GetMapping("/deleteStudent")
	public String deleteStudent(@RequestParam("id") int id, Model model) {
		teacherService.deleteStudent(id);
		List<StudentModel> studentList = teacherService.getAllStudents();
		model.addAttribute("students", studentList);
		return "ViewStudent";
	}

	@GetMapping("/teacher/deleteStudent")
	public String deleteStudent(@RequestParam("id") int id) {

		teacherService.deleteStudent(id);

		return "redirect:/teacher/viewStudent";
	}

	// Update Student Page
	@GetMapping("/teacher/updateStudent")
	public String updateStudent(@RequestParam("id") int id, Model model) {

		StudentModel student = teacherService.getStudentById(id);
		model.addAttribute("student", student);

		return "UpdateStudent";
	}

	// Save Updated Student
	@PostMapping("/teacher/updateStudent")
	public String updateStudentSave(StudentModel students) {

		teacherService.isUpdateStudent(students);

		return "redirect:/teacher/viewStudent";
	}

	// Search By Name
	@GetMapping("teacher/searchstudent")
	public String searchStudent(HttpServletRequest request, Model model) {
		String keyword = request.getParameter("keyword");

		List<StudentModel> studentList = (keyword == null || keyword.isEmpty()) ? teacherService.getAllStudents()
				: teacherService.searchStudent(keyword);
		model.addAttribute("students", studentList);
		model.addAttribute("keyword", keyword);
		return "ViewStudent";
	}

	// Add Performance
	@GetMapping("/teacher/addPerformance")
	public String addPerformance(@RequestParam("student_id") int studentId, Model model) {
		PerformanceModel performance = new PerformanceModel();
		performance.setStudent_id(studentId); // set student id
		model.addAttribute("performance", performance);
		return "AddPerformance";
	}

	// Save Performance
	@PostMapping("/teacher/addPerformance")
	public String savePerformance(PerformanceModel model, Model m) {
		boolean status = teacherService.addPerformance(model);

		if (status) {
			m.addAttribute("msg", "Performance Added Successfully");
		} else {
			m.addAttribute("msg", "Performance Not Added");
		}

		m.addAttribute("performance", new PerformanceModel());
		return "AddPerformance";
	}

	// View Performance
	/*
	 * @GetMapping({"/viewPerformance","/admin/viewPerformance",
	 * "student/viewPerformance"}) public String overallPerformance(Model model) {
	 * List<PerformanceModel> performancelist = teacherService.getAllPerformance();
	 * model.addAttribute("performances", performancelist); return
	 * "ViewPerformance"; }
	 */

	@GetMapping({ "/viewPerformance", "/admin/viewPerformance", "student/viewPerformance" })
	public String overallPerformance(Model model) {
		List<PerformanceModel> performancelist = teacherService.getAllPerformance();

		// Group performances by student
		Map<String, List<PerformanceModel>> studentPerformances = performancelist.stream()
				.collect(Collectors.groupingBy(p -> p.getName()));

		model.addAttribute("studentPerformances", studentPerformances);
		return "ViewPerformance";
	}

	// Search By Name in Performance Table
	@GetMapping({ "/searchPerformance", "/admin/searchPerformance", "student/searchPerformance" })
	public String searchPerformance(HttpServletRequest request, Model model) {
		String word = request.getParameter("word");

		List<PerformanceModel> performancelists = (word == null || word.isEmpty()) ? teacherService.getAllPerformance()
				: teacherService.searchNameforPerformance(word);

		Map<String, List<PerformanceModel>> studentPerformances = performancelists.stream()
				.collect(Collectors.groupingBy(p -> p.getName()));
		model.addAttribute("studentPerformances", studentPerformances);
		model.addAttribute("word", word);
		return "ViewPerformance";
	}

	// upload study material
	@GetMapping("/uploadMaterial")
	public String showUploadPage(Model model) {
		List<SubjectModel> subjects = adminservice.getAllSubjects();
		model.addAttribute("subjects", subjects);
		return "uploadMaterial";

	}

	// upload
	@PostMapping("/uploadMaterial")
	public String uploadMaterial(@RequestParam("subject_id") int subjectId, @RequestParam("file") MultipartFile file,
			HttpServletRequest request, Authentication auth) {

		try {
			String uploadPath = request.getServletContext().getRealPath("/uploads/study_material/");
			File dir = new File(uploadPath);

			if (!dir.exists()) {
				dir.mkdirs();
			}

			String fileName = file.getOriginalFilename();
			File destination = new File(uploadPath + File.separator + fileName);

			file.transferTo(destination);

			// 🔥 Logged-in user
			String email = auth.getName();

			TeacherModel teacher = teacherService.getTeacherByEmail(email);

			StudyMaterialModel material = new StudyMaterialModel();
			material.setSubject_id(subjectId);
			material.setFile_name(fileName);
			material.setUploaded_by(teacher.getId());

			teacherService.uploadMaterial(material);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return "redirect:/viewMaterial";
	}

	// view Material
	@GetMapping({ "/viewMaterial", "student/viewMaterial" })
	public String viewMaterial(Model model) {
		List<StudyMaterialModel> materials = teacherService.getAllMaterials();
		model.addAttribute("materials", materials);
		return "ViewMaterial";
	}

	// deactivate
	@GetMapping("teacher/deactivatestudent")
	public String deactivateStudent(@RequestParam("id") int id) {
		teacherService.deactivateStudent(id);
		return "redirect:/teacher/viewStudent";
	}

	// activated
	@GetMapping("teacher/activatestudent")
	public String activateStudent(@RequestParam("id") int id) {
		teacherService.activateStudent(id);
		return "redirect:/teacher/viewStudent";
	}

	@GetMapping("/teacher/predictStudent")
	public String showPage(Model model) {
		model.addAttribute("students", teacherService.getAllStudents());
		return "PredictPerformance";
	}

	@PostMapping("/teacher/predictAuto")
	public String predictAuto(@RequestParam("studentId") int studentId, Model model) {
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

	@GetMapping("/teacher/viewPredictions")
	public String viewPredictions(Model model) {
		List<PredictionModel> list = teacherService.getAllPrediction();
		model.addAttribute("predictions", list);
		return "ViewPrediction";
	}

}