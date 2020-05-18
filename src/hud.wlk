import wollok.game.*
import pepita.*
import elementosGame.*
import menu.*
import teclas.*
import timer.*

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
//////---------------------------------------TIMER HUD
object timerUnidad{
	var property position= game.at(36,19)
	method image(){
		const stringNumero= timer.segundos().toString()
		return unidades.imagen(stringNumero.reverse().charAt(0))
	}
}
/*object timerDecenaHud{
	var property position= game.at(35,19)
	method image(){
		const stringNumero= timer.minutos().toString()
		return decenas.imagen(stringNumero.reverse().charAt(0))
	}
}*/

////// ------------------------------------- ALIMENTO HUD

object alimentoUnidad{
	var property position = game.at(2,19)
	
	method image(){
		const stringNumero = menu.cantRecursoAlimento().toString()
		return unidades.imagen(stringNumero.reverse().charAt(0))
	}
}
object alimentoDecena{
	var property position = game.at(2,19)
	
	method image(){
		const stringNumero = menu.cantRecursoAlimento().toString()
		var valor = null
		if(stringNumero.length() > 1){
			valor = stringNumero.reverse().drop(1).charAt(0)
		}
		return decenas.imagen(valor)
	}
}
object alimentoCientos{
	var property position = game.at(2,19)
	
	method image(){
		const stringNumero = menu.cantRecursoAlimento().toString()
		var valor = null
		if(stringNumero.length() > 2){
			valor = stringNumero.reverse().drop(2).charAt(0)
		}
		return cientos.imagen(valor)
	}
} 
object alimentoMiles{
	var property position = game.at(1,19)
	
	method image(){
		const stringNumero = menu.cantRecursoAlimento().toString()
		var valor = null
		if(stringNumero.length() > 3){
			valor = stringNumero.reverse().drop(3).charAt(0)
		}
		return unidades.imagen(valor)
	}
}
object alimentoDecenaMiles{
	var property position = game.at(1,19)
	
	method image(){
		const stringNumero = menu.cantRecursoAlimento().toString()
		var valor = null
		if(stringNumero.length() > 4){
			valor = stringNumero.reverse().drop(4).charAt(0)
		}
		return decenas.imagen(valor)
	}
}
object alimentoCientosMiles{
	var property position = game.at(1,19)
	
	method image(){
		const stringNumero = menu.cantRecursoAlimento().toString()
		var valor = null
		if(stringNumero.length() > 5){
			valor = stringNumero.reverse().drop(5).charAt(0)
		}
		return cientos.imagen(valor)
	}
}

////// ------------------------------------- MADERA HUD

object maderaUnidad{
	var property position = game.at(5,19)
	
	method image(){
		const stringNumero = menu.cantRecursoMadera().toString()
		return unidades.imagen(stringNumero.reverse().charAt(0))
	}
}
object maderaDecena{
	var property position = game.at(5,19)
	
	method image(){
		const stringNumero = menu.cantRecursoMadera().toString()
		var valor = null
		if(stringNumero.length() > 1){
			valor = stringNumero.reverse().drop(1).charAt(0)
		}
		return decenas.imagen(valor)
	}
}
object maderaCientos{
	var property position = game.at(5,19)
	
	method image(){
		const stringNumero = menu.cantRecursoMadera().toString()
		var valor = null
		if(stringNumero.length() > 2){
			valor = stringNumero.reverse().drop(2).charAt(0)
		}
		return cientos.imagen(valor)
	}
} 
object maderaMiles{
	var property position = game.at(4,19)
	
	method image(){
		const stringNumero = menu.cantRecursoMadera().toString()
		var valor = null
		if(stringNumero.length() > 3){
			valor = stringNumero.reverse().drop(3).charAt(0)
		}
		return unidades.imagen(valor)
	}
}
object maderaDecenaMiles{
	var property position = game.at(4,19)
	
	method image(){
		const stringNumero = menu.cantRecursoMadera().toString()
		var valor = null
		if(stringNumero.length() > 4){
			valor = stringNumero.reverse().drop(4).charAt(0)
		}
		return decenas.imagen(valor)
	}
}
object maderaCientosMiles{
	var property position = game.at(4,19)
	
	method image(){
		const stringNumero = menu.cantRecursoMadera().toString()
		var valor = null
		if(stringNumero.length() > 5){
			valor = stringNumero.reverse().drop(5).charAt(0)
		}
		return cientos.imagen(valor)
	}
}

