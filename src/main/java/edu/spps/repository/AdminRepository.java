package edu.spps.repository;

import java.util.List;

import edu.spps.model.SubjectModel;
import edu.spps.model.TeacherModel;

public interface AdminRepository {
	public boolean addTeacher(TeacherModel model);

	public List<SubjectModel> getAllSubjects();
}
