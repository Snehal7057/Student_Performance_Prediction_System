package edu.spps.controller;

import java.io.File;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import edu.spps.model.PerformanceModel;
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
		List<StudentModel> studentList = teacherService.getAllStudents();
		model.addAttribute("students", studentList);
		return "redirect:/teacher/iewStudent";
	}

	// Search By Name
	@GetMapping("teacher/searchstudent")
	public String searchStudent(HttpServletRequest request, Model model) {
		String keyword=request.getParameter("keyword");
		
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
	
	//View Performance
	/*@GetMapping({"/viewPerformance","/admin/viewPerformance","student/viewPerformance"})
	public String overallPerformance(Model model) {
		List<PerformanceModel> performancelist = teacherService.getAllPerformance();
		model.addAttribute("performances", performancelist);
		return "ViewPerformance";
	}*/
	
	@GetMapping({"/viewPerformance","/admin/viewPerformance","student/viewPerformance"})
	public String overallPerformance(Model model) {
	    List<PerformanceModel> performancelist = teacherService.getAllPerformance();

	    // Group performances by student
	    Map<String, List<PerformanceModel>> studentPerformances = performancelist.stream()
	        .collect(Collectors.groupingBy(p -> p.getName())); // assuming getStudentName() exists

	    model.addAttribute("studentPerformances", studentPerformances);
	    return "ViewPerformance";
	}

	// Search By Name in Performance Table
	@GetMapping({"/searchPerformance","/admin/searchPerformance","student/searchPerformance"})
	 public String searchPerformance(HttpServletRequest request,Model model) {
		  String word=request.getParameter("word");
		  
		  List<PerformanceModel> performancelists=(word==null || word.isEmpty()) ? 
				                                  teacherService.getAllPerformance() :
			                                      teacherService.searchNameforPerformance(word);
		  
		  Map<String, List<PerformanceModel>> studentPerformances = performancelists.stream()
			        .collect(Collectors.groupingBy(p -> p.getName()));
		  model.addAttribute("studentPerformances",studentPerformances);
		  model.addAttribute("word",word);
			return "ViewPerformance";
		}
	    
	// upload study material
	@GetMapping("/uploadMaterial")
	public String showUploadPage(Model model) {
		List<SubjectModel> subjects = adminservice.getAllSubjects();
		model.addAttribute("subjects", subjects);
		return "uploadMaterial";

	}
  
	 //upload
	@PostMapping("/uploadMaterial")
	public String uploadMaterial(@RequestParam("subject_id") int subjectId, @RequestParam("file") MultipartFile file,
			HttpServletRequest request, HttpSession session) {

		try {
			// Get upload folder path
			String uploadPath = request.getServletContext().getRealPath("/uploads/study_material/");
			File dir = new File(uploadPath);

			// Create folder if it doesn't exist
			if (!dir.exists()) {
				dir.mkdirs();
			}

			// Get file name
			String fileName = file.getOriginalFilename();
			File destination = new File(uploadPath + File.separator + fileName);

			// Save file
			file.transferTo(destination);

			// Save to database
			StudyMaterialModel material = new StudyMaterialModel();
			material.setSubject_id(subjectId);
			material.setFile_name(fileName);

			// TEMPORARY teacher id (must exist in teachers table)
			material.setUploaded_by(11);

			teacherService.uploadMaterial(material);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/viewMaterial";
	}

	// view Material
	@GetMapping({"/viewMaterial","student/viewMaterial"})
	public String viewMaterial(Model model) {
		List<StudyMaterialModel> materials = teacherService.getAllMaterials();
		model.addAttribute("materials", materials);
		return "ViewMaterial";
	}

}