////// ------------------------------------- PIEDRA HUD

object piedraUnidad{
	var property position = game.at(8,19)
	
	method image(){
		const stringNumero = menu.cantRecursoPiedra().toString()
		return unidades.imagen(stringNumero.reverse().charAt(0))
	}
}
object piedraDecena{
	var property position = game.at(8,19)
	
	method image(){
		const stringNumero = menu.cantRecursoPiedra().toString()
		var valor = null
		if(stringNumero.length() > 1){
			valor = stringNumero.reverse().drop(1).charAt(0)
		}
		return decenas.imagen(valor)
	}
}
object piedraCientos{
	var property position = game.at(8,19)
	
	method image(){
		const stringNumero = menu.cantRecursoPiedra().toString()
		var valor = null
		if(stringNumero.length() > 2){
			valor = stringNumero.reverse().drop(2).charAt(0)
		}
		return cientos.imagen(valor)
	}
} 
object piedraMiles{
	var property position = game.at(7,19)
	
	method image(){
		const stringNumero = menu.cantRecursoPiedra().toString()
		var valor = null
		if(stringNumero.length() > 3){
			valor = stringNumero.reverse().drop(3).charAt(0)
		}
		return unidades.imagen(valor)
	}
}
object piedraDecenaMiles{
	var property position = game.at(7,19)
	
	method image(){
		const stringNumero = menu.cantRecursoPiedra().toString()
		var valor = null
		if(stringNumero.length() > 4){
			valor = stringNumero.reverse().drop(4).charAt(0)
		}
		return decenas.imagen(valor)
	}
}
object piedraCientosMiles{
	var property position = game.at(7,19)
	
	method image(){
		const stringNumero = menu.cantRecursoPiedra().toString()
		var valor = null
		if(stringNumero.length() > 5){
			valor = stringNumero.reverse().drop(5).charAt(0)
		}
		return cientos.imagen(valor)
	}
}

////// ------------------------------------- ALDEANOS HUD

object aldeanosUnidad{
	var property position = game.at(11,19)
	
	method image(){
		const stringNumero = menu.cantAldeanos().toString()
		return unidades.imagen(stringNumero.reverse().charAt(0))
	}
}
object aldeanosDecena{
	var property position = game.at(11,19)
	
	method image(){
		const stringNumero = menu.cantAldeanos().toString()
		var valor = null
		if(stringNumero.length() > 1){
			valor = stringNumero.reverse().drop(1).charAt(0)
		}
		return decenas.imagen(valor)
	}
}
object aldeanosCientos{
	var property position = game.at(11,19)
	
	method image(){
		const stringNumero = menu.cantAldeanos().toString()
		var valor = null
		if(stringNumero.length() > 2){
			valor = stringNumero.reverse().drop(2).charAt(0)
		}
		return cientos.imagen(valor)
	}
} 
object aldeanosMiles{
	var property position = game.at(10,19)
	
	method image(){
		const stringNumero = menu.cantAldeanos().toString()
		var valor = null
		if(stringNumero.length() > 3){
			valor = stringNumero.reverse().drop(3).charAt(0)
		}
		return unidades.imagen(valor)
	}
}
object aldeanosDecenaMiles{
	var property position = game.at(10,19)
	
	method image(){
		const stringNumero = menu.cantAldeanos().toString()
		var valor = null
		if(stringNumero.length() > 4){
			valor = stringNumero.reverse().drop(4).charAt(0)
		}
		return decenas.imagen(valor)
	}
}
object aldeanosCientosMiles{
	var property position = game.at(10,19)
	
	method image(){
		const stringNumero = menu.cantAldeanos().toString()
		var valor = null
		if(stringNumero.length() > 5){
			valor = stringNumero.reverse().drop(5).charAt(0)
		}
		return cientos.imagen(valor)
	}
}

////// ------------------------------------- POBLACION HUD

object poblacionUnidad{
	var property position = game.at(14,19)
	
	method image(){
		const stringNumero = menu.cantPoblacion().toString()
		return unidades.imagen(stringNumero.reverse().charAt(0))
	}
}
object poblacionDecena{
	var property position = game.at(14,19)
	
	method image(){
		const stringNumero = menu.cantPoblacion().toString()
		var valor = null
		if(stringNumero.length() > 1){
			valor = stringNumero.reverse().drop(1).charAt(0)
		}
		return decenas.imagen(valor)
	}
}
object poblacionCientos{
	var property position = game.at(14,19)
	
