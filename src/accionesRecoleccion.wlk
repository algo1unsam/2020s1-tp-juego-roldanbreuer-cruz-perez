import wollok.game.*
import elementosGame.*
import estados.*


class Recolector{
	var property tipo
	var property position
	var property barra = null
	var nombreTick = null
	
	method trabajable() { return false }
	
	method image(){
		return tipo.accion().image()
	}
	
	method iniciar(){
		aldeanos.requerir(tipo)
		if(barra == null){
			barra = new BarraRecoleccion(recolector = self, position = position)
			game.addVisualIn(barra, position)
		}else{
			barra = game.getObjectsIn(position).find({ objeto => objeto.tipo() == barraobj })
		}
		nombreTick = "Recolector"+position.toString()
		escenario.tickEnCurso().add(self)
		tipo.trabajable(false)
		game.onTick((tipo.accion().tiempoNecesario()/5)*1000, nombreTick, {=> barra.suma() })
	}
	
	method pausar(){
		game.removeTickEvent(nombreTick)
	}
	
	method unpausar(){
		game.onTick((tipo.accion().tiempoNecesario()/5)*1000, nombreTick, {=> barra.suma() })
	}
	
	method morir(){
		self.detener()
		aldeanoLibre.morir()
	}
	
	method detener(){
		aldeanos.liberar(tipo)
		tipo.trabajable(true)
		escenario.tickEnCurso().remove(self)
		game.removeTickEvent(nombreTick)
		game.removeVisual(game.getObjectsIn(position).find({ objeto => objeto.tipo() == tipo }))
	}
	
	method finalizar(){
		aldeanos.liberar(tipo)
		game.removeVisual(barra)
		tipo.remover()
		escenario.tickEnCurso().remove(self)
		game.removeTickEvent(nombreTick)
		game.removeVisual(game.getObjectsIn(position).find({ objeto => objeto.tipo() == tipo }))
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