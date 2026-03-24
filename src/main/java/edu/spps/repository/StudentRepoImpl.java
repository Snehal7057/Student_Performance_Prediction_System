package edu.spps.repository;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import edu.spps.model.PerformanceModel;
import edu.spps.model.StudentModel;

@Repository
public class StudentRepoImpl implements StudentRepo {

	@Autowired
	JdbcTemplate jdbcTemplate;

	public List<PerformanceModel> getPerformanceByStudentId(int studentId) {

		String sql = "select s.name,p.attendance,p.study_hours,p.assessment,p.participation,p.percentage,p.performance_date "
				+ "from students s join performance p on p.student_id=s.id " + "where p.student_id = ?";

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
		}, studentId);
	}

	@Override
	public StudentModel getStudentByEmail(String email) {
		String sql = "SELECT * FROM students WHERE email = ?";

		try {
			return jdbcTemplate.queryForObject(sql, new Object[] { email }, (rs, rowNum) -> {
				StudentModel student = new StudentModel();
				student.setId(rs.getInt("id"));
				student.setName(rs.getString("name"));
				student.setEmail(rs.getString("email"));
				student.setPassword(rs.getString("contact"));
				return student;
			});
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
}
