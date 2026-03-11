package edu.spps.service;

import java.util.List;

import edu.spps.model.SubjectModel;
import edu.spps.model.TeacherModel;

public interface AdminService {
	public boolean addTeacher(TeacherModel model);

	public List<SubjectModel> getAllSubjects();

	public List<TeacherModel> getAllTeacher();

	public boolean deleteTeacher(int id);

	TeacherModel getTeacherById(int id);
}