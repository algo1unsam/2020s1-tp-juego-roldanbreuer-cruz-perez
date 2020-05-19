import wollok.game.*
import cursor.*
import hud.*
import menu.*


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
			menu.Alimentar()
			if(minutos.even()){menu.Nacimiento()}
			segundos=0
			acumuladorTiempo=0
		}
		if(acumuladorTiempo%5==0){   //// --- Mercado
			menu.sumAlimento(1*menu.mercadosConstruidos())
			menu.sumMadera(1*menu.mercadosConstruidos())
			menu.sumPiedra(1*menu.mercadosConstruidos())
		}
		
	}
}


///esto es al pedo para que me tome el commit
object wollokDejameCommitear{}