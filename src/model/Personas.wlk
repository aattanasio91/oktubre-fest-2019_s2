import Nacionalidades.*
import Carpas.*

class Persona {
	var property peso
	var property jarrasCompradas = []
	var property musicaTradicional
	var property aguante
	var property nacionalidad
	
	method cantidadDeAlcoholIngerido(){
		return jarrasCompradas.sum({jarra => jarra.contenidoDeAlcohol()})
	}
	method estaEbria(){
		return (jarrasCompradas.sum({jarra => jarra.contenidoDeAlcohol()}) * self.peso()) > aguante 
	}
	
	
	method quiereEntrar(carpa){
		return self.leGusta(carpa.marcaQueVende()) and self.musicaTradicional() == carpa.tieneBandaTradicional()
	}
	method leGusta(cerveza) = true
	
	method esEbrioEmpedernido(){
		return self.jarrasCompradas().all({ jarra => jarra.capacidadEnLitros() >= 1})
	}
}


class Aleman inherits Persona{
	
	override method leGusta(cerveza) = true
	
	method tieneToc(carpa) {return carpa.cantidadPersonas().even()}
	
	override method quiereEntrar(carpa){
		return super(carpa) and carpa.personasDentro().size().even()
	}
	
	
}

class Belga inherits Persona{
	
	override method nacionalidad(){ return checo.nacionalidad() }
	
	override method leGusta(cerveza) {
		return cerveza.lupulo() > 4
	}
	
	method tieneToc(carpa) = true
		
}

class Checo inherits Persona{
	
	override method nacionalidad(){ return checo.nacionalidad() }
	
	override method leGusta(cerveza) {return cerveza.graduacion() > 0.08	}
	method tieneToc(carpa) = true
}