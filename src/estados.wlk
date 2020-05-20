import elementosGame.*
import wollok.game.*
import cursor.*

object escenario{
	var property estado = inGame
}

object recursos{
	//--- Recursos Inicializacion
	var property cantAlimento = 25
	var property cantMadera = 50
	var property cantPiedra = 50
	var property cantAlmacen = 100
	var property mercadosConstruidos = 0
}

// ---- Modificadores de recurso
object madera{
	method modificar(valor){
		recursos.cantMadera(recursos.cantMadera() + valor)
	}
}
object alimento{
	method modificar(valor){
		recursos.cantAlimento(recursos.cantAlimento() + valor)
	}
}
object piedra{
	method modificar(valor){
		recursos.cantPiedra(recursos.cantPiedra() + valor)
	}
}
object almacen{
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
	
}

object inGame{
	
	method aparecer(){
		
	}
	
	method cerrar(){
		
	}
	
	method q(){
		
	}
	
	method w(){
		
	}
	
	method e(){
		
	}
	
	method r(){
		
	}
	
	method a(){
		
	}
	
	method s(){
		
	}
	
	method d(){
		
	}
	
	method f(){
		
	}
	method t(){
		const objectivo = game.getObjectsIn(cursor.position()).find({ objeto => objeto.trabajable() == true })
		objetivo.trabajar(cursor.position())
	}
	
}

/*
object inMenu{
	
	method aparecer(){
		game.addVisualIn(menu, game.at(12,5))
		game.addVisualIn(tituloAcciones, game.at(13,13))
		game.addVisualIn(botonTalar, game.at(13,11))
		game.addVisualIn(botonMinar, game.at(16,11))
		game.addVisualIn(botonDetener, game.at(19,11))
		game.addVisualIn(botonCancelar, game.at(13,6))
		game.addVisualIn(botonSalir, game.at(20,6))
	}
	
	method cerrar(){
		game.removeVisual(menu)
		game.removeVisual(tituloAcciones)
		game.removeVisual(botonTalar)
		game.removeVisual(botonMinar)
		game.removeVisual(botonDetener)
		game.removeVisual(botonCancelar)
		game.removeVisual(botonSalir)
	}
	
	method accion(){
		
	}
	
	method q(){
		
	}
	
	method w(){
		
	}
	
	method e(){
		
	}
	
	method r(){
		
	}
	
	method a(){
		
	}
	
	method s(){
		
	}
	
	method d(){
		
	}
	
	method f(){
		
	}
	
}


object inMenuConst{
	
	method aparecer(){
		game.addVisualIn(menu, game.at(12,5))
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
		game.removeVisual(menu)
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
	
	method accion(){
		
	}
	
	method q(){
		
	}
	
	method w(){
		
	}
	
	method e(){
		
	}
	
	method r(){
		
	}
	
	method a(){
		
	}
	
	method s(){
		
	}
	
	method d(){
		
	}
	
	method f(){
		
	}
	
}*/