import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class PemasukanForm extends JFrame {
    private JTextField fieldNominal;
    private JTextField fieldUsername;
    private JButton jButton1;

    public PemasukanForm() {
        fieldUsername = new JTextField(20);
        fieldNominal = new JTextField(20);
        jButton1 = new JButton("Selesai");

        add(new JLabel("Username:"));
        add(fieldUsername);
        add(new JLabel("Nominal:"));
        add(fieldNominal);
        add(jButton1);

        jButton1.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                jButton1ActionPerformed(e);
            }
        });

        setLayout(new FlowLayout());
        setSize(640, 480);
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
    }

    private void jButton1ActionPerformed(ActionEvent e) {
        String username = fieldUsername.getText();
        String nominalStr = fieldNominal.getText();

        try {
            int nominal = Integer.parseInt(nominalStr);

            try (Connection connection = DatabaseConnection.getConnection()) {
                String checkSql = "SELECT COUNT(*) FROM pemasukan WHERE username = ?";
                try (PreparedStatement checkStatement = connection.prepareStatement(checkSql)) {
                    checkStatement.setString(1, username);
                    try (ResultSet resultSet = checkStatement.executeQuery()) {
                        if (resultSet.next() && resultSet.getInt(1) > 0) {
                            String updateSql = "UPDATE pemasukan SET nominal = ? WHERE username = ?";
                            try (PreparedStatement updateStatement = connection.prepareStatement(updateSql)) {
                                updateStatement.setInt(1, nominal);
                                updateStatement.setString(2, username);
                                updateStatement.executeUpdate();
                                JOptionPane.showMessageDialog(this, "Data berhasil diperbarui!");
                            }
                        } else {
                            String insertSql = "INSERT INTO pemasukan (username, nominal) VALUES (?, ?)";
                            try (PreparedStatement insertStatement = connection.prepareStatement(insertSql)) {
                                insertStatement.setString(1, username);
                                insertStatement.setInt(2, nominal);
                                insertStatement.executeUpdate();
                                JOptionPane.showMessageDialog(this, "Data berhasil dimasukkan!");
                            }
                        }
                    }
                }
            } catch (SQLException ex) {
                ex.printStackTrace();
                JOptionPane.showMessageDialog(this, "Gagal memasukkan atau memperbarui data: " + ex.getMessage());
            }
        } catch (NumberFormatException ex) {
            JOptionPane.showMessageDialog(this, "Nominal harus berupa angka!");
        }
    }

    public static void main(String[] args) {
        SwingUtilities.invokeLater(new Runnable() {
            @Override
            public void run() {
                new PemasukanForm().setVisible(true);
            }
        });
    }
}

class DatabaseConnection {
    private static final String URL = "jdbc:mysql://localhost:3306/pemasukkan";
    private static final String USER = "root";
    private static final String PASSWORD = "";

    public static Connection getConnection() throws SQLException {
        return DriverManager.getConnection(URL, USER, PASSWORD);
    }
