// The plugin function for adding a new filtering routine
jQuery.fn.dataTableExt.afnFiltering.push(
		function(oSettings, aData, iDataIndex){
			var dateStart = parseDateValue($("#dateStart").val());
			var dateEnd = parseDateValue($("#dateEnd").val());
			// aData represents the table structure as an array of columns, so the script access the date value 
			// in the first column of the table via aData[0]
			var evalDate = parseDateValue(aData[0]);
			
			if (evalDate >= dateStart && evalDate <= dateEnd) {
				return true;
			}
			else {
				return false;
			}
});

// Function for converting a yyyy-mm-dd date value into a numeric string for comparison (example 08-12-2010 becomes 20100812
function parseDateValue(rawDate) {
	var dateArray= rawDate.split("-");
	var parsedDate= dateArray[0] + dateArray[1] + dateArray[2];
return parsedDate;
}

$(function() {
	// Implements the dataTables plugin on the HTML table
	var $dTable= $("table.dataTablesTable").dataTable( {
	        "scrollY":        "400px",
	        "scrollCollapse": true,
	        "paging":         false,
			"bStateSave": 	  false,
			"aaSorting":  	  [[0,'asc']],
			"aoColumns": 	  [
          		{ "sType": "date" },
          		{ "sType": "numeric" }
    		]
	});
	$("#dateStart").keyup ( function() { $dTable.fnDraw(); } );
	$("#dateStart").change( function() { $dTable.fnDraw(); } );
	$("#dateEnd").keyup ( function() { $dTable.fnDraw(); } );
	$("#dateEnd").change( function() { $dTable.fnDraw(); } );
});

$(function() {
	// Implements and setting up the jQuery UI Datepicker widget on the date controls
	$( "#dateStart" ).datepicker({
		dateFormat: "yy-mm-dd",
		showOn: 'button', 
		buttonImage: '/datepicker/calendar.png', 
		buttonImageOnly: true
	});
	$( "#dateEnd" ).datepicker({
		dateFormat: "yy-mm-dd",
		showOn: 'button', 
		buttonImage: '/datepicker/calendar.png', 
		buttonImageOnly: true
	});
});
	
//$(function() {
//	$('#MyButton').click(function(){
//	    $('#chart').highcharts({
//	        data: {
//	            table: 'commentTable'
//	        },
//	        chart: {
//	            type: 'line'
//	        },
//	        title: {
//	            text: 'Data extracted from a HTML table in the page'
//	        },
//	        yAxis: {
//	            allowDecimals: true,
//	            title: {
//	                text: 'Units'
//	            }
//	        },
//	        tooltip: {
//	            formatter: function () {
//	                return '<b>' + this.series.name + '</b><br/>' +
//	                    this.point.y + ' ' + this.point.name.toLowerCase();
//	            }
//	        }
//	    });
//	});
//});