<!DOCTYPE html>
<%@page pageEncoding="UTF-8" language="java"%>
<%@page contentType="text/html;charset=UTF-8"%>
<html>
	<head>
		<meta charset="utf-8">
		<style>
			th {
				background-color: #A52A2A
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
	String dbName = "chemija";
	String userId = "root";
	String password = "";
/*
try {
Class.forName(driverName);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
*/
	Connection connection = null;
	Statement statement = null;
	ResultSet resultSet = null;
/*
	2	id	int(256)	utf8_lithuanian_ci
	3	gyv_sk	bigint(20)
	4	plotas	decimal(12,2)
	5	platuma	decimal(10,7)
	6	ilguma	decimal(10,7)	
	7	valstybe	char(3)	utf8_lithuanian_ci		
*/
%>
<h2 align="center"><strong>Cheminiai elementai</strong></h2>
<table align="center" cellpadding="5" cellspacing="5" border="1">
<tr>

</tr>
<tr>
	<th>id</th>
	<th>pavadinimas</th>
	<th>trumpinys</th>
	<th>busena</th>
	<th>a_numeris</th>
</tr>
<%

	try{
	     
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		response.setCharacterEncoding("UTF-8");		
		
	} catch(Exception e) {}

	try{ 
	
		String jdbcutf8 = ""; //  "&useUnicode=true&characterEncoding=UTF-8";	
		connection = DriverManager.getConnection ( connectionUrl + dbName + jdbcutf8, userId, password );
		
		statement=connection.createStatement();		
		String sql ="SELECT * FROM `elementai`  WHERE 1";

		resultSet = statement.executeQuery(sql);
		 
		while( resultSet.next() ){
		%>
			<tr style="background-color: #DEB887">
				<td><%= resultSet.getString ( "id" ) %></td>
				<td><%= resultSet.getString ( "pavadinimas" ) %></td>
				<td><%= resultSet.getString  ("trumpinys" ) %></td>
				<td><%= resultSet.getString ( "busena" ) %></td>
				<td><%= resultSet.getString ( "a_numeris" ) %></td>
			</tr>

		<% 
		}

	} catch (Exception e) {
	
		e.printStackTrace();
	}
%>

</table>

/* ---------------------------------------------------------------------------------------------- */

%>
<table align="center" cellpadding="5" cellspacing="5" border="1">
<tr>
	<th>id</th>
	<th>form</th>
	<th>pav_jung</th>
</tr>
<%

	try{
	     
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		response.setCharacterEncoding("UTF-8");		
		
	} catch(Exception e) {}

	try{ 
	
		String jdbcutf8 = ""; //  "&useUnicode=true&characterEncoding=UTF-8";	
		connection = DriverManager.getConnection ( connectionUrl + dbName + jdbcutf8, userId, password );
		
		statement=connection.createStatement();		
		String sql ="SELECT * FROM `junginiai`  WHERE 1";

		resultSet = statement.executeQuery(sql);
		 
		while( resultSet.next() ){
		%>
			<tr style="background-color: #DEB887">
				<td><%= resultSet.getString ( "id" ) %></td>
				<td><%= resultSet.getString ( "form" ) %></td>
				<td><%= resultSet.getString  ("pav_jung" ) %></td>

			</tr>

		<% 
		}

	} catch (Exception e) {
	
		e.printStackTrace();
	}
%>
</table>

</body>