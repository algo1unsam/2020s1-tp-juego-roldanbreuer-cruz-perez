import wollok.game.*
import pepita.*
import elementosGame.*
import menu.*
import teclas.*

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