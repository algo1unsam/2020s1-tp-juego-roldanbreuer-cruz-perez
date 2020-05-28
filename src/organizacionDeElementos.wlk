import wollok.game.*
class Elemento{
	var property position 
	
	method remover(){game.removeVisual(self)}
	
	method image() 
	
	method trabajar(origen, posicion){
		game.addVisualIn(new Recolector(tipo = origen, position = posicion), posicion)
		game.getObjectsIn(cursor.position()).find({ objeto => objeto.tipo() == origen }).iniciar()
	}
	
}

class Arboleda inherits Elemento{
	method image()= "assets/arbol1.png"
	
	method usarAldeano(){
		aldeanos.aldeanoTalador(aldeanos.aldeanoTalador() + 1)
	}
	
	method dejarAldeano(){
		aldeanos.aldeanoTalador(aldeanos.aldeanoTalador() - 1)
	}
	method sound() = "talar.ogg"
	method image() = "assets/talando.png"
}