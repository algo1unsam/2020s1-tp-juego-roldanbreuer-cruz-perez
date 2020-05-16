import wollok.game.*
import pepita.*
import elementosGame.*
import menu.*
//solo para comodidad del desarrollo del juego
//en este archivo solo se encuentra la configuracion de las teclas
object teclas{
	method q() {
		if(menu.visible() == "postSeleccion"){
			menu.accion("plantar", menu.seleccionado())
		}
		if(menu.visible() == "tecla"){
			menu.accion("plantar", [cursor.position()])
		}
	}
	method w() { 
		if(menu.visible() == "postSeleccion"){
			menu.remover("Seleccion", menu.seleccionado())
			menu.remover("Talada", menu.seleccionado())
			menu.remover("Minado", menu.seleccionado())
			menu.remover("Pesca", menu.seleccionado())
		}
		if(menu.visible() == "tecla"){
			menu.remover("Talada", [cursor.position()])
			menu.remover("Minado", [cursor.position()])
			menu.remover("Pesca", [cursor.position()])
		}
	}
	method e(){
		if(menu.visible() == "postSeleccion"){
			menu.accion("minar", menu.seleccionado())
		}
		if(menu.visible() == "tecla"){
			menu.accion("minar", [cursor.position()])
		}
	}
	method r(){
		if(menu.visible() == "postSeleccion"){
			menu.accion("talar", menu.seleccionado())
		}
		if(menu.visible() == "tecla"){
			menu.accion("talar", [cursor.position()])
		}
	}
	method a(){
		if(menu.visible() == "postSeleccion"){
			menu.accion("colocarPiedra", menu.seleccionado())
		}
		
		if(menu.visible() == "tecla"){
			menu.accion("colocarPiedra", [cursor.position()])
		}
	}
	method s(){
		if(cursor.seleccionInicio().size() == 0){
			cursor.seleccion()
		}
	}
	method d(){
		if(menu.visible() == "postSeleccion"){
			menu.accion("pesca", menu.seleccionado())
		}
		if(menu.visible() == "tecla"){
			menu.accion("pesca", [cursor.position()])
		}
	}
	method f(){
		
	}
	method m(){
		if(menu.visible() == null){
			menu.aparecer("tecla")
		}
	}	
	method menos(){
		if(menu.visible() != null){
			game.stop()
		}
	} 
	method bkps(){
		menu.cerrar() 
		if(menu.seleccionado().size() > 0)	menu.remover("Seleccion", menu.seleccionado())
		
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