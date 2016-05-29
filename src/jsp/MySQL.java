package jsp;
import java.sql.*;

public class MySQL {
	
	public static Connection connect(){
		try {
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			return DriverManager.getConnection(
					"jdbc:mysql://eu-cdbr-azure-west-d.cloudapp.net/kainos-data",
					"b372480c35e192",
					"14112d4e"
					);
			
		}catch(Exception e){
			return null;
			//throw new Error(e);
		}
	}

	public static boolean close(Connection c) {
		try {
			c.close();
			return true;
		}catch(Exception e){
			return false;
		}
		
	}

}
