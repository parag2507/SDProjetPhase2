package asu.edu.sd.spring.domain;

import java.util.ArrayList;
import java.util.List;

public class Shape {

	private List<Piece> pieces = new ArrayList<Piece>();
	private double volume;

	public List<Piece> getPieces() {
		return pieces;
	}

	public void setPieces(List<Piece> pieces) {
		this.pieces = pieces;
	}

	public double getVolume() {
		return volume;
	}

	public void setVolume(double volume) {
		this.volume = volume;
	}

	public void addPiece(Piece piece) {

		pieces.add(piece);

	}

}
