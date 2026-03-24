package edu.spps.repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import edu.spps.model.PerformanceModel;
import edu.spps.model.PredictionModel;
import edu.spps.model.StudentModel;
import edu.spps.model.StudyMaterialModel;
import edu.spps.model.TeacherModel;

@Repository
public class TeacherRepositoryImpl implements TeacherRepository {
	@Autowired
	JdbcTemplate jdbcTemplate;

	// Add Student
	@Override
	public boolean addStudent(StudentModel model) {
		String sql = "insert into students(name,email,contact,location,role_id) values(?,?,?,?,?)";
		int value = jdbcTemplate.update(sql, model.getName(), model.getEmail(), model.getContact(), model.getLocation(),
				3);
		return value > 0 ? true : false;
	}

	// View Student
	@Override
	public List<StudentModel> getAllStudents() {
		String sql = "SELECT id, name, email, contact, location, status, DATE(created_date) as created_date FROM students";
		List<StudentModel> list = jdbcTemplate.query(sql, (rs, rowNum) -> {
			StudentModel s = new StudentModel();
			s.setId(rs.getInt("id"));
			s.setName(rs.getString("name"));
			s.setEmail(rs.getString("email"));
			s.setContact(rs.getString("contact"));
			s.setLocation(rs.getString("location"));
			s.setCreatedDate(rs.getString("created_date"));
			s.setStatus(rs.getString("status"));
			// s.setRole_id(rs.getInt("role_id"));
			return s;
		});
		return list;
	}

	// Delete Student
	@Override
	public boolean deleteStudent(int id) {
		String sql = "delete from students where id=?";
		int value = jdbcTemplate.update(sql, id);
		return value > 0 ? true : false;
	}

	// Update Student Data
	@Override
	public boolean isUpdateStudent(StudentModel model) {
		String sql = "update students set name=? , email=? ,contact=?, location=? where id=?";
		int value = jdbcTemplate.update(sql, model.getName(), model.getEmail(), model.getContact(), model.getLocation(),
				model.getId());
		return value > 0 ? true : false;
	}

	// Handle Update Submission
	@Override
	public StudentModel getStudentById(int id) {
		String sql = "select * from students where id=?";
		return jdbcTemplate.queryForObject(sql, new Object[] { id }, (rs, rowNum) -> {
			StudentModel s = new StudentModel();
			s.setId(rs.getInt("id"));
			s.setName(rs.getString("name"));
			s.setEmail(rs.getString("email"));
			s.setContact(rs.getString("contact"));
			s.setLocation(rs.getString("location"));
			return s;
		});
	}

	// Search By Name in Student Table
	@Override
	public List<StudentModel> searchStudent(String keyword) {
		String sql = "select * from students where name like ?";

		String searchKeyword = "%" + keyword + "%";

		return jdbcTemplate.query(sql, new Object[] { searchKeyword }, (rs, rowNum) -> {
			StudentModel s = new StudentModel();
			s.setId(rs.getInt("id"));
			s.setName(rs.getString("name"));
			s.setEmail(rs.getString("email"));
			s.setContact(rs.getString("contact"));
			s.setLocation(rs.getString("location"));
			return s;
		});
	}

	// Add Student Performance
	@Override
	public boolean addPerformance(PerformanceModel model) {
		String sql = "insert into performance(student_id,attendance,study_hours,assessment,participation,percentage) values(?,?,?,?,?,?)";
		int value = jdbcTemplate.update(sql, model.getStudent_id(), model.getAttendance(), model.getStudy_hours(),
				model.getAssessment(), model.getParticipation(), model.getPercentage());
		return value > 0 ? true : false;
	}

	// View Performance
	@Override
	public List<PerformanceModel> getAllPerformance() {
		String sql = "select s.name,p.attendance,p.study_hours,p.assessment,p.participation,p.percentage,p.performance_date from students s join performance p on p.student_id=s.id";
		return jdbcTemplate.query(sql, (rs, rowNum) -> {

			PerformanceModel p = new PerformanceModel();
			p.setName(rs.getString("name"));
			p.setAttendance(rs.getInt("attendance"));
			p.setStudy_hours(rs.getInt("study_hours"));
			p.setAssessment(rs.getInt("assessment"));
			p.setParticipation(rs.getInt("participation"));
			p.setPercentage(rs.getDouble("percentage"));
			p.setPerformance_date(rs.getDate("performance_date").toLocalDate());
			return p;
		});
	}

	// Upload Files
	@Override
	public boolean uploadMaterial(StudyMaterialModel model) {
		String sql = "insert into study_materials(subject_id,file_name,uploaded_by) values (?,?,?)";

		int value = jdbcTemplate.update(sql, model.getSubject_id(), model.getFile_name(), model.getUploaded_by());
		return value > 0;
	}