	method image(){
		const stringNumero = menu.cantPoblacion().toString()
		var valor = null
		if(stringNumero.length() > 2){
			valor = stringNumero.reverse().drop(2).charAt(0)
		}
		return cientos.imagen(valor)
	}
} 
object poblacionMiles{
	var property position = game.at(13,19)
	
	method image(){
		const stringNumero = menu.cantPoblacion().toString()
		var valor = null
		if(stringNumero.length() > 3){
			valor = stringNumero.reverse().drop(3).charAt(0)
		}
		return unidades.imagen(valor)
	}
}
object poblacionDecenaMiles{
	var property position = game.at(13,19)
	
	method image(){
		const stringNumero = menu.cantPoblacion().toString()
		var valor = null
		if(stringNumero.length() > 4){
			valor = stringNumero.reverse().drop(4).charAt(0)
		}
		return decenas.imagen(valor)
	}
}
object poblacionCientosMiles{
	var property position = game.at(13,19)
	
	method image(){
		const stringNumero = menu.cantPoblacion().toString()
		var valor = null
		if(stringNumero.length() > 5){
			valor = stringNumero.reverse().drop(5).charAt(0)
		}
		return cientos.imagen(valor)
	}
}

//// ----------------- Hud Aldeanos

object aldDispUnidad{
	var property position = game.at(2,3)
	
	method image(){
		const stringNumero = menu.cantAldeanoDisponible().toString()
		return unidades.imagen(stringNumero.reverse().charAt(0))
	}
}
object aldDispDecena{
	var property position = game.at(2,3)
	
	method image(){
		const stringNumero = menu.cantAldeanoDisponible().toString()
		var valor = null
		if(stringNumero.length() > 1){
			valor = stringNumero.reverse().drop(1).charAt(0)
		}
		return decenas.imagen(valor)
	}
}
object aldDispCientos{
	var property position = game.at(2,3)
	
	method image(){
		const stringNumero = menu.cantAldeanoDisponible().toString()
		var valor = null
		if(stringNumero.length() > 2){
			valor = stringNumero.reverse().drop(2).charAt(0)
		}
		return cientos.imagen(valor)
	}
} 

object taladorUnidad{
	var property position = game.at(2,2)
	
	method image(){
		const stringNumero = menu.cantAldeanoTalador().toString()
		return unidades.imagen(stringNumero.reverse().charAt(0))
	}
}
object taladorDecena{
	var property position = game.at(2,2)
	
	method image(){
		const stringNumero = menu.cantAldeanoTalador().toString()
		var valor = null
		if(stringNumero.length() > 1){
			valor = stringNumero.reverse().drop(1).charAt(0)
		}
		return decenas.imagen(valor)
	}
}
object taladorCientos{
	var property position = game.at(2,2)
	
	method image(){
		const stringNumero = menu.cantAldeanoTalador().toString()
		var valor = null
		if(stringNumero.length() > 2){
			valor = stringNumero.reverse().drop(2).charAt(0)
		}
		return cientos.imagen(valor)
	}
} 

object mineroUnidad{
	var property position = game.at(2,1)
	
	method image(){
		const stringNumero = menu.cantAldeanoMinero().toString()
		return unidades.imagen(stringNumero.reverse().charAt(0))
	}
}
object mineroDecena{
	var property position = game.at(2,1)
	
	method image(){
		const stringNumero = menu.cantAldeanoMinero().toString()
		var valor = null
		if(stringNumero.length() > 1){
			valor = stringNumero.reverse().drop(1).charAt(0)
		}
		return decenas.imagen(valor)
	}
}
object mineroCientos{
	var property position = game.at(2,1)
	
	method image(){
		const stringNumero = menu.cantAldeanoMinero().toString()
		var valor = null
		if(stringNumero.length() > 2){
			valor = stringNumero.reverse().drop(2).charAt(0)
		}
		return cientos.imagen(valor)
	}
} 

object constructorUnidad{
	var property position = game.at(2,0)
	
	method image(){
		const stringNumero = menu.cantAldeanoConstructor().toString()
		return unidades.imagen(stringNumero.reverse().charAt(0))
	}
}
object constructorDecena{
	var property position = game.at(2,0)
	
	method image(){
		const stringNumero = menu.cantAldeanoConstructor().toString()
		var valor = null
		if(stringNumero.length() > 1){
			valor = stringNumero.reverse().drop(1).charAt(0)
		}
		return decenas.imagen(valor)
	}
}
object constructorCientos{
	var property position = game.at(2,0)
	
