import wollok.game.*
import cursor.*
import estados.*
import accionesRecoleccion.*
//import menu.*

//en este archivo solo se van a encontrar los elementos que interactuen con los aldeanos(arboledas
//casas, pesca etc..)

object fondoPantallaInicial{
	method image() = "assets/PantallaInicial.png"
}

object fondoCartel{
	method image() = "assets/fondoCartel.png"
}

object pressStart{
	var cambio = 0
	
	method image() = if (cambio.even()) "assets/pressStart.png" else "assets/vacio35.png"
	method titilar(){
		cambio += 1
	}
	
}

object pausa{
	method image() = "assets/pausa.png"
}

object centralErrores{
	var property tipo = "Errores"
	method image() = "assets/vacio35.png"
}

object aldeanoLibre{
	var property position = null
	var property tipo = "AldeanoLibre"
	
	method morir(){
		aldeanos.aldeanoDisponible(aldeanos.aldeanoDisponible() - 1)
		aldeanos.aldeanos(aldeanos.aldeanos() - 1)
	}
	
}

object barraobj{}

class BarraConstruccion{
	var property position
	var property tipo = barraobj
	var property progreso = 1
	var property albanil
	
	method suma(){
		progreso += 1
		if(progreso > 5){
			albanil.finalizar()
		}
	}
	
	method resta(){
		progreso -= 1
	}
	
	method image(){
		if(progreso == 1){ return "assets/barraConst00.png" }
		else if(progreso == 2){ return "assets/barraConst20.png" }
		else if(progreso == 3){ return "assets/barraConst40.png" }
		else if(progreso == 4){ return "assets/barraConst60.png" }
		else if(progreso == 5){ return "assets/barraConst80.png" }
		else{ return "assets/barraConst100.png" }
	}
}
class BarraRecoleccion{
	var property position
	var property tipo = barraobj
	var property progreso = 1
	var property recolector
	
	method trabajable() { return false }
	
	method suma(){
		progreso += 1
		recolector.recolectar()
		if(progreso > 5){
			recolector.finalizar()
		}
	}
	
	method resta(){
		progreso -= 1
	}
	
	method image(){
		if(progreso == 1){ return "assets/barraRecurso100.png" }
		else if(progreso == 2){ return "assets/barraRecurso80.png" }
		else if(progreso == 3){ return "assets/barraRecurso60.png" }
		else if(progreso == 4){ return "assets/barraRecurso40.png" }
		else if(progreso == 5){ return "assets/barraRecurso20.png" }
		else{ return "assets/barraRecurso00.png" }
	}
}

class BarraAlmacen{
	var property position
	var property tipo = barraobj
	
	method image(){
		const recus = [recursos.cantAlimento(), recursos.cantMadera(), recursos.cantPiedra()]
		const porcentaje = (recus.max() * 100)/recursos.cantAlmacen()
		if(porcentaje < 20 and porcentaje >= 0){return "assets/barraAlmacen00.png" }
		else if(porcentaje < 40 and porcentaje >= 20){ return "assets/barraAlmacen20.png" }
		else if(porcentaje < 60 and porcentaje >= 40){ return "assets/barraAlmacen40.png" }
		else if(porcentaje < 80 and porcentaje >= 60){ return "assets/barraAlmacen60.png" }
		else if(porcentaje < 100 and porcentaje >= 80){ return "assets/barraAlmacen80.png" }
		else{ return "assets/barraAlmacen100.png" }
	}
}

// -------------   OBJETOS DEL MENU -------------------------------------------------------------------------------////
object fondoMenu{
	var property position = game.at(12,5)	
	method image() = "assets/menu.png"
}

object botonTalar{
	method image() = "assets/botonTalar.png"
}
object botonMinar{
	method image() = "assets/botonMinar.png"
}
object botonDetener{
	method image() = "assets/botonDetener.png"
}
object botonCancelar{
	method image() = "assets/botonCancelarFlat.png"
}
object botonSalir{
	method image() = "assets/botonSalir.png"
}
object tituloAcciones{
	method image() = "assets/menuTituloAcciones.png"
}
object tituloConstrucciones{
	method image() = "assets/menuTituloConstrucciones.png"
}
object botonAlmacen{
	method image() = "assets/botonAlmacen.png"
}
object botonCasaC{
	method image() = "assets/botonCasaC.png"
}
object botonCasaG{
	method image() = "assets/botonCasaG.png"
}
object botonGranja{
	method image() = "assets/botonGranja.png"
}
object botonMercado{
	method image() = "assets/botonMercado.png"
}
object botonPlantacion{
	method image() = "assets/botonPlantacion.png"
}






