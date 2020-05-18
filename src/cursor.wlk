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
	var property limites = [game.at(0,19),game.at(1,19),game.at(2,19),game.at(3,19),game.at(4,19),game.at(5,19),game.at(6,19),game.at(7,19),game.at(8,19),game.at(9,19),game.at(10,19),game.at(11,19),game.at(12,19),game.at(13,19),game.at(14,19),game.at(15,19),game.at(16,19),game.at(17,19),game.at(18,19),game.at(19,19),game.at(20,19),game.at(21,19),game.at(22,19),game.at(23,19),game.at(24,19),game.at(25,19),game.at(26,19),game.at(27,19),game.at(28,19),game.at(29,19),game.at(30,19),game.at(31,19),game.at(32,19),game.at(33,19),game.at(34,19),game.at(35,19),game.at(36,19),
							game.at(-1,18),game.at(-1,17),game.at(-1,16),game.at(-1,15),game.at(-1,14),game.at(-1,13),game.at(-1,12),game.at(-1,11),game.at(-1,10),game.at(-1,9),game.at(-1,8),game.at(-1,7),game.at(-1,6),game.at(-1,5),game.at(-1,4),game.at(5,3),game.at(5,2),game.at(5,1),game.at(5,0),
							game.at(0,3),game.at(1,3),game.at(2,3),game.at(3,3),game.at(4,3),game.at(5,3),game.at(6,-1),game.at(7,-1),game.at(8,-1),game.at(9,-1),game.at(10,-1),game.at(11,-1),game.at(12,-1),game.at(13,-1),game.at(14,-1),game.at(15,-1),game.at(16,-1),game.at(17,-1),game.at(18,-1),game.at(19,-1),game.at(20,-1),game.at(21,-1),game.at(22,-1),game.at(23,-1),game.at(24,-1),game.at(25,-1),game.at(26,-1),game.at(27,-1),game.at(28,-1),game.at(29,-1),game.at(30,-1),game.at(31,3),game.at(32,3),game.at(33,3),game.at(34,3),game.at(35,3),game.at(36,3),
							game.at(37,18),game.at(37,17),game.at(37,16),game.at(37,15),game.at(37,14),game.at(37,13),game.at(37,12),game.at(37,11),game.at(37,10),game.at(37,9),game.at(37,8),game.at(37,7),game.at(37,6),game.at(37,5),game.at(37,4),game.at(31,3),game.at(31,2),game.at(31,1),game.at(31,0)]
	var property position = game.center()
	var property tipo = "Cursor"
	method seleccion() {
		if (seleccionInicio.size() == 0){
			self.accesoAlLugar(self.position())
			seleccionInicio.add(self.position())
			game.addVisualIn(new Seleccion(), position)
		}else{
			menu.seleccionado(seleccionInicio.copy())
			seleccionInicio.clear()
		}
	}
	method mover(posicionNueva){
		if(limites.filter({valor => valor == posicionNueva}).size() == 0){
			if(menu.visible() == null ){
				if (seleccionInicio.size() == 0){
					self.position(posicionNueva)
				}else{
					self.accesoAlLugar(posicionNueva)
					self.position(posicionNueva)
					seleccionInicio.add(position)
					game.addVisualIn(new Seleccion(), position)
				}
			}
		}
	}
	
	method accesoAlLugar(){
		// -- Se revisa si se tiene acceso a la posicion para poder realizar acciones
		if(game.getObjectsIn(self.position().up(1)).size() > 0 and
			game.getObjectsIn(self.position().down(1)).size() > 0 and
			game.getObjectsIn(self.position().left(1)).size() > 0 and 
			game.getObjectsIn(self.position().right(1)).size() > 0){
			centralErrores.error("No se tiene acceso a esta posicion.")
		}
	}
	method accesoAlLugar(posicion){
		// -- Se revisa si se tiene acceso a la posicion para poder realizar acciones
		if(game.getObjectsIn(posicion.up(1)).size() > 0 and
			game.getObjectsIn(posicion.down(1)).size() > 0 and
			game.getObjectsIn(posicion.left(1)).size() > 0 and 
			game.getObjectsIn(posicion.right(1)).size() > 0){
			centralErrores.error("No se tiene acceso a esta posicion.")
		}
	}
	
	method image() {
		return "assets/cursor.png"
	}

}