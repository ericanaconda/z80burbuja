; Sanchez Mayen Tristan Qesen
; Ramirez Valdovinos Eric
CPU "Z80.tbl"
HOF "INT8"

;Al final B y C funcionan como banderas:
      ;B=1 si se encontró la palabra, B=0 si no se encontro
      ;C=1 si la palabra es palindromo, C=0 si no lo es
;1000h el tamaño del primer bloque de codigo
;1001h el tamaño del segundo bloque de codigo
;1002h donde empieza el primer bloque de codigo
;1010h donde empieza el segundo bloque de codigo
;B el tamaño del primer bloque
;C el tamaño del segundo bloque

      LD A, (1000h)
      LD B, A
      LD A, (1001h)
      LD C, A
;IX El apuntador al principio del primer bloque
;IY El apuntador al principio del segundo bloque
      LD IX, 1002h
      LD IY, 1010h

EncontrarLetra: LD A, C
      CP 0
      JP Z, fin
      DEC C
      LD A, (IX+0)
      LD H, A
      LD A, (IY+0)
      CP H
      JP Z, encontrada
      INC IY
      JP EncontrarLetra
encontrada: PUSH IY
VerificarPalabra: DEC B
      LD A, 0
      CP B
      JP Z, Palindromo
      INC IY
      INC IX
      LD A, (IX+0)
      LD H, A
      LD A, (IY+0)
      CP H
      JP Z, VerificarPalabra
      JP falso

falso: POP IY
      INC IY
      LD IX, 1002h
      LD A, (1000h)
      LD B, A
      JP EncontrarLetra

Palindromo: 
      LD HL, 1002H      ; HL guardara la dirección final de la palabra
      LD A, (1000H)
      DEC A
Incrementar:            ; Proceso para que HL apunte al final de la palabra
      INC HL
      DEC A
      JP NZ, Incrementar
      
      LD DE, 1002H      ; DE guardara la dirección inicial de la palabra
; Inicialización de registros
      LD C, 0        ; 

SeguirVerificando:
; Cargar los caracteres apuntados por HL y DE y compararlos
      LD A, (DE)
      LD B, A
      LD A, (HL)
      CP B
      JR NZ, NoPalindromo

; Mover los punteros
      INC DE
      DEC HL

    ; Comprobar si los punteros se han cruzado
      LD A, L
      CP E
      JP M, SiPalindromo

    ; Si los punteros no se han cruzado, continuar verificando
      JR SeguirVerificando

; Si la palabra es un palíndromo
SiPalindromo:
      INC C    ; Establecer el flag en 1
      LD B, 1
      LD A,B 
      LD (1000H), A
      LD A,C
      LD (1001H), A
      HALT      ; Finalizar el programa

; Si la palabra no es un palíndromo
NoPalindromo:
      LD C, 0    ; Establecer el flag en 0
      LD B, 1
      LD A,B 
      LD (1000H), A
      LD A,C
      LD (1001H), A
      HALT      ; Finalizar el programa

;Si no se encuentra la palabra
fin: LD B, 0
      HALT
