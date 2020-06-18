# Aldeanos
El juego trata de construir una aldea y no perder a los aldeanos en el intento.

## Desarrolladores

- Fernanda Pérez
- Hernán Cruz

### Cosas a tener en cuenta:
- Se corre contrareloj ya que los aldeanos van consumiendo alimento a medida pasa el tiempo y al reproducirse.
- La falta de alimento provoca el deceso de los aldeanos.

La interface es mayormente intuitiva.

# Teclas del Juego:

- Direccionales: Movimiento del Cursor
- T: Presionandola sobre Arboles, Piedras, Costa del agua, Platacion, Granja o Construcciones pausadas para Talar, Minar, Pescar, Recolectar o Reanudar construccion respectivamente 
- W: Detiene la tarea que esta debajo del cursor
- M: Menu de opciones
- C: Menu de Construcciones, Nota: Solo se puede contruir en lugares libres
- P: Pausa el juego
- -: Quita la Musica
- +: Reanuda la Musica

# Recursos:

- Arboles: cada 12s dan 10 de Madera. 50 Madera total en 60s y desaparece
- Piedra: cada 24s dan 15 de Piedra. 75 Piedra total en 120s y desaparece
- Lago: cada 20s dan 5 de Alimento. 50 Alimento total en 100s, reutilizable.
- Granja: cada 30s dan 50 de Alimento. 250 Alimento total en 150s, reutilizable.
- Plantacion: cada 30s dan 150 de Alimento. 750 Alimento total en 150s, reutilizable.

# Informacion de Construcciones:

### CasaC
- Costo: 100 Madera
- Tiempo: 20s
- Casa con espacio para 1 aldeano mas.

### CasaG
- Costo: 200 Madera, 100 Piedra
- Tiempo: 50s
- Casa mas grande con espacio para 3 aldeanos mas.

### Almacen
- Costo: 50 Piedra
- Tiempo: 10s
- Aumenta el Limite de recursos que pueden recolectarse e indica con barra el recurso que mas esta ocupando.

### Mercado
- Costo: 300 Madera, 300 Piedra
- Tiempo: 300s (5 min)
- Solo puede haber un maximo de 3 en la partida, y otorga 1 * Cant. de Mercados de cada recurso cada 5 segundos.
- Ocupa 4 espacios y pide 2 aldeanos para costruir. 

### Granja
- Costo: 500 Madera, 50 Piedra
- Tiempo 300s (5 min)
- Tiene 4 espacios para recolectar, cada espacio otorga 50 de comida por recoleccion. Tarda 150s el ciclo completo
- Ocupa 4 espacios y pide 2 aldeanos para costruir.

### Plantacion
- Costo: 800 Madera, 150 Piedra
- Tiempo: 100s (10 min)
- Tiene 4 espacios para recolectar, cada espacio otorga 150 de comida por recoleccion. Tarda 150s el ciclo completo
- Ocupa 4 espacios y pide 2 aldeanos para costruir.

