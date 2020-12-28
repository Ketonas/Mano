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
	int resultSetChange;
/*
	2	pavadinimas	varchar(255)	utf8_general_ci	
	3	trumpinys	varchar(255)
*/
%>
<h2 align="center"><strong>Cheminiai elementai</strong></h2>
<table align="center" cellpadding="5" cellspacing="5" border="1">
<tr>

</tr>
<tr>
	<th>pavadinimas</th>
	<th>trumpinys</th>
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
		String sarisio_lent = request.getParameter("search");

		if ( sarisio_lent != null) {
		
			String	junginiai = request.getParameter("junginys");
		
		
		statement=connection.createStatement();		
		String sql = "SELECT `elementai`.`pavadinimas`,`elementai`.`trumpinys` FROM `elementai` LEFT JOIN `sarisio_lent` ON ( `elementai`.`id`=`sarisio_lent`.`id_elemento` ) LEFT JOIN `junginiai` ON ( `sarisio_lent`.`id_junginio`=`junginiai`.`id` ) WHERE `junginiai`.`pav_jung` LIKE ('Natr%')";

		resultSet = statement.executeQuery(sql);
		}
		while( resultSet.next() ){
%>
<tr style="background-color: #DEB887">
	<td><%= resultSet.getString ( "pavadinimas" ) %></td>
	<td><%= resultSet.getString ( "trumpinys" ) %></td>

</tr>

<% 
		}

	} catch (Exception e) {
	
		e.printStackTrace();
	}
%>
</table>
<form method="post" action="">
<table>
<tr>
<th>Iveskite teksta...</th>
<tr>

		<td>
			<input type="text" name="junginys" value="">
		</td>
		<td>
			<input type="submit" name="search" value="search">
		</td>
</tr>
</table>
</form>

</body>