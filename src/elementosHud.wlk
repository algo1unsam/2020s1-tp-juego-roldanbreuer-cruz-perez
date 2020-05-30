import estados.*
import wollok.game.*
import timer.*
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
class Miles inherits Unidad{override method image(){
		const stringNumero = origen.toString()
		var valor = null
		if(stringNumero.length() > 3){
			valor = stringNumero.reverse().drop(3).charAt(0)
		}
		return unidades.imagen(valor)
	}
}
class DecenaMiles inherits Decena{
	override method image(){
		const stringNumero = origen.toString()
		var valor = null
		if(stringNumero.length() > 4){
			valor = stringNumero.reverse().drop(4).charAt(0)
		}
		return decenas.imagen(valor)
	}
}
class CentenaMiles inherits Centena{
	override method image(){
		const stringNumero = origen.toString()
		var valor = null
		if(stringNumero.length() > 4){
			valor = stringNumero.reverse().drop(4).charAt(0)
		}
		return decenas.imagen(valor)
	}
	}
// ACA VOY A EMPEZAR A HEREDAR DE ESTAS TRES CLASES PADRES PARA TODOS LOS ELEMENTOS DEL HUD
//recordar setear origen y position al instanciar los objetos
class AlmacenUnidad inherits Unidad{}
class AlmacenDecena inherits Decena{}
class AlmacenCentena inherits Centena{}
class AlmacenMiles inherits Miles{}
class AlmacenDecenaMiles inherits Decena{}
class AlmacenCentenaMiles inherits Centena{}
// alimento
class AlimentoUnidad inherits Unidad{}
class AlimentoDecena inherits Decena{}
class AlimentoCentena inherits Centena{}
class AlimentoMiles inherits Miles{}
class AlimentoDecenaMiles inherits DecenaMiles{}
class AlimentoCentenaMiles inherits CentenaMiles{}
class MaderaUnidad inherits Unidad{}
class MaderaDecena inherits Decena{}
class MaderaCentena inherits Centena{}
class MaderaMiles inherits Miles{}
class MaderaDecenaMiles inherits DecenaMiles{}
class MaderaCentenaMiles inherits CentenaMiles{}
class PiedraUnidad inherits Unidad{}
class PiedraDecena inherits Decena{}
class PiedraCentena inherits Centena{}
class PiedraMiles inherits Miles{}
class PiedraDecenaMiles inherits DecenaMiles{}
class PiedraCentenaMiles inherits CentenaMiles{}
class AldeanosUnidad inherits Unidad{}
class AldeanosDecena inherits Decena{}
class AldeanosCentena inherits Centena{}
class AldeanosMiles inherits Miles{}
class AldeanosDecenaMiles inherits DecenaMiles{}
class AldeanosCentenaMiles inherits CentenaMiles{}
class PoblacionUnidad inherits Unidad{}
class PoblacionDecena inherits Decena{}
class PoblacionCentena inherits Centena{}
class PoblacionMiles inherits Miles{}
class PoblacionDecenaMiles inherits DecenaMiles{}
class PoblacionCentenaMiles inherits CentenaMiles{}
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
class TimerUnidad inherits Unidad{}
class TimerDecena inherits Decena{}
class TimerUnidadMinutos inherits Unidad{}
class TimerDecenaMinutos inherits Decena{}
class TimerCentenaMinutos inherits Centena{}
object cargarHud{
	method instanciarYCargarHud(){
	game.addVisual(new AlmacenUnidad(origen=recursos.cantAlmacen(),position=game.at(17,19)))
	game.addVisual(new AlmacenDecena(origen=recursos.cantAlmacen(),position=game.at(17,19)))
	game.addVisual(new AlmacenCentena(origen=recursos.cantAlmacen(),position=game.at(17,19)))
	game.addVisual(new AlmacenMiles(origen=recursos.cantAlmacen(),position=game.at(16,19)))
	game.addVisual(new AlmacenDecenaMiles(origen=recursos.cantAlmacen(),position=game.at(16,19)))
	game.addVisual(new AlmacenCentenaMiles(origen=recursos.cantAlmacen(),position=game.at(16,19)))	
	game.addVisual(new AlimentoUnidad(origen=recursos.cantAlimento(),position=game.at(2,19)))
	game.addVisual(new AlimentoCentena(origen=recursos.cantAlimento(),position=game.at(2,19)))
	game.addVisual(new AlimentoDecena(origen=recursos.cantAlimento(),position=game.at(2,19)))
	game.addVisual(new AlimentoMiles(origen=recursos.cantAlimento(),position=game.at(1,19)))
	game.addVisual(new AlimentoDecenaMiles(origen=recursos.cantAlimento(),position=game.at(1,19)))
	game.addVisual(new AlimentoCentenaMiles(origen=recursos.cantAlimento(),position=game.at(1,19)))
	game.addVisual(new MaderaUnidad(origen=recursos.cantMadera(),position=game.at(5,19)))
	game.addVisual(new MaderaDecena(origen=recursos.cantMadera(),position=game.at(5,19)))
	game.addVisual(new MaderaCentena(origen=recursos.cantMadera(),position=game.at(5,19)))
	game.addVisual(new MaderaMiles(origen=recursos.cantMadera(),position=game.at(4,19)))
	game.addVisual(new MaderaDecenaMiles(origen=recursos.cantMadera(),position=game.at(4,19)))
	game.addVisual(new MaderaCentenaMiles(origen=recursos.cantMadera(),position=game.at(4,19)))
	game.addVisual(new PiedraUnidad(origen=recursos.cantPiedra(),position=game.at(8,19)))
	game.addVisual(new PiedraDecena(origen=recursos.cantPiedra(),position=game.at(8,19)))
	game.addVisual(new PiedraCentena(origen=recursos.cantPiedra(),position=game.at(8,19)))
	game.addVisual(new PiedraMiles(origen=recursos.cantPiedra(),position=game.at(7,19)))
	game.addVisual(new PiedraDecenaMiles(origen=recursos.cantPiedra(),position=game.at(7,19)))
	game.addVisual(new PiedraCentenaMiles(origen=recursos.cantPiedra(),position=game.at(7,19)))
	game.addVisual(new AldeanosUnidad(origen=aldeanos.aldeanos(),position=game.at(11,19)))
	game.addVisual(new AldeanosDecena(origen=aldeanos.aldeanos(),position=game.at(11,19)))
	game.addVisual(new AldeanosCentena(origen=aldeanos.aldeanos(),position=game.at(11,19)))
	game.addVisual(new AldeanosMiles(origen=aldeanos.aldeanos(),position=game.at(10,19)))
	game.addVisual(new AldeanosDecenaMiles(origen=aldeanos.aldeanos(),position=game.at(10,19)))
	game.addVisual(new AldeanosCentenaMiles(origen=aldeanos.aldeanos(),position=game.at(10,19)))
	game.addVisual(new PoblacionUnidad(origen=aldeanos.poblacion(),position=game.at(14,19)))
	game.addVisual(new PoblacionDecena(origen=aldeanos.poblacion(),position=game.at(14,19)))
	game.addVisual(new PoblacionCentena(origen=aldeanos.poblacion(),position=game.at(14,19)))
	game.addVisual(new PoblacionMiles(origen=aldeanos.poblacion(),position=game.at(13,19)))
	game.addVisual(new PoblacionDecenaMiles(origen=aldeanos.poblacion(),position=game.at(13,19)))
	game.addVisual(new PoblacionCentenaMiles(origen=aldeanos.poblacion(),position=game.at(13,19)))
	///---Aldeanos
	game.addVisual(new AldeanosDisponiblesUnidad(origen=aldeanos.aldeanoDisponible(),position=game.at(2,3)))
	game.addVisual(new AldeanosDisponiblesDecena(origen=aldeanos.aldeanoDisponible(),position=game.at(2,3)))
	game.addVisual(new AldeanosDisponiblesCentena(origen=aldeanos.aldeanoDisponible(),position=game.at(2,3)))
	game.addVisual(new TaladorUnidad(origen=aldeanos.aldeanoTalador(),position=game.at(2,2)))
	game.addVisual(new TaladorDecena(origen=aldeanos.aldeanoTalador(),position=game.at(2,2)))
	game.addVisual(new TaladorCentena(origen=aldeanos.aldeanoTalador(),position=game.at(2,2)))
	game.addVisual(new MineroUnidad(origen=aldeanos.aldeanoMinero(),position=game.at(2,1)))
	game.addVisual(new MineroDecena(origen=aldeanos.aldeanoMinero(),position=game.at(2,1)))
	game.addVisual(new MineroCentena(origen=aldeanos.aldeanoMinero(),position=game.at(2,1)))
	game.addVisual(new ConstructorUnidad(origen=aldeanos.aldeanoConstructor(),position=game.at(2,0)))
	game.addVisual(new ConstructorDecena(origen=aldeanos.aldeanoConstructor(),position=game.at(2,0)))
	game.addVisual(new ConstructorCentena(origen=aldeanos.aldeanoConstructor(),position=game.at(2,0)))
	game.addVisual(new GranjeroUnidad(origen=aldeanos.aldeanoGranjero(),position=game.at(5,3)))
	game.addVisual(new GranjeroDecena(origen=aldeanos.aldeanoGranjero(),position=game.at(5,3)))
	game.addVisual(new GranjeroCentena(origen=aldeanos.aldeanoGranjero(),position=game.at(5,3)))
	game.addVisual(new AgricultorUnidad(origen=aldeanos.aldeanoAgricultor(),position=game.at(5,2)))
	game.addVisual(new AgricultorDecena(origen=aldeanos.aldeanoAgricultor(),position=game.at(5,2)))
	game.addVisual(new AgricultorCentena(origen=aldeanos.aldeanoAgricultor(),position=game.at(5,2)))
	game.addVisual(new PescadorUnidad(origen=aldeanos.aldeanoPescador(),position=game.at(5,1)))
	game.addVisual(new PescadorDecena(origen=aldeanos.aldeanoPescador(),position=game.at(5,1)))
	game.addVisual(new PescadorCentena(origen=aldeanos.aldeanoPescador(),position=game.at(5,1)))
	game.addVisual(new CazadorUnidad(origen=aldeanos.aldeanoCazador(),position=game.at(5,0)))
	game.addVisual(new CazadorDecena(origen=aldeanos.aldeanoCazador(),position=game.at(5,0)))
	game.addVisual(new CazadorCentena(origen=aldeanos.aldeanoCazador(),position=game.at(5,0)))
	//TIMER
	game.addVisual(new TimerUnidad(origen=timer.segundos(),position=game.at(36,19)))
	game.addVisual(new TimerDecena(origen=timer.segundos(),position=game.at(36,19)))
	game.addVisual(new TimerUnidadMinutos(origen=timer.minutos(),position=game.at(35,19)))
	game.addVisual(new TimerDecenaMinutos(origen=timer.minutos(),position=game.at(35,19)))
	game.addVisual(new TimerCentenaMinutos(origen=timer.minutos(),position=game.at(35,19)))
	}
	}






	
