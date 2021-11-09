import parcelas.*
object inta {
	const parcelas = []
	
	//PARA EL TEST
	method agregar(parcela) { parcelas.add(parcela)}
	
	method sumaDePlantasPorParcelas() = parcelas.sum{ parcela => parcela.plantas().size() }
	method cantidadDeParcelas() = parcelas.size()
	
	//PROMEDIO DE PLANTAS
	method promedioDePlantas() = self.sumaDePlantasPorParcelas()/self.cantidadDeParcelas()
	
	
	method parcelasConMasDeCuatroPlantas() = parcelas.filter{ parcela => parcela.plantas().size() > 4}
	method cantidadPlantasBienAsociadasPor(parcela) = parcela.plantas().count{ planta => parcela.seAsociaBien(planta)}
	
	//PARCELA AUTOSUSTENTABLE
	method parcelaMasAutosustentable() = self.parcelasConMasDeCuatroPlantas().max{ parcela => self.cantidadPlantasBienAsociadasPor(parcela)}
	
}