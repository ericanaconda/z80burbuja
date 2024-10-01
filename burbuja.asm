CPU "z80.tbl"
HOF "INT8"

LD A,(1000H)
CP 2
JP M,eti4
LD C,A
eti5: DEC C
LD D,C
LD B,0
LD IX,1001H
LD E,0
eti3: LD A, (IX+0)
CP (IX+1)
JP P,eti2
eti1: INC B
INC IX
DEC D
LD A,D
CP 0
JP NZ,eti3
LD A,E
CP 0
JP Z,eti4
LD A,C
CP 1
JP NZ,eti5
eti4: HALT
eti2: LD H, (IX+1)
LD (IX+0),H
LD (IX+1),A
LD E,1
JR eti1
