package edu.spps.model;

import java.time.LocalDate;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class PerformanceModel {
	private int id;
	private int student_id;
	private String name;
	private double attendance;
	private double study_hours;
	private double assessment;
	private double participation;
	private Double percentage;
	private LocalDate performance_date;
}
