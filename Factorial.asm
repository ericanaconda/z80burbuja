; Sanchez Mayen Tristan Qesen
; Ramirez Valdovinos Eric
CPU "Z80.tbl"
HOF "INT8"

; El resultado se guarda en la direccion 1001H

      LD A,(1000H) ; Lee el numero
      CP 0
      JP z,CasoParticular  ; Verifica si es 0
      CP 1
      JP z,CasoParticular  ; Verifica si es 1
; Asignamos valores iniciales a los registros
      LD D,A
      LD E,1
      LD B,A
eti5: LD C,E
      LD A,0
eti3: DEC C
      JP M,eti2
      ADD A,B              ; Realiza la multiplicación
      JR eti3
eti2: INC E                ; Verifica que se hayan multiplicado todos los numeros anteriores
      LD B,A               ; Salvamos lo acumulado en las multiplicaciones en B
      LD A,E
      CP D
      JP z,Fin             ; Si E=D se termino el proceso
      JR eti5
Fin: LD A,B                ; B tiene el factorial del numero
      LD (1001H),A
      HALT
CasoParticular: LD B,1     ; Si el numero es 0 o 1, el factorial es 1
      JR Fin
