CPU "Z80.tbl"
HOF "INT8"
;PROGRAMA 1. RELOCALIZACION HACIA ARRIBA DE CADENAS EN UN BLOQUE DE MEMORIA
LD HL, 1000H; definimos la localidad donde se encontrara el tamaño de memoria a relocalizar
LD (HL), 12H; la localidad 1000H contiene el tamaño de memoria a relocalizar
INC HL; incrementamos H+=1 para establecer el inicio de la busqueda
LD E,0; bandera para saber si se relocalizo o no la frase

;eti1 para encontrar valores distintos de cero
eti1: LD A, (HL); cargamos en el acumulador el valor de HL
CP 0 ;comprobamos si el valor es cero
INC HL ;incrementamos el apuntador para compara la siguiente localidad de memoria
JP Z, eti1; si el valor leido anterior era cero, continuamos en eti1 hasta encontrar algo distinto
LD A, E;
CP 0;
JP Z, eti2;
CP 1;
JP Z, eti3;

;eti2 para identificar donde termina la primera palabra y relocalizar alli (final de "HOLA")
eti2: LD BC, 0004H; le damos el valor 3 al BC para que actue como sumando
ADD HL,BC; sumamos 4 (1+3) locaciones de memoria despues de haber encontrado el primer caracter (HL+=4)
PUSH HL; guardamos el valor donde se hará la sobreescritura para la siguiente palabra en la pila (aqui termina la palabra "HOLA")
INC E; primera palabra encontrada, C=1
JR eti1; regresa a eti1

;eti3 implementacion del primer LDDR para 5 caracteres contiguos (ADIOS)
eti3: LD BC,0003H
ADD HL,BC;
LD (200H),HL
POP HL
LD BC,0003H
ADD HL, BC;
LD D,H;
LD E,L;
LD HL, (200H)
LD BC, 0005H;
LDDR
LD E,2;
JR eti1

;eti4 del segundo LDDR
HALT
