package asu.edu.sd.spring.service;

import java.util.Map;

import javax.annotation.PostConstruct;

import org.springframework.stereotype.Service;

import asu.edu.sd.spring.domain.Dimension;
import asu.edu.sd.spring.domain.Equations;
import asu.edu.sd.spring.domain.Piece;
import asu.edu.sd.spring.domain.Shape;
import asu.edu.sd.spring.domain.UnitConstants;

@Service
public class ShapeService implements IShapeService {

	@PostConstruct
	public void init() {
		Map<String, Map<String, Double>> conversionMap = UnitConstants.CONVERSIONMAP;
	}

	private double convertUnits(String inputUnit, String outputUnit) {
		return (UnitConstants.CONVERSIONMAP.get(inputUnit).get(outputUnit));
	}

	@Override
	public Shape[] getShape(String shapeType, Dimension dimension) {

		Shape[] shapes = null;
		if (shapeType.equals("cube")) {
			shapes = getCubes(dimension);
		} else if (shapeType.equals("spyramid")) {
			shapes = getSquarePyramid(dimension);
		} else if (shapeType.equals("tpyramid")) {
			shapes = getTriangularPyramid(dimension);
		}
		return shapes;
	}

	private Shape[] getTriangularPyramid(Dimension dimension) {
		Shape[] pyramid = new Shape[1];
		
		Piece piece = new Piece();
		
		piece.setBottomLength(dimension.getLength()/6);
		piece.setTopLength(dimension.getLength()-((2*dimension.getWidth())/Math.sqrt(3.0)));
		piece.setCount(6);
		
		Shape shape = new Shape();
		shape.addPiece(piece);
		pyramid[0] = shape;
		return pyramid;
	}

	private Shape[] getSquarePyramid(Dimension dimension) {
		Shape[] pyramid = new Shape[1];

		return pyramid;
	}

	private Shape[] getCubes(Dimension dimension) {
		Shape[] cubes = new Shape[4];

		double w = dimension.getWidth();
		double l = dimension.getLength();
		double h = dimension.getHeight();

		// Type 1

		double a = 1, b = -1, u = -(w + h);
		double c = 8, d = 4, v = l;
		cubes[0] = Equations.twoVariableEquationShape(a, b, c, d, u, v);

		// Type2 and Type 4
		Shape cubeType24 = Equations.threeVariableEquationShape(l,w,h);
		cubes[1] = cubeType24;
		cubes[3] = cubeType24;

		// Type3

		a = 1;
		b = -1;
		u = (2 * h - w);
		c = 8;
		d = 4;
		v = l;
		cubes[2] = Equations.twoVariableEquationShape(a, b, c, d, u, v);

		return cubes;
	}
}