// -------------   RECURSOS         -------------------------------------------------------------------------------////
// -------------   MADERA

object arbol{
	var property recurso = 50
	var property tipoRecurso = madera
}

class Arboleda{
	var property accion = talada
	var property position 
	var property tipo = arbol
	var property trabajable = true
	
	method remover(){
		game.removeVisual(self)
	}
	
	method image() = "assets/arbol1.png"
}

object talada{
	var property aldeanosNecesarios = 1
	var property tiempoNecesario = 60
	var property tipoObjetivo = arbol
	
	method usarAldeano(){
		aldeanos.aldeanoTalador(aldeanos.aldeanoTalador() + 1)
	}
	
	method dejarAldeano(){
		aldeanos.aldeanoTalador(aldeanos.aldeanoTalador() - 1)
	}
	
	method trabajar(origen, posicion){
		const sonido = game.sound("assets/talar.ogg")
		sonido.play()
		game.addVisualIn(new Recolector(tipo = origen, position = posicion), posicion)
		game.getObjectsIn(cursor.position()).find({ objeto => objeto.tipo() == origen }).iniciar()
	}
	
	method continuar(origen, posicion){
		game.addVisualIn(new Recolector(tipo = origen, position = posicion, barra = game.getObjectsIn(cursor.position()).find({ objeto => objeto.tipo() == barraobj })), posicion)
		game.getObjectsIn(cursor.position()).find({ objeto => objeto.tipo() == origen }).iniciar()
	}
	
	method sound() = "assets/talar.ogg"
	method image() = "assets/talando.png"
}

// -------------   PIEDRA

object roca{
	var property recurso = 75
	var property tipoRecurso = piedra
}

class Piedras{
	var property accion = minado
	var property position 
	var property tipo = roca
	var property trabajable = true
	
	method remover(){
		game.removeVisual(self)
	}
	
	method image() = "assets/piedra2.png"
}

object minado{
	var property aldeanosNecesarios = 1
	var property tiempoNecesario = 120
	var property tipoObjetivo = roca
	
	method usarAldeano(){
		aldeanos.aldeanoMinero(aldeanos.aldeanoMinero() + 1)
	}
	
	method dejarAldeano(){
		aldeanos.aldeanoMinero(aldeanos.aldeanoMinero() - 1)
	}
	
	method trabajar(origen, posicion){
		game.addVisualIn(new Recolector(tipo = origen, position = posicion), posicion)
		game.getObjectsIn(cursor.position()).find({ objeto => objeto.tipo() == origen }).iniciar()
	}
	
	method continuar(origen, posicion){
		game.addVisualIn(new Recolector(tipo = origen, position = posicion, barra = game.getObjectsIn(cursor.position()).find({ objeto => objeto.tipo() == barraobj })), posicion)
		game.getObjectsIn(cursor.position()).find({ objeto => objeto.tipo() == origen }).iniciar()
	}
	
	
	method sound()="assets/minar.ogg"
	method image() = "assets/minado.png"
}

// -------------   PECES
object pez{
	var property recurso = 25
	var property tipoRecurso = alimento
}

class Lago{
	var property accion = pesca
	var property position 
	var property tipo = pez
	var property trabajable = true
	
	method remover(){
		
	}
	
	method image()= "assets/vacio35.png"
}

object pesca{
	var property aldeanosNecesarios = 1
	var property tiempoNecesario = 100
	var property tipoObjetivo = pez
	
	method usarAldeano(){
		aldeanos.aldeanoPescador(aldeanos.aldeanoPescador() + 1)
	}
	
	method dejarAldeano(){
		aldeanos.aldeanoPescador(aldeanos.aldeanoPescador() - 1)
	}
	
	method trabajar(origen, posicion){
		game.addVisualIn(new Recolector(tipo = origen, position = posicion), posicion)
		game.getObjectsIn(cursor.position()).find({ objeto => objeto.tipo() == origen }).iniciar()
	}
	
	method continuar(origen, posicion){
		game.addVisualIn(new Recolector(tipo = origen, position = posicion, barra = game.getObjectsIn(cursor.position()).find({ objeto => objeto.tipo() == barraobj })), posicion)
		game.getObjectsIn(cursor.position()).find({ objeto => objeto.tipo() == origen }).iniciar()
	}
	
	
	method image() = "assets/pesca.png"
}





