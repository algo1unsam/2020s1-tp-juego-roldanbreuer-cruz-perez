import wollok.game.*
import cursor.*
import elementosGame.*
import elementosHud.*
import timer.*
import menu.*
import construcciones.*
import accionesPorTimer.*

object escenario{
	var property estado = inPortada
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
	
	method reiniciar(){
		cantAlimento = 25
		cantMadera = 50
		cantPiedra = 50
		cantAlmacen = 100
		mercadosConstruidos = 0
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
	
	method disponible(){
		if(aldeanoDisponible == 0){
			centralErrores.error("No hay aldeanos disponibles.")
		}
	}
	
	method reiniciar(){
		aldeanos = 5
		poblacion = 5
		aldeanoDisponible = 5
		aldeanoTalador = 0
		aldeanoMinero = 0
		aldeanoConstructor = 0
		aldeanoGranjero = 0
		aldeanoAgricultor = 0
		aldeanoPescador = 0
		aldeanoCazador = 0
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
	
	method inicializar(){
		escenario.estado(inGame)
		game.removeTickEvent("PressStart")
		game.clear()
		keyboard.up().onPressDo { cursor.mover(cursor.position().up(1)) }
		keyboard.down().onPressDo { cursor.mover(cursor.position().down(1)) }
		keyboard.left().onPressDo { cursor.mover(cursor.position().left(1)) }
		keyboard.right().onPressDo { cursor.mover(cursor.position().right(1)) }
		keyboard.backspace().onPressDo { escenario.estado().bksp() }
		keyboard.q().onPressDo { escenario.estado().q() }
		keyboard.p().onPressDo { escenario.estado().p() }
		keyboard.w().onPressDo { escenario.estado().w() }
		keyboard.e().onPressDo { escenario.estado().e() }
		keyboard.r().onPressDo { escenario.estado().r() }
		keyboard.t().onPressDo { escenario.estado().t() }
		keyboard.a().onPressDo { escenario.estado().a() }
		keyboard.s().onPressDo { escenario.estado().s() }
		keyboard.d().onPressDo { escenario.estado().d() }
		keyboard.f().onPressDo { escenario.estado().f() }
		keyboard.c().onPressDo { escenario.estado().c() }
		keyboard.enter().onPressDo { escenario.estado().enter() }
		game.addVisual(cursor)
		game.addVisual(hud)	
		self.poblarMapa()
		cargarHud.instanciarYCargarHud()
		timer.inicio()
	}
	
	method terminarJuego(){
		game.clear()
		recursos.reiniciar()
		aldeanos.reiniciar()
		timer.reiniciar()
		escenario.estado(inPortada)
		keyboard.enter().onPressDo { escenario.estado().enter() }
		game.addVisualIn(centralErrores, game.at(31,0))
		game.errorReporter(centralErrores)
		self.pantallaInicio()
	}
	
	method pantallaInicio(){
		game.addVisualIn(fondoPantallaInicial, game.at(0,0))
		game.addVisualIn(pressStart, game.at(13,3))
		game.onTick(500, "PressStart", {=> pressStart.titilar() })
	}
	
	
}

class Estados{
	
	
	method aparecer(){ }
	method cerrar(){ }
	method accion(){ }
	method mover(posicionNueva, position){ }
	method bksp(){ }
	method enter(){ }
	method c(){ }
	method q(){ }
	method w(){ }
	method e(){ }
	method r(){ }
	method a(){	}
	method s(){ }
	method d(){	}
	method f(){	}
	method t(){ }
	method p(){ }
	
	
}

object inPortada inherits Estados{
	override method enter(){ inicializar.inicializar() }
}

object inGameOver inherits Estados{
	override method enter(){ inicializar.terminarJuego() }
}

object inGame inherits Estados{
	
	override method mover(posicionNueva, position){ cursor.position(posicionNueva) }
	override method enter(){ self.t() }
	override method c(){ 
		inMenuConst.aparecer()
		escenario.estado(inMenuConst)
	}
	// override method q(){ dispararEvento.killRandom() } 
	override method s(){ 
		escenario.estado(inSeleccion)
		cursor.seleccion()
	}
	override method t(){
		aldeanos.disponible()
		if(game.getObjectsIn(cursor.position()).any({ objeto => objeto.tipo() == barraobj })){
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
	override method p(){
		escenario.estado(inPausa)
		game.addVisualIn(fondoCartel, game.at(12,9))
		game.addVisualIn(pausa, game.at(13,10))
		timer.pausa()
		escenario.tickEnCurso().forEach({ tick => tick.pausar() })
	}
	
}

object inSeleccion inherits Estados{
	
	override method mover(posicionNueva, position){ 
					cursor.position(posicionNueva)
					cursor.seleccionInicio().add(position)
					game.addVisualIn(new Seleccion(), position) 
	}
	override method enter(){ 
		/// ------------- Interaccion con menu TO DO
		cursor.seleccion()
		escenario.estado(inPostSeleccion)
		inPostSeleccion.aparecer()
	}
}

object inPausa inherits Estados{
	
	override method p(){
		escenario.estado(inGame)
		game.removeVisual(fondoCartel)
		game.removeVisual(pausa)
		timer.inicio()
		escenario.tickEnCurso().forEach({ tick => tick.unpausar() })
	}

}



object inPostSeleccion inherits Estados{
	
	override method aparecer(){
		game.addVisualIn(fondoMenu, game.at(12,5))
		game.addVisualIn(tituloAcciones, game.at(13,13))
		game.addVisualIn(botonTalar, game.at(13,11))
		game.addVisualIn(botonMinar, game.at(16,11))
		game.addVisualIn(botonDetener, game.at(19,11))
		game.addVisualIn(botonCancelar, game.at(13,6))
		game.addVisualIn(botonSalir, game.at(20,6))
	}
	
	override method cerrar(){
		game.removeVisual(fondoMenu)
		game.removeVisual(tituloAcciones)
		game.removeVisual(botonTalar)
		game.removeVisual(botonMinar)
		game.removeVisual(botonDetener)
		game.removeVisual(botonCancelar)
		game.removeVisual(botonSalir)
	}
	override method bksp(){ 
		self.cerrar()
		cursor.seleccionInicio().forEach({ posicion => game.getObjectsIn(posicion).find({ objeto => game.removeVisual(objeto.tipo() == "Seleccion" )}) })
		escenario.estado(inGame)
	}	
}


object inMenuConst inherits Estados{
	
	override method aparecer(){
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
	
	override method cerrar(){
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
	override method bksp(){
		self.cerrar()
		escenario.estado(inGame)
	}	
	override method q(){ 		
		recursos.disponible( almacenB.costoAlimento(), almacenB.costoMadera(), almacenB.costoPiedra())
		cursor.accesoAlLugar()
		game.addVisualIn(new Constructor(tipo = new Construir(accion= almacenB, position= cursor.position()), position = cursor.position()), cursor.position())
		game.getObjectsIn(cursor.position()).last().iniciar()
		recursos.consumir( almacenB.costoAlimento(), almacenB.costoMadera(), almacenB.costoPiedra())
		self.cerrar()
		escenario.estado(inGame)
	}
	override method w(){ 		
		recursos.disponible( casaC.costoAlimento(), casaC.costoMadera(), casaC.costoPiedra())
		cursor.accesoAlLugar()
		game.addVisualIn(new Constructor(tipo = new Construir(accion= casaC, position= cursor.position()), position = cursor.position()), cursor.position())
		game.getObjectsIn(cursor.position()).last().iniciar()
		recursos.consumir( casaC.costoAlimento(), casaC.costoMadera(), casaC.costoPiedra())
		self.cerrar()
		escenario.estado(inGame)
	}
	override method e(){ 		
		recursos.disponible( casaG.costoAlimento(), casaG.costoMadera(), casaG.costoPiedra())
		cursor.accesoAlLugar()
		game.addVisualIn(new Constructor(tipo = new Construir(accion= casaG, position= cursor.position()), position = cursor.position()), cursor.position())
		game.getObjectsIn(cursor.position()).last().iniciar()
		recursos.consumir( casaG.costoAlimento(), casaG.costoMadera(), casaG.costoPiedra())
		self.cerrar()
		escenario.estado(inGame)
	}

	override method a(){			
		const mercado = new MercadoVacio()		
		recursos.disponible( casaG.costoAlimento(), mercado.costoMadera(), mercado.costoPiedra())
		cursor.accesoAlLugar()
		if(cursor.validarCuatroPosicionesLibres()){ // validacion de posiciones que rodean a la construccion esten libres
		game.addVisualIn(new ConstruccionGrande(tipo = new Construir(accion= mercado, position= cursor.position()), position = cursor.position()), cursor.position())
		game.getObjectsIn(cursor.position()).last().iniciar()
		recursos.consumir( mercado.costoAlimento(), mercado.costoMadera(), mercado.costoPiedra())
		self.cerrar()
		escenario.estado(inGame)
		}
		
	}
	override method s(){		
		const granja = new GranjaVacio()		
		recursos.disponible( granja.costoAlimento(), granja.costoMadera(), granja.costoPiedra())
		cursor.accesoAlLugar()
		if(cursor.validarCuatroPosicionesLibres()){ //validacion
		game.addVisualIn(new ConstruccionGrande(tipo = new Construir(accion= granja, position= cursor.position()), position = cursor.position()), cursor.position())
		game.getObjectsIn(cursor.position()).last().iniciar()
		recursos.consumir( granja.costoAlimento(), granja.costoMadera(), granja.costoPiedra())
		self.cerrar()
		escenario.estado(inGame)	
		}
		
	}
	override method d(){	
		const plantacion =new PlantacionVacio()	
		recursos.disponible( plantacion.costoAlimento(), plantacion.costoMadera(), plantacion.costoPiedra())
		cursor.accesoAlLugar()
		if(cursor.validarCuatroPosicionesLibres()){ //validacion
		game.addVisualIn(new ConstruccionGrande(tipo = new Construir(accion= plantacion, position= cursor.position()), position = cursor.position()), cursor.position())
		game.getObjectsIn(cursor.position()).last().iniciar()
		recursos.consumir( plantacion.costoAlimento(), plantacion.costoMadera(), plantacion.costoPiedra())
		self.cerrar()
		escenario.estado(inGame)	
		}
		
	}
}