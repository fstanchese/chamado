package br.usjt.chamado.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;

import br.usjt.chamado.model.Fila;
import br.usjt.chamado.model.Usuario;

@Repository
public class FilaDAO {

	@PersistenceContext
	EntityManager manager;

	public Fila  adicionar(Fila fila) {
		return manager.merge(fila);
	}

	public void alterar(Fila fila) {
		manager.merge(fila);
	}

	public void remover(Fila fila) {
		Fila remover = buscaPorId(fila.getId());
		manager.remove(remover);
	}
	
	public Fila buscaPorId(Long id) {
		return manager.find(Fila.class, id);
	}

	@SuppressWarnings("unchecked")
	public List<Fila> listar() {
		List<Fila> filas = manager.createNamedQuery("Fila.listar").getResultList();
		for(Fila fila:filas) {
			try {
				Usuario usuario = (Usuario) manager.createNamedQuery("Usuario.buscaPorFila").setParameter("fila", fila).getSingleResult();
				fila.setNomeSolucionador(usuario.getNome());
			} catch (NoResultException nre) {
				fila.setNomeSolucionador("");
			}
		}
		return filas;
	}
	
	public Fila buscaPorNome(String nome) {
		return (Fila) manager.createNamedQuery("Fila.buscaPorNome").
				setParameter("nome", nome).getSingleResult();
	}

}
