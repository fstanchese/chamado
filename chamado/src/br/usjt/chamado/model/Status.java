package br.usjt.chamado.model;

public enum Status {
	ABERTO("ABERTO"), FECHADO("FECHADO"), EMANALISE("EM ANÁLISE"), PENDENTE("PENDENTE"), CANCELADO("CANCELADO");

    private String tipo;

    Status(String tipo) {
        this.tipo = tipo;
    }

    public String getTipoUsuario() {
        return tipo;
    }

}
