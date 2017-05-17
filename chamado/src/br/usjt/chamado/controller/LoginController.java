package br.usjt.chamado.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import br.usjt.chamado.dao.LoginDAO;
import br.usjt.chamado.model.Usuario;

@Controller
public class LoginController {

	private LoginDAO daoLogin;

	@Autowired
	public LoginController(LoginDAO daoLogin) {
		this.daoLogin = daoLogin;
	}

	@RequestMapping("loginForm")
	public String loginForm() {
		return "formulario-login";
	}

	@RequestMapping("menu")
	public String menuForm(Model model, HttpSession session) {
		return "menuPrincipal";
	}
	
	@RequestMapping("efetuaLogin")
	public String efetuaLogin(Model model, Usuario usuario, HttpSession session) {
		Usuario login = daoLogin.buscaUsuario(usuario);
		if (login.getId() != null) {
			session.setAttribute("usuarioLogado", login);
			model.addAttribute("login", login);
			return "redirect:chamados?statusId=ABERTO";
		}
		return "redirect:loginForm";
	}

	@RequestMapping("logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:loginForm";
	}
}
