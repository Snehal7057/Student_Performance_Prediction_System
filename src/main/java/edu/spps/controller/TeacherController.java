package edu.spps.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
		return "ViewStudent";
	}
}