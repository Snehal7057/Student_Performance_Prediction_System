package edu.spps.repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import edu.spps.model.StudentModel;
import edu.spps.model.SubjectModel;
import edu.spps.model.TeacherModel;

@Repository
public class AdminRepositoryImpl implements AdminRepository {
	@Autowired
	JdbcTemplate jdbcTemplate;

	//Add Teacher
	@Override
	public boolean addTeacher(TeacherModel model) {
		String sql = "insert into teachers(name,email,contact,experience,subject_id) values(?,?,?,?,?)";

		int value = jdbcTemplate.update(sql, model.getName(), model.getEmail(), model.getContact(),
				model.getExperience(), model.getSubject_id());
		return value > 0 ? true : false;
	}

	//view All Subject
	@Override
	public List<SubjectModel> getAllSubjects() {
		String sql = "select *from subjects";

		return jdbcTemplate.query(sql, new RowMapper<SubjectModel>() {

			@Override
			public SubjectModel mapRow(ResultSet rs, int rowNum) throws SQLException {
				SubjectModel sm = new SubjectModel();
				sm.setId(rs.getInt("id"));
				sm.setSubjectName(rs.getString("subject_name"));
				return sm;
			}

		});
	}

	//View All Teacher
	@Override
	public List<TeacherModel> getAllTeacher() {
		String sql = "Select t.id, t.name, t.email, t.contact, t.experience, s.subject_name from teachers t inner join subjects s on t.subject_id = s.id";

		return jdbcTemplate.query(sql, new RowMapper<TeacherModel>() {

			@Override
			public TeacherModel mapRow(ResultSet rs, int rowNum) throws SQLException {
				TeacherModel tm = new TeacherModel();
				tm.setId(rs.getInt("id"));
				tm.setName(rs.getString("name"));
				tm.setEmail(rs.getString("email"));
				tm.setContact(rs.getString("contact"));
				tm.setExperience(rs.getInt("experience"));
				tm.setSubjectName(rs.getString("subject_name"));
				System.out.println("Teacher ID = " + rs.getInt("id"));
				return tm;
			}

		});
	}

	//Delete Teacher
	@Override
	public boolean deleteTeacher(int id) {
		String sql = "delete from teachers where id=?";
		int value = jdbcTemplate.update(sql, id);
		return value > 0 ? true : false;
	}

	//Delete by ID
	@Override
	public TeacherModel getTeacherById(int id) {
		String sql = "select * from teachers where id=?";
		List<TeacherModel> list = jdbcTemplate.query(sql, new Object[] { id }, new RowMapper<TeacherModel>() {
			@Override
			public TeacherModel mapRow(ResultSet rs, int rowNum) throws SQLException {

				TeacherModel tm = new TeacherModel();

				tm.setId(rs.getInt("id"));
				tm.setName(rs.getString("name"));
				tm.setEmail(rs.getString("email"));
				tm.setContact(rs.getString("contact"));
				tm.setExperience(rs.getInt("experience"));
				tm.setSubject_id(rs.getInt("subject_id"));

				return tm;
			}
		});

		if (list.isEmpty()) {
			return null;
		}

		return list.get(0);
	}

	//Update Teacher
	@Override
	public boolean updateTeacher(TeacherModel teacher) {

		String sql = "update teachers set name=?, email=?, contact=?, experience=?, subject_id=? where id=?";

		int value = jdbcTemplate.update(sql, teacher.getName(), teacher.getEmail(), teacher.getContact(),
				teacher.getExperience(), teacher.getSubject_id(), teacher.getId());

		return value > 0;
	}

	//Search Teacher
	@Override
	public List<TeacherModel> searchTeacher(String keyword) {

		String sql = "Select t.*, s.subject_name from teachers t inner join subjects s on t.subject_id = s.id where t.name like ? or t.email like ? or s.subject_name like ?";

		String key = "%" + keyword + "%";

		return jdbcTemplate.query(sql, new Object[] { key, key, key }, (rs, rowNum) -> {

			TeacherModel teacher = new TeacherModel();
			teacher.setId(rs.getInt("id"));
			teacher.setName(rs.getString("name"));
			teacher.setEmail(rs.getString("email"));
			teacher.setContact(rs.getString("contact"));
			teacher.setExperience(rs.getInt("experience"));
			teacher.setSubject_id(rs.getInt("subject_id"));
			teacher.setSubjectName(rs.getString("subject_name"));

			return teacher;
		});
	}
	
     //view Student Data
	@Override
	public List<StudentModel> getAllStudents() {
		String sql = "select * from students";
		List<StudentModel> list = jdbcTemplate.query(sql, (rs, rowNum) -> {
			StudentModel s = new StudentModel();
			s.setId(rs.getInt("id"));
			s.setName(rs.getString("name"));
			s.setEmail(rs.getString("email"));
			s.setContact(rs.getString("contact"));
			s.setLocation(rs.getString("location"));
			// s.setRole_id(rs.getInt("role_id"));
			return s;
		});
		return list;
	}

	//Search Student
	@Override
	public List<StudentModel> searchStudent(String word) {
		 String sql="select * from students where name like ?";
		
		 String search="%" + word +"%";
		 return jdbcTemplate.query(sql, new Object[] {search}, (rs,rowNum) -> {
			 StudentModel s=new StudentModel();
		     	s.setId(rs.getInt("id"));
				s.setName(rs.getString("name"));
				s.setEmail(rs.getString("email"));
				s.setContact(rs.getString("contact"));
				s.setLocation(rs.getString("location"));		
				return s;		
		 });
	}
}
