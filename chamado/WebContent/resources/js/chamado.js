$(document).ready(function() {
	jQuery(function($) {
		$.mask.definitions['~'] = '[+-]';
		//Inicio Mascara Telefone
		$('#celular').mask("(99) 9999-9999?9").blur(
			function(event) {
				var target, phone, element;
				target = (event.currentTarget) ? event.currentTarget
						: event.srcElement;
				phone = target.value.replace(/\D/g, '');
				element = $(target);
				element.unmask();
				if (phone.length > 10) {
					element.mask("(99) 99999-999?9");
				} else {
					element.mask("(99) 9999-9999?9");
				}
		});
	});
	$("#cpf").mask("999.999.999-99");

	$("#tipoUsuario").change(function() {
		$('#blocoSLA').show();
		if ($('#tipoUsuario option:selected').val() != 'SOLICITANTE') {
			$('#blocoSLA').hide();
		}
	});
	
	$("#tipoUsuario").change(function() {
		$('#blocoFila').show();
		if ($('#tipoUsuario option:selected').val() != 'SOLUCIONADOR') {
			$('#blocoFila').hide();
		}
	});
	
	$(window).load(function() {
		$('#blocoFila').show();
		if ($('#tipoUsuario option:selected').val() != 'SOLUCIONADOR') {
			$('#blocoFila').hide();
		}	
		$('#blocoSLA').show();
		if ($('#tipoUsuario option:selected').val() != 'SOLICITANTE') {
			$('#blocoSLA').hide();
		}
	});

});