package edu.spps.security;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

@Service
public class CustomUserDetailsService implements UserDetailsService {

	@Autowired
	JdbcTemplate jdbcTemplate;

	@Override
	public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException {

		// ADMIN
		String adminQuery = "SELECT email, contact FROM admins WHERE email=?";
		List<UserDetails> admin = jdbcTemplate.query(adminQuery, new Object[] { email },
				(rs, rowNum) -> User.withUsername(rs.getString("email")).password("{noop}" + rs.getString("contact"))
						.roles("ADMIN").build());

		if (!admin.isEmpty())
			return admin.get(0);

		String teacherQuery = "SELECT email, contact, status FROM teachers WHERE email=?";
		List<UserDetails> teacher = jdbcTemplate.query(teacherQuery, new Object[] { email }, (rs, rowNum) -> {

			String status = rs.getString("status");

			if (!status.equalsIgnoreCase("active")) {
				throw new UsernameNotFoundException("Teacher is inactive");
			}

			return User.withUsername(rs.getString("email")).password("{noop}" + rs.getString("contact"))
					.roles("TEACHER").build();
		});

		if (!teacher.isEmpty())
			return teacher.get(0);

		String studentQuery = "SELECT email, contact, status FROM students WHERE email=?";
		List<UserDetails> student = jdbcTemplate.query(studentQuery, new Object[] { email }, (rs, rowNum) -> {

			String status = rs.getString("status");

			if (!status.equalsIgnoreCase("active")) {
				throw new UsernameNotFoundException("Student is inactive");
			}

			return User.withUsername(rs.getString("email")).password("{noop}" + rs.getString("contact"))
					.roles("STUDENT").build();
		});

		if (!student.isEmpty())
			return student.get(0);

		throw new UsernameNotFoundException("User not found");
	}
}