class Granjero{
	var property position
	method image() = "assets/vaca35.png"
}
class Agricultor{
	var property position
	method image() = "assets/recoleccion.png"
}

// -------------   CONSTRUCCIONES   -------------------------------------------------------------------------------////

class Construir{
	var property tipo = null
	var property position
	var property accion

	method image() = accion.image()
}


class Construir2{
	var property position
	method image() = "assets/construir.png"
}

object casaC{
	var property costoAlimento = 0
	var property costoMadera = 100
	var property costoPiedra = 0
	var property tiempoNecesario = 20
	var property aldeanosNecesarios = 1 
	
	method image() = "assets/casa1-35.png"
	
	method usarAldeano(){
		aldeanos.aldeanoConstructor(aldeanos.aldeanoConstructor() + 1)
	}
	
	method dejarAldeano(){
		aldeanos.aldeanoConstructor(aldeanos.aldeanoConstructor() - 1)
	}
	
	method activar(){
		aldeanos.poblacion(aldeanos.poblacion() + 1)
	}
	method completarEspacios(){}
}

object casaG{
	var property costoAlimento = 0
	var property costoMadera = 200
	var property costoPiedra = 100
	var property tiempoNecesario = 50
	var property aldeanosNecesarios = 1 
	
	method image() = "assets/casa2-35.png"
	
	method usarAldeano(){
		aldeanos.aldeanoConstructor(aldeanos.aldeanoConstructor() + 1)
	}
	
	method dejarAldeano(){
		aldeanos.aldeanoConstructor(aldeanos.aldeanoConstructor() - 1)
	}
	
	method activar(){
		aldeanos.poblacion(aldeanos.poblacion() + 3)
	}
	method completarEspacios(){}
	
}
object almacenB{
	var property costoAlimento = 0
	var property costoMadera = 0
	var property costoPiedra = 50
	var property tiempoNecesario = 10
	var property aldeanosNecesarios = 1 
	
	method image() = "assets/almacen35.png"
	
	method usarAldeano(){
		aldeanos.aldeanoConstructor(aldeanos.aldeanoConstructor() + 1)
	}
	
	method dejarAldeano(){
		aldeanos.aldeanoConstructor(aldeanos.aldeanoConstructor() - 1)
	}
	
	method activar(){
		recursos.cantAlmacen(recursos.cantAlmacen() + 50)
	}
	
	method completarEspacios(){}
	
}
class Mercado{
	var property tipo = null
	var property costoAlimento = 0
	var property costoMadera = 300
	var property costoPiedra = 300
	var property tiempoNecesario = 300
	var property aldeanosNecesarios = 2 
	method image() = "assets/market70.png"
	
	method usarAldeano(){
		aldeanos.aldeanoConstructor(aldeanos.aldeanoConstructor() + 2)
	}
	
	method dejarAldeano(){
		aldeanos.aldeanoConstructor(aldeanos.aldeanoConstructor() - 2)
	}
	
	method activar(){
		if(recursos.mercadosConstruidos()<3){
			recursos.mercadosConstruidos(recursos.mercadosConstruidos() + 1)
		}
	}
	method completarEspacios(){
		game.addVisualIn(new MercadoVacio(), cursor.position().up(1))
		game.addVisualIn(new MercadoVacio(), cursor.position().up(1).right(1))
		game.addVisualIn(new MercadoVacio(), cursor.position().right(1))
	}
}

class MercadoVacio inherits Mercado{
	override method image() = "assets/vacio35.png"
}

class Granja{
	var property tipo = null
	var property costoAlimento = 0
	var property costoMadera = 500
	var property costoPiedra = 50
	var property tiempoNecesario = 300
	var property aldeanosNecesarios = 2 
	
	method image() = "assets/granjaAnimales.png"
	
	method usarAldeano(){
		aldeanos.aldeanoConstructor(aldeanos.aldeanoConstructor() + 1)
	}
	
	method dejarAldeano(){
		aldeanos.aldeanoConstructor(aldeanos.aldeanoConstructor() - 1)
	}
	
	method activar(){}
	
	 method completarEspacios(){
		game.addVisualIn(new GranjaVacio(), cursor.position().up(1))
		game.addVisualIn(new GranjaVacio(), cursor.position().up(1).right(1))
		game.addVisualIn(new GranjaVacio(), cursor.position().right(1))
	}	
}
class GranjaVacio inherits Granja{
	override method image() = "assets/vacio35.png"	
}

