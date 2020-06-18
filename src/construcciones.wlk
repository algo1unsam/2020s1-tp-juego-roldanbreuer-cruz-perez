import wollok.game.*
import elementosGame.*
import estados.*

class Constructor{
	var property tipo
	var property position
	var property barra = null
	var nombreTick = null
	
	var property detenible = true
	
	method trabajable() { return false }
	
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
		tipo.trabajable(false)
		const sonido = game.sound("assets/martillo.mp3")
		sonido.play()
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
		game.removeVisual(self)
	}
		
	method finalizar(){
		aldeanos.liberar(tipo)
		tipo.accion().activar(position)
		game.removeVisual(barra)
		escenario.tickEnCurso().remove(self)
		game.removeTickEvent(nombreTick)
		game.removeVisual(self)
	}
	
}
class ConstruccionGrande inherits Constructor{
	override method iniciar(){
		super()
		tipo.accion().completarEspacios()
	}

}