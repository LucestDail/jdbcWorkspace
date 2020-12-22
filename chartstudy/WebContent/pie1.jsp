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
<title>게시물 등록 일자별 게시물 건수를 막대그래프와 선 그래프로 출력하기</title>
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
		select name, count(*) cnt from board
		group by name
		having count(*) >= 1
		order by cnt desc
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
		labels : [<core:forEach items = "${rs.rows}" var="m"> "${m.name}",</core:forEach>],
		datasets:[{
			data : [<core:forEach items = "${rs.rows}" var = "m">"${m.cnt}",</core:forEach>],
			backgroundColor : [<core:forEach items = "${rs.rows}" var = "m"> randomColor(1),</core:forEach>],
			label : "도넛 그래프"
		}]
};
window.onload = function(){
	var ctx = document.getElementById("canvas").getContext("2d");
	new Chart(ctx,{
		type : "pie",
		data : chartData,
		options : {
			responsive : true,
			legend : {position : "top",},
			title : {
				display : true,
				text : "도넛 그래프 연습"
			},
			animation : {
				animateScale : true,
				animateRotate : true
			}
		}
	})
}

</script>
</body>
</html>