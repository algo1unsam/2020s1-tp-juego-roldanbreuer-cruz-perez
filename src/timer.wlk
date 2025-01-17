import wollok.game.*
import cursor.*
import accionesPorTimer.*
import estados.*
import elementosHud.*


object timer{
	var property segundos=0
	var property minutos=0
	var property acumuladorTiempo=0
	
	method reiniciar(){
		segundos=0
		minutos=0
		acumuladorTiempo=0
	}
	
	method inicio() { game.onTick(1000, "updateTimer", { => self.update()} ) }
	method pausa() { game.removeTickEvent("updateTimer") }
	method update(){
		acumuladorTiempo+=1
		if(acumuladorTiempo<60){
			segundos+=1
			}
		if(acumuladorTiempo == 60){
			minutos+=1
			dispararEvento.Alimentar()
			if(minutos.even()){dispararEvento.Nacimiento()}
			segundos=0
			acumuladorTiempo=0
		}
		if(acumuladorTiempo%5==0){   //// --- Mercado
			dispararEvento.entregarRecursosMercado()
		}
	}
}
object timerSegundos {
	method consulta()= timer.segundos()
}
object timerMinutos{
	method consulta()=timer.minutos()
}