class Plantacion{
	var property tipo = null
	var property costoAlimento = 0
	var property costoMadera = 800
	var property costoPiedra = 150
	var property tiempoNecesario = 600
	var property aldeanosNecesarios = 2 
	
	method image() = "assets/plantacion.png"
	
	method usarAldeano(){
		aldeanos.aldeanoConstructor(aldeanos.aldeanoConstructor() + 1)
	}
	
	method dejarAldeano(){
		aldeanos.aldeanoConstructor(aldeanos.aldeanoConstructor() - 1)
	}
	
	method activar(){}
	
	method completarEspacios(){
		game.addVisualIn(new PlantacionVacio(), cursor.position().up(1))
		game.addVisualIn(new PlantacionVacio(), cursor.position().up(1).right(1))
		game.addVisualIn(new PlantacionVacio(), cursor.position().right(1))
	}	
	
}
class PlantacionVacio inherits Plantacion{
	override method image() = "assets/vacio35.png"
}
// -------------                    -------------------------------------------------------------------------------////

object gameover{
	method image() = "assets/gameover.png"
}

object agua{
	const property area=[
			          game.at(23,8),game.at(24,8),game.at(25,80),		
		game.at(22,7),game.at(23,7),game.at(24,7),game.at(25,7),game.at(26,7),
		game.at(22,6),game.at(23,6),game.at(24,6),game.at(25,6),game.at(26,6),
		game.at(22,5),game.at(23,5),game.at(24,5),game.at(25,5),game.at(26,5),
		game.at(22,4),game.at(23,4),game.at(24,4),game.at(25,4),game.at(26,4),
		game.at(22,4),game.at(23,3),game.at(24,3),game.at(25,3)
]
}

