package edu.spps.repository;

import java.util.List;

import edu.spps.model.StudentModel;
import edu.spps.model.SubjectModel;
import edu.spps.model.TeacherModel;

public interface TeacherRepository {
	public boolean addStudent(StudentModel model);
	public List<StudentModel> getAllStudents();
	public boolean deleteStudent(int id);
    public boolean isUpdateStudent(StudentModel model);
    StudentModel getStudentById(int id);
}
