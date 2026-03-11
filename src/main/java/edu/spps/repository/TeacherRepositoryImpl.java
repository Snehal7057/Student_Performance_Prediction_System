package edu.spps.repository;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import edu.spps.model.StudentModel;

@Repository
public class TeacherRepositoryImpl implements TeacherRepository{
@Autowired
JdbcTemplate jdbcTemplate;

	@Override
	public boolean addStudent(StudentModel model) {
		String sql="insert into students(name,email,contact,location,role_id) values(?,?,?,?,?)";
		int value=jdbcTemplate.update(sql,model.getName(),model.getEmail(),model.getContact(),model.getLocation(),3);
		return value>0?true:false;
	}

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
//    	 s.setRole_id(rs.getInt("role_id"));
    	 return s;
     });
	 return list;
   }
}




