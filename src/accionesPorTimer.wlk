//acciones que se disparan utilizando el timer
import timer.*
//import menu.*

object dispararEvento{
	
	method Alimentar(){
		const alimentoNecesario = cantAldeanos * 5
		const alimentoRestante = cantRecursoAlimento - alimentoNecesario
		if(alimentoRestante < 0){
			cantRecursoAlimento = 0
			const cantidadDeMuertes = alimentoRestante.abs().div(5)
			var inicio = 1000
			cantidadDeMuertes.times({ i => game.schedule(inicio, { => self.killRandom() }) 
										inicio += 500 })
		}else{
			cantRecursoAlimento = alimentoRestante
		}
	}
	
	method Nacimiento(){
		const alimentoNecesario = cantAldeanos * 5
		const alimentoRestante = cantRecursoAlimento - alimentoNecesario
		if(alimentoRestante >= 100 and cantAldeanos < cantPoblacion){
			cantAldeanoDisponible += 1
			cantAldeanos += 1
			cantRecursoAlimento -= 50
			game.say(centralErrores, "Ha nacido un nuevo Aldeano")
		}
	}
	
	method killRandom(){
		const todosLosAldeanos = game.allVisuals().filter({ filtro => filtro.tipo() == "Talador" or 
																	filtro.tipo() == "Minero" or
																	filtro.tipo() == "Constructor" or 
																	filtro.tipo() == "Pescador"})
		if(cantAldeanoDisponible > 0) todosLosAldeanos.add(aldeanoLibre)
		const sujetoAMorir = todosLosAldeanos.anyOne()
		if(sujetoAMorir.tipo() == "Talador" or sujetoAMorir.tipo() == "Minero" or sujetoAMorir.tipo() == "Constructor" or sujetoAMorir.tipo() == "Pescador"){
			self.remover(sujetoAMorir.tipo(), [sujetoAMorir.position()])
			cantAldeanoDisponible -= 1
			cantAldeanos -= 1
			if(cantAldeanos == 0){
				game.clear()
				game.addVisualIn(self, game.at(12,5))
				game.addVisualIn(gameover, game.at(13,10))
			}
			centralErrores.error("Ha muerto un aldeano "+sujetoAMorir.tipo())
		}else{
			cantAldeanoDisponible -= 1
			cantAldeanos -= 1
			if(cantAldeanos == 0){
				game.clear()
				game.addVisualIn(self, game.at(12,5))
				game.addVisualIn(gameover, game.at(13,10))
			}
			centralErrores.error("Ha muerto un aldeano disponible")
		}
		 
	}
	
}