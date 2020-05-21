import hud.*
import estados.*
import wollok.game.*
//aca estoy tratando de achicar el archivo hud en metodos de unidades, decenas, centenas, etc.. sin importar que es lo que le mande, y me pueda 
//returnar el calculo que necesito para el hud
//cuando estes disponible te cuento la idea
object hudElementos{	
method unidad(tipoRecurso,posicionRecurso,variableRecurso){
var property tipo= tipoRecurso
var property position = posicionRecurso
method image(){
		const stringNumero = variableRecurso.toString()
		return unidades.imagen(stringNumero.reverse().charAt(0))
	}
}
method decena(tipoRecurso,posicionRecurso,variableRecurso){
var property tipo= tipoRecurso
var property position = posicionRecurso
	
	method image(){
		const stringNumero =variableRecurso.toString()
		var valor = null
		if(stringNumero.length() > 1){
			valor = stringNumero.reverse().drop(1).charAt(0)
		}
		return decenas.imagen(valor)
		}		
}
method centena(tipoRecurso,posicionRecurso,variableRecurso){
var property tipo= tipoRecurso
var property position = posicionRecurso
	
	method image(){
		const stringNumero =variableRecurso.toString()
		var valor = null
		if(stringNumero.length() > 1){
			valor = stringNumero.reverse().drop(2).charAt(0)
		}
		return decenas.imagen(valor)
		}		
}
method miles(tipoRecurso,posicionRecurso,variableRecurso){
var property tipo= tipoRecurso
var property position = posicionRecurso
method image(){
		const stringNumero = variableRecurso.toString()
		var valor = null
		if(stringNumero.length() > 3){
			valor = stringNumero.reverse().drop(3).charAt(0)
		}
		return unidades.imagen(valor)
	}
}
method decenaMiles(tipoRecurso,posicionRecurso,variableRecurso){
var property tipo= tipoRecurso
var property position = posicionRecurso
	method image(){
		const stringNumero = variableRecurso.toString()
		var valor = null
		if(stringNumero.length() > 4){
			valor = stringNumero.reverse().drop(4).charAt(0)
		}
		return decenas.imagen(valor)
	}
}
method cientosMiles(tipoRecurso,posicionRecurso,variableRecurso){
var property tipo= tipoRecurso
var property position = posicionRecurso
method image(){
		const stringNumero = recursos.cantAlmacen().toString()
		var valor = null
		if(stringNumero.length() > 5){
			valor = stringNumero.reverse().drop(5).charAt(0)
		}
		return cientos.imagen(valor)
		}
}
}
object hudAldeanos{
method unidad(tipoRecurso,posicionRecurso,variableRecurso){
var property tipo= tipoRecurso
var property position = posicionRecurso
method image(){
		const stringNumero = variableRecurso.toString()
		return unidades.imagen(stringNumero.reverse().charAt(0))
	}
}
method decena(tipoRecurso,posicionRecurso,variableRecurso){
var property tipo= tipoRecurso
var property position = posicionRecurso
	
	method image(){
		const stringNumero =variableRecurso.toString()
		var valor = null
		if(stringNumero.length() > 1){
			valor = stringNumero.reverse().drop(1).charAt(0)
		}
		return decenas.imagen(valor)
		}		
}
method centena(tipoRecurso,posicionRecurso,variableRecurso){
var property tipo= tipoRecurso
var property position = posicionRecurso
	
	method image(){
		const stringNumero =variableRecurso.toString()
		var valor = null
		if(stringNumero.length() > 1){
			valor = stringNumero.reverse().drop(2).charAt(0)
		}
		return decenas.imagen(valor)
		}		
}	
}
