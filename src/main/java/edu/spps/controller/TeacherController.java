package edu.spps.controller;

import java.io.File;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import edu.spps.model.StudentModel;
import edu.spps.model.StudyMaterialModel;
import edu.spps.model.SubjectModel;
import edu.spps.service.AdminService;
import edu.spps.service.TeacherService;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class TeacherController {
	@Autowired
	AdminService adminservice;
	@Autowired
	TeacherService teacherService;

	// Teacher Dashboard
	@GetMapping("/teacher")
	public String teacherDashboard() {
		return "TeacherDashboard";
	}

	// Add Student
	@GetMapping("/addStudent")
	public String addStudent(Model model) {
		List<StudentModel> studentList = teacherService.getAllStudent();
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
	@GetMapping("/viewStudent")
	public String viewStudent(Model model) {
		List<StudentModel> studentList = teacherService.getAllStudent();
		model.addAttribute("students", studentList);
		return "ViewStudent";
	}

	// Delete Student
	@GetMapping("/deleteStudent")
	public String deleteStudent(@RequestParam("id") int id, Model model) {
		teacherService.deleteStudent(id);
		List<StudentModel> studentList = teacherService.getAllStudent();
		model.addAttribute("students", studentList);
		return "ViewStudent";
	}

	// Update Student
	@GetMapping("/updateStudent")
	public String updateStudent(@RequestParam("id") int id, Model model) {
		StudentModel student = teacherService.getStudentById(id);
		model.addAttribute("student", student);
		return "UpdateStudent";
	}

	// Save Update Student
	@PostMapping("/updateStudent")
	public String updateStudentSave(StudentModel students, Model model) {
		boolean status = teacherService.isUpdateStudent(students);
		model.addAttribute("msg", status ? "Student Updated Successfully" : "Update Failed");
		List<StudentModel> studentList = teacherService.getAllStudent();
		model.addAttribute("students", studentList);
		return "redirect:/ViewStudent";
	}

	// Search By Name
	@GetMapping("/searchstudent")
	public String searchStudent(@RequestParam(value = "keyword", required = false) String keyword, Model model) {
		List<StudentModel> studentList = (keyword == null || keyword.isEmpty()) ? teacherService.getAllStudent()
				: teacherService.searchStudent(keyword);
		model.addAttribute("students", studentList);
		model.addAttribute("keyword", keyword);
		return "ViewStudent";
	}

	// upload study material
	@GetMapping("/uploadMaterial")
	public String showUploadPage(Model model) {
		List<SubjectModel> subjects = adminservice.getAllSubjects();
		model.addAttribute("subjects", subjects);
		return "uploadMaterial";

	}

	@PostMapping("/uploadMaterial")
	public String uploadMaterial(@RequestParam("subject_id") int subjectId, @RequestParam("file") MultipartFile file,
			HttpServletRequest request, HttpSession session) {

		try {

			String uploadPath = request.getServletContext().getRealPath("/uploads/study_material/");

			File dir = new File(uploadPath);

			if (!dir.exists()) {
				dir.mkdirs();
			}

			String fileName = file.getOriginalFilename();

			File destination = new File(uploadPath + File.separator + fileName);

			file.transferTo(destination);

			StudyMaterialModel material = new StudyMaterialModel();

			material.setSubject_id(subjectId);
			material.setFile_name(fileName);
			material.setUploaded_by(1); // later session teacher id

			teacherService.uploadMaterial(material);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return "redirect:/uploadMaterial";
	}

	// Add Performance
}