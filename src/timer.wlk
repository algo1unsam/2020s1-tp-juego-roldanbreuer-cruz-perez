import wollok.game.*
import cursor.*
import hud.*
import accionesPorTimer.*
import estados.*
import elementosHud.*
//import menu.*


object timer{
	var property segundos=0
	var property minutos=0
	var property acumuladorTiempo=0
	method inicio() = game.onTick(1000, "updateTimer", { => self.update()} )
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
			alimento.modificar(1*recursos.mercadosConstruidos())
			madera.modificar(1*recursos.mercadosConstruidos())
			piedra.modificar(1*recursos.mercadosConstruidos())
		}
	}
}
object timerSegundos {
	method consulta()= timer.segundos()
}
object timerMinutos{
	method consulta()=timer.minutos()
}
object wollok{}