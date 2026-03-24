package edu.spps.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.spps.model.PerformanceModel;
import edu.spps.model.StudentModel;
import edu.spps.repository.StudentRepo;

@Service
public class StudentServiceImpl implements StudentService {
	@Autowired
	StudentRepo studentRepo;

	@Override
	public List<PerformanceModel> getPerformanceByStudentId(int studentId) {
		// TODO Auto-generated method stub
		return studentRepo.getPerformanceByStudentId(studentId);
	}

	@Override
	public StudentModel getStudentByEmail(String email) {
		// TODO Auto-generated method stub
		return studentRepo.getStudentByEmail(email);
	}

}
