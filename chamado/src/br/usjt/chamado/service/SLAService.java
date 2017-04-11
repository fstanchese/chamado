package br.usjt.chamado.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import br.usjt.chamado.dao.SLADAO;
import br.usjt.chamado.model.SLA;

@Service
public class SLAService {

	private SLADAO daoSLA;

	@Autowired
	public SLAService(SLADAO daoSLA) {
		this.daoSLA = daoSLA;
	}
	
	public SLA buscaPorId(Long id) {
		return daoSLA.buscaPorId(id);
	}
	
	public List<SLA> listar() {
		return daoSLA.listar();
	}
	
	public SLA buscaPorDescricao(String descricao) {
		return daoSLA.buscaPorDescricao(descricao);
	}

	public List<SLA> listarUsuario(Long id) {
		// TODO Auto-generated method stub
		return daoSLA.buscaPorUsuario(id);
	}
}