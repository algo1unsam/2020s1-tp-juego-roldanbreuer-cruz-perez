//import wollok.game.*
//import cursor.*
//import elementosGame.*
//import teclas.*

//solo para comodidad del desarrollo del juego
//en este archivo se encuentran solamente los elementos que componen el menu


object menu{
	var property seleccionado = []
	method image() = "assets/menu.png"
	}
	
class Remover{
	method removerObjeto(){

	}
}


	/*method remover(tipo,lista){
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
				if(tipo == "Agricultor"){
					cantAldeanoAgricultor -= 1
					cantAldeanoDisponible += 1
					game.removeVisual(game.getObjectsIn(objeto).find({ filtro => filtro.tipo() == "Barra" }))
					self.terminarConstruccion("Recoleccion plantacion"+objeto.toString())
				}
				if(tipo == "Granjero"){
					cantAldeanoGranjero -= 1
					cantAldeanoDisponible += 1
					game.removeVisual(game.getObjectsIn(objeto).find({ filtro => filtro.tipo() == "Barra" }))
					self.terminarConstruccion("Recoleccion Granja"+objeto.toString())
				}
				if(tipo == "Constructor"){
					cantAldeanoDisponible += 1
					cantAldeanoConstructor -= 1
					self.terminarConstruccion("Construccion"+objeto.toString())
				}
				if(tipo == "Constructor2"){
					cantAldeanoDisponible += 2
					cantAldeanoConstructor -= 2
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
		////--------------------------------------------- RECOLECCION
		
		if(accion == "granja") {
			const recurso=50
			const ticksRecurso = 150
			
			var objeto = lista.last() 
			const listaPos = game.getObjectsIn(objeto)
			if(listaPos.filter({ tipo => tipo.tipo() == "granja" }).size() > 0 and cantAldeanoDisponible > 0){
				game.addVisualIn(new Granjero(position = objeto), objeto)
				game.addVisualIn(new BarraRecoleccion(), objeto)
				game.onTick((ticksRecurso/5)*1000,"Recoleccion Granja"+objeto.toString(), {
					const barra = game.getObjectsIn(objeto).find({ filtro => filtro.tipo() == "Barra" })
					if((cantRecursoAlimento + (recurso/5)) <= maxAlmacen){
						barra.suma()
						cantRecursoAlimento += (recurso/5)
					}else{
						self.remover("Granjero",[objeto])
						barra.error("Se lleno el almacen.")
					}
					if( barra.progreso() >= 6 ){
						cantAldeanoDisponible += 1
						cantAldeanoGranjero -= 1
						game.removeVisual(barra)
						game.removeVisual(game.getObjectsIn(objeto).find({ filtro => filtro.tipo() == "Granjero" }))
						self.terminarConstruccion("Recoleccion Granja"+objeto.toString())
					}
				})
				cantAldeanoDisponible -= 1
				cantAldeanoGranjero += 1
			}else if(cantAldeanoDisponible == 0){
				centralErrores.error("No hay aldeanos disponibles.")
			}
			
		}
		if(accion == "plantacion") {
			const recurso=150
			const ticksRecurso = 150
			self.remover("Seleccion", lista)
			var objeto = lista.last() 
			const listaPos = game.getObjectsIn(objeto)
			if(listaPos.filter({ tipo => tipo.tipo() == "plantacion" }).size() > 0 and cantAldeanoDisponible > 0){
				game.addVisualIn(new Agricultor(position = objeto), objeto)
				game.addVisualIn(new BarraRecoleccion(), objeto)
				game.onTick((ticksRecurso/5)*1000,"Recoleccion plantacion"+objeto.toString(), {
					const barra = game.getObjectsIn(objeto).find({ filtro => filtro.tipo() == "Barra" })
					if((cantRecursoAlimento + (recurso/5)) <= maxAlmacen){
						barra.suma()
						cantRecursoAlimento += (recurso/5)
					}else{
						self.remover("Agricultor",[objeto])
						barra.error("Se lleno el almacen.")
					}
					if( barra.progreso() >= 6 ){
						cantAldeanoDisponible += 1
						cantAldeanoAgricultor -= 1
						game.removeVisual(barra)
						game.removeVisual(game.getObjectsIn(objeto).find({ filtro => filtro.tipo() == "Agricultor" }))
						self.terminarConstruccion("Recoleccion plantacion"+objeto.toString())
					}
				})
				cantAldeanoDisponible -= 1
				cantAldeanoAgricultor += 1
			}else if(cantAldeanoDisponible == 0){
				centralErrores.error("No hay aldeanos disponibles.")
			}
		
		}
		
		
		////--------------------------------------------- CONSTRUCCIONES 
		if(accion == "Almacen") {
			const costoMadera = 0
			const costoPiedra = 50
			const ticksConstruccion = 10
			
			if((costoMadera <= cantRecursoMadera and costoPiedra <= cantRecursoPiedra and cantAldeanoDisponible > 0) or game.getObjectsIn(cursor.position()).filter({ filtro => filtro.tipo() == "Barra" }).size() > 0){
				var objeto = lista.last() 
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
				
				cantAldeanoDisponible -= 1
				cantAldeanoConstructor += 1
				
			}else if(cantAldeanoDisponible == 0){
				centralErrores.error("No hay aldeanos disponibles.")
			}else if(costoMadera > cantRecursoMadera or costoPiedra > cantRecursoPiedra){
				centralErrores.error("No hay recursos suficientes.")
			}
			if(self.visible() != null) self.cerrar()
		}
		if(accion == "CasaC") {
			const costoMadera = 100
			const costoPiedra = 0
			const ticksConstruccion = 20
			
			if((costoMadera <= cantRecursoMadera and costoPiedra <= cantRecursoPiedra and cantAldeanoDisponible > 0) or game.getObjectsIn(cursor.position()).filter({ filtro => filtro.tipo() == "Barra" }).size() > 0){
				var objeto = lista.last()  
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
				
				cantAldeanoDisponible -= 1
				cantAldeanoConstructor += 1
				
			}else if(cantAldeanoDisponible == 0){
				centralErrores.error("No hay aldeanos disponibles.")
			}else if(costoMadera > cantRecursoMadera or costoPiedra > cantRecursoPiedra){
				centralErrores.error("No hay recursos suficientes.")
			}
			if(self.visible() != null) self.cerrar()
		}
		if(accion == "CasaG") {
			const costoMadera = 200
			const costoPiedra = 100
			const ticksConstruccion = 50
			
			if((costoMadera <= cantRecursoMadera and costoPiedra <= cantRecursoPiedra and cantAldeanoDisponible > 0) or game.getObjectsIn(cursor.position()).filter({ filtro => filtro.tipo() == "Barra" }).size() > 0){
				var objeto = lista.last() 					
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
				
				cantAldeanoDisponible -= 1
				cantAldeanoConstructor += 1
			}else if(cantAldeanoDisponible == 0){
				centralErrores.error("No hay aldeanos disponibles.")
			}else if(costoMadera > cantRecursoMadera or costoPiedra > cantRecursoPiedra){
				centralErrores.error("No hay recursos suficientes.")
			}
			if(self.visible() != null) self.cerrar()
		}
		if(accion == "Mercado") {
			const costoMadera = 300
			const costoPiedra = 300
			const ticksConstruccion = 300
			const maxConstruidos = 3

			if(game.getObjectsIn(cursor.position()).size() == 1 and 
			   game.getObjectsIn(cursor.position().up(1)).size() == 0 and
			   game.getObjectsIn(cursor.position().right(1)).size() == 0 and
			   game.getObjectsIn(cursor.position().right(1).up(1)).size() == 0){
				centralErrores.error("Esta construcción ocupa 4 espacios.")
			}
			
			if(mercadosConstruidos == maxConstruidos){
				centralErrores.error("Solo pueden construir 3 mercados.")
			}
			
			if((costoMadera <= cantRecursoMadera and costoPiedra <= cantRecursoPiedra and cantAldeanoDisponible > 1) or game.getObjectsIn(cursor.position()).filter({ filtro => filtro.tipo() == "Barra" }).size() > 0){
				var objeto = lista.last() 				
				if(game.getObjectsIn(objeto).filter({ filtro => filtro.tipo() == "Barra" }).size() == 0){
					game.addVisualIn(new Mercado(), objeto)
					game.addVisualIn(new MercadoVacio(), objeto.up(1))
					game.addVisualIn(new MercadoVacio(), objeto.right(1))
					game.addVisualIn(new MercadoVacio(), objeto.right(1).up(1))
					game.addVisualIn(new BarraConstruccion(), objeto)
					cantRecursoMadera -= costoMadera
					cantRecursoPiedra -= costoPiedra
				}
				game.addVisualIn(new Construir2(position = objeto), objeto)
				game.onTick((ticksConstruccion/5)*1000,"Construccion"+objeto.toString(), {
					const barra = game.getObjectsIn(objeto).find({ filtro => filtro.tipo() == "Barra" })
					barra.suma()
					if( barra.progreso() >= 6 ){
						cantAldeanoDisponible += 2
						cantAldeanoConstructor -= 2
						mercadosConstruidos += 1
						game.removeVisual(barra)
						game.removeVisual(game.getObjectsIn(objeto).find({ filtro => filtro.tipo() == "Constructor2" }))
						self.terminarConstruccion("Construccion"+objeto.toString())
					}
				})
				cantAldeanoDisponible -= 2
				cantAldeanoConstructor += 2
			}else if(cantAldeanoDisponible < 2){
				centralErrores.error("No hay aldeanos disponibles.")
			}else if(costoMadera > cantRecursoMadera or costoPiedra > cantRecursoPiedra){
				centralErrores.error("No hay recursos suficientes.")
			}
			if(self.visible() != null) self.cerrar()
		}
		if(accion == "Granja") {
			const costoMadera = 500
			const costoPiedra = 50
			const ticksConstruccion = 300

			if(game.getObjectsIn(cursor.position()).size() == 1 and 
			   game.getObjectsIn(cursor.position().up(1)).size() == 0 and
			   game.getObjectsIn(cursor.position().right(1)).size() == 0 and
			   game.getObjectsIn(cursor.position().right(1).up(1)).size() == 0){
				centralErrores.error("Esta construcción ocupa 4 espacios.")
			}
			
			
			if((costoMadera <= cantRecursoMadera and costoPiedra <= cantRecursoPiedra and cantAldeanoDisponible > 1) or game.getObjectsIn(cursor.position()).filter({ filtro => filtro.tipo() == "Barra" }).size() > 0){
				var objeto = lista.last() 		
				if(game.getObjectsIn(objeto).filter({ filtro => filtro.tipo() == "Barra" }).size() == 0){
					game.addVisualIn(new Granja(), objeto)
					game.addVisualIn(new GranjaVacio(), objeto.up(1))
					game.addVisualIn(new GranjaVacio(), objeto.right(1))
					game.addVisualIn(new GranjaVacio(), objeto.right(1).up(1))
					game.addVisualIn(new BarraConstruccion(), objeto)
					cantRecursoMadera -= costoMadera
					cantRecursoPiedra -= costoPiedra
				}
				game.addVisualIn(new Construir2(position = objeto), objeto)
				game.onTick((ticksConstruccion/5)*1000,"Construccion"+objeto.toString(), {
					const barra = game.getObjectsIn(objeto).find({ filtro => filtro.tipo() == "Barra" })
					barra.suma()
					if( barra.progreso() >= 6 ){
						cantAldeanoDisponible += 2
						cantAldeanoConstructor -= 2
						game.removeVisual(barra)
						game.removeVisual(game.getObjectsIn(objeto).find({ filtro => filtro.tipo() == "Constructor2" }))
						self.terminarConstruccion("Construccion"+objeto.toString())
					}
				})
				
				cantAldeanoDisponible -= 2
				cantAldeanoConstructor += 2
			}else if(cantAldeanoDisponible < 2){
				centralErrores.error("No hay aldeanos disponibles.")
			}else if(costoMadera > cantRecursoMadera or costoPiedra > cantRecursoPiedra){
				centralErrores.error("No hay recursos suficientes.")
			}
			if(self.visible() != null) self.cerrar()
		}
		if(accion == "Plantacion") {
			const costoMadera = 800
			const costoPiedra = 150
			const ticksConstruccion = 600

			if(game.getObjectsIn(cursor.position()).size() == 1 and 
			   game.getObjectsIn(cursor.position().up(1)).size() == 0 and
			   game.getObjectsIn(cursor.position().right(1)).size() == 0 and
			   game.getObjectsIn(cursor.position().right(1).up(1)).size() == 0){
				centralErrores.error("Esta construcción ocupa 4 espacios.")
			}
			
			
			if((costoMadera <= cantRecursoMadera and costoPiedra <= cantRecursoPiedra and cantAldeanoDisponible > 1) or game.getObjectsIn(cursor.position()).filter({ filtro => filtro.tipo() == "Barra" }).size() > 0){
				var objeto = lista.last() 			
				if(game.getObjectsIn(objeto).filter({ filtro => filtro.tipo() == "Barra" }).size() == 0){
					game.addVisualIn(new Plantacion(), objeto)
					game.addVisualIn(new PlantacionVacio(), objeto.up(1))
					game.addVisualIn(new PlantacionVacio(), objeto.right(1))
					game.addVisualIn(new PlantacionVacio(), objeto.right(1).up(1))
					game.addVisualIn(new BarraConstruccion(), objeto)
					cantRecursoMadera -= costoMadera
					cantRecursoPiedra -= costoPiedra
				}
				game.addVisualIn(new Construir2(position = objeto), objeto)
				game.onTick((ticksConstruccion/5)*1000,"Construccion"+objeto.toString(), {
					const barra = game.getObjectsIn(objeto).find({ filtro => filtro.tipo() == "Barra" })
					barra.suma()
					if( barra.progreso() >= 6 ){
						cantAldeanoDisponible += 2
						cantAldeanoConstructor -= 2
						game.removeVisual(barra)
						game.removeVisual(game.getObjectsIn(objeto).find({ filtro => filtro.tipo() == "Constructor2" }))
						self.terminarConstruccion("Construccion"+objeto.toString())
					}
				})
				
				cantAldeanoDisponible -= 2
				cantAldeanoConstructor += 2
			}else if(cantAldeanoDisponible < 2){
				centralErrores.error("No hay aldeanos disponibles.")
			}else if(costoMadera > cantRecursoMadera or costoPiedra > cantRecursoPiedra){
				centralErrores.error("No hay recursos suficientes.")
			}
			if(self.visible() != null) self.cerrar()
		}
	
	}
	
}
*/