import wollok.game.*
import pepita.*
import elementosGame.*
import teclas.*
//solo para comodidad del desarrollo del juego
//en este archivo se encuentran solamente los elementos que componen el menu
object menu{
	var property visible
	var property seleccionado = []
	var property cantidadArbolesPlantados=0
	var property cantRecursos=0
	const recursoMadera=50
	const recursoPiedra=75
	const recursoPez=25
	method image() = "assets/menu.png"
	
	method aparecer(motivo){
		visible = motivo
		if(motivo == "postSeleccion" or motivo == "tecla" ){
			game.addVisualIn(self, game.at(12,5))
			game.addVisualIn(tituloAcciones, game.at(13,13))
			game.addVisualIn(botonTalar, game.at(13,11))
			game.addVisualIn(botonMinar, game.at(16,11))
			game.addVisualIn(botonDetener, game.at(19,11))
			game.addVisualIn(botonCancelar, game.at(13,6))
			game.addVisualIn(botonSalir, game.at(21,6))
		}
		if(motivo == "construccion"){
			game.addVisualIn(self, game.at(12,5))
			game.addVisualIn(tituloConstrucciones, game.at(13,13))
			game.addVisualIn(botonAlmacen, game.at(13,10))
			game.addVisualIn(botonCasaC, game.at(16,10))
			game.addVisualIn(botonCasaG, game.at(19,10))
			game.addVisualIn(botonCancelar, game.at(13,6))
			game.addVisualIn(botonSalir, game.at(21,6))
		}
	}
	
	method cerrar(){
		if(visible == "postSeleccion" or visible == "tecla" ){
			game.removeVisual(self)
			game.removeVisual(tituloAcciones)
			game.removeVisual(botonTalar)
			game.removeVisual(botonMinar)
			game.removeVisual(botonDetener)
			game.removeVisual(botonCancelar)
			game.removeVisual(botonSalir)
		}
		if(visible == "construccion"){
			game.removeVisual(self)
			game.removeVisual(tituloConstrucciones)
			game.removeVisual(botonAlmacen)
			game.removeVisual(botonCasaC)
			game.removeVisual(botonCasaG)
			game.removeVisual(botonCancelar)
			game.removeVisual(botonSalir)
		}
		visible = null
	}
	
	
	method remover(tipo,lista){
		lista.forEach({ 
			objeto => 
			if(game.getObjectsIn(objeto).filter({ filtro => filtro.tipo() == tipo }).size() > 0){
				const posic = game.getObjectsIn(objeto).filter({ filtro => filtro.tipo() == tipo }).last()
				game.removeVisual(posic)
			}
		})
		if(self.visible() != null) self.cerrar()
	}
	
	method accion(accion,lista){
		// aparecer
		if(accion == "plantar") {
			self.remover("Seleccion", lista)
			lista.forEach({ 
				objeto => 
				game.addVisualIn(new Arboleda(), objeto)
			})
		
		}
		if(accion == "talar") {
			self.remover("Seleccion", lista)
			lista.forEach({ 
				objeto => 
				game.addVisualIn(new Talada(), objeto)
			})
			cantidadArbolesPlantados=lista.sum({objeto => game.getObjectsIn(objeto).filter({ filtro => filtro.tipo() == "Arboleda" }).size()})
			cantRecursos += cantidadArbolesPlantados*recursoMadera
			game.say(cursor, "recursos sumados: " + self.cantRecursos().toString())
			
		
		}
		if(accion == "colocarPiedra") {
			self.remover("Seleccion", lista)
			lista.forEach({ 
				objeto => 
				game.addVisualIn(new Piedras(), objeto)
			})
		}
		if(accion == "minar") {
			self.remover("Seleccion", lista)
			lista.forEach({ 
				objeto => 
				game.addVisualIn(new Minado(), objeto)
			})
		}
		if(accion == "pesca") {
			self.remover("Seleccion", lista)
			lista.forEach({ 
				objeto => 
				game.addVisualIn(new Pesca(), objeto)
			})
		}
		if(accion == "Almacen") {
			lista.forEach({ 
				objeto => 
				game.addVisualIn(new Almacen(), objeto)
			})
			if(self.visible() != null) self.cerrar()
		}
		if(accion == "CasaC") {
			lista.forEach({ 
				objeto => 
				game.addVisualIn(new CasaC(), objeto)
			})
			if(self.visible() != null) self.cerrar()
		}
		if(accion == "CasaG") {
			lista.forEach({ 
				objeto => 
				game.addVisualIn(new CasaG(), objeto)
			})
			if(self.visible() != null) self.cerrar()
		}
	}
	
}
