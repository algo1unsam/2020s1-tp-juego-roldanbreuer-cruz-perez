//acciones que se disparan utilizando el timer
import wollok.game.*
import timer.*
import estados.*
import elementosGame.*

object dispararEvento{
	method Alimentar(){
		const  alimentoNecesario = aldeanos.aldeanos() * 5
		const  alimentoRestante = recursos.cantAlimento() - alimentoNecesario
		if(alimentoRestante < 0){
			recursos.cantAlimento(0)
			const cantidadDeMuertes = alimentoRestante.abs().div(5)
			var inicio = 1000
			cantidadDeMuertes.times({ i => game.schedule(inicio, { => self.killRandom() }) 
										inicio += 500 })
		}else{
			recursos.cantAlimento(alimentoRestante)
		}
	}
	
	method Nacimiento(){
		const  alimentoNecesario = aldeanos.aldeanos() * 5
		const  alimentoRestante = recursos.cantAlimento() - alimentoNecesario
		if(alimentoRestante >= 100 and aldeanos.aldeanos() < aldeanos.poblacion()){
			aldeanos.aldeanoDisponible(aldeanos.aldeanoDisponible() + 1)
			aldeanos.aldeanos(aldeanos.aldeanos() + 1)
			alimento.modificar(-50)
			//game.say(centralErrores, "Ha nacido un nuevo Aldeano")
		}
	}
	
	method killRandom(){
	
		const todosLosAldeanos = escenario.tickEnCurso()
		if(aldeanos.aldeanoDisponible() > 0) todosLosAldeanos.add(aldeanoLibre)
		
		const sujetoAMorir = todosLosAldeanos.anyOne()
		
		sujetoAMorir.morir()
		
		if(aldeanos.aldeanos() == 0){
				game.clear()
				keyboard.enter().onPressDo { escenario.estado().enter() }
				escenario.estado(inGameOver)
				game.addVisualIn(fondoCartel, game.at(12,9))
				game.addVisualIn(gameover, game.at(13,10))
		}
		
		centralErrores.error("Ha muerto un aldeano")
		
			 
	}
	method entregarRecursosMercado(){
		alimento.modificar(1*recursos.mercadosConstruidos())
		madera.modificar(1*recursos.mercadosConstruidos())
		piedra.modificar(1*recursos.mercadosConstruidos())
	}
	
}