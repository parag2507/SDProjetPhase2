package asu.edu.sd.spring.service;

import asu.edu.sd.spring.domain.Dimension;
import asu.edu.sd.spring.domain.Shape;


public interface IShapeService {

	Shape[] getShape(String string,Dimension dimension);
	
}
