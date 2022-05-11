class Pedido {
	var property distancia
	var property tiempoMaximo
	var property pasajerosATransportar
	var property coloresIncompatibles = []
	
	method velocidadRequerida() = distancia / tiempoMaximo
	
	method loPuedeSatisfacer(unVehiculo){
		return unVehiculo.velocidadMaxima() >= self.velocidadRequerida()  + 10
			&& unVehiculo.capacidad() >= pasajerosATransportar
			&& not coloresIncompatibles.contains(unVehiculo.color())
	}
	
	method acelerar() { tiempoMaximo -= 1}
	method relajar() { tiempoMaximo += 1}
	
}