	method image(){
		const stringNumero = menu.cantAldeanoConstructor().toString()
		var valor = null
		if(stringNumero.length() > 2){
			valor = stringNumero.reverse().drop(2).charAt(0)
		}
		return cientos.imagen(valor)
	}
} 

object granjeroUnidad{
	var property position = game.at(5,3)
	
	method image(){
		const stringNumero = menu.cantAldeanoGranjero().toString()
		return unidades.imagen(stringNumero.reverse().charAt(0))
	}
}
object granjeroDecena{
	var property position = game.at(5,3)
	
	method image(){
		const stringNumero = menu.cantAldeanoGranjero().toString()
		var valor = null
		if(stringNumero.length() > 1){
			valor = stringNumero.reverse().drop(1).charAt(0)
		}
		return decenas.imagen(valor)
	}
}
object granjeroCientos{
	var property position = game.at(5,3)
	
	method image(){
		const stringNumero = menu.cantAldeanoGranjero().toString()
		var valor = null
		if(stringNumero.length() > 2){
			valor = stringNumero.reverse().drop(2).charAt(0)
		}
		return cientos.imagen(valor)
	}
} 

object agricultorUnidad{
	var property position = game.at(5,2)
	
	method image(){
		const stringNumero = menu.cantAldeanoAgricultor().toString()
		return unidades.imagen(stringNumero.reverse().charAt(0))
	}
}
object agricultorDecena{
	var property position = game.at(5,2)
	
	method image(){
		const stringNumero = menu.cantAldeanoAgricultor().toString()
		var valor = null
		if(stringNumero.length() > 1){
			valor = stringNumero.reverse().drop(1).charAt(0)
		}
		return decenas.imagen(valor)
	}
}
object agricultorCientos{
	var property position = game.at(5,2)
	
	method image(){
		const stringNumero = menu.cantAldeanoAgricultor().toString()
		var valor = null
		if(stringNumero.length() > 2){
			valor = stringNumero.reverse().drop(2).charAt(0)
		}
		return cientos.imagen(valor)
	}
} 


object pescadorUnidad{
	var property position = game.at(5,1)
	
	method image(){
		const stringNumero = menu.cantAldeanoPescador().toString()
		return unidades.imagen(stringNumero.reverse().charAt(0))
	}
}
object pescadorDecena{
	var property position = game.at(5,1)
	
	method image(){
		const stringNumero = menu.cantAldeanoPescador().toString()
		var valor = null
		if(stringNumero.length() > 1){
			valor = stringNumero.reverse().drop(1).charAt(0)
		}
		return decenas.imagen(valor)
	}
}
object pescadorCientos{
	var property position = game.at(5,1)
	
	method image(){
		const stringNumero = menu.cantAldeanoPescador().toString()
		var valor = null
		if(stringNumero.length() > 2){
			valor = stringNumero.reverse().drop(2).charAt(0)
		}
		return cientos.imagen(valor)
	}
} 

object cazadorUnidad{
	var property position = game.at(5,0)
	
	method image(){
		const stringNumero = menu.cantAldeanoCazador().toString()
		return unidades.imagen(stringNumero.reverse().charAt(0))
	}
}
object cazadorDecena{
	var property position = game.at(5,0)
	
	method image(){
		const stringNumero = menu.cantAldeanoCazador().toString()
		var valor = null
		if(stringNumero.length() > 1){
			valor = stringNumero.reverse().drop(1).charAt(0)
		}
		return decenas.imagen(valor)
	}
}
object cazadorCientos{
	var property position = game.at(5,0)
	
	method image(){
		const stringNumero = menu.cantAldeanoCazador().toString()
		var valor = null
		if(stringNumero.length() > 2){
			valor = stringNumero.reverse().drop(2).charAt(0)
		}
		return cientos.imagen(valor)
	}
} 

object cargaHud{
	method cargar(){
	game.addVisual(alimentoUnidad)
	game.addVisual(alimentoDecena)
	game.addVisual(alimentoCientos)
	game.addVisual(alimentoMiles)
	game.addVisual(alimentoDecenaMiles)
	game.addVisual(alimentoCientosMiles)
	game.addVisual(maderaUnidad)
	game.addVisual(maderaDecena)
	game.addVisual(maderaCientos)
	game.addVisual(maderaMiles)
	game.addVisual(maderaDecenaMiles)
	game.addVisual(maderaCientosMiles)
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
	}
}
