package br.usjt.chamado.service;

import java.time.Instant;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.temporal.ChronoUnit;
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

	@Autowired
	public ChamadoService(ChamadoDAO daoChamado) {
		this.daoChamado = daoChamado;
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
        LocalDateTime hoje = LocalDateTime.now();
        LocalDateTime outraData;
        Instant instant;
        
		List<Chamado> lista = daoChamado.listarSolucionador(solicitante);
		for (Chamado chamado : lista) {
			instant = Instant.ofEpochMilli(chamado.getDtLimite().getTime());
			outraData = LocalDateTime.ofInstant(instant, ZoneId.systemDefault());
	        long diferencaEmMinutos = Math.abs(ChronoUnit.MINUTES.between(hoje, outraData));
	        long diferencaEmHours = Math.abs(ChronoUnit.HOURS.between(hoje, outraData));
	        long diferencaEmDias = Math.abs(ChronoUnit.DAYS.between(hoje, outraData));			
			String prazo = diferencaEmDias + " dia(s) "+ diferencaEmHours%24 +" hora(s) "+ diferencaEmMinutos%60 + " minuto(s) ";			
			chamado.setPrazo(prazo);
		}
		return lista;
	}
}