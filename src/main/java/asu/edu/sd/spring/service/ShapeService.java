package asu.edu.sd.spring.service;

import java.util.Map;

import javax.annotation.PostConstruct;

import org.apache.commons.math3.linear.Array2DRowRealMatrix;
import org.apache.commons.math3.linear.ArrayRealVector;
import org.apache.commons.math3.linear.DecompositionSolver;
import org.apache.commons.math3.linear.LUDecomposition;
import org.apache.commons.math3.linear.RealMatrix;
import org.apache.commons.math3.linear.RealVector;
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
		 
		
		RealMatrix coefficients = new Array2DRowRealMatrix(new double[][] {
				{ 1, -1 }, { 3, 3 } }, false);

		DecompositionSolver solver = new LUDecomposition(coefficients)
				.getSolver();
		
		RealVector constants = new ArrayRealVector(new double[] { -dimension.getHeight(),dimension.getLength()}, false);
		RealVector solution = solver.solve(constants);

		Piece piece1 = new Piece();
		piece1.setBottomLength(solution.getEntry(0));
		piece1.setTopLength(solution.getEntry(0) - ((2*dimension.getWidth())/Math.sqrt(3)));
		piece1.setCount(3);

		Piece piece2 = new Piece();
		piece2.setBottomLength(solution.getEntry(1));
		piece2.setTopLength(solution.getEntry(1) - ((2*dimension.getWidth())/Math.sqrt(3)));
		piece2.setCount(3);

		Shape shape = new Shape();
		shape.addPiece(piece1);
		shape.addPiece(piece2);
		
		shape.setVolume(Math.pow(piece2.getBottomLength(), 3)/8.49);
		
		pyramid[0] = shape;
		return pyramid;
	}

	private Shape[] getSquarePyramid(Dimension dimension) {
		Shape[] pyramid = new Shape[1];
		
		RealMatrix coefficients = new Array2DRowRealMatrix(new double[][] {
				{ 0, -1.22, 1 }, { 1, -1, 0 }, { 2, 2, 4 } }, false);
		DecompositionSolver solver = new LUDecomposition(coefficients)
				.getSolver();
		
		RealVector constants = new ArrayRealVector(new double[] { -dimension.getHeight(), -2*dimension.getWidth(), dimension.getLength() }, false);
		RealVector solution = solver.solve(constants);
		
		Piece piece1 = new Piece();
		piece1.setBottomLength(solution.getEntry(0));
		piece1.setTopLength(solution.getEntry(0));
		piece1.setCount(2);

		Piece piece2 = new Piece();
		piece2.setBottomLength(solution.getEntry(1));
		piece2.setTopLength(solution.getEntry(1));
		piece2.setCount(2);
		
		Piece piece3 = new Piece();
		piece3.setBottomLength(solution.getEntry(2));
		piece3.setTopLength(solution.getEntry(2) - ((2*dimension.getWidth())/Math.sqrt(3)));
		piece3.setCount(4);

		
		Shape shape = new Shape();
		shape.addPiece(piece1);
		shape.addPiece(piece2);
		shape.addPiece(piece3);
		
		double slantHeight = piece3.getBottomLength() + dimension.getHeight();
		
		double height = Math.sqrt(Math.pow(slantHeight, 2) - (Math.pow(piece2.getBottomLength(), 2)/2));
		
		double volume = Math.pow(piece2.getBottomLength(),2)*height/3;
		
		shape.setVolume(volume);
		
		pyramid[0] = shape;

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