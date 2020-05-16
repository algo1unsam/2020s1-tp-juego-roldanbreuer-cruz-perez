import wollok.game.*
import pepita.*
//en este archivo solo se van a encontrar los elementos que interactuen con los aldeanos(arboledas
//casas, pesca etc..)
//solo para comodidad del desarrollo del juego
class Arboleda{
	var property position
	var property tipo = "Arboleda"
	method image() = "assets/arbol1.png"
}
class Talada{
	var property position
	var property tipo = "Talada"
	method image() = "assets/talando.png"
}

class Piedras{
	var property position
	var property tipo = "Piedras"
	method image() = "assets/piedra2.png"
}

class Minado{
	var property position
	var property tipo = "Minado"
	method image() = "assets/minado.png"
}
class Pesca{
	var property position
	var property tipo = "Pesca"
	method image() = "assets/pesca.png"
}