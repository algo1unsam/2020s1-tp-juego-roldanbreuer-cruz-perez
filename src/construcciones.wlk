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
		aldeanos.requerir(tipo)
		game.addVisualIn(tipo, position)
		if(barra == null){
			barra = new BarraConstruccion(albanil = self, position = position)
			game.addVisualIn(barra, position)
		}else{
			barra = game.getObjectsIn(position).find({ objeto => objeto.tipo() == barraobj })
		}
		nombreTick = "Constructor"+position.toString()
		escenario.tickEnCurso().add(self)
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
		escenario.tickEnCurso().remove(self)
		game.removeTickEvent(nombreTick)
		game.removeVisual(self)
	}
		
	method finalizar(){
		aldeanos.liberar(tipo)
		tipo.accion().activar()
		game.removeVisual(barra)
		escenario.tickEnCurso().remove(self)
		game.removeTickEvent(nombreTick)
		game.removeVisual(self)
	}
}
class ConstruccionGrande inherits Constructor{
	override method iniciar(){
		aldeanos.requerir(tipo)
		game.addVisualIn(tipo, position)
		game.addVisualIn(new Vacio(), position.up(1))
		game.addVisualIn(new Vacio(), position.up(1).right(1))
		game.addVisualIn(new Vacio(),position.right(1))
		if(barra == null){
			barra = new BarraConstruccion(albanil = self, position = position)
			game.addVisualIn(barra, position)
		}else{
			barra = game.getObjectsIn(position).find({ objeto => objeto.tipo() == barraobj })
		}
		nombreTick = "Constructor"+position.toString()
		escenario.tickEnCurso().add(self)
		game.onTick((tipo.accion().tiempoNecesario()/5)*1000, nombreTick, {=> barra.suma() })
	}
}