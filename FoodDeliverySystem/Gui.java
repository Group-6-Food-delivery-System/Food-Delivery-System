package foodDeliverySystem;

import java.awt.BorderLayout;
import java.awt.EventQueue;

import javax.swing.JFrame;
import javax.swing.JPanel;
import javax.swing.border.EmptyBorder;
import javax.swing.JLabel;
import javax.swing.JTextArea;
import javax.swing.JTable;
import javax.swing.JButton;
import java.awt.event.ActionListener;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.awt.event.ActionEvent;
import javax.swing.table.DefaultTableModel;
import javax.swing.JScrollPane;
import net.proteanit.sql.DbUtils;

public class Gui extends JFrame {
	
	static Connection connection = null;
	static String databaseName = "food_delivery_system";
	static String url = "jdbc:mysql://127.0.0.1:3306/?user=root" + databaseName;
	static String username = "root";
	static String password = "AmmiAbbu6353123!";
	

	private JPanel contentPane;
	private JTable table;
	private JButton btnNewButton;
	private JButton btnNewButton_1;
	private JScrollPane scrollPane;

	/**
	 * Launch the application.
	 */
	public static void main(String[] args) {
		EventQueue.invokeLater(new Runnable() {
			public void run() {
				try {
					Gui frame = new Gui();
					frame.setVisible(true);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		});
	}

	/**
	 * Create the frame.
	 */
	public Gui() {
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		setBounds(100, 100, 450, 300);
		contentPane = new JPanel();
		contentPane.setBorder(new EmptyBorder(5, 5, 5, 5));
		setContentPane(contentPane);
		contentPane.setLayout(null);
		
		JLabel lblNewLabel = new JLabel("Driver ID");
		lblNewLabel.setBounds(26, 36, 46, 14);
		contentPane.add(lblNewLabel);
		
		JTextArea textArea = new JTextArea();
		textArea.setBounds(20, 61, 72, 22);
		contentPane.add(textArea);
		
		scrollPane = new JScrollPane();
		scrollPane.setBounds(213, 66, 189, 157);
		contentPane.add(scrollPane);
		
		table = new JTable();
		scrollPane.setViewportView(table);
		table.setModel(new DefaultTableModel(
			new Object[][] {
				{null, null, null, null},
			},
			new String[] {
				"Heading1", "New column", "New column", "New column"
			}
		));
		
		btnNewButton = new JButton("Show Orders");
		btnNewButton.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) 
			{
				try 
				{
					Class.forName("com.mysql.jdbc.Driver").getDeclaredConstructor().newInstance();
					connection = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/food_delivery_system?user=root&password=AmmiAbbu6353123!");
					
					String query  = "SELECT * FROM driver WHERE DriverNumberID = '" + textArea.getText() + "'"    ; 
					
					PreparedStatement pst = connection.prepareStatement(query);
					
					ResultSet rs = pst.executeQuery();
					
					table.setModel(DbUtils.resultSetToTableModel(rs));
					
				} catch(Exception e1) {
					System.out.println(e1);
				}
				
			}
		});
		
		
		btnNewButton.setBounds(20, 107, 112, 23);
		contentPane.add(btnNewButton);
		
		btnNewButton_1 = new JButton("Close");
		btnNewButton_1.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				System.exit(0);
			}
		});
		btnNewButton_1.setBounds(26, 152, 89, 23);
		contentPane.add(btnNewButton_1);
	}
}
