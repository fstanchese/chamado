package br.usjt.chamado.service;

import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import br.usjt.chamado.dao.ChamadoDAO;
import br.usjt.chamado.model.Chamado;
import br.usjt.chamado.model.Status;
import br.usjt.chamado.model.Usuario;

@Service
public class ChamadoService {

	private ChamadoDAO daoChamado;
	private SLAService serviceSLA;
	
	@Autowired
	public ChamadoService(ChamadoDAO daoChamado, SLAService serviceSLA) {
		this.daoChamado = daoChamado;
		this.serviceSLA = serviceSLA;
	}
	
	public void adicionar(Chamado chamado) {
		Calendar limite = Calendar.getInstance();
		limite.add(Calendar.HOUR,chamado.getSla().getSLATempo());
		chamado.setDtCadastro(new Date());
		chamado.setDtLimite(limite.getTime());
		chamado.setStatus(Status.ABERTO);
		if (chamado.getAtivo() == null)
			chamado.setAtivo(1);
		daoChamado.adicionar(chamado);
	}
	
	public void alterar(Chamado chamado) {
		Chamado chamadolOld = buscaPorId(chamado.getId());
		chamado.setDtCadastro(chamadolOld.getDtCadastro());
		chamado.setDtLimite(chamadolOld.getDtLimite());
		chamado.setDtFimAtendimento(chamadolOld.getDtFimAtendimento());
		chamado.setDtInicioAtendimento(chamadolOld.getDtInicioAtendimento());
		chamado.setStatus(chamadolOld.getStatus());
		chamado.setSolicitante(chamadolOld.getSolicitante());
		if (chamado.getAtivo() == null)
			chamado.setAtivo(chamadolOld.getAtivo());
		daoChamado.alterar(chamado);
	}
	
	public void remover(Chamado chamado) {
		daoChamado.remover(chamado);
	}
	
	public Chamado buscaPorId(Long id) {
		return daoChamado.buscaPorId(id);
	}
	

	public List<Chamado> listarSolucionador(Usuario solicitante) {
        
		List<Chamado> lista = daoChamado.listarSolucionador(solicitante);
		for (Chamado chamado : lista) {
			String prazo = serviceSLA.calculaPrazo(chamado.getDtLimite());
			if (serviceSLA.estaAtrasado(chamado.getDtLimite())) {
			  chamado.setStatus(Status.ATRASADO);
			}
			chamado.setPrazo(prazo);
		}
		return lista;
	}
}