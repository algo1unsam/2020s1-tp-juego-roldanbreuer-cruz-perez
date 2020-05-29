
import estados.*
import wollok.game.*
//aca estoy tratando de achicar el archivo hud en metodos de unidades, decenas, centenas, etc.. sin importar que es lo que le mande, y me pueda 
//returnar el calculo que necesito para el hud
//cuando estes disponible te cuento la idea

object hud{
	var property position = game.at(0,0)
	var property tipo = "hud"
	var property tiempo = 0
	var property trabajaMadera = 0
	var property trabajaPiedra = 0
	var property trabajaPesca  = 0
	var property trabajaGranja = 0
	var property trabajaGanaderia = 0	
	
	
	method image() = "assets/hud.png"
}

object unidades{
	method imagen(valor){
		if(valor == "0"){
			return "assets/0.png"
		}else if(valor == "1"){
			return "assets/1.png"
		}else if(valor == "2"){
			return "assets/2.png"
		}else if(valor == "3"){
			return "assets/3.png"
		}else if(valor == "4"){
			return "assets/4.png"
		}else if(valor == "5"){
			return "assets/5.png"
		}else if(valor == "6"){
			return "assets/6.png"
		}else if(valor == "7"){
			return "assets/7.png"
		}else if(valor == "8"){
			return "assets/8.png"
		}else if(valor == "9"){
			return "assets/9.png"
		}else{
			return "assets/vacio35.png"
		}
	}
}
object decenas{
	method imagen(valor){
		if(valor == "0"){
			return "assets/0_.png"
		}else if(valor == "1"){
			return "assets/1_.png"
		}else if(valor == "2"){
			return "assets/2_.png"
		}else if(valor == "3"){
			return "assets/3_.png"
		}else if(valor == "4"){
			return "assets/4_.png"
		}else if(valor == "5"){
			return "assets/5_.png"
		}else if(valor == "6"){
			return "assets/6_.png"
		}else if(valor == "7"){
			return "assets/7_.png"
		}else if(valor == "8"){
			return "assets/8_.png"
		}else if(valor == "9"){
			return "assets/9_.png"
		}else{
			return "assets/vacio35.png"
		}
	}
}
object cientos{
	method imagen(valor){
		if(valor == "0"){
			return "assets/0__.png"
		}else if(valor == "1"){
			return "assets/1__.png"
		}else if(valor == "2"){
			return "assets/2__.png"
		}else if(valor == "3"){
			return "assets/3__.png"
		}else if(valor == "4"){
			return "assets/4__.png"
		}else if(valor == "5"){
			return "assets/5__.png"
		}else if(valor == "6"){
			return "assets/6__.png"
		}else if(valor == "7"){
			return "assets/7__.png"
		}else if(valor == "8"){
			return "assets/8__.png"
		}else if(valor == "9"){
			return "assets/9__.png"
		}else{
			return "assets/vacio35.png"
		}
	}
}


//---- unidad en este caso es la clase padre-----

class Unidad{
	var property origen
	var property position
	method image(){
		const stringNumero= origen.toString()
		return unidades.imagen(stringNumero.reverse().charAt(0))
	}
}

class Decena inherits Unidad{
	override method image(){
		const stringNumero = origen.toString()
		var valor = null
		if(stringNumero.length() > 1){
			valor = stringNumero.reverse().drop(1).charAt(0)
		}
		return decenas.imagen(valor)
	}
}

class Centena inherits Unidad{
	override method image(){
		const stringNumero = origen.toString()
		var valor = null
		if(stringNumero.length() > 2){
			valor = stringNumero.reverse().drop(2).charAt(0)
		}
		return cientos.imagen(valor)
	}
}
// ACA VOY A EMPEZAR A HEREDAR DE ESTAS TRES CLASES PADRES PARA TODOS LOS ELEMENTOS DEL HUD
//recordar setear origen y position al instanciar los objetos
class AlmacenUnidad inherits Unidad{}
class AlmacenDecena inherits Decena{}
class AlmacenCentena inherits Centena{}
class AlmacenMiles inherits Unidad{
	override method image(){
		const stringNumero = origen.toString()
		var valor = null
		if(stringNumero.length() > 3){
			valor = stringNumero.reverse().drop(3).charAt(0)
		}
		return unidades.imagen(valor)
	}
	}
