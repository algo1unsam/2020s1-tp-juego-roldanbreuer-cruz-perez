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
	}
	
	method cerrar(){
		visible = null
		game.removeVisual(self)
	}
	
	method accion(accion){
		// aparecer
		if(accion == "remover")	{
			self.seleccionado().forEach({ 
				objeto => 
				if(game.getObjectsIn(objeto).size() > 0){
					const posic = game.getObjectsIn(objeto).last()
					game.removeVisual(posic)
				}
			})
			self.cerrar()
		}
		if(accion == "plantar") {
			self.accion("remover")
			self.seleccionado().forEach({ 
				objeto => 
				game.addVisualIn(new Arboleda(), objeto)
			})
		}
		if(accion == "talar") {
			self.accion("remover")
			self.seleccionado().forEach({ 
				objeto => 
				game.addVisualIn(new Talada(), objeto)
			})
		}
		if(accion == "colocarPiedra") {
			self.accion("remover")
			self.seleccionado().forEach({ 
				objeto => 
				game.addVisualIn(new Piedras(), objeto)
			})
		}
		if(accion == "minar") {
			self.accion("remover")
			self.seleccionado().forEach({ 
				objeto => 
				game.addVisualIn(new Minado(), objeto)
			})
		}
		if(accion == "pesca") {
			self.accion("remover")
			self.seleccionado().forEach({ 
				objeto => 
				game.addVisualIn(new Pesca(), objeto)
			})
		}
	}
	
}
