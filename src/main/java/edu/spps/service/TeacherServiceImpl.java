package edu.spps.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.spps.model.PerformanceModel;
import edu.spps.model.PredictionModel;
import edu.spps.model.StudentModel;
import edu.spps.model.StudyMaterialModel;
import edu.spps.model.TeacherModel;
import edu.spps.repository.TeacherRepository;

@Service
public class TeacherServiceImpl implements TeacherService {

	@Autowired
	private TeacherRepository studRepo;

	@Override
	public boolean addStudent(StudentModel model) {
		return studRepo.addStudent(model);
	}

	@Override
	public List<StudentModel> getAllStudents() {
		return studRepo.getAllStudents();
	}

	@Override
	public boolean deleteStudent(int id) {
		return studRepo.deleteStudent(id);
	}

	@Override
	public boolean isUpdateStudent(StudentModel model) {
		return studRepo.isUpdateStudent(model);
	}

	@Override
	public StudentModel getStudentById(int id) {
		return studRepo.getStudentById(id);
	}

	@Override
	public List<StudentModel> searchStudent(String keyword) {
		return studRepo.searchStudent(keyword);
	}

	@Override
	public boolean addPerformance(PerformanceModel model) {
		return studRepo.addPerformance(model);
	}

	@Override
	public List<PerformanceModel> getAllPerformance() {
		return studRepo.getAllPerformance();
	}

	@Override
	public boolean uploadMaterial(StudyMaterialModel model) {
		return studRepo.uploadMaterial(model);
	}

	public List<StudyMaterialModel> getAllMaterials() {
		return studRepo.getAllMaterials();
	}

	@Override
	public List<PerformanceModel> searchNameforPerformance(String word) {
		return studRepo.searchNameforPerformance(word);
	}

	@Override
	public boolean deactivateStudent(int id) {
		// TODO Auto-generated method stub
		return studRepo.deactivateStudent(id);
	}

	@Override
	public boolean activateStudent(int id) {
		// TODO Auto-generated method stub
		return studRepo.activateStudent(id);
	}

	@Override
	public PerformanceModel getAvgPerformance(int studentId) {
		// TODO Auto-generated method stub
		return studRepo.getAvgPerformance(studentId);
	}

	@Override
	public List<PredictionModel> getAllPrediction() {
		// TODO Auto-generated method stub
		return studRepo.getAllPrediction();
	}

	@Override
	public TeacherModel getTeacherByEmail(String email) {
		// TODO Auto-generated method stub
		return studRepo.findByEmail(email);
	}

}