class AlmacenDecenaMiles inherits Decena{
	override method image(){
		const stringNumero = origen.toString()
		var valor = null
		if(stringNumero.length() > 4){
			valor = stringNumero.reverse().drop(4).charAt(0)
		}
		return decenas.imagen(valor)
	}
}
class AlmacenCentenaMiles inherits Centena{
	override method image(){
		const stringNumero = origen.toString()
		var valor = null
		if(stringNumero.length() > 4){
			valor = stringNumero.reverse().drop(4).charAt(0)
		}
		return decenas.imagen(valor)
	}
}
//timer

// alimento
class AlimentoUnidad inherits AlmacenUnidad{}
class AlimentoDecena inherits AlmacenDecena{}
class AlimentoCentena inherits AlmacenCentena{}
class AlimentoMiles inherits AlmacenMiles{}
class AlimentoDecenaMiles inherits AlmacenDecenaMiles{}
class AlimentoCentenaMiles inherits AlmacenCentenaMiles{}
class MaderaUnidad inherits AlmacenUnidad{}
class MaderaDecena inherits AlmacenDecena{}
class MaderaCentena inherits AlmacenCentena{}
class MaderaMiles inherits AlmacenMiles{}
class MaderaDecenaMiles inherits AlmacenDecenaMiles{}
class MaderaCentenaMiles inherits AlmacenCentenaMiles{}
class PiedraUnidad inherits AlmacenUnidad{}
class PiedraDecena inherits AlmacenDecena{}
class PiedraCentena inherits AlmacenCentena{}
class PiedraMiles inherits AlmacenMiles{}
class PiedraDecenaMiles inherits AlmacenDecenaMiles{}
class PiedraCentenaMiles inherits AlmacenCentenaMiles{}
class AldeanosUnidad inherits AlmacenUnidad{}
class AldeanosDecena inherits AlmacenDecena{}
class AldeanosCentena inherits AlmacenCentena{}
class AldeanosMiles inherits AlmacenMiles{}
class AldeanosDecenaMiles inherits AlmacenDecenaMiles{}
class AldeanosCentenaMiles inherits AlmacenCentenaMiles{}
class PoblacionUnidad inherits AlmacenUnidad{}
class PoblacionDecena inherits AlmacenDecena{}
class PoblacionCentena inherits AlmacenCentena{}
class PoblacionMiles inherits AlmacenMiles{}
class PoblacionDecenaMiles inherits AlmacenDecenaMiles{}
class PoblacionCentenaMiles inherits AlmacenCentenaMiles{}
class AldeanosDisponiblesUnidad inherits Unidad{}
class AldeanosDisponiblesDecena inherits Decena{}
class AldeanosDisponiblesCentena inherits Centena{}
class TaladorUnidad inherits Unidad{}
class TaladorDecena inherits Decena{}
class TaladorCentena inherits Centena{}
class MineroUnidad inherits Unidad{}
class MineroDecena inherits Decena{}
class MineroCentena inherits Centena{}
class ConstructorUnidad inherits Unidad{}
class ConstructorDecena inherits Decena{}
class ConstructorCentena inherits Centena{}
class GranjeroUnidad inherits Unidad{}
class GranjeroDecena inherits Decena{}
class GranjeroCentena inherits Centena{}
class AgricultorUnidad inherits Unidad{}
class AgricultorDecena inherits Decena{}
class AgricultorCentena inherits Centena{}
class PescadorUnidad inherits Unidad{}
class PescadorDecena inherits Decena{}
class PescadorCentena inherits Centena{}
class CazadorUnidad inherits Unidad{}
class CazadorDecena inherits Decena{}
class CazadorCentena inherits Centena{}
object cargarHud{
	method instanciarClases(){
	var almacenUnidad= new AlmacenUnidad(origen=recursos.cantAlmacen(),position=game.at(17,19))
	var almacenDecena= new AlmacenDecena(origen=recursos.cantAlmacen(),position=game.at(17,19))
	var almacenCentena= new AlmacenCentena(origen=recursos.cantAlmacen(),position=game.at(17,19))
	const almacenMiles= new AlmacenMiles(origen=recursos.cantAlmacen(),position=game.at(16,19))
	const almacenDecenaMiles= new AlmacenDecenaMiles(origen=recursos.cantAlmacen(),position=game.at(16,19))
	const almacenCentenaMiles= new AlmacenCentenaMiles(origen=recursos.cantAlmacen(),position=game.at(16,19))
	const alimentoUnidad= new AlimentoUnidad(origen=recursos.cantAlimento(),position=game.at(2,19))
	const alimentoDecena= new AlimentoDecena(origen=recursos.cantAlimento(),position=game.at(2,19))
	const alimentoCentena= new AlimentoCentena(origen=recursos.cantAlimento(),position=game.at(2,19))
	const alimentoMiles= new AlimentoMiles(origen=recursos.cantAlimento(),position=game.at(1,19))
	const alimentoDecenaMiles= new AlimentoDecenaMiles(origen=recursos.cantAlimento(),position=game.at(1,19))
	const alimentoCentenaMiles= new AlimentoCentenaMiles(origen=recursos.cantAlimento(),position=game.at(1,19))
	const maderaUnidad= new MaderaUnidad(origen=recursos.cantMadera(),position=game.at(5,19))
	const maderaDecena= new MaderaDecena(origen=recursos.cantMadera(),position=game.at(5,19))
	const maderaCentena= new MaderaCentena(origen=recursos.cantMadera(),position=game.at(5,19))
	const maderaMiles= new MaderaMiles(origen=recursos.cantMadera(),position=game.at(4,19))
	const maderaDecenaMiles= new MaderaDecenaMiles(origen=recursos.cantMadera(),position=game.at(4,19))
	const maderaCentenaMiles= new MaderaCentenaMiles(origen=recursos.cantMadera(),position=game.at(4,19))
	const piedraUnidad= new PiedraUnidad(origen=recursos.cantPiedra(),position=game.at(8,19))
	const piedraCentena= new PiedraCentena(origen=recursos.cantPiedra(),position=game.at(8,19))
	const piedraMiles= new PiedraMiles(origen=recursos.cantPiedra(),position=game.at(7,19))
	const piedraDecenaMiles= new PiedraDecenaMiles(origen=recursos.cantPiedra(),position=game.at(7,19))
	const piedraCentenaMiles= new PiedraCentenaMiles(origen=recursos.cantPiedra(),position=game.at(7,19))
	const aldeanosUnidad= new AldeanosUnidad(origen=aldeanos.aldeanos(),position=game.at(11,19))
	const aldeanosDecena= new AldeanosDecena(origen=aldeanos.aldeanos(),position=game.at(11,19))
	const aldeanosCentena= new AldeanosCentena(origen=aldeanos.aldeanos(),position=game.at(11,19))
	const aldeanosMiles= new AldeanosMiles(origen=aldeanos.aldeanos(),position=game.at(10,19))
	const aldeanosDecenaMiles= new AldeanosDecenaMiles(origen=aldeanos.aldeanos(),position=game.at(10,19))
	const aldeanosCentenaMiles= new AldeanosCentenaMiles(origen=aldeanos.aldeanos(),position=game.at(10,19))
	const poblacionUnidad= new PoblacionUnidad(origen=aldeanos.poblacion(),position=game.at(14,19))
	const poblacionDecena= new PoblacionDecena(origen=aldeanos.poblacion(),position=game.at(14,19))
	const poblacionCentena= new PoblacionCentena(origen=aldeanos.poblacion(),position=game.at(14,19))
	const poblacionMiles= new PoblacionMiles(origen=aldeanos.poblacion(),position=game.at(13,19))
	const poblacionDecenaMiles= new PoblacionDecenaMiles(origen=aldeanos.poblacion(),position=game.at(13,19))
	const poblacionCentenaMiles= new PoblacionCentenaMiles(origen=aldeanos.poblacion(),position=game.at(13,19))
	const aldeanosDispUnidad= new AldeanosDisponiblesUnidad(origen=aldeanos.aldeanoDisponible(),position=game.at(2,3))
	const aldeanosDispDecena= new AldeanosDisponiblesDecena(origen=aldeanos.aldeanoDisponible(),position=game.at(2,3))
	const aldeanosDispCentena= new AldeanosDisponiblesCentena(origen=aldeanos.aldeanoDisponible(),position=game.at(2,3))
	const aldeanoTaladorUnidad= new TaladorUnidad(origen=aldeanos.aldeanoTalador(),position=game.at(2,2))
	const aldeanoTaladorDecena= new TaladorDecena(origen=aldeanos.aldeanoTalador(),position=game.at(2,2))
	const aldeanoTaladorCentena= new TaladorCentena(origen=aldeanos.aldeanoTalador(),position=game.at(2,2))
	const aldeanoMineroUnidad= new MineroUnidad(origen=aldeanos.aldeanoMinero(),position=game.at(2,1))
	const aldeanoMineroDecena= new MineroDecena(origen=aldeanos.aldeanoMinero(),position=game.at(2,1))
	const aldeanoMineroCentena= new MineroCentena(origen=aldeanos.aldeanoMinero(),position=game.at(2,1))
	const aldeanoConstructorUnidad= new ConstructorUnidad(origen=aldeanos.aldeanoConstructor(),position=game.at(2,0))
	const aldeanoConstructorDecena= new ConstructorDecena(origen=aldeanos.aldeanoConstructor(),position=game.at(2,0))
	const aldeanoConstructorCentena= new ConstructorCentena(origen=aldeanos.aldeanoConstructor(),position=game.at(2,0))
	const aldeanoPescadorUnidad= new PescadorUnidad(origen=aldeanos.aldeanoPescador(),position=game.at(5,1))
	const aldeanoPescadorDecena= new PescadorDecena(origen=aldeanos.aldeanoPescador(),position=game.at(5,1))
	const aldeanoPescadorCentena= new PescadorCentena(origen=aldeanos.aldeanoPescador(),position=game.at(5,1))
	}
	method cargarHud() {
	game.addVisual(almacenUnidad)
	game.addVisual(almacenDecena)
	game.addVisual(almacenCientos)
	game.addVisual(almacenMiles)
	game.addVisual(almacenDecenaMiles)
	game.addVisual(almacenCientosMiles)	
	game.addVisual(alimentoUnidad)
	game.addVisual(alimentoDecena)
	game.addVisual(alimentoCentena)
	game.addVisual(alimentoMiles)
	game.addVisual(alimentoDecenaMiles)
	game.addVisual(alimentoCientosMiles)
	game.addVisual(maderaUnidad)
	game.addVisual(maderaDecena)
	game.addVisual(maderaCentena)
	game.addVisual(maderaMiles)
	game.addVisual(maderaDecenaMiles)
	game.addVisual(maderaCentenaMiles)
	game.addVisual(piedraUnidad)
	game.addVisual(piedraDecena)
	game.addVisual(piedraCientos)
	game.addVisual(piedraMiles)
	game.addVisual(piedraDecenaMiles)
	game.addVisual(piedraCientosMiles)
	game.addVisual(aldeanosUnidad)
	game.addVisual(aldeanosDecena)
	game.addVisual(aldeanosCientos)
	game.addVisual(aldeanosMiles)
	game.addVisual(aldeanosDecenaMiles)
	game.addVisual(aldeanosCientosMiles)
	game.addVisual(poblacionUnidad)
	game.addVisual(poblacionDecena)
	game.addVisual(poblacionCientos)
	game.addVisual(poblacionMiles)
	game.addVisual(poblacionDecenaMiles)
	game.addVisual(poblacionCientosMiles)
	///---Aldeanos
	game.addVisual(aldDispUnidad)
	game.addVisual(aldDispDecena)
	game.addVisual(aldDispCientos)
	game.addVisual(taladorUnidad)
	game.addVisual(taladorDecena)
	game.addVisual(taladorCientos)
	game.addVisual(mineroUnidad)
	game.addVisual(mineroDecena)
	game.addVisual(mineroCientos)
	game.addVisual(constructorUnidad)
	game.addVisual(constructorDecena)
	game.addVisual(constructorCientos)
	game.addVisual(granjeroUnidad)
	game.addVisual(granjeroDecena)
	game.addVisual(granjeroCientos)
	game.addVisual(agricultorUnidad)
	game.addVisual(agricultorDecena)
	game.addVisual(agricultorCientos)
	game.addVisual(pescadorUnidad)
	game.addVisual(pescadorDecena)
	game.addVisual(pescadorCientos)
	game.addVisual(cazadorUnidad)
	game.addVisual(cazadorDecena)
	game.addVisual(cazadorCientos)
	//TIMER
	game.addVisual(timerUnidad)
	game.addVisual(timerDecena)
	game.addVisual(timerUnidadMinutos)
	game.addVisual(timerDecenaMinutos)
	game.addVisual(timerCentenaMinutos)
	}


	}
}





	
