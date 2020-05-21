import wollok.game.*
import elementosGame.*
import estados.*

class Constructor{
	var property tipo
	var property position
	var property barra = null
	var nombreTick = null
	
	method image() = "assets/construir.png"
	
	method iniciar(){
		game.addVisual(tipo)
		if(barra == null){
			barra = new BarraConstruccion(albanil = self, position = position)
			game.addVisualIn(barra, position)
		}
		nombreTick = "Constructor"+position.toString()
		escenario.tickEnCurso().add(self)
		
		game.onTick((tipo.accion().tiempoNecesario()/5)*100, nombreTick, {=> barra.suma() })
	}
	
	method pausa(){
		game.removeTickEvent(nombreTick)
	}
	
	method unpausa(){
		game.onTick((tipo.accion().tiempoNecesario()/5)*100, nombreTick, {=> barra.suma() })
	}
	
	method detener(){
		aldeanos.liberar(tipo)
		escenario.tickEnCurso().remove(nombreTick)
		game.removeTickEvent(nombreTick)
		game.removeVisual(self)
	}
		
	method finalizar(){
		aldeanos.liberar(tipo)
		game.removeVisual(barra)
		tipo.remover()
		escenario.tickEnCurso().remove(nombreTick)
		game.removeTickEvent(nombreTick)
		game.removeVisual(self)
	}
	
}