CPU "Z80.tbl"
HOF "INT8"
;PROGRAMA 1. RELOCALIZACION HACIA ARRIBA DE CADENAS EN UN BLOQUE DE MEMORIA
LD HL, 1000H; definimos la localidad donde se encontrara el tamaño de memoria a relocalizar
LD IX, 10FFH; es la direccion final para buscar en el bloque de memoria
INC HL; incrementamos H+=1 para establecer el inicio de la busqueda
LD E,0; bandera para saber si se relocalizo o no la frase

;move_forward para encontrar valores distintos de cero
move_forward: INC HL ;incrementamos el apuntador para compara la siguiente localidad de memoria
PUSH DE;
PUSH HL;
PUSH IX;
POP DE;
POP BC;

LD A, B;
CP D;
JR NZ, continue_move_forward;
LD A,C;
CP E;
JR NZ, continue_move_forward;
JR not_found;

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
;queda guardada la ubicacion de destino para el LDDR en DE
LD HL, (200H); 
LD BC, 0005H; cargamos BC con 5 para hacer la copia de los 5 caracteres de la palabra "ADIOS"
LDIR; utilizamos en mnemonico para copiar y ejecutar el bucle 5 veces
PUSH DE; guardamos DE para saber donde continuar con la relocalizacion
LD E,2; colocamos un 2 en E para entrar a la eti4 cuando se regrese a eti1
LD BC, 0004H;
ADD HL, BC; apunta al final de la palabra "ADIOS"
JR move_forward; saltamos a eti1 para buscar la siguiente palabra

;relocate_que: relocalizacion del segundo LDDR para la ultima palabra, "QUE"
relocate_que: POP DE
LD BC, 0003H;
LDIR 
LD HL, 1000H;
LD E, 3; el 3 indica que se completo el proceso de relocalizacion
LD (HL),E;

not_found: HALT

delete:
