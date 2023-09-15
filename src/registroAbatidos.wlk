object registroAbatidosCOD {
	const registro = []
	
	method dia(reg) = reg.get(1)
	method cant(reg) = reg.first()
	
	method agregarAbaditosDia(cantidad,dia){
		if(self.yaEstaElDia(dia)){
			self.error("Ya existe el día")
		}
		registro.add([cantidad, dia])
	}
	
	method agregarAbaditosVariosDias(registrosAbatidos){
		if(self.dia(registrosAbatidos))
			self.error("Ya existe el día")
		
		registro.addAll(registrosAbatidos)
		
	}
	
	method yaEstaElDia(dia) = registro.any({r => self.dia(r) == dia})
	
	method eliminitarElRegistroDelDia(dia){
		if(not self.yaEstaElDia(dia)){
			self.error("El dia no esta en la lista")
		}
		registro.remove(self.registroDia(dia))
	}
	
	method registroDia(dia) = registro.find({r => self.dia(r) == dia})
	
	method eliminarVariosRegistrosDeDias(listaDeDias){
		if(not listaDeDias.all({r => self.yaEstaElDia(r)})){
			self.error("No estan todos los dias")
		}
		listaDeDias.forEach({r=> self.eliminitarElRegistroDelDia(r)})
	}
	
	method eliminarVariosRegistrosDeDias2(listaDeDias){
		if( listaDeDias.any({r => not self.yaEstaElDia(r)})){
			self.error("No estan todos los dias")
		}
		listaDeDias.forEach({r=> self.eliminitarElRegistroDelDia(r)})
	}
	
	
}