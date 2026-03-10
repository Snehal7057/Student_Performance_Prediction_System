package edu.spps.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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

}
