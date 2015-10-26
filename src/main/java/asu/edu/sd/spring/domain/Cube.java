package asu.edu.sd.spring.domain;

import java.util.ArrayList;
import java.util.List;

public class Cube {
	
	private List<Piece> cubePieces = new ArrayList<Piece>();
	private double volume;
	private String unit;
	
	public double getVolume() {
		return volume;
	}
	public void setVolume(double volume) {
		this.volume = volume;
	}
	public String getUnit() {
		return unit;
	}
	public void setUnit(String unit) {
		this.unit = unit;
	}
	public List<Piece> getCubePieces() {
		return cubePieces;
	}
	public void setCubePieces(List<Piece> cubePieces) {
		this.cubePieces = cubePieces;
	}
}
