CPU "Z80.tbl"
HOF "INT8"
 ;Inicializamos en la localidad 1016 de memoria
;Cuevas Quintana Amir
;De la Rosa Flores Fernando Grupo 04 EyPC

   LD   A, (400H)               ; Factorial del número en 1000H  
   LD   B, A                     ; Guardamos el número en B para poder usar el acumulador
   LD   HL, 1                    ; Inicializamos el acumulador de 16 Bits en 1

FACT:
   LD   A, B                     ; Pasamos B = A, para poder comparar
   CP   1                        ; Si B = 0, el factorial es 1, y finalizamos
   JR   Z, RESULT                ; Finalizamos en caso de B sea igual a 0
   DEC  B                        ; Decrementamos B para hacer la recursion del Factorial
   
   LD   D, H                     ; Guardamos el acumulador en DE
   LD   E, L 
   CALL MULT                     ; Multiplicamos HL por DE 
   JR   FACT                     ; Volvemos a llamar a la función

MULT:
   LD   C, B                     ; Guardamos el multiplicador en C
   LD   A, C                     ; Movemos el multiplicador a A para comparar con 0
   CP   0                        ; Comprobamos si el multiplicador es 0
   
MULT2:
   ADD  HL, DE                   ; Sumamos DE a HL
   SUB  1                        ; Restamos 1 a C
   JR   NZ, MULT2                ; Si C no es 0, volvemos al bucle
   RET        

RESULT:
   LD   A, H                     ; Primero guardamos el byte menos significativo
   LD   (0402H), A
   LD   A, L                     ; Luego guardamos el byte más significativo
   LD   (0403H), A
   HALT
