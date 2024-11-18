import java.util.HashMap;

public class Z80Mnemonicos {
    public static final HashMap<Integer, String> mnemonics = new HashMap<>();
    public static final HashMap<Integer, Integer> parameterLength = new HashMap<>();

        static {
            // Instrucciones sin parámetros
            mnemonics.put(0x00, "NOP");
            mnemonics.put(0x02, "LD (BC),A");
            mnemonics.put(0x03, "INC BC");
            mnemonics.put(0x04, "INC B");
            mnemonics.put(0x05, "DEC B");
            mnemonics.put(0x07, "RLCA");
            mnemonics.put(0x08, "EX AF,AF'");
            mnemonics.put(0x09, "ADD HL,BC");
            mnemonics.put(0x0A, "LD A,(BC)");
            mnemonics.put(0x0B, "DEC BC");
            mnemonics.put(0x0C, "INC C");
            mnemonics.put(0x0D, "DEC C");
            mnemonics.put(0x0F, "RRCA");
            mnemonics.put(0x10, "DJNZ d");
            mnemonics.put(0x12, "LD (DE),A");
            mnemonics.put(0x13, "INC DE");
            mnemonics.put(0x14, "INC D");
            mnemonics.put(0x15, "DEC D");
            mnemonics.put(0x17, "RLA");
            mnemonics.put(0x18, "JR d");
            mnemonics.put(0x19, "ADD HL,DE");
            mnemonics.put(0x1A, "LD A,(DE)");
            mnemonics.put(0x1B, "DEC DE");
            mnemonics.put(0x1C, "INC E");
            mnemonics.put(0x1D, "DEC E");
            mnemonics.put(0x1F, "RRA");
    
            // Instrucciones con 1 byte de parámetro
            mnemonics.put(0x06, "LD B, %02X");
            parameterLength.put(0x06, 1);
            mnemonics.put(0x0E, "LD C, %02X");
            parameterLength.put(0x0E, 1);
            mnemonics.put(0x16, "LD D, %02X");
            parameterLength.put(0x16, 1);
            mnemonics.put(0x1E, "LD E, %02X");
            parameterLength.put(0x1E, 1);
            mnemonics.put(0x26, "LD H, %02X");
            parameterLength.put(0x26, 1);
            mnemonics.put(0x2E, "LD L, %02X");
            parameterLength.put(0x2E, 1);
            mnemonics.put(0x3E, "LD A, %02X");    
            parameterLength.put(0x3E, 1);
            
            //LD r,r'
            mnemonics.put(0x48, "LD C, B");
            parameterLength.put(0x48, 1);
            mnemonics.put(0x50, "LD D, B");
            parameterLength.put(0x50, 1);
            mnemonics.put(0x58, "LD E, B");
            parameterLength.put(0x58, 1);
            mnemonics.put(0x60, "LD H, B");
            parameterLength.put(0x60, 1);
            mnemonics.put(0x68, "LD L, B");
            parameterLength.put(0x68, 1);
            mnemonics.put(0x78, "LD A, B");
            parameterLength.put(0x78, 1);

            mnemonics.put(0x41, "LD B, C");
            parameterLength.put(0x41, 1);
            mnemonics.put(0x51, "LD D, C");
            parameterLength.put(0x51, 1);
            mnemonics.put(0x59, "LD E, C");
            parameterLength.put(0x59, 1);
            mnemonics.put(0x61, "LD H, C");
            parameterLength.put(0x61, 1);
            mnemonics.put(0x69, "LD L, C");
            parameterLength.put(0x69, 1);
            mnemonics.put(0x79, "LD A, C");
            parameterLength.put(0x79, 1);

            mnemonics.put(0x42, "LD B, D");
            parameterLength.put(0x42, 1);
            mnemonics.put(0x4A, "LD C, D");
            parameterLength.put(0x4A, 1);
            mnemonics.put(0x5A, "LD E, D");
            parameterLength.put(0x5A, 1);
            mnemonics.put(0x62, "LD H, D");
            parameterLength.put(0x62, 1);
            mnemonics.put(0x6A, "LD L, D");
            parameterLength.put(0x6A, 1);
            mnemonics.put(0x7A, "LD A, D");
            parameterLength.put(0x7A, 1);
            
            mnemonics.put(0x43, "LD B, E");
            parameterLength.put(0x43, 1);
            mnemonics.put(0x4B, "LD C, E");
            parameterLength.put(0x4B, 1);
            mnemonics.put(0x53, "LD D, E");
            parameterLength.put(0x53, 1);
            mnemonics.put(0x63, "LD H, E");
            parameterLength.put(0x63, 1);
            mnemonics.put(0x6B, "LD L, E");
            parameterLength.put(0x6B, 1);
            mnemonics.put(0x7B, "LD A, E");
            parameterLength.put(0x7B, 1);
            
            mnemonics.put(0x44, "LD B, H");
            parameterLength.put(0x44, 1);
            mnemonics.put(0x4C, "LD C, H");
            parameterLength.put(0x4C, 1);
            mnemonics.put(0x54, "LD D, H");
            parameterLength.put(0x54, 1);
            mnemonics.put(0x5C, "LD E, H");
            parameterLength.put(0x5C, 1);
            mnemonics.put(0x6C, "LD L, H");
            parameterLength.put(0x6C, 1);
            mnemonics.put(0x7C, "LD A, H");
            parameterLength.put(0x7C, 1);

            mnemonics.put(0x45, "LD B, L");
            parameterLength.put(0x45, 1);
            mnemonics.put(0x4D, "LD C, L");
            parameterLength.put(0x4D, 1);
            mnemonics.put(0x55, "LD D, L");
            parameterLength.put(0x55, 1);
            mnemonics.put(0x5D, "LD E, L");
            parameterLength.put(0x5D, 1);
            mnemonics.put(0x65, "LD H, L");
            parameterLength.put(0x65, 1);
            mnemonics.put(0x7D, "LD A, L");
            parameterLength.put(0x7D, 1);

            mnemonics.put(0x47, "LD B, A");
            parameterLength.put(0x47, 1);
            mnemonics.put(0x4F, "LD C, A");
            parameterLength.put(0x4F, 1);
            mnemonics.put(0x57, "LD D, A");
            parameterLength.put(0x57, 1);
            mnemonics.put(0x5F, "LD E, A");
            parameterLength.put(0x5F, 1);
            mnemonics.put(0x67, "LD H, A");
            parameterLength.put(0x67, 1);
            mnemonics.put(0x6F, "LD L, A");
            parameterLength.put(0x6F, 1);

            //LD r, (HL)
            mnemonics.put(0x46, "LD B, (HL)");
            parameterLength.put(0x46, 1);
            mnemonics.put(0x4E, "LD C, (HL)");
            parameterLength.put(0x4E, 1);
            mnemonics.put(0x56, "LD D, (HL)");
            parameterLength.put(0x56, 1);
            mnemonics.put(0x5E, "LD E, (HL)");
            parameterLength.put(0x5E, 1);
            mnemonics.put(0x66, "LD H, (HL)");
            parameterLength.put(0x66, 1);
            mnemonics.put(0x6E, "LD L, (HL)");
            parameterLength.put(0x6E, 1);
            mnemonics.put(0x7E, "LD A, (HL)");
            parameterLength.put(0x7E, 1);

            //LD r,(IX+d)
            mnemonics.put(0x46, "LD B, (IX+d)");
            parameterLength.put(0x46, 1);
            mnemonics.put(0x4E, "LD C, (IX+d)");
            parameterLength.put(0x4E, 1);
            mnemonics.put(0x56, "LD D, (IX+d)");
            parameterLength.put(0x56, 1);
            mnemonics.put(0x5E, "LD E, (IX+d)");
            parameterLength.put(0x5E, 1);
            mnemonics.put(0x66, "LD H, (IX+d)");
            parameterLength.put(0x66, 1);
            mnemonics.put(0x6E, "LD L, (IX+d)");
            parameterLength.put(0x6E, 1);
            mnemonics.put(0x7E, "LD A, (IX+d)");
            parameterLength.put(0x7E, 1);

            //LD r, (IY+d)
            mnemonics.put(0x46, "LD B, (IY+d)");
            parameterLength.put(0x46, 1);
            mnemonics.put(0x4E, "LD C, (IY+d)");
            parameterLength.put(0x4E, 1);
            mnemonics.put(0x56, "LD D, (IY+d)");
            parameterLength.put(0x56, 1);
            mnemonics.put(0x5E, "LD E, (IY+d)");
            parameterLength.put(0x5E, 1);
            mnemonics.put(0x66, "LD H, (IY+d)");
            parameterLength.put(0x66, 1);
            mnemonics.put(0x6E, "LD L, (IY+d)");
            parameterLength.put(0x6E, 1);
            mnemonics.put(0x7E, "LD A, (IY+d)");
            parameterLength.put(0x7E, 1);

            //LD (HL),r
            mnemonics.put(0x70, "LD (HL), B");
            parameterLength.put(0x70, 1);
            mnemonics.put(0x71, "LD (HL), C");
            parameterLength.put(0x71, 1);
            mnemonics.put(0x72, "LD (HL), D");
            parameterLength.put(0x72, 1);
            mnemonics.put(0x73, "LD (HL), E");
            parameterLength.put(0x73, 1);
            mnemonics.put(0x74, "LD (HL), H");
            parameterLength.put(0x74, 1);
            mnemonics.put(0x75, "LD (HL), L");
            parameterLength.put(0x75, 1);
            mnemonics.put(0x77, "LD (HL), A");
            parameterLength.put(0x77, 1);

            //LD (IX+d),r
            mnemonics.put(0x70, "LD (IX+d), B");
            parameterLength.put(0x70, 1);
            mnemonics.put(0x71, "LD (IX+d), C");
            parameterLength.put(0x71, 1);
            mnemonics.put(0x72, "LD (IX+d), D");
            parameterLength.put(0x72, 1);
            mnemonics.put(0x73, "LD (IX+d), E");
            parameterLength.put(0x73, 1);
            mnemonics.put(0x74, "LD (IX+d), H");
            parameterLength.put(0x74, 1);
            mnemonics.put(0x75, "LD (IX+d), L");
            parameterLength.put(0x75, 1);
            mnemonics.put(0x77, "LD (IX+d), A");
            parameterLength.put(0x77, 1);

            //LD (IY+d),r
            mnemonics.put(0x70, "LD (IY+d), B");
            parameterLength.put(0x70, 1);
            mnemonics.put(0x71, "LD (IY+d), C");
            parameterLength.put(0x71, 1);
            mnemonics.put(0x72, "LD (IY+d), D");
            parameterLength.put(0x72, 1);
            mnemonics.put(0x73, "LD (IY+d), E");
            parameterLength.put(0x73, 1);
            mnemonics.put(0x74, "LD (IY+d), H");
            parameterLength.put(0x74, 1);
            mnemonics.put(0x75, "LD (IY+d), L");
            parameterLength.put(0x75, 1);
            mnemonics.put(0x77, "LD (IY+d), A");
            parameterLength.put(0x77, 1);
            
            mnemonics.put(0x33, "LD (HL), %02X");
            parameterLength.put(0x33, 1);
            mnemonics.put(0xDD, "LD (IX+d), %02X");
            parameterLength.put(0xDD, 1);
            mnemonics.put(0xFD, "LD (IY+d), %02X");
            parameterLength.put(0xFD, 1);
            mnemonics.put(0x0A, "LD A, (BC)");
            parameterLength.put(0x0A, 1);
            mnemonics.put(0x1A, "LD A, (DE)");
            parameterLength.put(0x1A, 1);
            mnemonics.put(0x02, "LD (BC),A");
            parameterLength.put(0x02, 1);
            mnemonics.put(0x12, "LD (DE), A");
            parameterLength.put(0x12, 1);
            mnemonics.put(0xED, "LD A, I");
            parameterLength.put(0xED, 1);
            mnemonics.put(0xED, "LD A, R");
            parameterLength.put(0xED, 1);
            mnemonics.put(0xED, "LD I, A");
            parameterLength.put(0xED, 1);
            mnemonics.put(0xED, "LD R, A");
            parameterLength.put(0xED, 1);
            
            // Instrucciones con 2 bytes de parámetro
            //LD dd,nn
            mnemonics.put(0x01, "LD BC, %04X");
            parameterLength.put(0x01, 2);
            mnemonics.put(0x11, "LD DE, %04X");
            parameterLength.put(0x11, 2);
            mnemonics.put(0x21, "LD HL, %04X");
            parameterLength.put(0x21, 2);
            mnemonics.put(0x31, "LD SP, %04X");
            parameterLength.put(0x31, 2);

            mnemonics.put(0x32, "LD IY,%04X");
            parameterLength.put(0x32, 2);
            mnemonics.put(0x32, "LD IX,%04X");
            parameterLength.put(0x32, 2);
            mnemonics.put(0x32, "LD (nn),A");
            parameterLength.put(0x32, 2);
            mnemonics.put(0x3A, "LD A,(nn)");
            parameterLength.put(0x3A, 2);
            mnemonics.put(0xC3, "JP %04X");
            parameterLength.put(0xC3, 2);
            mnemonics.put(0xCD, "CALL %04X");
            parameterLength.put(0xCD, 2);

            
    
            // Instrucciones de salto condicional
            mnemonics.put(0x20, "JR NZ, %02X");
            parameterLength.put(0x20, 1);
            mnemonics.put(0x28, "JR Z, %02X");
            parameterLength.put(0x28, 1);
            mnemonics.put(0x30, "JR NC, %02X");
            parameterLength.put(0x30, 1);
            mnemonics.put(0x38, "JR C, %02X");
            parameterLength.put(0x38, 1);
    
            // Otros mnemónicos
            mnemonics.put(0xC9, "RET");
            mnemonics.put(0xAF, "XOR A");
            mnemonics.put(0x76, "HALT");


    }

    public static String getMnemonic(int opcode) {
        // Reemplazo de getOrDefault para versiones de Java anteriores a 8
        if (mnemonics.containsKey(opcode)) {
            return mnemonics.get(opcode);
        } else {
            return "UNKNOWN";
        }
    }

    public static int getParameterLength(int opcode) {
        // Reemplazo de getOrDefault para versiones de Java anteriores a 8
        if (parameterLength.containsKey(opcode)) {
            return parameterLength.get(opcode);
        } else {
            return 0;
        }
    }
}
