            CPU "Z80.tbl"
            HOF "INT8"

            LD HL, 130BH   ; HL apunta al inicio de la memoria a verificar
            LD BC, 05H     ; BC es la longitud total de la memoria a verificar

Verificar: LD A, (HL)     ; Carga en A el contenido de la memoria apuntada por HL
            OR A           ; Comprueba si A es cero
            JP NZ, Noempty ; Si A no es cero, salta a NOT_EMPTY
            INC HL         ; Incrementa HL para apuntar al siguiente byte
            DEC BC         ; Decrementa el contador de bytes
            LD A, B        ; Carga el byte más significativo del contador en A
            OR C           ; OR con el byte menos significativo para comprobar si BC es 0
            JP NZ, Verificar ; Si BC no es cero, continúa el bucle

            LD HL, 1310H   ; HL apunta al inicio de "HOLA COMO ESTAS"
            LD DE, 130BH   ; DE apunta a la nueva dirección de "HOLA COMO"
            LD BC, 09H     ; BC es la cantidad de bytes a mover (8 letras + 1 espacio)

Desplazar:  LD A, (HL)     ; Carga en A el contenido de la memoria apuntada por HL
            LD (DE), A     ; Pasar contenido de A en la memoria apuntada por DE
            INC HL         ; Incrementa HL
            INC DE         ; Incrementa DE
            DEC BC         ; Decrementa BC
            LD A, B        ; Carga en A el byte más significativo de BC para verificar
            OR C           ; Realiza OR con el byte menos significativo para verificar si BC es cero
            JP NZ, Desplazar ; Si BC no es cero, sigue desplazando

            LD HL, 130BH   ; HL apunta nuevamente a "HOLA" al inicio de la cadena
            LD DE, 1315H   ; DE apunta a la localización después de "HOLA COMO " 
            LD BC, 04H     ; BC es la longitud de "HOLA"
            LDIR           ; Copia "HOLA" a 130AH

            HALT           ; Detiene la ejecución

Noempty:  HALT       ; detiene la ejecución
