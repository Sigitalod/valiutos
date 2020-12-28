import java.sql.*;

public class DbViewValiutos {
																																										// JDBC driver name and database URL
	static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";  
	static final String DB_URL = "jdbc:mysql://localhost/valiutos";

																																										//  Database credentials
	static final String USER = "root";
	static final String PASS = "";

	public static void main(String[] args) {

		Connection conn = null;
		Statement stmt = null;
		
		try{

																																										//STEP 2: Register JDBC driver
			// Class.forName( "com.mysql.jdbc.Driver" );																				 // .newInstance();

																																										//STEP 3: Open a connection
			System.out.println( "Connecting to database..." );
			conn = DriverManager.getConnection(DB_URL, USER, PASS);

																																										//STEP 4: Execute a query
			System.out.println( "Creating statement..." );
			stmt = conn.createStatement();
			String sql;
			sql = 
				"SELECT"
					+ "`valst_valiutos_kodas`"
					+ ", `valiutos`.`valiutos_pav`"
					+ GROUP_CONCAT ", `valstybes_pav` = salys`"
					+ COUNT ",`valstybes`.`id`= `kiekis_saliu`"
					
				+ "FROM" 
					+ "`valstybes`"
				+''LEFT JOIN'' `valiutos` ON (`valiutos`.`valiuto_kodas`=`valstybes`.`valst_valiutos_kodas`)
					
					;
			ResultSet rs = stmt.executeQuery(sql);
			
			System.out.println ( "--------------------------------------------------------------------------------------------------------" );
			System.out.println ( "| valst_valiutos_kodas |    valiutos_pav         |   salys      |  kiekis_saliu    |   kursas su euru |" );
			System.out.println ( "---------------------------------------------------------------------------------------------------------" );

																																										//STEP 5: Extract data from result set
			while ( rs.next() ) {
				
																																										//Retrieve by column name
				String valst_valiutos_kodas  = rs.getString("valst_valiutos_kodas");
				String valiutos_pav = rs.getString ( "valiutos_pav" );
				String salys = rs.getString ( "salys" );
				int kiekis_saliu = rs.getInteger ( "kiekis_saliu" );
				double kursas = rs.getDouble ( "kursas_euro_atzvilgiu" );
			
																																									//Display values
				System.out.println ( 

					String.format (

						"| %3s | %14s | %12s |  %3d | %8.5f |"
						, vals_valiutos_kodas
						, valiutos_pav
						, salys
						, kiekis_saliu
						, kursas
					) 
				);
				System.out.println ( "--------------------------------------------------------------" );
			}
																																										//STEP 6: Clean-up environment
			rs.close();
			stmt.close();
			conn.close();

		} catch ( SQLException se ) {
																																										//Handle errors for JDBC
			se.printStackTrace();
		} catch ( Exception e ) {
																																										//Handle errors for Class.forName
			e.printStackTrace();

		} finally {
																																										//finally block used to close resources
			try{
					if (stmt != null) {

						stmt.close();
					}

			}catch ( SQLException se2 ){

			}																																							// nothing we can do
			
			try{

				if ( conn!=null ) {

					conn.close();
				}

			} catch ( SQLException se ) {

				se.printStackTrace();
			}																																							//end finally try
		}																																								//end try
		System.out.println( "Goodbye!" );
	}																																								//end main
}																																									//end FirstExample