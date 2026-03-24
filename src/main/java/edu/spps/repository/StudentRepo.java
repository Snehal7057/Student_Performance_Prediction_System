package edu.spps.repository;

import java.util.List;

import edu.spps.model.PerformanceModel;
import edu.spps.model.StudentModel;

public interface StudentRepo {
	public List<PerformanceModel> getPerformanceByStudentId(int studentId);

	public StudentModel getStudentByEmail(String email);

}
