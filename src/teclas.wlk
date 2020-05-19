import wollok.game.*
import cursor.*
import elementosGame.*
import menu.*
import timer.*



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
		if(menu.visible() == "construccion"){
			menu.accion("Almacen", [cursor.position()])
		}
	}
	method w() { 
		if(menu.visible() == "postSeleccion"){
			menu.remover("Seleccion", menu.seleccionado())
			menu.remover("Talador", menu.seleccionado())
			menu.remover("Minero", menu.seleccionado())
			menu.remover("Pescador", menu.seleccionado())
			menu.remover("Constructor", menu.seleccionado())
		}
		if(menu.visible() == "tecla" or menu.visible() == null){
			menu.remover("Talador", [cursor.position()])
			menu.remover("Minero", [cursor.position()])
			menu.remover("Pescador", [cursor.position()])
			menu.remover("Constructor", [cursor.position()])
		}
		if(menu.visible() == "construccion"){
			menu.accion("CasaC", [cursor.position()])
		}
	}
	method e(){
		if(menu.visible() == "postSeleccion"){
			menu.accion("minar", menu.seleccionado())
		}
		if(menu.visible() == "tecla"){
			menu.accion("minar", [cursor.position()])
		}
		if(menu.visible() == "construccion"){
			menu.accion("CasaG", [cursor.position()])
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
		if(menu.visible() == "construccion"){
			menu.accion("Mercado", [cursor.position()])
		}
	}
	method s(){
		if(cursor.seleccionInicio().size() == 0){
			cursor.seleccion()
		}
		if(menu.visible() == "construccion"){
			menu.accion("Granja", [cursor.position()])
		}
	}
	method d(){
		if(menu.visible() == "postSeleccion"){
			menu.accion("pesca", menu.seleccionado())
		}
		if(menu.visible() == "tecla"){
			menu.accion("pesca", [cursor.position()])
		}
		if(menu.visible() == "construccion"){
			menu.accion("Plantacion", [cursor.position()])
		}
	}
	method f(){
		
	}
	method k(){
		menu.Alimentar()
	}
	method c(){
		if(menu.visible() == null and cursor.seleccionInicio().size() == 0){
			if(game.getObjectsIn(cursor.position()).size() == 1){
				menu.aparecer("construccion")
			}else{
				centralErrores.error("No se puede construir ahi.")
			}
		}
	}
	method t(){
		const listaPos = game.getObjectsIn(cursor.position())
		if(menu.visible() == null){
			if(listaPos.filter({ objeto => objeto.tipo() == "Arboleda" }).size() > 0 and 
				listaPos.filter({ objeto => objeto.tipo() == "Talador" }).size() == 0){
				menu.accion("talar", [cursor.position()])
			}
			if(listaPos.filter({ objeto => objeto.tipo() == "Agua" }).size() > 0 and 
				listaPos.filter({ objeto => objeto.tipo() == "Pescador" }).size() == 0){
				menu.accion("pesca", [cursor.position()])
			}
			if(listaPos.filter({ objeto => objeto.tipo() == "Piedras" }).size() > 0 and 
				listaPos.filter({ objeto => objeto.tipo() == "Minero" }).size() == 0){
				menu.accion("minar", [cursor.position()])
			}
			if(listaPos.filter({ objeto => objeto.tipo() == "casac" }).size() > 0 and 
				listaPos.filter({ objeto => objeto.tipo() == "Barra" }).size() > 0){
				menu.accion("CasaC", [cursor.position()])
			}
			if(listaPos.filter({ objeto => objeto.tipo() == "casag" }).size() > 0 and 
				listaPos.filter({ objeto => objeto.tipo() == "Barra" }).size() > 0){
				menu.accion("CasaG", [cursor.position()])
			}
			if(listaPos.filter({ objeto => objeto.tipo() == "almacen" }).size() > 0 and 
				listaPos.filter({ objeto => objeto.tipo() == "Barra" }).size() > 0){
				menu.accion("Almacen", [cursor.position()])
			}
		}
	}
	
	method o(){
		game.say(cursor, timer.segundos().toString())
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