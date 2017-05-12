package br.usjt.chamado.restcontroller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import br.usjt.chamado.dao.UsuarioDAO;
import br.usjt.chamado.model.Usuario;

@RestController
public class RestUsuario {

	private UsuarioDAO daoUsuario;

	@Autowired
	public RestUsuario(UsuarioDAO daoUsuario) {
		this.daoUsuario = daoUsuario;
	}
	
	@RequestMapping(value="/listarusuarios",method = RequestMethod.GET)
	public List<Usuario> listarTodos() {
		List<Usuario> usuarios = daoUsuario.listar();
		return usuarios;
	}
}
