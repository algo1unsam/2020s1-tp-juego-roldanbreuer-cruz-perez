import wollok.game.*
import pepita.*
import elementosGame.*
import teclas.*
//solo para comodidad del desarrollo del juego
//en este archivo se encuentran solamente los elementos que componen el menu


object menu{
	var property visible
	var property seleccionado = []
		
	var property cantRecursoMadera=0
	var property cantRecursoPiedra=0
	var property cantRecursoAlimento=0
	var property cantAldeanos = 5
	var property cantPoblacion = 10
	
	var property cantAldeanoDisponible = 5
	var property cantAldeanoTalador = 0
	var property cantAldeanoMinero = 0
	var property cantAldeanoConstructor = 0
	var property cantAldeanoGranjero = 0
	var property cantAldeanoAgricultor = 0
	var property cantAldeanoPescador = 0
	var property cantAldeanoCazador = 0
	
	var property cantArbolesPlantados=0
	var property cantidadPiedrasMinadas=0
	var property cantidadPesca=0
	var recurso=0
		
	method sumAliU(){
		cantRecursoAlimento += 1
	}
	method sumAliD(){
		cantRecursoAlimento += 10
	}
	method sumAliC(){
		cantRecursoAlimento += 100
	}
	method sumAliM(){
		cantRecursoAlimento += 1000
	}
	method sumAliDM(){
		cantRecursoAlimento += 10000
	}
	method sumAliCM(){
		cantRecursoAlimento += 100000
	}
	method sumAldeano(){
		cantAldeanos += 1
		cantAldeanoDisponible += 1
	}
	
	

	method image() = "assets/menu.png"
	method informacionRecursos(){
		game.say(cursor,"Madera: " + cantRecursoMadera.toString() + " Piedra: " + cantRecursoPiedra.toString() + " Alimento: " + cantRecursoAlimento.toString())
	}
	method aparecer(motivo){
		visible = motivo
		if(motivo == "postSeleccion" or motivo == "tecla" ){
			game.addVisualIn(self, game.at(12,5))
			game.addVisualIn(tituloAcciones, game.at(13,13))
			game.addVisualIn(botonTalar, game.at(13,11))
			game.addVisualIn(botonMinar, game.at(16,11))
			game.addVisualIn(botonDetener, game.at(19,11))
			game.addVisualIn(botonCancelar, game.at(13,6))
			game.addVisualIn(botonSalir, game.at(21,6))
		}
		if(motivo == "construccion"){
			game.addVisualIn(self, game.at(12,5))
			game.addVisualIn(tituloConstrucciones, game.at(13,13))
			game.addVisualIn(botonAlmacen, game.at(13,10))
			game.addVisualIn(botonCasaC, game.at(16,10))
			game.addVisualIn(botonCasaG, game.at(19,10))
			game.addVisualIn(botonCancelar, game.at(13,6))
			game.addVisualIn(botonSalir, game.at(21,6))
		}
	}
	
	method cerrar(){
		if(visible == "postSeleccion" or visible == "tecla" ){
			game.removeVisual(self)
			game.removeVisual(tituloAcciones)
			game.removeVisual(botonTalar)
			game.removeVisual(botonMinar)
			game.removeVisual(botonDetener)
			game.removeVisual(botonCancelar)
			game.removeVisual(botonSalir)
		}
		if(visible == "construccion"){
			game.removeVisual(self)
			game.removeVisual(tituloConstrucciones)
			game.removeVisual(botonAlmacen)
			game.removeVisual(botonCasaC)
			game.removeVisual(botonCasaG)
			game.removeVisual(botonCancelar)
			game.removeVisual(botonSalir)
		}
		visible = null
	}
	
	
	method remover(tipo,lista){
		lista.forEach({ 
			objeto => 
			if(game.getObjectsIn(objeto).filter({ filtro => filtro.tipo() == tipo }).size() > 0){
				if(tipo == "Talada"){
					cantAldeanoTalador -= 1
					cantAldeanoDisponible += 1
				}
				if(tipo == "Minado"){
					cantAldeanoMinero -= 1
					cantAldeanoDisponible += 1
				}
				if(tipo == "Pesca"){
					cantAldeanoPescador -= 1
					cantAldeanoDisponible += 1
				}
				const posic = game.getObjectsIn(objeto).filter({ filtro => filtro.tipo() == tipo }).last()
				game.removeVisual(posic)
			}
		})
		if(self.visible() != null) self.cerrar()
	}
	
	method terminarConstruccion(nombre){
		game.removeTickEvent(nombre)
	}
	
