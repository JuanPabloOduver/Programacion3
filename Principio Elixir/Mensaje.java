import javax.swing.JOptionPane;
/**
Modulo para mostrar un mensaje en pantalla
- autor: Juan Pablo Oduver Garcia.
- fecha: 19/08/2025
- licencia: GNU GPL v3
**/
public class Mensaje {
    public static void main(String[] args) {
        if (args.length > 0 && args[0].equals("input")) {
            String mensaje = args.length > 1 ? args[1] : "Ingrese un valor:";
            String input = JOptionPane.showInputDialog(null, mensaje);
            System.out.println(input);
            JOptionPane.showMessageDialog(null, input, mensaje, 0);
        } else if (args.length > 0) {
            JOptionPane.showMessageDialog(null, args[0]);
        }    else {
            JOptionPane.showMessageDialog(null, "No se proporcionó ningún mensaje");
        }
    }
}
