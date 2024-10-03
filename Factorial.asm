CPU "Z80.tbl"
HOF "INT8"

; El resultado se guarda en la direccion 1001H

      LD A,(1000H) ; Lee el numero
      CP 0
      JP z,CasoParticular  ; Verifica si es 0
      CP 1
      JP z,CasoParticular  ; Verifica si es 1
      LD D,A
      LD E,1
      LD B,A
eti5: LD C,E
      LD A,0
eti3: DEC C
      JP M,eti2
      ADD A,B
      JR eti3
eti2: INC E                ; 
      LD B,A
      LD A,E
      CP D
      JP z,Fin
      JR eti5
Fin: LD A,B
      LD (1001H),A
      HALT
CasoParticular: LD B,1
      JR Fin