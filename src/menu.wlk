import wollok.game.*
import cursor.*
import elementosGame.*
import teclas.*
//solo para comodidad del desarrollo del juego
//en este archivo se encuentran solamente los elementos que componen el menu


object menu{
	var property visible
	var property seleccionado = []
		
	var property cantRecursoMadera=100
	var property cantRecursoPiedra=50
	var property cantRecursoAlimento=0
	var property cantAldeanos = 5
	var property cantPoblacion = 5
	var property maxAlmacen = 100
	
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
			game.addVisualIn(botonSalir, game.at(20,6))
		}
		if(motivo == "construccion"){
			game.addVisualIn(self, game.at(12,5))
			game.addVisualIn(tituloConstrucciones, game.at(13,13))
			game.addVisualIn(botonAlmacen, game.at(13,10))
			game.addVisualIn(botonCasaC, game.at(16,10))
			game.addVisualIn(botonCasaG, game.at(19,10))
			game.addVisualIn(botonCancelar, game.at(13,6))
			game.addVisualIn(botonSalir, game.at(20,6))
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
	
	method Alimentar(){
		const alimentoNecesario = cantAldeanos * 5
		const alimentoRestante = cantRecursoAlimento - alimentoNecesario
		if(alimentoRestante < 0){
			cantRecursoAlimento = 0
			const cantidadDeMuertes = alimentoRestante.abs().div(5)
			var inicio = 1000
			cantidadDeMuertes.times({ i => game.schedule(inicio, { => self.killRandom() }) 
										inicio += 500 })
		}else{
			cantRecursoAlimento = alimentoRestante
		}
	}
	
	method Nacimiento(){
		const alimentoNecesario = cantAldeanos * 5
		const alimentoRestante = cantRecursoAlimento - alimentoNecesario
		if(alimentoRestante >= 100){
			cantAldeanoDisponible += 1
			cantAldeanos += 1
			cantRecursoAlimento -= 50
			game.say(centralErrores, "Ha nacido un nuevo Aldeano")
		}
	}
	
	method killRandom(){
		const todosLosAldeanos = game.allVisuals().filter({ filtro => filtro.tipo() == "Talador" or 
																	filtro.tipo() == "Minero" or
																	filtro.tipo() == "Constructor" or 
																	filtro.tipo() == "Pescador"})
		if(cantAldeanoDisponible > 0) todosLosAldeanos.add(aldeanoLibre)
		const sujetoAMorir = todosLosAldeanos.anyOne()
		if(sujetoAMorir.tipo() == "Talador" or sujetoAMorir.tipo() == "Minero" or sujetoAMorir.tipo() == "Constructor" or sujetoAMorir.tipo() == "Pescador"){
			self.remover(sujetoAMorir.tipo(), [sujetoAMorir.position()])
			cantAldeanoDisponible -= 1
			cantAldeanos -= 1
			if(cantAldeanos == 0){
				game.clear()
				game.addVisualIn(self, game.at(12,5))
				game.addVisualIn(gameover, game.at(13,10))
			}
			centralErrores.error("Ha muerto un aldeano "+sujetoAMorir.tipo())
		}else{
			cantAldeanoDisponible -= 1
			cantAldeanos -= 1
			if(cantAldeanos == 0){
				game.clear()
				game.addVisualIn(self, game.at(12,5))
				game.addVisualIn(gameover, game.at(13,10))
			}
			centralErrores.error("Ha muerto un aldeano disponible")
		}
		 
	}
	
	
	
	method remover(tipo,lista){
		lista.forEach({ 
			objeto => 
			if(game.getObjectsIn(objeto).filter({ filtro => filtro.tipo() == tipo }).size() > 0){
				if(tipo == "Talador"){
					cantAldeanoTalador -= 1
					cantAldeanoDisponible += 1
					self.terminarConstruccion("Recoleccion Madera"+objeto.toString())
				}
				if(tipo == "Minero"){
					cantAldeanoMinero -= 1
					cantAldeanoDisponible += 1
					self.terminarConstruccion("Recoleccion Piedra"+objeto.toString())
				}
				if(tipo == "Pescador"){
					cantAldeanoPescador -= 1
					cantAldeanoDisponible += 1
					game.removeVisual(game.getObjectsIn(objeto).find({ filtro => filtro.tipo() == "Barra" }))
					self.terminarConstruccion("Recoleccion Pesca"+objeto.toString())
				}
				if(tipo == "Constructor"){
					cantAldeanoDisponible += 1
					cantAldeanoConstructor -= 1
					self.terminarConstruccion("Construccion"+objeto.toString())
					
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
			const recurso = 50
			const ticksRecurso = 60
						
			self.remover("Seleccion", lista)
			lista.forEach({ 
				objeto => 
				cursor.accesoAlLugar(objeto)
				const listaPos = game.getObjectsIn(objeto)
				if(listaPos.filter({ tipo => tipo.tipo() == "Arboleda" }).size() > 0 and cantAldeanoDisponible > 0) {
					game.sound("talar.ogg")
					game.addVisualIn(new Talada(position = objeto), objeto)
					if(game.getObjectsIn(objeto).filter({ filtro => filtro.tipo() == "Barra" }).size() == 0){
						game.addVisualIn(new BarraRecoleccion(), objeto)
					}
					game.onTick((ticksRecurso/5)*1000,"Recoleccion Madera"+objeto.toString(), {
						const barra = game.getObjectsIn(objeto).find({ filtro => filtro.tipo() == "Barra" })
						if((cantRecursoMadera + (recurso/5)) <= maxAlmacen){
							barra.suma()
							cantRecursoMadera += (recurso/5)
						}else{
							self.remover("Talador",[objeto])
							barra.error("Se lleno el almacen.")
						}
						if( barra.progreso() >= 6 ){
							cantAldeanoDisponible += 1
							cantAldeanoTalador -= 1
							game.removeVisual(barra)
							game.removeVisual(game.getObjectsIn(objeto).find({ filtro => filtro.tipo() == "Arboleda" }))
							game.removeVisual(game.getObjectsIn(objeto).find({ filtro => filtro.tipo() == "Talador" }))
							self.terminarConstruccion("Recoleccion Madera"+objeto.toString())
						}
					})
					cantAldeanoDisponible -= 1
					cantAldeanoTalador += 1
				}else if(cantAldeanoDisponible == 0){
					centralErrores.error("No hay aldeanos disponibles.")
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
			const recurso = 75
			const ticksRecurso = 120

			self.remover("Seleccion", lista)
			lista.forEach({ 
				objeto => 
				cursor.accesoAlLugar(objeto)
				const listaPos = game.getObjectsIn(objeto)
				if(listaPos.filter({ tipo => tipo.tipo() == "Piedras" }).size() > 0 and cantAldeanoDisponible > 0){ 
					game.addVisualIn(new Minado(position = objeto), objeto)
					game.sound("minar.ogg")
					if(game.getObjectsIn(objeto).filter({ filtro => filtro.tipo() == "Barra" }).size() == 0){
						game.addVisualIn(new BarraRecoleccion(), objeto)
					}
					game.onTick((ticksRecurso/5)*1000,"Recoleccion Piedra"+objeto.toString(), {
						const barra = game.getObjectsIn(objeto).find({ filtro => filtro.tipo() == "Barra" })
						if((cantRecursoPiedra + (recurso/5)) <= maxAlmacen){
							barra.suma()
							cantRecursoPiedra += (recurso/5)
						}else{
							self.remover("Minero",[objeto])
							barra.error("Se lleno el almacen.")
						}
						if( barra.progreso() >= 6 ){
							cantAldeanoDisponible += 1
							cantAldeanoMinero -= 1
							game.removeVisual(barra)
							game.removeVisual(game.getObjectsIn(objeto).find({ filtro => filtro.tipo() == "Piedras" }))
							game.removeVisual(game.getObjectsIn(objeto).find({ filtro => filtro.tipo() == "Minero" }))
							self.terminarConstruccion("Recoleccion Piedra"+objeto.toString())
						}
					})
					cantAldeanoDisponible -= 1
					cantAldeanoMinero += 1
				}else if(cantAldeanoDisponible == 0){
					centralErrores.error("No hay aldeanos disponibles.")
				}
			})
		}
		if(accion == "pesca") {
			const recurso=25
			const ticksRecurso = 60
			self.remover("Seleccion", lista)
			lista.forEach({ 
				objeto => 
				cursor.accesoAlLugar(objeto)
				const listaPos = game.getObjectsIn(objeto)
				if(listaPos.filter({ tipo => tipo.tipo() == "Agua" }).size() > 0 and cantAldeanoDisponible > 0){
					game.addVisualIn(new Pesca(position = objeto), objeto)
					game.addVisualIn(new BarraRecoleccion(), objeto)
					game.onTick((ticksRecurso/5)*1000,"Recoleccion Pesca"+objeto.toString(), {
						const barra = game.getObjectsIn(objeto).find({ filtro => filtro.tipo() == "Barra" })
						if((cantRecursoAlimento + (recurso/5)) <= maxAlmacen){
							barra.suma()
							cantRecursoAlimento += (recurso/5)
						}else{
							self.remover("Pescar",[objeto])
							barra.error("Se lleno el almacen.")
						}
						if( barra.progreso() >= 6 ){
							cantAldeanoDisponible += 1
							cantAldeanoPescador -= 1
							game.removeVisual(barra)
							game.removeVisual(game.getObjectsIn(objeto).find({ filtro => filtro.tipo() == "Pescador" }))
							self.terminarConstruccion("Recoleccion Pesca"+objeto.toString())
						}
					})
					cantAldeanoDisponible -= 1
					cantAldeanoPescador += 1
				}else if(cantAldeanoDisponible == 0){
					centralErrores.error("No hay aldeanos disponibles.")
				}
			})
		}
		
		if(accion == "Almacen") {
			const costoMadera = 0
			const costoPiedra = 50
			const ticksConstruccion = 10
			
			if((costoMadera <= cantRecursoMadera and costoPiedra <= cantRecursoPiedra and cantAldeanoDisponible > 0) or game.getObjectsIn(cursor.position()).filter({ filtro => filtro.tipo() == "Barra" }).size() > 0){
				lista.forEach({ 
					objeto => 
					if(game.getObjectsIn(objeto).filter({ filtro => filtro.tipo() == "Barra" }).size() == 0){						
						game.addVisualIn(new Almacen(), objeto)
						game.addVisualIn(new BarraConstruccion(), objeto)
						cantRecursoMadera -= costoMadera
						cantRecursoPiedra -= costoPiedra
					}
					game.addVisualIn(new Construir(position = objeto), objeto)
					game.onTick((ticksConstruccion/5)*1000,"Construccion"+objeto.toString(), {
						const barra = game.getObjectsIn(objeto).find({ filtro => filtro.tipo() == "Barra" })
						barra.suma()
						if( barra.progreso() >= 6 ){
							cantAldeanoDisponible += 1
							cantAldeanoConstructor -= 1
							maxAlmacen += 50
							game.removeVisual(barra)
							game.addVisualIn(new BarraAlmacen(), objeto)
							game.removeVisual(game.getObjectsIn(objeto).find({ filtro => filtro.tipo() == "Constructor" }))
							self.terminarConstruccion("Construccion"+objeto.toString())
						}
					})
				})
				cantAldeanoDisponible -= 1
				cantAldeanoConstructor += 1
				
			}
			if(self.visible() != null) self.cerrar()
		}
		if(accion == "CasaC") {
			const costoMadera = 100
			const costoPiedra = 0
			const ticksConstruccion = 20
			
			if((costoMadera <= cantRecursoMadera and costoPiedra <= cantRecursoPiedra and cantAldeanoDisponible > 0) or game.getObjectsIn(cursor.position()).filter({ filtro => filtro.tipo() == "Barra" }).size() > 0){
				lista.forEach({ 
					objeto => 
					if(game.getObjectsIn(objeto).filter({ filtro => filtro.tipo() == "Barra" }).size() == 0){
						game.addVisualIn(new CasaC(), objeto)
						game.addVisualIn(new BarraConstruccion(), objeto)
						cantRecursoMadera -= costoMadera
						cantRecursoPiedra -= costoPiedra
					}
					game.addVisualIn(new Construir(position = objeto), objeto)
					game.onTick((ticksConstruccion/5)*1000,"Construccion"+objeto.toString(), {
						const barra = game.getObjectsIn(objeto).find({ filtro => filtro.tipo() == "Barra" })
						barra.suma()
						if( barra.progreso() >= 6 ){
							cantAldeanoDisponible += 1
							cantAldeanoConstructor -= 1
							cantPoblacion += 1
							game.removeVisual(barra)
							game.removeVisual(game.getObjectsIn(objeto).find({ filtro => filtro.tipo() == "Constructor" }))
							self.terminarConstruccion("Construccion"+objeto.toString())
						}
					})
				})
				cantAldeanoDisponible -= 1
				cantAldeanoConstructor += 1
				
			}
			if(self.visible() != null) self.cerrar()
		}
		if(accion == "CasaG") {
			const costoMadera = 200
			const costoPiedra = 100
			const ticksConstruccion = 50
			
			if((costoMadera <= cantRecursoMadera and costoPiedra <= cantRecursoPiedra and cantAldeanoDisponible > 0) or game.getObjectsIn(cursor.position()).filter({ filtro => filtro.tipo() == "Barra" }).size() > 0){
				lista.forEach({ 
					objeto => 					
					if(game.getObjectsIn(objeto).filter({ filtro => filtro.tipo() == "Barra" }).size() == 0){
						game.addVisualIn(new CasaG(), objeto)
						game.addVisualIn(new BarraConstruccion(), objeto)
						cantRecursoMadera -= costoMadera
						cantRecursoPiedra -= costoPiedra
					}
					game.addVisualIn(new Construir(position = objeto), objeto)
					game.onTick((ticksConstruccion/5)*1000,"Construccion"+objeto.toString(), {
						const barra = game.getObjectsIn(objeto).find({ filtro => filtro.tipo() == "Barra" })
						barra.suma()
						if( barra.progreso() >= 6 ){
							cantAldeanoDisponible += 1
							cantAldeanoConstructor -= 1
							cantPoblacion += 3
							game.removeVisual(barra)
							game.removeVisual(game.getObjectsIn(objeto).find({ filtro => filtro.tipo() == "Constructor" }))
							self.terminarConstruccion("Construccion"+objeto.toString())
						}
					})
				})
				cantAldeanoDisponible -= 1
				cantAldeanoConstructor += 1
			}
			if(self.visible() != null) self.cerrar()
		}
	}
	
}
