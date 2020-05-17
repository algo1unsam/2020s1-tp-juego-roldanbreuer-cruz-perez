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
class Lago{
	var property position
	var property tipo="Agua"
	method image()= "vacio35.png"
}
object resource{
	method calculo(cantidad,recursos){
		return cantidad*recursos}
	
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

//----------- NUMEROS

class Uno{
	var property position
	var property tipo = "numero"
	method image() = "assets/1.png"
}
class Dos{
	var property position
	var property tipo = "numero"
	method image() = "assets/2.png"
}
class Tres{
	var property position
	var property tipo = "numero"
	method image() = "assets/3.png"
}
class Cuatro{
	var property position
	var property tipo = "numero"
	method image() = "assets/4.png"
}
class Cinco{
	var property position
	var property tipo = "numero"
	method image() = "assets/5.png"
}
class Seis{
	var property position
	var property tipo = "numero"
	method image() = "assets/6.png"
}
class Siete{
	var property position
	var property tipo = "numero"
	method image() = "assets/7.png"
}
class Ocho{
	var property position
	var property tipo = "numero"
	method image() = "assets/8.png"
}
class Nueve{
	var property position
	var property tipo = "numero"
	method image() = "assets/9.png"
}
class Cero{
	var property position
	var property tipo = "numero"
	method image() = "assets/0.png"
}


class Diez{
	var property position
	var property tipo = "numero"
	method image() = "assets/1_.png"
}
class Veinte{
	var property position
	var property tipo = "numero"
	method image() = "assets/2_.png"
}
class Treinta{
	var property position
	var property tipo = "numero"
	method image() = "assets/3_.png"
}
class Cuarenta{
	var property position
	var property tipo = "numero"
	method image() = "assets/4_.png"
}
class Cincuenta{
	var property position
	var property tipo = "numero"
	method image() = "assets/5_.png"
}
class Sesenta{
	var property position
	var property tipo = "numero"
	method image() = "assets/6_.png"
}
class Setenta{
	var property position
	var property tipo = "numero"
	method image() = "assets/7_.png"
}
class Ochenta{
	var property position
	var property tipo = "numero"
	method image() = "assets/8_.png"
}
class Noventa{
	var property position
	var property tipo = "numero"
	method image() = "assets/9_.png"
}
class CeroCero{
	var property position
	var property tipo = "numero"
	method image() = "assets/0_.png"
}

class Cien{
	var property position
	var property tipo = "numero"
	method image() = "assets/1__.png"
}
class Doscientos{
	var property position
	var property tipo = "numero"
	method image() = "assets/2__.png"
}
class Trescientos{
	var property position
	var property tipo = "numero"
	method image() = "assets/3__.png"
}
class Cuatrocientos{
	var property position
	var property tipo = "numero"
	method image() = "assets/4__.png"
}
class Quinientos{
	var property position
	var property tipo = "numero"
	method image() = "assets/5__.png"
}
class Seiscientos{
	var property position
	var property tipo = "numero"
	method image() = "assets/6__.png"
}
class Setecientos{
	var property position
	var property tipo = "numero"
	method image() = "assets/7__.png"
}
class Ochocientos{
	var property position
	var property tipo = "numero"
	method image() = "assets/8__.png"
}
class Novecientos{
	var property position
	var property tipo = "numero"
	method image() = "assets/9__.png"
}
class CeroCeroCero{
	var property position
	var property tipo = "numero"
	method image() = "assets/0__.png"
}

object agua{
	const property area=[
					  game.at(23,7),game.at(24,7),game.at(25,7),game.at(26,7),
		game.at(22,6),game.at(23,6),game.at(24,6),game.at(25,6),game.at(26,6),
		game.at(22,5),game.at(23,5),game.at(24,5),game.at(25,5),game.at(26,5),
		game.at(22,4),game.at(23,4),game.at(24,4),game.at(25,4),game.at(26,4),
		              game.at(23,3),game.at(24,3),game.at(25,3)
]
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