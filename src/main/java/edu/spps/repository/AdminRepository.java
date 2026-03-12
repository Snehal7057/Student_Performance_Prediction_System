
package edu.spps.repository;

import java.util.List;

import edu.spps.model.SubjectModel;
import edu.spps.model.TeacherModel;

public interface AdminRepository {
	public boolean addTeacher(TeacherModel model);
	public List<SubjectModel> getAllSubjects();
	public List<TeacherModel> getAllTeacher();
	public boolean deleteTeacher(int id);
	TeacherModel getTeacherById(int id);

	public boolean updateTeacher(TeacherModel teacher);

	public List<TeacherModel> searchTeacher(String keyword);
}
