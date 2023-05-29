/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package eva_3_7_javadbconnector;

import java.util.logging.Level;
import java.util.logging.Logger;
//IMPORTS PARA LA CONEXIÓN
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
//IMPORTS PARA EJECUTAR INSTRUCCIONES
import java.sql.Statement;
import java.sql.ResultSet;
import java.sql.PreparedStatement;
//Llamada a funcion
import java.sql.CallableStatement;
import java.sql.Types;
import java.time.LocalDate;
/**
 *
 * @author Israel
 */
public class EVA_3_7_JavaDBConnector {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Connection connection;
        try {
            // TODO code application logic here
            //CARGAMOS TODA LA LIBRERÍA DEL JDBC
            Class.forName("com.mysql.cj.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/eva_3";
            connection = DriverManager.getConnection(url, "root", "patin12");
            
            //CONSULTA:SQL
            //Statement statement = connection.createStatement();
            //OBTENER UN RESULTSET (UN LISTADO DE FILAS)
            //ResultSet resultset;
            //resultset = statement.executeQuery(
            //"select * from actor limit 50;");
            
            //? son comidines, se numeran en la secuencia que aparecen en el query. A travez de statement.setType
            //(posicion, valor) se cambia el comodin en la posisicion indicada, por el valor
            String query = "select * from actor where actor_id = ?;";
            PreparedStatement pStatement = connection.prepareStatement(query);
            pStatement.setInt(1,209);
            ResultSet resultset;
            resultset = pStatement.executeQuery();
            
            int actor_id;
            String f_name;
            String l_name;
            while(resultset.next()){//true mientras haya datos
                actor_id = resultset.getInt("actor_id");
                f_name = resultset.getString("first_name");
                l_name = resultset.getString("last_name");
                System.out.println("ID: " + actor_id + "\n" +
                                   "First_name: " + f_name + "\n" + 
                                   "Last Name: " + l_name);
            }
            resultset.close();
            
            //EJECUTAR UN INSERT
            String qInsert = "insert into actor(first_name, last_name)" + "values(?,?);";
            PreparedStatement pSInsert = connection.prepareStatement(qInsert);
            pSInsert.setString(1,"Juan");
            pSInsert.setString(2,"Smith");
            pSInsert.execute();
            
            //LLAMAR A FUNCION O PROCEDIMIENTO
            CallableStatement callStat = connection.prepareCall("{?= call generar_rfc(?,?,?,?);}");
            //Parametros de salida
            callStat.registerOutParameter(1, Types.VARCHAR);
            //Parametros de entrada
            callStat.setString(2, "Juan");
            callStat.setString(3,"Perez");
            callStat.setString(4,"Jolote");
            callStat.setObject(5, LocalDate.of(2004, 11, 20));
            callStat.execute();
            System.out.print("RFC" + callStat.getString(1));
            
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
            Logger.getLogger(EVA_3_7_JavaDBConnector.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(EVA_3_7_JavaDBConnector.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println("SQLException: " + ex.getMessage());
             System.out.println("SQLState: " + ex.getSQLState());
              System.out.println("SQLError: " + ex.getErrorCode());
        }
       
    
}
}