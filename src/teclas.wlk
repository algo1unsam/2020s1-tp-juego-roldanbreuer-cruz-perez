import wollok.game.*
import pepita.*
import elementosGame.*
import menu.*
//solo para comodidad del desarrollo del juego
//en este archivo solo se encuentra la configuracion de las teclas
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