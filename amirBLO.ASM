CPU "Z80.tbl"
HOF "INT8"

            LD HL, 1000H   ; HL apunta al inicio de la memoria a verificar
            LD BC, 0CH     ; BC es la longitud total de la memoria a verificar

Verificar:  LD A, (HL)     ; Carga en A el contenido de la memoria apuntada por HL
            OR A           ; Comprueba si A es cero
            JP Z, Noempty ; Si A no es cero, salta a NOT_EMPTY
            INC HL         ; Incrementa HL para apuntar al siguiente byte
            DEC BC         ; Decrementa el contador de bytes
            LD A, B        ; Carga el byte más significativo del contador en A
            OR C           ; OR con el byte menos significativo para comprobar si BC es 0
            JP NZ, Verificar ; Si BC no es cero, continúa el bucle

            LD HL, 1000H   ; HL apunta al inicio de "hola como estas"
            LD DE, 10A0H   ; DE apunta a la nueva dirección de "Hola como"
            LD BC, 0CH     ; BC es la cantidad de bytes a mover (8 letras + 1 espacio)

Desplazar:  LD A, (HL)     ; Carga en A el contenido de la memoria apuntada por HL
            LD (DE), A     ; Pasar contenido de A en la memoria apuntada por DE
            INC HL         ; Incrementa HL
            INC DE         ; Incrementa DE
            DEC BC         ; Decrementa BC
            LD A, B        ; Carga en A el byte más significativo de BC para verificar
            OR C           ; Realiza OR con el byte menos significativo para verificar si BC es cero
            JP NZ, Desplazar ; Si BC no es cero, sigue desplazando
            JP Borrar

Borrar:     LD HL, 1000H   ; HL apunta al inicio de la cadena "HOLA COMO ESTAS"
            LD DE, 100CH   ; DE apunta al final de la cadena "HOLA COMO "
            LD BC, 0CH     ; BC es la longitud total de la parte a borrar

LlenarCeros:    
            LD (HL), 00H   ; Llena la dirección apuntada por HL con cero
            INC HL         ; Incrementa HL para apuntar al siguiente byte
            DEC BC         ; Decrementa BC para controlar el bucle
            LD A, B        ; Carga en A el byte más significativo de BC para verificar
            OR C           ; Realiza OR con el byte menos significativo para verificar si BC es cero
            JP NZ, LlenarCeros ; Si BC no es cero, sigue llenando con ceros
           
            HALT           ; Detiene la ejecución

Noempty:  HALT       ; detiene la ejecución