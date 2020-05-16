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

object arboledaNO{
	const property area = [
game.at(0,18),game.at(1,18),game.at(2,18),game.at(3,18),game.at(4,18),game.at(5,18),game.at(6,18),game.at(7,18),game.at(8,18),game.at(9,18),
game.at(0,17),game.at(1,17),game.at(2,17),game.at(3,17),game.at(4,17),game.at(5,17),game.at(6,17),game.at(7,17),game.at(8,17),game.at(9,17),
game.at(0,16),game.at(1,16),game.at(2,16),game.at(3,16),game.at(4,16),game.at(5,16),game.at(6,16),game.at(7,16),game.at(8,16),game.at(9,16),
game.at(0,15),game.at(1,15),game.at(2,15),game.at(3,15),game.at(4,15),game.at(5,15),game.at(6,15),game.at(7,15),game.at(8,15),game.at(9,15),
game.at(0,14),game.at(1,14),game.at(2,14),game.at(3,14),game.at(4,14),game.at(5,14),game.at(6,14),game.at(7,14),
game.at(0,13),game.at(1,13),game.at(2,13),game.at(3,13),game.at(4,13),game.at(5,13),
game.at(0,18),game.at(1,18),game.at(2,18),game.at(3,18)]
}


object cursor {
	var property seleccionInicio = []
	var property position = game.center()
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