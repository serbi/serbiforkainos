<%@ page language = "java"
    contentType = "text/html; charset = ISO-8859-1"
    import = "jsp.*"
    import = "java.sql.*"
%>
<html>
<head>
	<title>forkainos /serbi</title>
	<link rel="stylesheet" href="http://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">	
	<link type="text/css" href="/styles.css" rel="stylesheet">
</head>
<body>
	<div id="layout">
		<div id="banner">
			<h4>//forkainos.azurewebsites.net/</h4>
			<p class="bannerClear"></p>
		</div>
		
		<div id="content">
<!-- 		<div id="chart"></div> --> <!-- Chart's place -->
			<%
			Connection c = MySQL.connect();
			String query = "SELECT * FROM kurs";
			Statement st = c.createStatement();
			ResultSet rs = st.executeQuery(query);
			%>

			<div id="baseDateControl">
<!-- 			<input type="button" value="Capacity Chart" id="MyButton" > --> <!-- Run chart plugin with data from "kainosdataTable" table -->
				<p>
					This web application reads the <a href="http://forkainos.azurewebsites.net/data.csv">data.csv</a>'s data stored in MySQL database and display it in the HTML table.<br>
					In case the table is not loading properly, please <a href="http://forkainos.azurewebsites.net/">reload</a> the page.<br>
	 				/Damian Sygidus, syg.dam@gmail.com 
				</p>
				<hr>
				Select date from <input id="dateStart" name="dateStart" value="1998-01-05" class="datepicker" type="text" size="8" > to <input id="dateEnd" name="dateEnd" value="2016-05-12" class="datepicker" type="text" size="8" ><br>
				<hr>
			</div>
			
			<table id="kainosdataTable" class="dataTablesTable" data-graph-container-before="1" data-graph-type="column" width="80%">
				<thead>
		            <tr>
		                <th><span>Date</span></th>
		                <th><span>Value</span></th>
		            </tr>
				</thead>
		
				<tbody>	        
			      <%int r = 0; //import data from mySQL table and export to HTML table
					while (rs.next()) {
						Date data = rs.getDate("Data");
						double wartosc = rs.getDouble("Wartosc");%>
						<tr>
							<td><%out.print(data);%></td>
							<td><%out.print(wartosc);%></td>
						</tr>
				  <%} MySQL.close(c);
				  %>	
				</tbody>
			</table>
			<div id="dataTables_info"></div>
			
			<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.3.min.js"></script>
			<script type="text/javascript" src="https://cdn.datatables.net/1.10.12/js/jquery.dataTables.min.js"></script>
			<script type="text/javascript" src="https://cdn.datatables.net/1.10.12/js/dataTables.foundation.min.js"></script>
  			<script type="text/javascript" src="https://code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
			<script type="text/javascript" src="https://code.highcharts.com/highcharts.js"></script>
			<script type="text/javascript" src="/config.js"></script>
		</div>
	</div>
</body>
</html>