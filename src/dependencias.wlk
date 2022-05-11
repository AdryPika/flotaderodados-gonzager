import rodados.*
class Dependencia {
	var rodados = []
	var pedidos = []
	var property cantEmpleados = 0
	
	method agregarAFlota(rodado) {
		rodados.add(rodado)
	}	
	
	method quitarDeFlota(rodado) {
		rodados.remove(rodado)
	}
	
	method pesoTotalFlota() {
		return rodados.sum( { r => r.peso() } )
	}
	
	method cantidadRodados() = rodados.size()
	
	method todosAndanMasDe(velocidad) {
		return rodados.all( { r => r.velocidadMaxima() >= velocidad })
	
	}
	
	method estaBienEquipada() {
		return self.cantidadRodados() >= 3 && 
		       self.todosAndanMasDe(100)
	}
	
	method rodadosDeUn(color) {
		return rodados.filter( { r => r.color() == color})
	}
	
	method capacidadTotalEnColor(color) {
		self.rodadosDeUn(color).sum( { r=> r.capacidad() })
	}
	
	method colorDelRodadoMasRapido() {
		rodados.max( {r => r.velocidadMaxima() }).color()
	}
	
	method capacidadTotalDeLaFlota() {
		return rodados.sum ( {r => r.capacidad()})
	}
	
	method capacidadFaltante() {
		return 0.max( cantEmpleados - self.capacidadTotalDeLaFlota())
	}
	
	method esGrande() {
		return cantEmpleados>= 40 && self.cantidadRodados() >= 5 
	}
	
	method agregarPedido(unPedido) {
		pedidos.add(unPedido)
	}
	
	method quitarPedido(unPedido) {
		pedidos.remove(unPedido)
	}
	
	method totalPasajerosEnPedidos() {
		return pedidos.sum ( { p => p.pasajerosATransportar() })
	}
	
	method pedidosInsatisfechos() {
		return pedidos.filter( { p => not self.puedeSatisfacerPedido(p) })
	}
	
	method puedeSatisfacerPedido( pedido ) {
		return rodados.any ({ r => pedido.loPuedeSatisfacer(r) })
	}
	
	method esColorImpatibleParaTodosLosPedidos(unColor) {
		return pedidos.all( { p => p.coloresIncompatibles().contains(unColor)  })
	}
	
	method relajarTodosLosPedidosRegistrado() {
		pedidos.forEach( { p=> p.relajar()})
	}
	
	
	
}