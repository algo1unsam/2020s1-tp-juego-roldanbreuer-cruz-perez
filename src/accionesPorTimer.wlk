//acciones que se disparan utilizando el timer
import timer.*
//import menu.*



object accionesAutomaticas{
	method AlimentarPorMinuto(){
		if(timer.acumuladorTiempo()%5==0){ menu.Alimentar()}
	}
	
	method nacimientosAutomaticos(){
		if(timer.acumuladorTiempo()%5==0){ menu.Nacimiento()}
	}
	
}