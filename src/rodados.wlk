class Corsa {
	var property color
	method capacidad() = 4
	method velocidadMaxima() = 150
	method peso() = 1300
}

class Kwid {
	var property tanqueAdicional = false
	method capacidad() = if(tanqueAdicional){3} else{4}
	method velocidadMaxima() = if(tanqueAdicional){120} else{110}
	method peso() = 1200 + if(tanqueAdicional){150} else{0}
	method color() = "azul"
}

object traffic {
	var property interior = interiorComodo 
	var property motor = motorPulenta
	
	method capacidad() = interior.capacidad()
	method velocidadMaxima() = motor.velocidadMaxima()
	method peso() = 4000 + interior.peso() + motor.peso()
	method color() = "blanco"
}

object interiorComodo {
	method capacidad() = 5
	method peso() = 700
}

object interiorPopular {
	method capacidad() = 12
	method peso() = 1000
}

object motorPulenta {
	method velocidadMaxima() = 130
	method peso() = 800
}

object motorBataton {
	method velocidadMaxima() = 80
	method peso() = 500
}

class AutoEspecial {
	var property peso
	var property color
	var property velocidadMaxima
	var property capacidad
}
