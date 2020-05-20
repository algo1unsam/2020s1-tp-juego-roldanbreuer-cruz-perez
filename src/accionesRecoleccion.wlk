import wollok.game.*
import elementosGame.*
import estados.*


class Recolector{
	var property tipo
	var property position
	var property barra
	var nombreTick 
	
	method image(){
		return tipo.image()
	}
	
	method iniciar(){
		aldeanos.requerir(tipo)
		barra = new BarraRecoleccion(recolector = self, position = position)
		game.addVisualIn(barra, position)
		nombreTick = "Recolector"+position.toString()
		game.onTick((tipo.accion().tiempoNecesario()/5), nombreTick, {=> barra.suma() })
	}
	
	method detener(){
		aldeanos.liberar(tipo)
		game.removeVisual(barra)
		game.removeTickEvent(nombreTick)
	}
	
	method recolectar(){
		tipo.tipo().tipoRecurso().modificar(tipo.tipo().recurso()/5)
	}
}