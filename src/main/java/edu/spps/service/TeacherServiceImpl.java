package edu.spps.service;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.spps.model.PerformanceModel;
import edu.spps.model.StudentModel;
import edu.spps.repository.TeacherRepository;

@Service
public class TeacherServiceImpl implements TeacherService{

	 @Autowired
	 private TeacherRepository studRepo;
	 
	@Override
	public boolean addStudent(StudentModel model) {
		return studRepo.addStudent(model);
	}

	@Override
	public List<StudentModel> getAllStudent() {
		return studRepo.getAllStudents();
	}

	@Override
	public boolean deleteStudent(int id) {
		return studRepo.deleteStudent(id);
	}

	@Override
	public boolean isUpdateStudent(StudentModel model) {
		return studRepo.isUpdateStudent(model);
	}

	@Override
	public StudentModel getStudentById(int id) {
		return studRepo.getStudentById(id);
	}

	@Override
	public List<StudentModel> searchStudent(String keyword) {
		return studRepo.searchStudent(keyword);
	}

	@Override
	public boolean addPerformance(PerformanceModel model) {
		return studRepo.addPerformance(model);
	}

	@Override
	public List<PerformanceModel> getAllPerformance() {
		return studRepo.getAllPerformance();
	}
}
