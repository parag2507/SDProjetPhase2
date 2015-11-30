package asu.edu.sd.spring.domain;

import org.apache.commons.math3.linear.Array2DRowRealMatrix;
import org.apache.commons.math3.linear.ArrayRealVector;
import org.apache.commons.math3.linear.DecompositionSolver;
import org.apache.commons.math3.linear.LUDecomposition;
import org.apache.commons.math3.linear.RealMatrix;
import org.apache.commons.math3.linear.RealVector;

/* References: http://userpages.umbc.edu/~squire/cs455_l3.html
 * http://stackoverflow.com/questions/11609107/solving-a-simultaneous-equation-through-code
 */
public class Equations {

	public static Shape twoVariableEquationShape(double a, double b, double c,
			double d, double u, double v) {

		RealMatrix coefficients = new Array2DRowRealMatrix(new double[][] {
				{ a, b }, { c, d } }, false);
		DecompositionSolver solver = new LUDecomposition(coefficients)
				.getSolver();
		
		RealVector constants = new ArrayRealVector(new double[] { u,v }, false);
		RealVector solution = solver.solve(constants);

		Piece piece1 = new Piece();
		piece1.setBottomLength(solution.getEntry(0));
		piece1.setTopLength(solution.getEntry(0));
		piece1.setCount(8);

		Piece piece2 = new Piece();
		piece2.setBottomLength(solution.getEntry(1));
		piece2.setTopLength(solution.getEntry(1));
		piece2.setCount(4);

		Shape shape = new Shape();
		shape.addPiece(piece1);
		shape.addPiece(piece2);

		return shape;
	}

	public static Shape threeVariableEquationShape(double l,double w, double h) {
		
		RealMatrix coefficients = new Array2DRowRealMatrix(new double[][] {
				{ 1, -1, 0 }, { 0, 1, -1 }, { 4, 4, 4 } }, false);
		DecompositionSolver solver = new LUDecomposition(coefficients)
				.getSolver();
		
		RealVector constants = new ArrayRealVector(new double[] { 2*(h-w), -2*h, l }, false);
		RealVector solution = solver.solve(constants);
		
		Piece piece1 = new Piece();
		piece1.setBottomLength(solution.getEntry(0));
		piece1.setTopLength(solution.getEntry(0));
		piece1.setCount(4);

		Piece piece2 = new Piece();
		piece2.setBottomLength(solution.getEntry(1));
		piece2.setTopLength(solution.getEntry(1));
		piece2.setCount(4);
		
		Piece piece3 = new Piece();
		piece3.setBottomLength(solution.getEntry(2));
		piece3.setTopLength(solution.getEntry(2));
		piece3.setCount(4);

		
		Shape shape = new Shape();
		shape.addPiece(piece1);
		shape.addPiece(piece2);
		shape.addPiece(piece3);

		return shape;

	
	}

}

