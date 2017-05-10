package br.usjt.chamado.test;

import javax.transaction.Transactional;

import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.transaction.TransactionConfiguration;

import br.usjt.chamado.dao.FilaDAO;
import br.usjt.chamado.model.Fila;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations="file:WebContent/WEB-INF/spring-context.xml")
@TransactionConfiguration(defaultRollback=true)
public class FilaDAOTest {

	@Autowired
	FilaDAO filaDAO;
	
	@Transactional
	@Test
	public void salvarTest() {
		Fila fila = new Fila();
		
		fila.setDescricao("Fila 1");
		
		Fila filaSalvo = filaDAO.adicionar(fila);	
		Assert.assertNotNull(filaSalvo);
	}
	
	@Transactional
	@Test
	public void excluirTest() {
		Fila fila = new Fila();
		
		fila.setDescricao("Fila 1");
		
		Fila filaSalvo = filaDAO.adicionar(fila);	
		Long id = filaSalvo.getId();
		
		filaDAO.remover(filaSalvo);
		
		Fila filaExcluido = filaDAO.buscaPorId(id);
		
		Assert.assertNull(filaExcluido);
		
	}
}
