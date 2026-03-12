package edu.spps.model;

import java.time.LocalDate;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class PerformanceModel {
  private int id;
  private int student_id;
  private int attendance;
  private int assessment;
  private int participation;
  private double percentage;
  private LocalDate performance_date;
}
