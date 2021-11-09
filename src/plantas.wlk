class Plantas {
	var property anioObtencion
	var property altura
	
	method horasDeSolToleradas()
	method esFuerte() = self.horasDeSolToleradas() > 10
	method daSemillas() = self.esFuerte()
	
	// Abstract
	method espacioQueOcupa()
	method condicionAlternativa()
	method esParcelaIdeal(parcela)
	
	
}

class Menta inherits Plantas{
	override method horasDeSolToleradas() = 6
	override method espacioQueOcupa() = altura * 3
	override method condicionAlternativa() = altura > 0.4
	override method daSemillas() = super() or self.condicionAlternativa() 
	override method esParcelaIdeal(parcela) = parcela.superficie() > 6
	
	
}

class HierbaBuena inherits Menta{
	override method espacioQueOcupa() = super() * 2
}

class Soja inherits Plantas{
	override method horasDeSolToleradas(){
		if (altura < 0.5){
			return 6
		}if(altura.between(0.5,1)){
			return 7
		}else{
			return 9
		}
	}
	override method espacioQueOcupa() = altura/2
	override method condicionAlternativa() = anioObtencion > 2007 and altura > 1
	override method daSemillas() = super() or self.condicionAlternativa() 
	override method esParcelaIdeal(parcela) = parcela.horasDeSol() == self.horasDeSolToleradas()
}

class SojaTransgenica inherits Soja{
	override method daSemillas() = false
	override method esParcelaIdeal(parcela) = parcela.plantas().size() == 1
	
}

class Quinoa inherits Plantas{
	var property horasDeSolToleradas
	override method espacioQueOcupa() = 0.5
	override method condicionAlternativa() = anioObtencion < 2005
	override method daSemillas() = super() or self.condicionAlternativa()
	
	override method esParcelaIdeal(parcela) = parcela.plantas().all{ planta => planta.altura() <= 1.5 }
}