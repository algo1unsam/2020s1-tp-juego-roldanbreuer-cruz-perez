import hud.*
import estados.*
import wollok.game.*
//aca estoy tratando de achicar el archivo hud en metodos de unidades, decenas, centenas, etc.. sin importar que es lo que le mande, y me pueda 
//returnar el calculo que necesito para el hud
//cuando estes disponible te cuento la idea

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
// alimento
class AlimentoUnidad inherits AlmacenUnidad{}
class AlimentoDecena inherits AlmacenDecena{}
class AlimentoCentena inherits AlmacenCentena{}
class AlimentoMiles inherits AlmacenMiles{}
class AlimentosDecenaMiles inherits AlmacenDecenaMiles{}
class AlimentosCentenaMiles inherits AlmacenCentenaMiles{}
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
class AldeanosDisponiblesDecenas inherits Decena{}
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
object instanciarClases{
	var alimentoUnidad = new AlimentoUnidad()
}





	
