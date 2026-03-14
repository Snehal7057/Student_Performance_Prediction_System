package edu.spps.model;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class TeacherModel {
	private int id;
	private String name;
	private String email;
	private String contact;
	private int experience;
	private int subject_id;
	private int role_id;
	private String subjectName;
	private String createdDate;

}
