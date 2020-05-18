import wollok.game.*
import pepita.*
import hud.*
object timer{
	var segundos=0
	method segundos(){return segundos}
	method inicio() = game.onTick(10, "updateTimer", { => self.update()} )
	method update(){
		if(segundos<60){
			segundos+=1
		}
}

}
