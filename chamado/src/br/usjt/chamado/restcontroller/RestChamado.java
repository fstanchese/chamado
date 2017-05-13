package br.usjt.chamado.restcontroller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import br.usjt.chamado.dao.ChamadoDAO;
import br.usjt.chamado.dao.UsuarioDAO;
import br.usjt.chamado.model.Chamado;
import br.usjt.chamado.model.Usuario;

@RestController
@RequestMapping("/rest/v1/chamados")
public class RestChamado {

	private ChamadoDAO daoChamado;
	private UsuarioDAO daoLogin;

	@Autowired
	public RestChamado(ChamadoDAO daoChamado, UsuarioDAO daoLogin) {
		this.daoChamado = daoChamado;
		this.daoLogin = daoLogin;
	}
	
	@RequestMapping(method = RequestMethod.GET)
	public List<Chamado> listarTodos(@RequestParam(value="login") String login) {
		Usuario usuario = daoLogin.buscaPorLogin(login);
		if (usuario != null) {
			return daoChamado.listarSolucionador(usuario);
		} else
			return null;
	}

}
