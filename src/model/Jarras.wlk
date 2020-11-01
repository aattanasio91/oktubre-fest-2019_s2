class Jarra {
	var property capacidadEnLitros
	var property marca
	
	method contenidoDeAlcohol(){
		return capacidadEnLitros * marca.graduacion()
	}
}