package edu.spps.model;

import java.time.LocalDate;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class PredictionModel {

	private int prediction_id;
	private int student_id;
	private String name;
	private String month;
	private double predicted_score;
	private LocalDate created_at;
}