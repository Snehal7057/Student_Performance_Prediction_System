package edu.spps.controller;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import edu.spps.model.PerformanceModel;
import edu.spps.model.StudentModel;
import edu.spps.service.StudentService;
import edu.spps.service.TeacherService;

@Controller
public class StudentController {

	@Autowired
	StudentService studentService;
	@Autowired
	TeacherService teacherService;

	@GetMapping("/student/dashboard")
	public String dashboard() {
		return "StudentDashboard";
	}

	@GetMapping("/student/myPerformance")
	public String viewPerformance(Model model, Authentication auth) {

		String email = auth.getName();

		StudentModel student = studentService.getStudentByEmail(email);

		if (student == null) {
			model.addAttribute("error", "Student not found");
			return "ViewPerformance";
		}

		List<PerformanceModel> list = studentService.getPerformanceByStudentId(student.getId());

		Map<String, List<PerformanceModel>> map = new LinkedHashMap<>();

		for (PerformanceModel p : list) {
			String name = p.getName();

			if (!map.containsKey(name)) {
				map.put(name, new ArrayList<>());
			}

			map.get(name).add(p);
		}

		model.addAttribute("studentPerformances", map);

		return "ViewPerformance";
	}
}
