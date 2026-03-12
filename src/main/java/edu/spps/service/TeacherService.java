package edu.spps.service;

import java.util.List;

import edu.spps.model.StudentModel;
import edu.spps.model.SubjectModel;

public interface TeacherService {
	public boolean addStudent(StudentModel model);
	public List<StudentModel> getAllStudent();
	public boolean deleteStudent(int id);
    public boolean isUpdateStudent(StudentModel model);
    StudentModel getStudentById(int id);
}
