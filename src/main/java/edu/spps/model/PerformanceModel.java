package edu.spps.model;

import java.time.LocalDate;
import java.time.LocalDateTime;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class PerformanceModel {
  private int id;
  private int student_id;
  private String name;  
  private Integer attendance;
  private Integer study_hours;
  private Integer assessment;
  private Integer participation;
  private Double percentage;
  private LocalDate performance_date;
}
