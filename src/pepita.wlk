import wollok.game.*

class Arboleda{
    var property recursoMadera=50
    method position() = game.at(5,1)
    method image() = "assets/arbol1.png"
    
    	
  

}

class Seleccion{
	var property position
	method image() {
		return "assets/cursor.png"
	}
}

object cursor {
	var property seleccionInicio = []
	var property position =game.at(5,1)


	method seleccion() {
		if (seleccionInicio == null){
			seleccionInicio.add(self.position())
		}else{
			game.addVisualIn(new Seleccion(), position)
			seleccionInicio = null
		}
		
	}


	method mover(posicionNueva){
		if (seleccionInicio == null){
			self.position(posicionNueva)
		}else{
			seleccionInicio.add(self.position())
			game.addVisualIn(new Seleccion(), position)
			self.position(posicionNueva)
		}
		
	}
	
	method image() {
		return "assets/cursor.png"
	}

}

object enter{
	method apretar(){
		if(cursor.seleccionInicio() != null){
			cursor.seleccion()
		}
	}
}