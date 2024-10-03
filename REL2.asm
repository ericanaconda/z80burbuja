CPU "Z80.tbl"
HOF "INT8"
;PROGRAMA 1. RELOCALIZACION HACIA ARRIBA DE CADENAS EN UN BLOQUE DE MEMORIA
;Por: Eric Ramirez Valdovinos & Tristan Qesen Sánchez Mayen
LD HL, 1000H; definimos la localidad donde se encontrara si se pudo o no relocalizar
LD IX, 10FFH; es la direccion final para buscar en el bloque de memoria
INC HL; incrementamos H+=1 para establecer el inicio de la busqueda
LD E,0; bandera para saber si se relocalizo o no la frase

;move_forward para encontrar valores distintos de cero
move_forward: INC HL ;incrementamos el apuntador para compara la siguiente localidad de memoria
PUSH DE; guarda en la pila el valor de DE
PUSH HL; guarda en la pila el valor de HL (1000H)
PUSH IX; guarda en la pila el valor de IX (10FFH), limite del recorrido de busqueda
POP DE; guarda en DE el valor de IX (10FFH)
POP BC; guarda en BC el valor de HL (1000H)
LD A, B; actualiza el acumulador con los primeros bits de BC
CP D; compara los primeros bits de la posicion actual de HL con el limite de busqueda
JR NZ, continue_move_forward; si no son iguales, salta a la siguiente comparacion (para este caso siempre seran iguales pero si se deseara ampliar el rango de busqueda es mas necesario)
LD A,C; le pasa al acumulador los bits menos significantes de BC
CP E; compara los bits menos significantes de BC (HL: posicion actual) con el limite de busqueda
JR NZ, continue_move_forward; si es cero, se llego al limite y no se puede seguir comparando
JR not_found; salto relativo a la instruccion para terminar el programa, si se llega por este salto, no se relocalizaron todos los bloques de memoria

continue_move_forward: POP DE;
LD A, (HL); cargamos en el acumulador el valor de HL
CP 0 ;
JP Z, move_forward; si el valor leido anterior era cero, continuamos en eti1 hasta encontrar algo distinto
LD A, E; pasamos el valor de la variable E que indica el numero de palabras relocalizadas
CP 0; comparamos si E es 0
JP Z, identify_hola; si E era cero (A=0), se enciende Z y se dirige a identify_hola
CP 1; comparamos si E es 1
JP Z, relocate_adios; si E era uno (A=1), se enciende Z y se dirige a relocate_adios
CP 2; comparamos si E es 2
JP Z, relocate_que; si E era dos (A=2), se enciende Z y se dirige a relocate_que

;identify_hola para identificar donde termina la primera palabra y relocalizar alli (final de "HOLA")
identify_hola: LD BC, 0004H; le damos el valor 4 al BC para que actue como sumando
ADD HL,BC; sumamos 4 (1+4) locaciones de memoria despues de haber encontrado el primer caracter (HL+=4)
PUSH HL; guardamos el valor donde se hará la sobreescritura para la siguiente palabra en la pila (5 espacios despues de terminar la palabra "HOLA")
INC E; primera palabra encontrada, E=1
JR move_forward; regresa a move_forward

;relocate_adios implementacion del primer LDDR para 5 caracteres contiguos (ADIOS)
relocate_adios: LD (200H),HL; guardamos esa direccion destino en una celda no utilizada (200H)
POP HL; recuperamos la locacion de memoria justo despues de que termina la palabra "HOLA"
LD D,H; copiamos el valor mas significante de HL en D
LD E,L; copiamos el valor menos significante de HL en E
;queda guardada la ubicacion de destino para acomodar el siguiente bloque de memoria
LD HL, (200H); le regresamos a HL la direccion de la que debera copiar hacia arriba
LD BC, 0005H; cargamos BC con 5 para hacer la copia de los 5 caracteres de la palabra "ADIOS"

;delete1: es la primera etiqueta para mover los bloques de memoria, eliminando lo que hubiera en la direccion de origen
delete1: LD A,(HL); pasa al acumulador el valor de la celda apuntada por HL
LD (DE),A; guarda en la direccion destino el valor del acumulador
LD (HL),0; actualiza a "0" a la locacion origen del valor copiado
INC HL; incrementa HL, apuntador de los valores origen
INC DE; incrementa en uno DE, apuntador para los valores relocalizado
DEC BC; decrementa BC, contador de bytes a relocalizar
LD A, B; pasa al acumulador el valor mas significativo de BC (0)
CP C; compara si los dos bits finales de BC han llegado a cero
JR NZ, delete1; si el valor todavia no es cero, repite la etiqueta

PUSH DE; guardamos DE para saber donde continuar con la relocalizacion
LD E,2; colocamos un 2 en E para entrar a la eti4 cuando se regrese a eti1
ADD HL, BC; apunta al final de la palabra "ADIOS"
JR move_forward; saltamos a move_forward para buscar la siguiente palabra

;relocate_que: relocalizacion del tercer bloque para la ultima palabra, "QUE"
relocate_que: POP DE; regresamos el valor de DE para la direccion en la que necesitamos relocalizar
LD BC, 0003H; esatblecemos un contador de 3 bytes, longitud de la cadena a relocalizar

;delete2: proceso para copiar e ir borrando cadena de origen de la palabra "QUE"
delete2: LD A,(HL); pasa al acumulador el valor de la celda apuntada por HL
LD (DE),A; guarda en la direccion destino el valor del acumulador
LD (HL),0; actualiza a "0" a la locacion origen del valor copiado
INC HL; incrementa HL, apuntador de los valores origen
INC DE; incrementa en uno DE, apuntador para los valores relocalizado
DEC BC; decrementa BC, contador de bytes a relocalizar
LD A,B; pasa al acumulador el valor mas significativo de BC (0)
CP C; compara si los dos bits finales de BC han llegado a cero
JR NZ, delete2; si el valor todavia no es cero, repite la etiqueta

LD HL, 1000H; HL apunta a la direccion 1000H para indicar que se completo el proceso
LD E, 3; el 3 indica que se completo el proceso de relocalizacion (es un corazon es ASCII)
LD (HL),E; el contenido de HL (contenido de la 1000H) se actualiza a un 3

not_found: HALT; fin del programa