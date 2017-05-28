package br.usjt.chamado.restcontroller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import br.usjt.chamado.model.Chamado;
import br.usjt.chamado.model.Usuario;
import br.usjt.chamado.service.ChamadoService;
import br.usjt.chamado.service.UsuarioService;

@RestController
public class RestChamado {

	private ChamadoService serviceChamado;
	private UsuarioService serviceLogin;

	@Autowired
	public RestChamado(ChamadoService serviceChamado, UsuarioService serviceLogin) {
		this.serviceChamado = serviceChamado;
		this.serviceLogin = serviceLogin;
	}
	
	@RequestMapping(value="/rest/v1/chamados", method = RequestMethod.GET)
	public List<Chamado> listarTodos(@RequestParam(value="login") String login, @RequestParam(value="status") String status ) {
		Usuario usuario = serviceLogin.buscaPorLogin(login);
		if (usuario != null) {
			return serviceChamado.listarSolucionador(usuario,status);
		} else
			return null;
	}

	@RequestMapping(value="/rest/v1/chamado/{id}", method = RequestMethod.GET)
	public Chamado getChamado(@PathVariable("id") long id) {
		Chamado chamado = serviceChamado.buscaPorId(id);
		if (chamado != null) {
			return chamado;
		}
		return null;
	}
	
	@RequestMapping(value="/rest/v1/chamado/", method = RequestMethod.POST)
	public ResponseEntity<Chamado> addChamado(@RequestBody Chamado chamado) {
		if (chamado.getId() == null) {
			serviceChamado.adicionar(chamado);
			return new ResponseEntity<Chamado>(chamado,HttpStatus.CREATED);
		}
		return new ResponseEntity<Chamado>(chamado,HttpStatus.CONFLICT);
	}	
	
	@RequestMapping(value="/rest/v1/chamado/", method = RequestMethod.PUT)
	public ResponseEntity<Chamado> editChamado(@RequestBody Chamado chamado) {
		if (chamado.getId() != null) {
			serviceChamado.alterar(chamado);
			return new ResponseEntity<Chamado>(chamado,HttpStatus.OK);
		}
		return new ResponseEntity<Chamado>(chamado,HttpStatus.CONFLICT);
	}
	
	@RequestMapping(value="/rest/v1/chamado/atende", method = RequestMethod.PUT)
	public ResponseEntity<Chamado> atendeChamado(@RequestBody Chamado chamado) {
		if (chamado.getId() != null) {
			serviceChamado.atender(chamado);
			return new ResponseEntity<Chamado>(chamado,HttpStatus.OK);
		}
		return new ResponseEntity<Chamado>(chamado,HttpStatus.CONFLICT);
	}
}
