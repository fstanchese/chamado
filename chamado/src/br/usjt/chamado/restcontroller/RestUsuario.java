package br.usjt.chamado.restcontroller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import br.usjt.chamado.model.Usuario;
import br.usjt.chamado.service.UsuarioService;

@RestController
public class RestUsuario {

	private UsuarioService serviceUsuario;

	@Autowired
	public RestUsuario(UsuarioService serviceUsuario) {
		this.serviceUsuario = serviceUsuario;
	}
	
	@RequestMapping(value="/rest/v1/usuarios",method = RequestMethod.GET)
	public List<Usuario> listarTodos() {
		List<Usuario> usuarios = serviceUsuario.listar();
		return usuarios;
	}
}
