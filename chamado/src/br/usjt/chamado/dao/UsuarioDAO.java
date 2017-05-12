package br.usjt.chamado.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;

import br.usjt.chamado.model.Usuario;

@Repository
public class UsuarioDAO {

	@PersistenceContext
	EntityManager manager;

	public void adicionar(Usuario usuario) {
		manager.persist(usuario);
	}

	public void alterar(Usuario usuario) {
		manager.merge(usuario);
	}

	public void remover(Usuario usuario) {
		Usuario remover = buscaPorId(usuario.getId());
		manager.remove(remover);
	}
	
	public Usuario buscaPorId(Long id) {
		return manager.find(Usuario.class, id);
	}

	@SuppressWarnings("unchecked")
	public List<Usuario> listar() {
		return manager.createNamedQuery("Usuario.listar").getResultList();
	}
	
	public Usuario buscaPorUsuario(String login,String senha) {
		try {
			return (Usuario) manager.createNamedQuery("Usuario.buscaUsuario").
				setParameter("login", login).
				setParameter("senha", senha).
				getSingleResult();
		}catch (NoResultException nre){
			System.out.println("passei");
			return null;
		}		
	}

	public Usuario buscaPorLogin(String login) {
		try {
			return (Usuario) manager.createNamedQuery("Usuario.buscaLogin").
				setParameter("login", login).
				getSingleResult();
		}catch (NoResultException nre){
			System.out.println("passei");
			return null;
		}		
	}
	
	@SuppressWarnings("unchecked")
	public List<Usuario> listarSolucionador() {
		return manager.createNamedQuery("Usuario.listarSolucionador").getResultList();
	}

}
