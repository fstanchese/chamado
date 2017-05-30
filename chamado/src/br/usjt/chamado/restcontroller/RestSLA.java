package br.usjt.chamado.restcontroller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import br.usjt.chamado.model.SLA;
import br.usjt.chamado.service.SLAService;

@RestController
public class RestSLA {

	private SLAService serviceSLA;

	@Autowired
	public RestSLA(SLAService serviceSLA) {
		this.serviceSLA = serviceSLA;
	}
	
	@RequestMapping(value="/rest/v1/sla",method = RequestMethod.GET)
	public List<SLA> listarTodos(@RequestParam(value="id") Long id) {
		List<SLA> slas = serviceSLA.listarUsuario(id);
		return slas;
	}
}
