package br.usjt.chamado.restcontroller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import br.usjt.chamado.dao.UsuarioDAO;
import br.usjt.chamado.model.Usuario;

@RestController
public class Autenticar {

	private UsuarioDAO daoLogin;

	@Autowired
	public Autenticar(UsuarioDAO daoLogin) {
		this.daoLogin = daoLogin;
	}
	
	@RequestMapping(value="/logar",method = RequestMethod.GET)
	public String efetuaLogin(@RequestParam(value="login") String login, @RequestParam(value="senha") String senha ) {
		Usuario usuario = daoLogin.buscaPorLogin(login);
		if (!usuario.getSenha().equals(senha)) {
			return "login_erro";
		}
		System.out.println("usuario "+login.toString());
		return "login_ok";
	}
}
