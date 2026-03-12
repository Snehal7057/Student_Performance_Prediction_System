package edu.spps.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import edu.spps.model.PerformanceModel;
import edu.spps.model.StudentModel;
import edu.spps.model.SubjectModel;
import edu.spps.model.TeacherModel;
import edu.spps.service.TeacherService;

@Controller
public class TeacherController {
	@Autowired
	TeacherService teacherService;

	//Teacher Dashboard
	@GetMapping("/teacher")
	public String teacherDashboard() {
		return "TeacherDashboard";
	}
	
	//Add Student
	@GetMapping("/addStudent")
	public String addStudent(Model model) {
		List<StudentModel> studentList = teacherService.getAllStudent();
		model.addAttribute("students", studentList);
		return "AddStudent";
	}

	//Save Student
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
	
	//View Student
	@GetMapping("/viewStudent")
	public String viewStudent(Model model) {
		List<StudentModel> studentList = teacherService.getAllStudent();
		model.addAttribute("students", studentList);
		return "ViewStudent";
	}

	//Delete Student
	@GetMapping("/deleteStudent")
	public String deleteStudent(@RequestParam("id") int id,Model model) {
		teacherService.deleteStudent(id);
		List<StudentModel> studentList = teacherService.getAllStudent();
		model.addAttribute("students", studentList);		
		return "ViewStudent";
	}
	
	//Update Student
	@GetMapping("/updateStudent")
	public String updateStudent(@RequestParam("id") int id,Model model) {
		StudentModel student= teacherService.getStudentById(id);
		model.addAttribute("student", student);		
		return "UpdateStudent";
	}
	
	//Save Update Student
	@PostMapping("/updateStudent")
	public String updateStudentSave(StudentModel students,Model model) {
		boolean status=teacherService.isUpdateStudent(students);
		model.addAttribute("msg",status ? "Student Updated Successfully" : "Update Failed");
		List<StudentModel> studentList = teacherService.getAllStudent();
		model.addAttribute("students", studentList);	
		return "redirect:/ViewStudent";
	}
	
	//Search By Name
	@GetMapping("/searchstudent")
	public String searchStudent(@RequestParam(value="keyword",required=false) String keyword,Model model) {
		List<StudentModel> studentList =(keyword==null || keyword.isEmpty()) ?
				                        teacherService.getAllStudent():
				                        teacherService.searchStudent(keyword);
		model.addAttribute("students", studentList);
		model.addAttribute("keyword",keyword);
		return "ViewStudent";
	}
	
	//Add Performance
	@GetMapping("/addPerformance")
	public String addPerformance(@RequestParam("student_id") int studentId, Model model){
	    PerformanceModel performance = new PerformanceModel();
	    performance.setStudent_id(studentId);   // set student id
	    model.addAttribute("performance", performance);
	    return "AddPerformance";
	}

	
     //Save Performance
	@PostMapping("/addPerformance")
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
	@GetMapping("/viewPerformance")
	public String overallPerformance(Model model) {
		List<PerformanceModel> performancelist=teacherService.getAllPerformance();
		model.addAttribute("performances",performancelist);
		return "ViewPerformance";
	} 
}