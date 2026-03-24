package edu.spps.ml;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

import edu.spps.model.PredictionModel;
import weka.classifiers.trees.RandomForest;
import weka.core.Attribute;
import weka.core.DenseInstance;
import weka.core.Instance;
import weka.core.Instances;

@Service
public class WekaPredictionService {

	@Autowired
	private JdbcTemplate jdbcTemplate;

	public double predict(int studentId, double attendance, double studyHours, double assessment,
			double participation) {

		double predicted = 0;

		try {
			ArrayList<Attribute> attributes = new ArrayList<>();
			attributes.add(new Attribute("attendance"));
			attributes.add(new Attribute("study_hours"));
			attributes.add(new Attribute("assessment"));
			attributes.add(new Attribute("participation"));
			attributes.add(new Attribute("percentage"));

			Instances dataset = new Instances("StudentPerformance", attributes, 0);
			dataset.setClassIndex(4);

			String sql = "SELECT attendance, study_hours, assessment, participation, percentage FROM performance";

			List<Instance> instanceList = jdbcTemplate.query(sql, (rs, rowNum) -> {
				DenseInstance inst = new DenseInstance(5);
				inst.setValue(attributes.get(0), rs.getDouble("attendance"));
				inst.setValue(attributes.get(1), rs.getDouble("study_hours"));
				inst.setValue(attributes.get(2), rs.getDouble("assessment"));
				inst.setValue(attributes.get(3), rs.getDouble("participation"));
				inst.setValue(attributes.get(4), rs.getDouble("percentage"));
				return inst;
			});

			instanceList.forEach(dataset::add);

			RandomForest rf = new RandomForest();
			rf.buildClassifier(dataset);

			DenseInstance newInst = new DenseInstance(5);
			newInst.setValue(attributes.get(0), attendance);
			newInst.setValue(attributes.get(1), studyHours);
			newInst.setValue(attributes.get(2), assessment);
			newInst.setValue(attributes.get(3), participation);
			newInst.setDataset(dataset);

			predicted = rf.classifyInstance(newInst);

			String month = java.time.LocalDate.now().toString().substring(0, 7);
			String checkSql = "SELECT COUNT(*) FROM predictions WHERE student_id=? AND month=?";
			int count = jdbcTemplate.queryForObject(checkSql, Integer.class, studentId, month);

			if (count > 0)
				return -1;

			PredictionModel p = new PredictionModel();
			p.setStudent_id(studentId);
			p.setMonth(month);
			p.setPredicted_score(predicted);

			String insertSql = "INSERT INTO predictions(student_id, month, predicted_score) VALUES(?,?,?)";
			jdbcTemplate.update(insertSql, p.getStudent_id(), p.getMonth(), p.getPredicted_score());

		} catch (Exception e) {
			e.printStackTrace();
		}

		return predicted;
	}
}