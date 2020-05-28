import hud.*
import estados.*
import wollok.game.*
//aca estoy tratando de achicar el archivo hud en metodos de unidades, decenas, centenas, etc.. sin importar que es lo que le mande, y me pueda 
//returnar el calculo que necesito para el hud
//cuando estes disponible te cuento la idea
class Unidad{
	var property position
	var property origen
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
