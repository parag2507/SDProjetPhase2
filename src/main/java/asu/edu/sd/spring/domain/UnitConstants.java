package asu.edu.sd.spring.domain;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class UnitConstants {

	public static String METER = "meter";
	public static String CENTIMETER = "centimeter";
	public static String INCHES = "inches";
	public static String YARDS = "yards";

	public static Map<String, Map<String, Double>> CONVERSIONMAP = populateConversionMap();

	public static List<String> unitsList = new ArrayList<String>();

	static {
		unitsList.add(METER);
		unitsList.add(CENTIMETER);
		unitsList.add(INCHES);
		unitsList.add(YARDS);
	}

	private static Map<String, Map<String, Double>> populateConversionMap() {

		Map<String, Map<String, Double>> conversionMap = new HashMap<>();

		Map<String, Double> meterMap = new HashMap<String, Double>();
		meterMap.put(METER, (double) 1);
		meterMap.put(CENTIMETER, (double) 100);
		meterMap.put(INCHES, (double) 39.37);
		meterMap.put(YARDS, (double) 1.09);
		conversionMap.put(METER, meterMap);

		Map<String, Double> centimeterMap = new HashMap<String, Double>();
		centimeterMap.put(METER, (double) 0.01);
		centimeterMap.put(CENTIMETER, (double) 1);
		centimeterMap.put(INCHES, (double) 0.393701);
		centimeterMap.put(YARDS, (double) 0.010936);
		conversionMap.put(CENTIMETER, centimeterMap);

		Map<String, Double> inchesMap = new HashMap<String, Double>();
		inchesMap.put(METER, (double) 0.02);
		inchesMap.put(CENTIMETER, (double) 2.54);
		inchesMap.put(INCHES, (double) 1.0);
		inchesMap.put(YARDS, (double) 0.027);
		conversionMap.put(INCHES, inchesMap);

		Map<String, Double> yardsMap = new HashMap<String, Double>();
		yardsMap.put(METER, (double) 0.91);
		yardsMap.put(CENTIMETER, (double) 91.44);
		yardsMap.put(INCHES, (double) 36);
		yardsMap.put(YARDS, (double) 1);
		conversionMap.put(YARDS, yardsMap);

		return conversionMap;
	}

	public static double getConversionFactor(String unit) {
		
		Map<String, Double> unitMap = CONVERSIONMAP.get(unit);
		return unitMap.get(CENTIMETER);
	}

	public static double getInverseConversionFactor(String unit) {

		Map<String, Double> centimeterMap = CONVERSIONMAP.get(CENTIMETER);
		return centimeterMap.get(unit);
	}

}
