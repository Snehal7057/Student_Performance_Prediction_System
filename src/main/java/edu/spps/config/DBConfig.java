package edu.spps.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.datasource.DriverManagerDataSource;

@Configuration
@ComponentScan(basePackages = { "edu.spps" })
public class DBConfig {

@Bean
public DriverManagerDataSource getDataSource() {

DriverManagerDataSource dataSource = new DriverManagerDataSource();

dataSource.setDriverClassName("com.mysql.cj.jdbc.Driver");
dataSource.setUrl("jdbc:mysql://localhost:3306/student_performance");
dataSource.setUsername("root");
dataSource.setPassword("root");

return dataSource;
}

@Bean
public JdbcTemplate jdbcTemplate(DriverManagerDataSource ds) {
return new JdbcTemplate(ds);
}
}
