import Marcas.*
import Personas.*
import Jarras.*

class Carpa {
	var property limiteDeGente
	const property tieneBandaTradicional
	const property marcaQueVende
	var property personasDentro = #{}
	
	method dejaIngresar(persona){ return personasDentro.size() < limiteDeGente and not persona.estaEbria() }
	
	method puedeEntrar(persona) {
		return persona.quiereEntrar(self) and self.dejaIngresar(persona)
	}
	
	method ingresarACarpa(persona){
		if (self.puedeEntrar(persona) and not persona.estaEbria()){
			self.personasDentro().add(persona)
		}
		else{
			self.error("No puede entrar")
		} 
	}
	
	method servirJarra(persona, capacidad){
		persona.jarrasCompradas().add(new Jarra(marca = self.marcaQueVende(), capacidadEnLitros = capacidad))
	}
	
	method cantEbriosEmpedernidos(){
		return self.personasDentro().count({persona => persona.esEbrioEmpedernido()})
	}
}
