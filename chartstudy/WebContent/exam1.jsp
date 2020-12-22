<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<%@ taglib prefix="core" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="functions"
	uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>

<html>
<head>
<meta charset="EUC-KR">
<title>�Խù� ��� ���ں� �Խù� �Ǽ��� ����׷����� �� �׷����� ����ϱ�</title>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.min.js"></script>
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style>
canvas {
	-moz-user-select: none;
	-webkit-user-select: none;
	-ms-user-select: none;
	user-select: none;
}
</style>
<sql:setDataSource var="conn" driver="org.mariadb.jdbc.Driver"
	url="jdbc:mariadb://localhost:59753/classdb" user="root"
	password="159753" />
<sql:query var="rs" dataSource="${conn}">
		select date_format(regdate, '%Y%m%d') date, count(*) cnt from board
		group by date
		having count(*) >= 1
		order by date
	</sql:query>
</head>
<body>
	<div style="width: 75%">
		<canvas id="canvas"></canvas>
	</div>
	<script type="text/javascript">
var randomColorFactor = function(){
	return Math.round(Math.random() * 255);
}
var randomColor = function(opacity){
	return "rgba(" + randomColorFactor() + "," + randomColorFactor() + "," + randomColorFactor() + "," + (opacity || '.3')+")";
};
var chartData = {
		labels : [<core:forEach items = "${rs.rows}" var="m"> "${m.date}",</core:forEach>],
		datasets:[{
			type : "line",
			borderWidth : 2,
			borderColor : [<core:forEach items = "${rs.rows}" var = "m"> randomColor(1),</core:forEach>],
			label : "�Ǽ�",
			fill : false,
			data : [<core:forEach items = "${rs.rows}" var = "m">"${m.cnt}",</core:forEach>],
		},{
			type : "bar",
			label : "�Ǽ�",
			backgroundColor : [<core:forEach items = "${rs.rows}" var = "m"> randomColor(1),</core:forEach>],
			data : [<core:forEach items = "${rs.rows}" var = "m"> randomColor(1),</core:forEach>],
			borderWidth : 2
		}]
};
window.onload = function(){
	var ctx = document.getElementById("canvas").getContext("2d");
	new Chart(ctx,{
		type : "bar",
		data : chartData,
		options : {
			responsive : true,
			title : {display : true, text : "�Խ��� ��� �Ǽ�"},
			legend : {display : false},
			scales : {
				xAxes : [{
					display : true,
					scaleLabel : {
						display : true,
						labelString : "�Խù� �����"
					},
					stacked : true
				}],
				yAxes : [{
					display : true,
					scaleLabel : {
						display : true,
						labelString : "�Խù� �ۼ� �Ǽ�"
					},
					stacked : true
				}]
			}
		}
	})
}

</script>
</body>
</html>