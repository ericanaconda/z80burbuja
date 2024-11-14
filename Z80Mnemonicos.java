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
            mnemonics.put(0x3E, "LD A, %02X");
            parameterLength.put(0x3E, 1);
    
            // Instrucciones con 2 bytes de parámetro
            mnemonics.put(0x01, "LD BC, %04X");
            parameterLength.put(0x01, 2);
            mnemonics.put(0x11, "LD DE, %04X");
            parameterLength.put(0x11, 2);
            mnemonics.put(0x21, "LD HL, %04X");
            parameterLength.put(0x21, 2);
            mnemonics.put(0x31, "LD SP, %04X");
            parameterLength.put(0x31, 2);
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