object arboles{
	const property area = [game.at(0,18),game.at(1,18),game.at(2,18),game.at(3,18),game.at(4,18),game.at(5,18),game.at(6,18),game.at(7,18),game.at(8,18),game.at(9,18),game.at(10,18),game.at(11,18),game.at(12,18),game.at(13,18),game.at(14,18),game.at(15,18),game.at(16,18),game.at(17,18),game.at(18,18),game.at(19,18),game.at(20,18),game.at(21,18),game.at(25,18),game.at(26,18),game.at(27,18),game.at(28,18),game.at(29,18),game.at(30,18),game.at(31,18),game.at(32,18),game.at(33,18),game.at(34,18),game.at(35,18),game.at(36,18),
game.at(0,17),game.at(1,17),game.at(2,17),game.at(3,17),game.at(4,17),game.at(5,17),game.at(6,17),game.at(7,17),game.at(8,17),game.at(9,17),game.at(10,17),game.at(11,17),game.at(12,17),game.at(13,17),game.at(14,17),game.at(15,17),game.at(16,17),game.at(17,17),game.at(18,17),game.at(19,17),game.at(20,17),game.at(21,17),game.at(22,17),game.at(25,17),game.at(26,17),game.at(27,17),game.at(28,17),game.at(29,17),game.at(30,17),game.at(31,17),game.at(32,17),game.at(33,17),game.at(34,17),game.at(35,17),game.at(36,17),
game.at(0,16),game.at(1,16),game.at(2,16),game.at(3,16),game.at(4,16),game.at(5,16),game.at(6,16),game.at(7,16),game.at(8,16),game.at(9,16),game.at(10,16),game.at(11,16),game.at(12,16),game.at(13,16),game.at(14,16),game.at(15,16),game.at(16,16),game.at(17,16),game.at(18,16),game.at(19,16),game.at(20,16),game.at(21,16),game.at(22,16),game.at(23,16),game.at(24,16),game.at(25,16),game.at(26,16),game.at(27,16),game.at(28,16),game.at(29,16),game.at(30,16),game.at(34,16),game.at(35,16),game.at(36,16),
game.at(0,15),game.at(1,15),game.at(2,15),game.at(3,15),game.at(4,15),game.at(5,15),game.at(6,15),game.at(7,15),game.at(8,15),game.at(9,15),game.at(10,15),game.at(11,15),game.at(12,15),game.at(13,15),game.at(14,15),game.at(15,15),game.at(16,15),game.at(17,15),game.at(18,15),game.at(19,15),game.at(20,15),game.at(21,15),game.at(22,15),game.at(23,15),game.at(24,15),game.at(25,15),game.at(26,15),game.at(27,15),game.at(28,15),game.at(29,15),game.at(30,15),game.at(34,15),game.at(35,15),game.at(36,15),
game.at(0,14),game.at(1,14),game.at(2,14),game.at(3,14),game.at(4,14),game.at(5,14),game.at(6,14),game.at(7,14),game.at(8,14),game.at(9,14),game.at(10,14),game.at(11,14),game.at(12,14),game.at(13,14),game.at(14,14),game.at(15,14),game.at(16,14),game.at(17,14),game.at(18,14),game.at(19,14),game.at(20,14),game.at(21,14),game.at(22,14),game.at(23,14),game.at(24,14),game.at(25,14),game.at(26,14),game.at(27,14),game.at(28,14),game.at(29,14),game.at(30,14),game.at(31,14),game.at(32,14),game.at(33,14),game.at(34,14),game.at(35,14),game.at(36,14),
game.at(0,13),game.at(1,13),game.at(2,13),game.at(3,13),game.at(4,13),game.at(5,13),game.at(6,13),game.at(7,13),game.at(8,13),game.at(9,13),game.at(10,13),game.at(11,13),game.at(12,13),game.at(13,13),game.at(14,13),game.at(15,13),game.at(16,13),game.at(17,13),game.at(18,13),game.at(19,13),game.at(20,13),game.at(21,13),game.at(22,13),game.at(23,13),game.at(24,13),game.at(25,13),game.at(26,13),game.at(27,13),game.at(28,13),game.at(29,13),game.at(30,13),game.at(31,13),game.at(32,13),game.at(33,13),game.at(34,13),game.at(35,13),game.at(36,13),
game.at(0,12),game.at(1,12),game.at(2,12),game.at(3,12),game.at(4,12),game.at(5,12),game.at(6,12),game.at(7,12),game.at(8,12),game.at(9,12),game.at(17,12),game.at(18,12),game.at(19,12),game.at(20,12),game.at(21,12),game.at(22,12),game.at(23,12),game.at(24,12),game.at(25,12),game.at(26,12),game.at(27,12),game.at(28,12),game.at(29,12),game.at(30,12),game.at(31,12),game.at(32,12),game.at(33,12),game.at(34,12),game.at(35,12),game.at(36,12),
game.at(19,11),game.at(20,11),game.at(21,11),game.at(22,11),game.at(23,11),game.at(24,11),game.at(25,11),game.at(26,11),game.at(27,11),game.at(28,11),game.at(29,11),game.at(30,11),game.at(31,11),game.at(32,11),game.at(33,11),game.at(34,11),game.at(35,11),game.at(36,11),
game.at(19,10),game.at(20,10),game.at(21,10),game.at(22,10),game.at(23,10),game.at(24,10),game.at(25,10),game.at(26,10),game.at(27,10),game.at(28,10),game.at(29,10),game.at(30,10),game.at(31,10),game.at(32,10),game.at(33,10),game.at(34,10),game.at(35,10),game.at(36,10),
game.at(0,9),game.at(1,9),game.at(2,9),game.at(3,9),game.at(4,9),game.at(5,9),game.at(6,9),game.at(7,9),game.at(8,9),game.at(9,9),game.at(10,9),game.at(11,9),game.at(12,9),game.at(13,9),game.at(14,9),game.at(15,9),game.at(16,9),game.at(20,9),game.at(21,9),game.at(22,9),game.at(23,9),game.at(24,9),game.at(27,9),game.at(28,9),game.at(29,9),game.at(30,9),game.at(31,9),game.at(32,9),game.at(33,9),game.at(34,9),game.at(35,9),game.at(36,9),
game.at(0,8),game.at(1,8),game.at(2,8),game.at(3,8),game.at(4,8),game.at(5,8),game.at(6,8),game.at(7,8),game.at(8,8),game.at(9,8),game.at(10,8),game.at(11,8),game.at(12,8),game.at(13,8),game.at(14,8),game.at(15,8),game.at(16,8),game.at(17,8),game.at(21,8),game.at(22,8),game.at(28,8),game.at(29,8),game.at(30,8),game.at(31,8),game.at(32,8),game.at(33,8),game.at(34,8),game.at(35,8),game.at(36,8),
game.at(0,7),game.at(1,7),game.at(2,7),game.at(3,7),game.at(4,7),game.at(5,7),game.at(6,7),game.at(7,7),game.at(8,7),game.at(9,7),game.at(10,7),game.at(11,7),game.at(12,7),game.at(13,7),game.at(14,7),game.at(15,7),game.at(16,7),game.at(17,7),game.at(28,7),game.at(29,7),game.at(30,7),game.at(31,7),game.at(32,7),game.at(33,7),game.at(34,7),game.at(35,7),game.at(36,7),
game.at(0,6),game.at(1,6),game.at(2,6),game.at(3,6),game.at(4,6),game.at(5,6),game.at(6,6),game.at(7,6),game.at(8,6),game.at(9,6),game.at(10,6),game.at(11,6),game.at(12,6),game.at(13,6),game.at(14,6),game.at(15,6),game.at(16,6),game.at(17,6),game.at(18,6),game.at(27,6),game.at(28,6),game.at(29,6),game.at(30,6),game.at(31,6),game.at(32,6),game.at(33,6),game.at(34,6),game.at(35,6),game.at(36,6),
game.at(0,5),game.at(1,5),game.at(2,5),game.at(3,5),game.at(4,5),game.at(5,5),game.at(6,5),game.at(7,5),game.at(8,5),game.at(9,5),game.at(10,5),game.at(11,5),game.at(12,5),game.at(13,5),game.at(14,5),game.at(15,5),game.at(16,5),game.at(17,5),game.at(18,5),game.at(19,5),game.at(20,5),game.at(21,5),game.at(27,5),game.at(28,5),game.at(29,5),game.at(30,5),game.at(31,5),game.at(32,5),game.at(33,5),game.at(34,5),game.at(35,5),game.at(36,5),
game.at(0,4),game.at(1,4),game.at(2,4),game.at(3,4),game.at(4,4),game.at(5,4),game.at(6,4),game.at(7,4),game.at(8,4),game.at(9,4),game.at(10,4),game.at(11,4),game.at(12,4),game.at(13,4),game.at(14,4),game.at(15,4),game.at(16,4),game.at(17,4),game.at(18,4),game.at(19,4),game.at(20,4),game.at(27,4),game.at(28,4),game.at(29,4),game.at(30,4),game.at(31,4),game.at(32,4),game.at(33,4),game.at(34,4),game.at(35,4),game.at(36,4),
game.at(6,3),game.at(7,3),game.at(8,3),game.at(9,3),game.at(10,3),game.at(11,3),game.at(12,3),game.at(13,3),game.at(14,3),game.at(15,3),game.at(16,3),game.at(17,3),game.at(18,3),game.at(19,3),game.at(20,3),game.at(21,3),game.at(27,3),game.at(28,3),game.at(29,3),game.at(30,3),
game.at(6,2),game.at(7,2),game.at(8,2),game.at(9,2),game.at(10,2),game.at(11,2),game.at(12,2),game.at(13,2),game.at(14,2),game.at(15,2),game.at(16,2),game.at(17,2),game.at(18,2),game.at(19,2),game.at(20,2),game.at(21,2),game.at(24,2),game.at(25,2),game.at(26,2),game.at(27,2),game.at(28,2),game.at(29,2),game.at(30,2),
game.at(6,1),game.at(9,1),game.at(10,1),game.at(11,1),game.at(12,1),game.at(13,1),game.at(14,1),game.at(15,1),game.at(16,1),game.at(17,1),game.at(18,1),game.at(19,1),game.at(20,1),game.at(21,1),game.at(22,1),game.at(23,1),game.at(24,1),game.at(25,1),game.at(26,1),game.at(27,1),game.at(28,1),game.at(29,1),game.at(30,1),
game.at(6,0),game.at(10,0),game.at(11,0),game.at(12,0),game.at(13,0),game.at(14,0),game.at(15,0),game.at(16,0),game.at(17,0),game.at(18,0),game.at(19,0),game.at(20,0),game.at(21,0),game.at(22,0),game.at(23,0),game.at(24,0),game.at(25,0),game.at(26,0),game.at(27,0),game.at(28,0),game.at(29,0),game.at(30,0)

]
}
object piedras{
	const property area = [game.at(22,18),game.at(23,18),game.at(24,18),
game.at(23,17),game.at(24,17),
game.at(31,16),game.at(32,16),game.at(33,16),
game.at(31,15),game.at(32,15),game.at(33,15),
game.at(25,9),game.at(26,9),
game.at(26,8),game.at(27,8),
game.at(27,7),
game.at(26,3),
game.at(22,2),game.at(23,2),
game.at(7,1),game.at(8,1),
game.at(7,0),game.at(8,0),game.at(9,0)]
}