import wollok.game.*

class Arboleda{
    var property recursoMadera=50
    method position() = game.at(5,1)
    method image() = "assets/arbol1.png"
    
    	
  

}

class Arbol{
	var property position
	method image() = "assets/arbol1.png"
}

class Seleccion{
	var property position
	method image() = "assets/cursor.png"	
}

object cursor {
	var property seleccionInicio = []
	var property position = game.at(1,1)

	
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

object menu{
	var property visible
	var property seleccionado
	
	method image() = "assets/menu.png"
	
	method aparecer(motivo){
		visible = motivo
		game.addVisualIn(self, game.at(12,6))
	}
	
	method cerrar(){
		visible = null
		game.removeVisual(self)
	}
	
	method accion(accion){
		// aparecer
		if(accion == "remover")	self.seleccionado().forEach({ 
			objeto => 
			if(game.getObjectsIn(objeto).size() > 0){
				const posic = game.getObjectsIn(objeto).last()
				game.removeVisual(posic)
			}
		})
		if(accion == "plantar") {
			self.accion("remover")
			self.seleccionado().forEach({ 
				objeto => 
				game.addVisualIn(new Arbol(), objeto)
			})
		}
	}
	
}



object teclas{
	
	method q() {}
	method w() { self.error(menu.seleccionado().toString()) }
	method e(){
		if(menu.visible() == "postSeleccion"){
			menu.accion("plantar")
		}
	}
	method r(){
		if(menu.visible() == "postSeleccion"){
			menu.accion("remover")
		}
	}
	method a(){}
	method s(){
		if(cursor.seleccionInicio().size() == 0){
			cursor.seleccion()
		}
	}
	method d(){}
	method f(){}
		
	
}

object enter{
	method apretar(){
		if(cursor.seleccionInicio().size() != 0){
			cursor.seleccion()
			menu.aparecer("postSeleccion")
		}
	}
}