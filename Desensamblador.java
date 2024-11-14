import javax.swing.*;
import javax.swing.filechooser.FileNameExtensionFilter;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.io.*;

public class Desensamblador extends JFrame {
    public JTextArea textArea;
    public JButton uploadButton;

    public Desensamblador() {
        setTitle("HEX to Zilog Z80 Disassembler");
        setSize(600, 400);
        setDefaultCloseOperation(EXIT_ON_CLOSE);
        setLocationRelativeTo(null);

        textArea = new JTextArea();
        textArea.setEditable(false);
        JScrollPane scrollPane = new JScrollPane(textArea);

        uploadButton = new JButton("Upload .HEX File");
        uploadButton.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                openFileChooser();
            }
        });

        add(uploadButton, BorderLayout.NORTH);
        add(scrollPane, BorderLayout.CENTER);
    }

    public void openFileChooser() {
        JFileChooser fileChooser = new JFileChooser();
        fileChooser.setFileFilter(new FileNameExtensionFilter("HEX Files", "hex"));
        
        int result = fileChooser.showOpenDialog(this);
        if (result == JFileChooser.APPROVE_OPTION) {
            File file = fileChooser.getSelectedFile();
            try {
                String disassembledCode = disassembleHexFile(file);
                textArea.setText(disassembledCode);
            } catch (IOException ex) {
                JOptionPane.showMessageDialog(this, "Error reading file", "Error", JOptionPane.ERROR_MESSAGE);
            }
        }
    }

    public String disassembleHexFile(File file) throws IOException {
        StringBuilder disassembledCode = new StringBuilder();
        BufferedReader reader = new BufferedReader(new FileReader(file));
        String line;
        
        while ((line = reader.readLine()) != null) {
            if (line.startsWith(":")) {
                int length = Integer.parseInt(line.substring(1, 3), 16);
                int address = Integer.parseInt(line.substring(3, 7), 16);
                int recordType = Integer.parseInt(line.substring(7, 9), 16);

                if (recordType == 0x00) {
                    for (int i = 0; i < length; i++) {
                        int opcode = Integer.parseInt(line.substring(9 + i * 2, 11 + i * 2), 16);
                        String mnemonic = "";
                        int paramLength = Z80Mnemonicos.getParameterLength(opcode);

                        if (paramLength == 1) {  // Instrucciones de 1 byte
                            int param = Integer.parseInt(line.substring(11 + i * 2, 13 + i * 2), 16);
                            mnemonic = String.format(Z80Mnemonicos.getMnemonic(opcode), param);
                            i += 1;
                        } else if (paramLength == 2) {  // Instrucciones de 2 bytes
                            int param1 = Integer.parseInt(line.substring(11 + i * 2, 13 + i * 2), 16);
                            int param2 = Integer.parseInt(line.substring(13 + i * 2, 15 + i * 2), 16);
                            int addressParam = (param2 << 8) | param1;
                            mnemonic = String.format(Z80Mnemonicos.getMnemonic(opcode), addressParam);
                            i += 2;
                        } else {  // Instrucciones sin parámetros
                            mnemonic = Z80Mnemonicos.getMnemonic(opcode);
                        }

                        disassembledCode.append(String.format("%04X: %02X %s%n", address + i, opcode, mnemonic));
                    }
                }
            }
        }
        reader.close();
        return disassembledCode.toString();
    }

    public static void main(String[] args) {
        SwingUtilities.invokeLater(new Runnable() {
            @Override
            public void run() {
                new Desensamblador().setVisible(true);
            }
        });
    }
}