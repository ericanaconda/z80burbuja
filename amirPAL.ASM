CPU "Z80.tbl"
HOF "INT8"

    LD HL, 10C0H   ; Puntero al inicio de la palabra
    LD DE, 10CCH   ; Puntero al final de la palabra

    ; Inicialización de registros
    LD C, 0        ; C contendrá un flag para indicar si la palabra es un palíndromo

CheckPalindrome:
    ; Cargar los caracteres apuntados por HL y DE
    LD A, (HL)
    LD B, A
    LD A, (DE)

    ; Comparar los caracteres
    CP B
    JR NZ, NotPalindrome

    ; Mover los punteros
    INC HL
    DEC DE

    ; Comprobar si los punteros se han cruzado
    LD A, H
    CP D
    JR NC, PalindromeFound

    ; Si los punteros no se han cruzado, continuar verificando
    JR CheckPalindrome
    HALT

PalindromeFound:
    ; La palabra es un palíndromo
    INC C    ; Establecer el flag en 1
    HALT      ; Finalizar el programa

NotPalindrome:
    ; La palabra no es un palíndromo
    LD C, 0    ; Establecer el flag en 0
    HALT      ; Finalizar el programa