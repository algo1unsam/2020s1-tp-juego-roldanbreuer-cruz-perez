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
	method w() { 
		if(menu.visible() == "tecla"){
			menu.remover("talar", [cursor.position()])
			menu.remover("minar", [cursor.position()])
			menu.remover("pesca", [cursor.position()])
		}
	}
	method e(){
		if(menu.visible() == "postSeleccion"){
			menu.accion("plantar", menu.seleccionado())
		}
	}
	method r(){

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
		if(menu.visible() == "tecla"){
			menu.accion("colocarPiedra", [cursor.position()])
		}
	}
	method f(){
		if(menu.visible() == "postSeleccion"){
			menu.accion("minar", menu.seleccionado())
		}
	}
	method m(){
		if(menu.visible() == null){
			menu.aparecer("tecla")
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