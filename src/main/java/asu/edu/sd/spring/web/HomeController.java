package asu.edu.sd.spring.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import asu.edu.sd.spring.domain.Cube;
import asu.edu.sd.spring.domain.Dimension;
import asu.edu.sd.spring.service.IShapeService;

@Controller
public class HomeController {

	@Autowired
	private IShapeService shapeService;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView home() {
		
		ModelAndView model = new ModelAndView("index");
		model.addObject("command", new Dimension());
		model.addObject("unitList", shapeService.getUnits());
		return model;
	}

	@RequestMapping(value = "/processDimension")
	public ModelAndView processDimension(@ModelAttribute("SpringWeb") Dimension input
			) {
		
		ModelAndView model = new ModelAndView("index");
		Cube[] outputCubes = shapeService.getOutput(input);
				
		model.addObject("command", input);
		model.addObject("output", outputCubes);
		model.addObject("unitList", shapeService.getUnits());
		model.addObject("shapeType", input.getShape());
		return model;
	}
	
	

	
}