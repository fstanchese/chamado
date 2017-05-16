package br.usjt.chamado.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import br.usjt.chamado.dao.LoginDAO;
import br.usjt.chamado.model.Usuario;
import br.usjt.chamado.service.ChamadoService;

@Controller
public class LoginController {

	private LoginDAO daoLogin;
	private ChamadoService serviceChamado;

	@Autowired
	public LoginController(LoginDAO daoLogin, ChamadoService serviceChamado) {
		this.daoLogin = daoLogin;
		this.serviceChamado = serviceChamado;
	}

	@RequestMapping("loginForm")
	public String loginForm() {
		return "formulario-login";
	}

	@RequestMapping("menu")
	public String menuForm(Model model, HttpSession session) {
		Usuario usuario = (Usuario) session.getAttribute("usuarioLogado");
		model.addAttribute("chamados",serviceChamado.listarSolucionador(usuario));
		model.addAttribute("login", usuario);
		return "chamado/lista";
	}
	
	@RequestMapping("efetuaLogin")
	public String efetuaLogin(Usuario usuario, HttpSession session) {
		Usuario login = daoLogin.buscaUsuario(usuario);
		if (login.getId() != null) {
			System.out.println("usuario "+login.toString());
			session.setAttribute("usuarioLogado", login);
			return "redirect:menu";
		}
		return "redirect:loginForm";
	}

	@RequestMapping("logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:loginForm";
	}
}
