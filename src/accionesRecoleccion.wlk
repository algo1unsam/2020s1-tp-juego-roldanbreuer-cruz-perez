import wollok.game.*
import elementosGame.*
import estados.*


class Recolector{
	var property tipo
	var property position
	var property barra = null
	var nombreTick = null
	
	method image(){
		return tipo.accion().image()
	}
	
	method iniciar(){
		aldeanos.requerir(tipo)
		if(barra == null){
			barra = new BarraRecoleccion(recolector = self, position = position)
			game.addVisualIn(barra, position)
		}
		nombreTick = "Recolector"+position.toString()
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
	
	method recolectar(){
		if((tipo.tipo().tipoRecurso().consulta() + (tipo.tipo().recurso()/5)) <= almacen.consulta()){
			tipo.tipo().tipoRecurso().modificar(tipo.tipo().recurso()/5)
		}else{
			self.detener()
			barra.resta()
			centralErrores.error("No hay espacio en el Almacen")
		}
	}
	
}