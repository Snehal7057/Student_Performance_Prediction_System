package edu.spps.model;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class StudyMaterialModel {

	private int id;
	private int subject_id;
	private String file_name;
	private int uploaded_by;
	private String upload_date;
	private String subject_name;
	private String teacher_name;

}
