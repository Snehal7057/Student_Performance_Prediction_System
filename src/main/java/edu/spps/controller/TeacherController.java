package edu.spps.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.ui.Model;
import edu.spps.model.StudentModel;
import edu.spps.model.SubjectModel;
import edu.spps.model.TeacherModel;
import edu.spps.service.TeacherService;

@Controller
public class TeacherController {
   @Autowired
   TeacherService teacherService;
   
   @GetMapping("/")
   public String addStudent(Model model) {
	   List<StudentModel> studentList=teacherService.getAllStudent();
	   model.addAttribute("students",studentList);
	   return "AddStudent";
   }
   
   @PostMapping("/addStudent")
   public String saveStudent(StudentModel model,Model m) {
	   boolean status=teacherService.addStudent(model);
	    if(status) {
	    	m.addAttribute("msg","Student Added Successfully");
	    }
	    else {
	    	m.addAttribute("msg","Student Not Added");
	    }
	   return "AddStudent";   
   }
}

