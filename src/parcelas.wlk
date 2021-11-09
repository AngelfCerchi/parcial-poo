class Parcela {
	var property ancho 
	var property largo
	var property horasDeSol
	const property plantas = []


	method superficie() = ancho*largo
	method cantidadMaxima() = if(ancho>largo) self.superficie()/5 else self.superficie()/3+largo
	method tieneComplicaciones() = plantas.any{p => p.horasDeSolToleradas() < horasDeSol }
	
	method superaCantidadMaxima() = self.cantidadMaxima() <= plantas.size()
	method superaTolerancia(planta) = horasDeSol- planta.horasDeSolToleradas() > 2
	method puedePlantar(planta) = !self.superaCantidadMaxima() and !self.superaTolerancia(planta)
	
	method plantar(planta){
		if(self.puedePlantar(planta))
			plantas.add(planta)
		else
			self.error("No se puede Plantar")
	}
	
	//method seAsociaBien(planta)
	
}

class ParcelaEcologica inherits Parcela{
	method seAsociaBien(planta) = !self.tieneComplicaciones() and planta.esParcelaIdeal(self) 
}

class ParcelaIndustrial inherits Parcela{
	method comoMaximoDos() = plantas.size() <= 2
	method seAsociaBien(planta) = self.comoMaximoDos() and planta.esFuerte()
}