package asu.edu.sd.spring.service;

import java.util.List;

import asu.edu.sd.spring.domain.Cube;
import asu.edu.sd.spring.domain.Dimension;

public interface IShapeService {
	
	Cube[] getOutput(Dimension input);
	List<String> getUnits();
	
}