	method accion(accion,lista){
		// aparecer
		if(accion == "plantar") {
			self.remover("Seleccion", lista)
			lista.forEach({ 
				objeto => 
				game.addVisualIn(new Arboleda(), objeto)
			})
		
		}
		//listaPos.filter({ objeto => objeto.tipo() == "Arboleda" })
		if(accion == "talar") {
			recurso = 50
			
			
			cantArbolesPlantados =lista.sum({objeto => game.getObjectsIn(objeto).filter({ filtro => filtro.tipo() == "Arboleda" }).size()})
			cantRecursoMadera += resource.calculo(cantArbolesPlantados, recurso)
			self.remover("Seleccion", lista)
			lista.forEach({ 
				objeto => 
				const listaPos = game.getObjectsIn(objeto)
				if(listaPos.filter({ tipo => tipo.tipo() == "Arboleda" }).size() > 0 and cantAldeanoDisponible > 0) {
					game.addVisualIn(new Talada(), objeto)
					cantAldeanoDisponible -= 1
					cantAldeanoTalador += 1
				}else if(cantAldeanoDisponible == 0){
					cursor.error("No hay aldeanos disponibles.")
				}
			})
		}
		
		
		if(accion == "colocarPiedra") {
			
			self.remover("Seleccion", lista)
			lista.forEach({ 
				objeto => 
				game.addVisualIn(new Piedras(), objeto)
			})
		}
		if(accion == "colocarLago") {
			
			self.remover("Seleccion", lista)
			lista.forEach({ 
				objeto => 
				game.addVisualIn(new Lago(), objeto)
			})
		}
		
		if(accion == "minar") {
			recurso = 75
			cantidadPiedrasMinadas=lista.sum({objeto => game.getObjectsIn(objeto).filter({ filtro => filtro.tipo() == "Piedras" }).size()})
			cantRecursoPiedra += resource.calculo(cantidadPiedrasMinadas, recurso)
			self.remover("Seleccion", lista)
			lista.forEach({ 
				objeto => 
				const listaPos = game.getObjectsIn(objeto)
				if(listaPos.filter({ tipo => tipo.tipo() == "Piedras" }).size() > 0 and cantAldeanoDisponible > 0){ 
					game.addVisualIn(new Minado(), objeto)
					cantAldeanoDisponible -= 1
					cantAldeanoMinero += 1
				}else if(cantAldeanoDisponible == 0){
					cursor.error("No hay aldeanos disponibles.")
				}
			})
		}
		if(accion == "pesca") {
			recurso=25
			self.remover("Seleccion", lista)
			lista.forEach({ 
				objeto => 
				const listaPos = game.getObjectsIn(objeto)
				if(listaPos.filter({ tipo => tipo.tipo() == "Agua" }).size() > 0 and cantAldeanoDisponible > 0){
					 game.addVisualIn(new Pesca(), objeto)
					 cantAldeanoDisponible -= 1
					cantAldeanoPescador += 1
				}else if(cantAldeanoDisponible == 0){
					cursor.error("No hay aldeanos disponibles.")
				}
			})
			cantidadPesca=lista.sum({objeto => game.getObjectsIn(objeto).filter({ filtro => filtro.tipo() == "Agua" }).size()})
			cantRecursoAlimento += resource.calculo(cantidadPesca, recurso)
		}
		
		if(accion == "Almacen") {
			const costoMadera = 0
			const costoPiedra = 50
			const ticksConstruccion = 10
			
			if(costoMadera <= cantRecursoMadera and costoPiedra <= cantRecursoPiedra and cantAldeanoDisponible > 0){
				lista.forEach({ 
					objeto => 
					game.addVisualIn(new Almacen(), objeto)
					game.addVisualIn(new BarraConstruccion(), objeto)
					game.onTick((ticksConstruccion/5)*1000,"Construccion Almacen"+objeto.toString(), {
						const barra = game.getObjectsIn(objeto).find({ filtro => filtro.tipo() == "Barra" })
						barra.suma()
						if( barra.progreso() >= 6 ){
							cantAldeanoDisponible += 1
							cantAldeanoConstructor -= 1
							game.removeVisual(barra)
							self.terminarConstruccion("Construccion Almacen"+objeto.toString())
						}
					})
				})
				cantRecursoMadera -= costoMadera
				cantRecursoPiedra -= costoPiedra
				cantAldeanoDisponible -= 1
				cantAldeanoConstructor += 1
				
			}
			if(self.visible() != null) self.cerrar()
		}
		if(accion == "CasaC") {
			const costoMadera = 100
			const costoPiedra = 0
			const ticksConstruccion = 20
			
			if(costoMadera <= cantRecursoMadera and costoPiedra <= cantRecursoPiedra and cantAldeanoDisponible > 0){
				lista.forEach({ 
					objeto => 
					game.addVisualIn(new CasaC(), objeto)
					game.addVisualIn(new BarraConstruccion(), objeto)
					game.onTick((ticksConstruccion/5)*1000,"Construccion CasaC"+objeto.toString(), {
						const barra = game.getObjectsIn(objeto).find({ filtro => filtro.tipo() == "Barra" })
						barra.suma()
						if( barra.progreso() >= 6 ){
							cantAldeanoDisponible += 1
							cantAldeanoConstructor -= 1
							game.removeVisual(barra)
							self.terminarConstruccion("Construccion CasaC"+objeto.toString())
						}
					})
				})
				cantRecursoMadera -= costoMadera
				cantRecursoPiedra -= costoPiedra
				cantAldeanoDisponible -= 1
				cantAldeanoConstructor += 1
				
			}
			if(self.visible() != null) self.cerrar()
		}
		if(accion == "CasaG") {
			const costoMadera = 200
			const costoPiedra = 100
			const ticksConstruccion = 50
			
			if(costoMadera <= cantRecursoMadera and costoPiedra <= cantRecursoPiedra and cantAldeanoDisponible > 0){
				lista.forEach({ 
					objeto => 
					game.addVisualIn(new CasaG(), objeto)
					game.addVisualIn(new BarraConstruccion(), objeto)
					game.onTick((ticksConstruccion/5)*1000,"Construccion CasaG"+objeto.toString(), {
						const barra = game.getObjectsIn(objeto).find({ filtro => filtro.tipo() == "Barra" })
						barra.suma()
						if( barra.progreso() >= 6 ){
							cantAldeanoDisponible += 1
							cantAldeanoConstructor -= 1
							game.removeVisual(barra)
							self.terminarConstruccion("Construccion CasaG"+objeto.toString())
						}
					})
				})
				cantRecursoMadera -= costoMadera
				cantRecursoPiedra -= costoPiedra
				cantAldeanoDisponible -= 1
				cantAldeanoConstructor += 1
			}
			if(self.visible() != null) self.cerrar()
		}
	}
	
}
