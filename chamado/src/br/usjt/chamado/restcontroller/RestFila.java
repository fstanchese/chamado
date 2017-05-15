package br.usjt.chamado.restcontroller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import br.usjt.chamado.dao.FilaDAO;
import br.usjt.chamado.model.Fila;

@RestController
public class RestFila {

	private FilaDAO daoFila;

	@Autowired
	public RestFila(FilaDAO daoFila) {
		this.daoFila = daoFila;
	}
	
	@RequestMapping(value="/rest/v1/filas",method = RequestMethod.GET)
	public List<Fila> listarTodos() {
		List<Fila> filas = daoFila.listar();
		return filas;
	}
}
