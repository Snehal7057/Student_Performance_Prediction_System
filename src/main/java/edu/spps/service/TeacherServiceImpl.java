package edu.spps.service;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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

}
