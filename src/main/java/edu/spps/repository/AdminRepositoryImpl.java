package edu.spps.repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import edu.spps.model.SubjectModel;
import edu.spps.model.TeacherModel;

@Repository
public class AdminRepositoryImpl implements AdminRepository {
	@Autowired
	JdbcTemplate jdbcTemplate;

	@Override
	public boolean addTeacher(TeacherModel model) {
		String sql = "insert into teachers(name,email,contact,experience,subject_id) values(?,?,?,?,?)";

		int value = jdbcTemplate.update(sql, model.getName(), model.getEmail(), model.getContact(),
				model.getExperience(), model.getSubid());
		return value > 0 ? true : false;
	}

	@Override
	public List<SubjectModel> getAllSubjects() {
		String sql = "select *from subjects";

		return jdbcTemplate.query(sql, new RowMapper<SubjectModel>() {

			@Override
			public SubjectModel mapRow(ResultSet rs, int rowNum) throws SQLException {
				SubjectModel sm = new SubjectModel();
				sm.setId(rs.getInt("id"));
				sm.setSubName(rs.getString("subject_name"));
				return sm;
			}

		});
	}

}
