package edu.spps.model;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class StudentModel {
	private int id;
	private String name;
	private String email;
	private String contact;
	private String location;
	private int role_id;
	private String createdDate;
}
