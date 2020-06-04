import elementosGame.*
import wollok.game.*
import cursor.*
import menu.*
import construcciones.*

object escenario{
	var property estado = inGame
	var property tickEnCurso = []
}

object recursos{
	//--- Recursos Inicializacion
	var property cantAlimento = 25
	var property cantMadera = 50
	var property cantPiedra = 50
	var property cantAlmacen = 100
	var property mercadosConstruidos = 0
	//var property tipo="numerosHUD"
	//var property posicionHud=game.at(17,19)
	method disponible(alimento, madera, piedra){
		if(cantAlimento < alimento or cantMadera < madera or cantPiedra < piedra) centralErrores.error("No hay recursos disponibles")
	}
	
	method consumir(alim, mad, pied){
		alimento.modificar(-alim)
		piedra.modificar(-pied)
		madera.modificar(-mad)
	}
	/*method recursosHud(){
		hud.unidad(self.tipo(),self.posicionHud(),self.cantAlimento())
		hud.decena(self.tipo(),self.posicionHud(),self.cantAlimento())
		hud.centena(self.tipo(),self.posicionHud(),self.cantAlimento())
		hud.miles((self.tipo(),self.posicionHud(),self.cantAlimento()))
	}*/
}

// ---- Modificadores de recurso
object madera{
	method consulta() = recursos.cantMadera()
	method modificar(valor){
		recursos.cantMadera(recursos.cantMadera() + valor)
	}
}
object alimento{
	method consulta() = recursos.cantAlimento()
	method modificar(valor){
		recursos.cantAlimento(recursos.cantAlimento() + valor)
	}
}
object piedra{
	method consulta() = recursos.cantPiedra()
	method modificar(valor){
		recursos.cantPiedra(recursos.cantPiedra() + valor)
	}
}
object almacen{
	method consulta() = recursos.cantAlmacen()
	method modificar(valor){
		recursos.cantAlmacen(recursos.cantAlmacen() + valor)
	}
}

object aldeanos{
	//--- Aldeanos Inicializacion
	var property aldeanos = 5
	var property poblacion = 5
	var property aldeanoDisponible = 5
	var property aldeanoTalador = 0
	var property aldeanoMinero = 0
	var property aldeanoConstructor = 0
	var property aldeanoGranjero = 0
	var property aldeanoAgricultor = 0
	var property aldeanoPescador = 0
	var property aldeanoCazador = 0
	//var property position = game.at(2,3)
	//-- Manejadores de trabajos
	method requerir(tipo){
		if(tipo.accion().aldeanosNecesarios() <= aldeanoDisponible){
			aldeanoDisponible -= tipo.accion().aldeanosNecesarios()
			tipo.accion().usarAldeano()
		}else{
			centralErrores.error("No hay aldeanos disponibles.")
		}
	}
	
	method liberar(tipo){
		aldeanoDisponible += tipo.accion().aldeanosNecesarios()
		tipo.accion().dejarAldeano()
	}
	/*method aldeanoDisponibleHud(){
		hud.unidad(position,aldeanoDisponible)
	}*/
}
class Aldeano{
	method consulta()=aldeanos.aldeanos()
}
class AldeanoDisponible {
	method consulta()=aldeanos.aldeanoDisponible()
}
class AldeanoTalador {
	method consulta()= aldeanos.aldeanoTalador()
}
class AldeanoMinero {
	method consulta()= aldeanos.aldeanoMinero()
}
class AldeanoPescador {
	method consulta()= aldeanos.aldeanoPescador()
}
class AldeanoCazador {
	method consulta()= aldeanos.aldeanoCazador()
}
class AldeanoGranjero {
	method consulta()= aldeanos.aldeanoGranjero()
}
class AldeanoAgricultor {
	method consulta()= aldeanos.aldeanoAgricultor()
}
class AldeanoConstructor {
	method consulta()= aldeanos.aldeanoConstructor()
}
class Poblacion {
	method consulta()= aldeanos.poblacion()
}

object inicializar{
	
	method poblarMapa(){
		agua.area().forEach({ objeto => game.addVisualIn(new Lago(), objeto) })
		arboles.area().forEach({ objeto => game.addVisualIn(new Arboleda(), objeto) })
		piedras.area().forEach({ objeto => game.addVisualIn(new Piedras(), objeto) })
	}
	
}


