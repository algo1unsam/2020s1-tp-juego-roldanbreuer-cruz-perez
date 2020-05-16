import wollok.game.*
import elementosGame.*
import menu.*
import teclas.*
//aqui se encuentra nuestro cursor y su configuracion
class Seleccion{
	var property position
	var property tipo = "Seleccion"
	method image() = "assets/cursor.png"	
}

object cursor {
	var property seleccionInicio = []
	var property position = game.at(1,1)
	var property tipo = "Cursor"
	method seleccion() {
		if (seleccionInicio.size() == 0){
			seleccionInicio.add(self.position())
		}else{
			seleccionInicio.add(position)
			game.addVisualIn(new Seleccion(), position)
			menu.seleccionado(seleccionInicio.copy())
			seleccionInicio.clear()
		}
	}
	method mover(posicionNueva){
		if (seleccionInicio.size() == 0){
			self.position(posicionNueva)
		}else{
			seleccionInicio.add(position)
			game.addVisualIn(new Seleccion(), position)
			self.position(posicionNueva)
		}
	}
	
	method image() {
		return "assets/cursor.png"
	}

}