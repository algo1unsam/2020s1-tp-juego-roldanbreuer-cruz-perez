import wollok.game.*
import pepita.*
import elementosGame.*
import menu.*
//solo para comodidad del desarrollo del juego
//en este archivo solo se encuentra la configuracion de las teclas
object teclas{
	method q() {
		if(menu.visible() == "postSeleccion"){
			menu.accion("talar", menu.seleccionado())
		}
	}
	method w() { self.error(menu.seleccionado().toString()) }
	method e(){
		if(menu.visible() == "postSeleccion"){
			menu.accion("plantar", menu.seleccionado())
		}
	}
	method r(){
		if(menu.visible() == "postSeleccion"){
			menu.accion("remover", menu.seleccionado())
		}
	}
	method a(){
		if(menu.visible() == "postSeleccion"){
			menu.accion("pesca", menu.seleccionado())
		}
	}
	method s(){
		if(cursor.seleccionInicio().size() == 0){
			cursor.seleccion()
		}
	}
	method d(){
		if(menu.visible() == "postSeleccion"){
			menu.accion("colocarPiedra", menu.seleccionado())
		}
	}
	method f(){
		if(menu.visible() == "postSeleccion"){
			menu.accion("minar", menu.seleccionado())
		}
	}
		
	
}
object enter{
	method apretar(){
		if(cursor.seleccionInicio().size() != 0){
			cursor.seleccion()
			menu.aparecer("postSeleccion")
		}
	}
}