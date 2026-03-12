package edu.spps.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.spps.model.StudentModel;
import edu.spps.model.SubjectModel;
import edu.spps.model.TeacherModel;
import edu.spps.repository.AdminRepository;

@Service
public class AdminServiceImpl implements AdminService {

	@Autowired
	private AdminRepository adminRepo;

	@Override
	public boolean addTeacher(TeacherModel model) {
		return adminRepo.addTeacher(model);
	}

	@Override
	public List<SubjectModel> getAllSubjects() {
		return adminRepo.getAllSubjects();
	}

	@Override
	public List<TeacherModel> getAllTeacher() {
		return adminRepo.getAllTeacher();
	}

	@Override
	public boolean deleteTeacher(int id) {
		return adminRepo.deleteTeacher(id);
	}

	@Override
	public TeacherModel getTeacherById(int id) {
		return adminRepo.getTeacherById(id);
	}

	@Override
	public boolean updateTeacher(TeacherModel teacher) {
		return adminRepo.updateTeacher(teacher);
	}

	@Override
	public List<TeacherModel> searchTeacher(String keyword) {
		return adminRepo.searchTeacher(keyword);
	}

	@Override
	public List<StudentModel> getAllStudents() {
		return adminRepo.getAllStudents();
	}

}
