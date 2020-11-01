
class Cerveza {
	var property lupulo
	var property paisDeOrigen
	
	method graduacion()	
}

class CervezaRubia inherits Cerveza{
	var property graduacion
	
}

class CervezaNegra inherits Cerveza{
		
	override method graduacion(){
		return graduacionReglamentaria.graduacionMundial().min(2 * self.lupulo())
	}
}

class CervezaRoja inherits CervezaNegra{
	
	override method graduacion(){
		return super() * 1.25
	}
}

object graduacionReglamentaria {
	var property graduacionMundial = 0
}


