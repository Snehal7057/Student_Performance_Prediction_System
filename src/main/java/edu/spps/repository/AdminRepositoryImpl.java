package edu.spps.repository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import edu.spps.model.TeacherModel;

@Repository
public class AdminRepositoryImpl implements AdminRepository {
	@Autowired
	JdbcTemplate jdbcTemplate;

	@Override
	public boolean addTeacher(TeacherModel model) {
		String sql = "insert into teachers(name,email,contact,experience,subject_id) values(?,?,?,?,?)";

		int value = jdbcTemplate.update(sql, model.getTeacher_name(), model.getEmail(), model.getContact(),
				model.getExperience(), model.getSubid());
		return value > 0 ? true : false;
	}

}