	// Search By Name in Performance Table
	public List<PerformanceModel> searchNameforPerformance(String word) {
		String sql = "select s.name,p.attendance,p.study_hours,p.assessment,"
				+ "p.participation,p.percentage,p.performance_date "
				+ "from students s join performance p on p.student_id=s.id " + "where s.name like ?";
		String search = "%" + word + "%";

		return jdbcTemplate.query(sql, new Object[] { search }, (rs, rowNum) -> {
			PerformanceModel pm = new PerformanceModel();
			pm.setName(rs.getString("name"));
			pm.setAttendance(rs.getInt("attendance"));
			pm.setStudy_hours(rs.getInt("study_hours"));
			pm.setAssessment(rs.getInt("assessment"));
			pm.setParticipation(rs.getInt("participation"));
			pm.setPercentage(rs.getDouble("percentage"));
			pm.setPerformance_date(rs.getDate("performance_date").toLocalDate());
			return pm;
		});
	}

	// View Study material

	@Override
	public List<StudyMaterialModel> getAllMaterials() {
		String sql = "select sm.id, s.subject_name, sm.file_name, t.name as teacher_name,DATE(sm.upload_date) as upload_date from study_materials sm inner join subjects s on sm.subject_id = s.id inner join teachers t on sm.uploaded_by = t.id";
		return jdbcTemplate.query(sql, (rs, rowNum) -> {

			StudyMaterialModel m = new StudyMaterialModel();

			m.setId(rs.getInt("id"));
			m.setSubject_name(rs.getString("subject_name"));
			m.setFile_name(rs.getString("file_name"));
			m.setTeacher_name(rs.getString("teacher_name"));
			m.setUpload_date(rs.getString("upload_date"));

			return m;
		});
	}

	// Deactivate Student
	@Override
	public boolean deactivateStudent(int id) {
		String sql = "update students set status='inactive' where id=?";
		int result = jdbcTemplate.update(sql, id);
		return result > 0;
	}

	// Activate Student
	@Override
	public boolean activateStudent(int id) {
		String sql = "update students set status='active' where id=?";
		int result = jdbcTemplate.update(sql, id);
		return result > 0;
	}

	public PerformanceModel getAvgPerformance(int studentId) {
		String countSql = "SELECT COUNT(*) FROM performance WHERE student_id=?";
		int count = jdbcTemplate.queryForObject(countSql, Integer.class, studentId);
		if (count == 0)
			return null;

		String sqlAvg = "SELECT AVG(attendance) AS attendance, " + "AVG(study_hours) AS study_hours, "
				+ "AVG(assessment) AS assessment, " + "AVG(participation) AS participation "
				+ "FROM performance WHERE student_id=?";

		return jdbcTemplate.queryForObject(sqlAvg, new Object[] { studentId }, (rs, rowNum) -> {
			PerformanceModel m = new PerformanceModel();
			m.setStudent_id(studentId);
			m.setAttendance(rs.getDouble("attendance"));
			m.setStudy_hours(rs.getDouble("study_hours"));
			m.setAssessment(rs.getDouble("assessment"));
			m.setParticipation(rs.getDouble("participation"));

			return m;
		});
	}

	@Override
	public List<PredictionModel> getAllPrediction() {
		String sql = "SELECT p.prediction_id, p.student_id, s.name, p.month, p.predicted_score, p.created_at "
				+ "FROM predictions p " + "JOIN students s ON p.student_id = s.id " + "ORDER BY p.month DESC";

		return jdbcTemplate.query(sql, (rs, rowNum) -> {
			PredictionModel p = new PredictionModel();
			p.setPrediction_id(rs.getInt("prediction_id"));
			p.setStudent_id(rs.getInt("student_id"));
			p.setName(rs.getString("name"));
			p.setMonth(rs.getString("month"));
			p.setPredicted_score(rs.getDouble("predicted_score"));
			p.setCreated_at(rs.getTimestamp("created_at").toLocalDateTime().toLocalDate());
			return p;
		});
	}

	private RowMapper<TeacherModel> rowMapper = new RowMapper<TeacherModel>() {
		@Override
		public TeacherModel mapRow(ResultSet rs, int rowNum) throws SQLException {
			TeacherModel t = new TeacherModel();
			t.setId(rs.getInt("id"));
			t.setEmail(rs.getString("email"));
			t.setPassword(rs.getString("contact"));
			t.setName(rs.getString("name"));
			return t;
		}
	};

	@Override
	public TeacherModel findByEmail(String email) {

		String sql = "SELECT * FROM teachers WHERE email = ?";

		List<TeacherModel> list = jdbcTemplate.query(sql, rowMapper, email);

		if (list.isEmpty()) {
			return null;
		}

		return list.get(0);
	}

}