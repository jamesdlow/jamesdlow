var REVERSECCY = 'GBP';
var ccyquery = '';
$('#table.dataTable tbody td:first-child').each(function(i) {
	var ccy = this.innerHTML;
	if (ccy.length == 3) {
		ccyquery += (ccyquery == ''?'':',')+REVERSECCY+ccy+'=X';
	}
});
$.getJSON("http://query.yahooapis.com/v1/public/yql?q=select%20rate%2Cname%20from%20csv%20where%20url%3D'http%3A%2F%2Fdownload.finance.yahoo.com%2Fd%2Fquotes%3Fs%3D"+ccyquery+"%26f%3Dl1n'%20and%20columns%3D'rate%2Cname'&format=json", function(data){
	var rows = data.query.results.row;
	$('<th>'+REVERSECCY+'</th>').insertBefore('#table.dataTable thead tr:first-child th:last-child');
	$('<td><input type="text" value="Search..." placeholder="" rel="Search..." class="clearFieldBlurred" size="1"></td>').insertBefore('#table.dataTable thead tr.search_entries td:last-child');
	for (var i in rows) {
		var ccy = rows[i];
		var row = $('#table.dataTable tbody td:last-child')[i];
		$('<td>'+(parseFloat(row.innerHTML.replace(',',''))/ccy.rate).toFixed(2)+'</td>').insertBefore(row);
	}
});