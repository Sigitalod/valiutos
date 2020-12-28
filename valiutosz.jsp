<!DOCTYPE html>
<%@page pageEncoding="UTF-8" language="java"%>
<%@page contentType="text/html;charset=UTF-8"%>
<html>
	<head>
		<meta charset="utf-8">
		<style>
			th, td {
				background-color: #97f7cc;
			}
		</style>
	</head>
<body>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>





<%
// String id = request.getParameter("userId");
	String driverName = "com.mysql.jdbc.Driver";
	String connectionUrl = "jdbc:mysql://localhost:3306/";
	String dbName = "valiutos";
	String userId = "root";
	String password = "";

	Connection connection = null;
	Statement statement = null;
	ResultSet resultSet = null;

%>
<h2 align="center"><strong>Retrieve data from database in jsp</strong></h2>
<table align="center" cellpadding="5" cellspacing="5" border="1">
<tr>

</tr>
<tr>
	<th colspan="2">valstybės</th>
	<th rowspan="2">val.kodas</th>

</tr>
<tr>
	<th>pav.</th>
	<th>kodas</th>

</tr>
	
	
	
<%

	try{
	     
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		response.setCharacterEncoding("UTF-8");		
		
	} catch(Exception e) {}
	
	String sql="";
	
	try{ 
	
		String jdbcutf8 = ""; //  "&useUnicode=true&characterEncoding=UTF-8";	
		connection = DriverManager.getConnection ( connectionUrl + dbName + jdbcutf8, userId, password );
		statement=connection.createStatement();		
		 sql =
				"SELECT `valst`.`valstybes_pav`,`valst`.`valstybes_kodas`,`valiutos`.`valiutos_pav` "
				+"FROM `valstybes` "
				+"LEFT JOIN `valiutos` ON ( `valstybes`.`valst_valiutos_kodas`=`valiutos`.`valiuto_kodas` ) "
				+"LEFT JOIN `valstybes` AS `valst` ON ( `valiutos`.`valiuto_kodas`=`valst`.`valst_valiutos_kodas` ) ";
			
		resultSet = statement.executeQuery(sql);
		
		
		while( resultSet.next() ){
%>
<tr style="background-color: #DEB887">
	<td><%= resultSet.getString ( "valstybes_pav" ) %></td>
	<td><%= resultSet.getString ( "valstybes_kodas" ) %></td>
	<td><%= resultSet.getString  ("valiutos_pav" ) %></td>
</tr>

<% 
		}

	} catch (Exception e) {
	
		e.printStackTrace();
	}
%>
</table>
<%= sql %>


</body>