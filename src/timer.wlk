import wollok.game.*
import cursor.*
import hud.*
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
		if(acumuladorTiempo == 59){
			minutos+=1
			segundos=0
			acumuladorTiempo=0
		}
	}
}
///esto es al pedo para que me tome el commit
object wollokDejameCommitear{}