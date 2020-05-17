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
	method calcularRecursos(){}
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
object resource{
	method calculo(cantidad,recursos){
		return cantidad*recursos}
	
}
object hud{
	var property position = game.at(0,0)
	var property tipo = "hud"
	method image() = "assets/hud.png"
}
object botonTalar{
	var property tipo = "boton"
	method image() = "assets/botonTalar.png"
}
object botonMinar{
	var property tipo = "boton"
	method image() = "assets/botonMinar.png"
}
object botonDetener{
	var property tipo = "boton"
	method image() = "assets/botonDetener.png"
}
object botonCancelar{
	var property tipo = "boton"
	method image() = "assets/botonCancelarFlat.png"
}
object botonSalir{
	var property tipo = "boton"
	method image() = "assets/botonSalir.png"
}
object tituloAcciones{
	var property tipo = "boton"
	method image() = "assets/menuTituloAcciones.png"
}
object tituloConstrucciones{
	var property tipo = "boton"
	method image() = "assets/menuTituloConstrucciones.png"
}
object botonAlmacen{
	var property tipo = "boton"
	method image() = "assets/botonAlmacen.png"
}
object botonCasaC{
	var property tipo = "boton"
	method image() = "assets/botonCasaC.png"
}
object botonCasaG{
	var property tipo = "boton"
	method image() = "assets/botonCasaG.png"
}
class CasaC{
	var property position
	var property tipo = "construccion"
	method image() = "assets/casa1-35.png"
}
class CasaG{
	var property position
	var property tipo = "construccion"
	method image() = "assets/casa2-35.png"
}
class Almacen{
	var property position
	var property tipo = "construccion"
	method image() = "assets/almacen35.png"
}



object arboledaNO{
	const property area = [
game.at(0,18),game.at(1,18),game.at(2,18),game.at(3,18),game.at(4,18),game.at(5,18),game.at(6,18),game.at(7,18),game.at(8,18),game.at(9,18),
game.at(0,17),game.at(1,17),game.at(2,17),game.at(3,17),game.at(4,17),game.at(5,17),game.at(6,17),game.at(7,17),game.at(8,17),game.at(9,17),
game.at(0,16),game.at(1,16),game.at(2,16),game.at(3,16),game.at(4,16),game.at(5,16),game.at(6,16),game.at(7,16),game.at(8,16),game.at(9,16),
game.at(0,15),game.at(1,15),game.at(2,15),game.at(3,15),game.at(4,15),game.at(5,15),game.at(6,15),game.at(7,15),game.at(8,15),game.at(9,15),
game.at(0,14),game.at(1,14),game.at(2,14),game.at(3,14),game.at(4,14),game.at(5,14),game.at(6,14),game.at(7,14),
game.at(0,13),game.at(1,13),game.at(2,13),game.at(3,13),game.at(4,13),game.at(5,13),
game.at(0,18),game.at(1,18),game.at(2,18),game.at(3,18)]
}
object piedras{
	const property area = [game.at(26,8),game.at(27,8),game.at(31,16),game.at(22,18)]
}