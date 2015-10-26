package asu.edu.sd.spring.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.PostConstruct;

import org.springframework.stereotype.Service;

import asu.edu.sd.spring.domain.Cube;
import asu.edu.sd.spring.domain.Dimension;
import asu.edu.sd.spring.domain.UnitConstants;
@Service
public class ShapeService implements IShapeService{

	private static List<String> unitsList = new ArrayList<String>();
	private static int NUMBER_TYPE_CUBE = 4;
	
	@PostConstruct
	public void init(){
		Map<String, Map<String, Double>> conversionMap = UnitConstants.CONVERSIONMAP;
		for(String unit:conversionMap.keySet()){
			unitsList.add(unit);
		}
	}

	@Override
	public Cube[] getOutput(Dimension inputDimension) {
		
		
		Cube[] cubes = new Cube[NUMBER_TYPE_CUBE];
		
		for(int i=0;i<cubes.length;i++){
			cubes[i] = getCubeType(inputDimension,i);
		}
		
		return cubes;
	}

	private Cube getCubeType(Dimension inputDimension, int type) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<String> getUnits() {
		return unitsList;
	}
	
	private double convertUnits(String inputUnit, String outputUnit) {
		return (UnitConstants.CONVERSIONMAP.get(inputUnit).get(outputUnit)) ;
	}
}