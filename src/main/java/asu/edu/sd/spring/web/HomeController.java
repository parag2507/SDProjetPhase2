package asu.edu.sd.spring.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import asu.edu.sd.spring.domain.Dimension;
import asu.edu.sd.spring.domain.Piece;
import asu.edu.sd.spring.domain.Shape;
import asu.edu.sd.spring.domain.UnitConstants;
import asu.edu.sd.spring.service.IShapeService;

@Controller
public class HomeController {

	@Autowired
	private IShapeService shapeService;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView home() {
		
		ModelAndView model = new ModelAndView("index");
		model.addObject("command", new Dimension());
		model.addObject("unitList", UnitConstants.unitsList);
		return model;
	}

	@RequestMapping(value = "/processDimension")
	public ModelAndView processDimension(@ModelAttribute("SpringWeb") Dimension input
			) {
		
		ModelAndView model = new ModelAndView("index");
		
		Shape[] outputShape = shapeService.getShape(input.getShape(),input);
		
		for(Shape shape : outputShape){
			
			List<Piece> pieces = shape.getPieces();
			
			for(Piece piece:pieces){
				piece.setBottomLength(Math.abs(round(piece.getBottomLength(),1)));
				piece.setTopLength(Math.abs(round(piece.getTopLength(),1)));
			}
			shape.setVolume(Math.abs(round(shape.getVolume(),1)));
		}
		
		model.addObject("command", input);
		model.addObject("unitList", UnitConstants.unitsList);
		model.addObject("shapeType", input.getShape());
		model.addObject("shape", outputShape);
		return model;
	}	
	
	public static double round(double value, int places) {
	    if (places < 0) throw new IllegalArgumentException();

	    long factor = (long) Math.pow(10, places);
	    value = value * factor;
	    long tmp = Math.round(value);
	    return (double) tmp / factor;
	}
}