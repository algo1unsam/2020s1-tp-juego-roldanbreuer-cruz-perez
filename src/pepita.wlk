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
	var property position = game.center()
	var property tipo = "Cursor"
	method seleccion() {
		if (seleccionInicio.size() == 0){
			seleccionInicio.add(self.position())
			game.addVisualIn(new Seleccion(), position)
		}else{
			menu.seleccionado(seleccionInicio.copy())
			seleccionInicio.clear()
		}
	}
	method mover(posicionNueva){
		if(menu.visible() == null ){
			if (seleccionInicio.size() == 0){
				self.position(posicionNueva)
			}else{
				self.position(posicionNueva)
				seleccionInicio.add(position)
				game.addVisualIn(new Seleccion(), position)
			}
		}
	}
	
	method image() {
		return "assets/cursor.png"
	}

}