object inGame{
	
	method aparecer(){ }
	method cerrar(){ }
	method accion(){ }
	method mover(posicionNueva, position){ cursor.position(posicionNueva) }
	method bksp(){ }
	method enter(){ self.t() }
	method c(){ 
		inMenuConst.aparecer()
		escenario.estado(inMenuConst)
	}
	method q(){ }
	method w(){ }
	method e(){ }
	method r(){ }
	method a(){	}
	method s(){ 
		escenario.estado(inSeleccion)
		cursor.seleccion()
	}
	method d(){	}
	method f(){	}
	method t(){
		if(game.getObjectsIn(cursor.position()).any({ objeto => objeto.tipo() == "Barra" })){
			const objetivo = game.getObjectsIn(cursor.position()).find({ objeto => objeto.trabajable() })
			objetivo.accion().continuar(objetivo, cursor.position())
		}else{
			if(game.getObjectsIn(cursor.position()).any({ objeto => objeto.trabajable() })){
				const objetivo = game.getObjectsIn(cursor.position()).find({ objeto => objeto.trabajable() })
				cursor.accesoAlLugar()
				objetivo.accion().trabajar(objetivo, cursor.position())
			}
		}
	}
	
}

object inSeleccion{
	
	method aparecer(){ }
	method cerrar(){ }
	method accion(){ }
	method mover(posicionNueva, position){ 
					cursor.position(posicionNueva)
					cursor.seleccionInicio().add(position)
					game.addVisualIn(new Seleccion(), position) }
	method bksp(){ }
	method c(){ }
	method enter(){ 
		/// ------------- Interaccion con menu TO DO
		cursor.seleccion()
		escenario.estado(inPostSeleccion)
		inPostSeleccion.aparecer()
	}
	method q(){ }
	method w(){ }
	method e(){ }
	method r(){ }
	method a(){	}
	method s(){	}
	method d(){	}
	method f(){	}
	method t(){ }
}

object inPausa{
	
	method aparecer(){ }
	method cerrar(){ }
	method accion(){ }
	method mover(posicionNueva, position){  }
	method bksp(){ }
	method c(){ }
	method q(){ }
	method w(){ }
	method e(){ }
	method r(){ }
	method a(){	}
	method s(){	}
	method d(){	}
	method f(){	}
	method t(){ }
}



object inPostSeleccion{
	
	method aparecer(){
		game.addVisualIn(fondoMenu, game.at(12,5))
		game.addVisualIn(tituloAcciones, game.at(13,13))
		game.addVisualIn(botonTalar, game.at(13,11))
		game.addVisualIn(botonMinar, game.at(16,11))
		game.addVisualIn(botonDetener, game.at(19,11))
		game.addVisualIn(botonCancelar, game.at(13,6))
		game.addVisualIn(botonSalir, game.at(20,6))
	}
	
	method cerrar(){
		game.removeVisual(fondoMenu)
		game.removeVisual(tituloAcciones)
		game.removeVisual(botonTalar)
		game.removeVisual(botonMinar)
		game.removeVisual(botonDetener)
		game.removeVisual(botonCancelar)
		game.removeVisual(botonSalir)
	}
	method bksp(){ 
		self.cerrar()
		cursor.seleccionInicio().forEach({ posicion => game.getObjectsIn(posicion).find({ objeto => game.removeVisual(objeto.tipo() == "Seleccion" )}) })
		escenario.estado(inGame)
	}	
	method accion(){ }
	method c(){ }
	method q(){ }
	method w(){ }
	method e(){ }
	method r(){ }
	method a(){	}
	method s(){	}
	method d(){	}
	method f(){	}
	method t(){ }
}


object inMenuConst{
	
	method aparecer(){
		game.addVisualIn(fondoMenu, game.at(12,5))
		game.addVisualIn(tituloConstrucciones, game.at(13,13))
		game.addVisualIn(botonAlmacen, game.at(13,10))
		game.addVisualIn(botonCasaC, game.at(16,10))
		game.addVisualIn(botonCasaG, game.at(19,10))
		game.addVisualIn(botonMercado, game.at(13,7))
		game.addVisualIn(botonGranja, game.at(16,7))
		game.addVisualIn(botonPlantacion, game.at(19,7))
		game.addVisualIn(botonCancelar, game.at(13,6))
		game.addVisualIn(botonSalir, game.at(20,6))
	}
	
