package edu.spps.repository;

import java.util.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import edu.spps.model.PerformanceModel;
import edu.spps.model.StudentModel;
import edu.spps.model.TeacherModel;

@Repository
public class TeacherRepositoryImpl implements TeacherRepository{
@Autowired
JdbcTemplate jdbcTemplate;

    //Add Student
	@Override
	public boolean addStudent(StudentModel model) {
		String sql="insert into students(name,email,contact,location,role_id) values(?,?,?,?,?)";
		int value=jdbcTemplate.update(sql,model.getName(),model.getEmail(),model.getContact(),model.getLocation(),3);
		return value>0?true:false;
	}

	//View Student
	@Override
	public List<StudentModel> getAllStudents() {
     String sql="select * from students";
     List<StudentModel> list=jdbcTemplate.query(sql,(rs,rowNum) ->{
    	 StudentModel s=new StudentModel();
    	 s.setId(rs.getInt("id"));
    	 s.setName(rs.getString("name"));
    	 s.setEmail(rs.getString("email"));
    	 s.setContact(rs.getString("contact"));
    	 s.setLocation(rs.getString("location"));
       //s.setRole_id(rs.getInt("role_id"));
    	 return s;
     });
	 return list;
   }

	//Delete Student 
	@Override
	public boolean deleteStudent(int id) {
		String sql="delete from students where id=?";
	   int value=jdbcTemplate.update(sql,id);
		return value>0?true:false;
	}

	//Update Student Data
	@Override
	public boolean isUpdateStudent(StudentModel model) {
		String sql="update students set name=? , email=? ,contact=?, location=? where id=?";
		int value=jdbcTemplate.update(sql,model.getName(),model.getEmail(),model.getContact(),model.getLocation(),model.getId());
		return value>0?true:false;
	}

	//Handle Update Submission
	@Override
	public StudentModel getStudentById(int id) {
		String sql="select * from students where id=?";
		return jdbcTemplate.queryForObject(sql,new Object[] {id},(rs,rowNum)->{
			StudentModel s=new StudentModel();
			s.setId(rs.getInt("id"));
			s.setName(rs.getString("name"));
			s.setEmail(rs.getString("email"));
			s.setContact(rs.getString("contact"));
			s.setLocation(rs.getString("location"));
            return s;
		});
	}

	//Search By Name
	@Override
	public List<StudentModel> searchStudent(String keyword) {
		String sql="select * from students where name like ?";
		
		String searchKeyword="%"+keyword+"%";
		
		return jdbcTemplate.query(sql, new Object[] {searchKeyword}, 
				(rs,rowNum) -> {
					StudentModel s=new StudentModel();
			        s.setId(rs.getInt("id"));
			        s.setName(rs.getString("name"));
			        s.setEmail(rs.getString("email"));
			        s.setContact(rs.getString("contact"));
			        s.setLocation(rs.getString("location"));
			        return s;
				});
	}

	//Add Student Performance
	@Override
	public boolean addPerformance(PerformanceModel model) {
		String sql = "insert into performance(student_id,attendance,study_hours,assessment,participation,percentage) values(?,?,?,?,?,?)";

	    int value = jdbcTemplate.update(sql,
	            model.getStudent_id(),
	            model.getAttendance(),
	            model.getStudy_hours(),
	            model.getAssessment(),
	            model.getParticipation(),
	            model.getPercentage());
	    
		return value>0?true:false;
	}

	//View Performance
	@Override
	public List<PerformanceModel> getAllPerformance() {
		String sql="select s.name,p.attendance,p.study_hours,p.assessment,p.participation,p.percentage,p.performance_date from students s join performance p on p.student_id=s.id";
		return jdbcTemplate.query(sql,(rs,rowNum)->{
			
			PerformanceModel p=new PerformanceModel();
			p.setName(rs.getString("name"));
			p.setAttendance(rs.getInt("attendance"));
			p.setStudy_hours(rs.getInt("study_hours"));
			p.setAssessment(rs.getInt("assessment"));
			p.setParticipation(rs.getInt("participation"));
			p.setPercentage(rs.getDouble("percentage"));
			p.setPerformance_date(rs.getDate("performance_date").toLocalDate());			return p;
		});
	}		
}
