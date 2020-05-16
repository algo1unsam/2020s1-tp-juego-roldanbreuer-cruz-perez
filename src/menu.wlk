import wollok.game.*
import pepita.*
import elementosGame.*
import teclas.*
//solo para comodidad del desarrollo del juego
//en este archivo se encuentran solamente los elementos que componen el menu
object menu{
	var property visible
	var property seleccionado
	
	method image() = "assets/menu.png"
	
	method aparecer(motivo){
		visible = motivo
		game.addVisualIn(self, game.at(12,6))
		game.addVisualIn(botonTalar, game.at(13,12))
		game.addVisualIn(botonMinar, game.at(16,12))
		game.addVisualIn(botonDetener, game.at(19,12))
		game.addVisualIn(botonCancelar, game.at(22,12))
		
	}
	
	method cerrar(){
		visible = null
		game.removeVisual(self)
		game.removeVisual(botonTalar)
		game.removeVisual(botonMinar)
		game.removeVisual(botonDetener)
		game.removeVisual(botonCancelar)
	}
	
	
	method remover(tipo,lista){
		lista.forEach({ 
			objeto => 
			if(game.getObjectsIn(objeto).filter({ filtro => filtro.tipo() == tipo }).size() > 0){
				const posic = game.getObjectsIn(objeto).filter({ filtro => filtro.tipo() == "Seleccion" }).last()
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
	}
	
}
