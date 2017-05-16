package br.usjt.chamado.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;
import javax.persistence.PersistenceException;

import org.springframework.stereotype.Repository;

import br.usjt.chamado.model.Chamado;
import br.usjt.chamado.model.TipoUsuario;
import br.usjt.chamado.model.Usuario;

@Repository
public class ChamadoDAO {

	@PersistenceContext
	EntityManager manager;

	public void adicionar(Chamado chamado) {
		manager.persist(chamado);
	}

	public void alterar(Chamado chamado) {
		manager.merge(chamado);
	}

	public void remover(Chamado chamado) {
		Chamado remover = buscaPorId(chamado.getId());
		manager.remove(remover);
	}
	
	public Chamado buscaPorId(Long id) {
		return manager.find(Chamado.class, id);
	}

	@SuppressWarnings("unchecked")
	public List<Chamado> listarSolucionador(Usuario usuario) {
		List<Chamado> lista = null;
		if(usuario.getTipoUsuario() == TipoUsuario.SOLICITANTE ) {
			try {
				lista = manager.createNamedQuery("Chamado.listarSolicitante")
						.setParameter("solicitante", usuario)
						.getResultList();				
			}catch (PersistenceException e) {
				lista = null;	
			}
		} else if(usuario.getTipoUsuario() == TipoUsuario.ADMINISTRADOR )  {
			try {
				lista = manager.createNamedQuery("Chamado.listar").getResultList();			
			} catch (PersistenceException e) {
				lista = null;	
			}
		} else if(usuario.getTipoUsuario() == TipoUsuario.SOLUCIONADOR )  {
			try {
				lista = manager.createNamedQuery("Chamado.listarFila")
						.setParameter("fila", usuario.getFila())
						.setParameter("usuario", usuario)
						.getResultList();				
			} catch (PersistenceException e) {
				lista = null;	
			}
		
		}
		return lista;
	}

}