	method cerrar(){
		game.removeVisual(fondoMenu)
		game.removeVisual(tituloConstrucciones)
		game.removeVisual(botonAlmacen)
		game.removeVisual(botonCasaC)
		game.removeVisual(botonCasaG)
		game.removeVisual(botonMercado)
		game.removeVisual(botonGranja)
		game.removeVisual(botonPlantacion)
		game.removeVisual(botonCancelar)
		game.removeVisual(botonSalir)
	}
	method bksp(){
		self.cerrar()
		escenario.estado(inGame)
	}	
	method accion(){ }
	method c(){ }
	method q(){ 		
		recursos.disponible( almacenB.costoAlimento(), almacenB.costoMadera(), almacenB.costoPiedra())
		cursor.accesoAlLugar()
		game.addVisualIn(new Constructor(tipo = new Construir(accion= almacenB, position= cursor.position()), position = cursor.position()), cursor.position())
		game.getObjectsIn(cursor.position()).last().iniciar()
		recursos.consumir( almacenB.costoAlimento(), almacenB.costoMadera(), almacenB.costoPiedra())
		self.cerrar()
		escenario.estado(inGame)
	}
	method w(){ 		
		recursos.disponible( casaC.costoAlimento(), casaC.costoMadera(), casaC.costoPiedra())
		cursor.accesoAlLugar()
		game.addVisualIn(new Constructor(tipo = new Construir(accion= casaC, position= cursor.position()), position = cursor.position()), cursor.position())
		game.getObjectsIn(cursor.position()).last().iniciar()
		recursos.consumir( casaC.costoAlimento(), casaC.costoMadera(), casaC.costoPiedra())
		self.cerrar()
		escenario.estado(inGame)
	}
	method e(){ 		
		recursos.disponible( casaG.costoAlimento(), casaG.costoMadera(), casaG.costoPiedra())
		cursor.accesoAlLugar()
		game.addVisualIn(new Constructor(tipo = new Construir(accion= casaG, position= cursor.position()), position = cursor.position()), cursor.position())
		game.getObjectsIn(cursor.position()).last().iniciar()
		recursos.consumir( casaG.costoAlimento(), casaG.costoMadera(), casaG.costoPiedra())
		self.cerrar()
		escenario.estado(inGame)
	}
	method r(){ }
	method a(){			
		recursos.disponible( casaG.costoAlimento(), mercado.costoMadera(), mercado.costoPiedra())
		cursor.accesoAlLugar()
		game.addVisualIn(new Constructor(tipo = new Construir(accion= mercado, position= cursor.position()), position = cursor.position()), cursor.position())
		game.getObjectsIn(cursor.position()).last().iniciar()
		recursos.consumir( mercado.costoAlimento(), mercado.costoMadera(), mercado.costoPiedra())
		self.cerrar()
		escenario.estado(inGame)
	}
	method s(){			
		recursos.disponible( granja.costoAlimento(), granja.costoMadera(), granja.costoPiedra())
		cursor.accesoAlLugar()
		game.addVisualIn(new Constructor(tipo = new Construir(accion= granja, position= cursor.position()), position = cursor.position()), cursor.position())
		game.getObjectsIn(cursor.position()).last().iniciar()
		recursos.consumir( granja.costoAlimento(), granja.costoMadera(), granja.costoPiedra())
		self.cerrar()
		escenario.estado(inGame)
	}
	method d(){			
		recursos.disponible( plantacion.costoAlimento(), plantacion.costoMadera(), plantacion.costoPiedra())
		cursor.accesoAlLugar()
		game.addVisualIn(new Constructor(tipo = new Construir(accion= plantacion, position= cursor.position()), position = cursor.position()), cursor.position())
		game.getObjectsIn(cursor.position()).last().iniciar()
		recursos.consumir( plantacion.costoAlimento(), plantacion.costoMadera(), plantacion.costoPiedra())
		self.cerrar()
		escenario.estado(inGame)
	}
	method f(){	}
	method t(){ }
	
}