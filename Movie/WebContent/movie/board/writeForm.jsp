<%@page import="org.jsoup.select.Elements"%>
<%@page import="org.jsoup.Jsoup"%>
<%@page import="org.jsoup.nodes.Document"%>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.net.HttpURLConnection"%>
<%@page import="java.net.URL"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="core" uri="http://java.sun.com/jsp/jstl/core"%>
<core:set var="path" value="${pageContext.request.contextPath}" />
<!-- movie write form -->
<core:if test = "${sessionScope.board_type == 0}">
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="${path}/resource/mycss.css">
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js">
</script>
<script type = "text/javascript">
	function inputcheck(){
		f = document.f;
		if(f.board_subject.value == ""){
			alert("������ �Է��ϼ���");
			f.board_subject.focus();
			return;
		}
		if(Number.isInteger(f.score_category_a.value)){
			alert("�����׸��� ��� ���� �����ϴ�!!!");
			f.score_category_a.focus();
		}
		if(f.score_category_b.value == ''){
			alert("�����׸��� ��� ���� �����ϴ�!!!");
			f.score_category_b.focus();
		}
		if(f.score_category_c.value == ''){
			alert("�����׸��� ��� ���� �����ϴ�!!!");
			f.score_category_c.focus();
		}
		if(f.score_category_d.value == ''){
			alert("�����׸��� ��� ���� �����ϴ�!!!");
			f.score_category_d.focus();
		}
		if(f.score_category_a.value > 25){
			alert("�ϳ��� �׸� ������ 25���� �ѱ� �� �����ϴ�!!!");
			f.score_category_a.focus();
			return;
		}
		if(f.score_category_b.value > 25){
			alert("�ϳ��� �׸� ������ 25���� �ѱ� �� �����ϴ�!!!");
			f.score_category_b.focus();
			return;
		}
		if(f.score_category_c.value > 25){
			alert("�ϳ��� �׸� ������ 25���� �ѱ� �� �����ϴ�!!!");
			f.score_category_c.focus();
			return;
		}
		if(f.score_category_d.value > 25){
			alert("�ϳ��� �׸� ������ 25���� �ѱ� �� �����ϴ�!!!");
			f.score_category_d.focus();
			return;
		}
		f.submit();
	}
	$(function(){
		if($("#board_notice_able_checker").prop("checked")){
			$("#board_notice_able").val("1");
		}else{
			$("#board_notice_able").val("0");
		}
	})
</script>
</head>
<body>
	<form action = "write.do" method = "post" enctype = "multipart/form-data" name = "f">
	<input type = "hidden" name = "board_notice_able" value = "0">
	<input type = "hidden" name = "movie_id">
	<input type = "hidden" name = "movie_subject">
	<input type = "hidden" name = "area_xpoint" value = "0">
	<input type = "hidden" name = "area_ypoint" value = "0">
	<table class="table table-bordered">
		<caption>�Խ��� �۾���</caption>
		<tr>
			<th>
				��ǰ���
			</th>
			<td>
			<core:if test="${!empty param.movie_id}">
				<input type = "text" name = "movie_id" readonly value = "${param.movie_id}">
			</core:if>
			<core:if test = "${empty param.movie_id}">
				<input type = "text" name = "movie_subject">
			</core:if>
			</td>
		</tr>
		<tr>
			<th>
				����
			</th>
			<td>
				<input type = "text" name = "board_subject">
			</td>
		</tr>
		<tr>
			<th>
				����
			</th>
			<td>
				<textarea rows = "15" name = "board_content" id = "board_content" class = "w3-input w3-border"></textarea>
			</td>
		</tr>
		<script>
			CKEDITOR.replace("board_content", {
				filebrowserImageUploadUrl : "imgupload.do"
				})
		</script>
		
		<tr>
			<th>
				���� å��
			</th>
			<td colspan = "2">
			��� ���� : 
			<select name="score_category_a">
                <option  value="1">1</option>
                <option  value="2">2</option>
                <option  value="3">3</option>
                <option  value="4">4</option>
                <option  value="5">5</option>
                <option  value="6">6</option>
                <option  value="7">7</option>
                <option  value="8">8</option>
                <option  value="9">9</option>
                <option  value="10">10</option>
                <option  value="11">11</option>
                <option  value="12">12</option>
                <option  value="13">13</option>
                <option  value="14">14</option>
                <option  value="15">15</option>
                <option  value="16">16</option>
                <option  value="17">17</option>
                <option  value="18">18</option>
                <option  value="19">19</option>
                <option  value="20">20</option>
                <option  value="21">21</option>
                <option  value="22">22</option>
                <option  value="20">23</option>
                <option  value="24">24</option>
                <option  value="25">25</option>
            </select>
			���� ���� : 
			<select name="score_category_b">
                <option  value="1">1</option>
                <option  value="2">2</option>
                <option  value="3">3</option>
                <option  value="4">4</option>
                <option  value="5">5</option>
                <option  value="6">6</option>
                <option  value="7">7</option>
                <option  value="8">8</option>
                <option  value="9">9</option>
                <option  value="10">10</option>
                <option  value="11">11</option>
                <option  value="12">12</option>
                <option  value="13">13</option>
                <option  value="14">14</option>
                <option  value="15">15</option>
                <option  value="16">16</option>
                <option  value="17">17</option>
                <option  value="18">18</option>
                <option  value="19">19</option>
                <option  value="20">20</option>
                <option  value="21">21</option>
                <option  value="22">22</option>
                <option  value="20">23</option>
                <option  value="24">24</option>
                <option  value="25">25</option>
            </select>
			���� ���� : 
			<select name="score_category_c">
                <option  value="1">1</option>
                <option  value="2">2</option>
                <option  value="3">3</option>
                <option  value="4">4</option>
                <option  value="5">5</option>
                <option  value="6">6</option>
                <option  value="7">7</option>
                <option  value="8">8</option>
                <option  value="9">9</option>
                <option  value="10">10</option>
                <option  value="11">11</option>
                <option  value="12">12</option>
                <option  value="13">13</option>
                <option  value="14">14</option>
                <option  value="15">15</option>
                <option  value="16">16</option>
                <option  value="17">17</option>
                <option  value="18">18</option>
                <option  value="19">19</option>
                <option  value="20">20</option>
                <option  value="21">21</option>
                <option  value="22">22</option>
                <option  value="20">23</option>
                <option  value="24">24</option>
                <option  value="25">25</option>
            </select>
			��Ÿ ���� :
			<select name="score_category_d">
                <option  value="1">1</option>
                <option  value="2">2</option>
                <option  value="3">3</option>
                <option  value="4">4</option>
                <option  value="5">5</option>
                <option  value="6">6</option>
                <option  value="7">7</option>
                <option  value="8">8</option>
                <option  value="9">9</option>
                <option  value="10">10</option>
                <option  value="11">11</option>
                <option  value="12">12</option>
                <option  value="13">13</option>
                <option  value="14">14</option>
                <option  value="15">15</option>
                <option  value="16">16</option>
                <option  value="17">17</option>
                <option  value="18">18</option>
                <option  value="19">19</option>
                <option  value="20">20</option>
                <option  value="21">21</option>
                <option  value="22">22</option>
                <option  value="20">23</option>
                <option  value="24">24</option>
                <option  value="25">25</option>
            </select>
			</td>
		</tr>
		
		<tr>
			<th>
				÷������
			</th>
			<td>
				<input type = "file" name = "board_attached_file" class = "normalbutton">
			</td>
		</tr>
		
		<tr>
			<td colspan = "2" align = "center">
				<core:if test = "${!empty sessionScope.admin}">
				<input type = "checkbox" name = "board_notice_able_checker" value = "1">���� ���
				</core:if>
				<input type = "submit" value = "�Խù� ���" class = "redbutton"> 
			</td>
		</tr>
	</table>
</form>
</body>
</html>
</core:if>



<!--  theater write form -->
<core:if test = "${sessionScope.board_type == 1}">
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="${path}/resource/mycss.css">
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js">
</script>
 <script src="https://polyfill.io/v3/polyfill.min.js?features=default"></script>
<script
      src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDdjN2QZk3VM026nj2NXFC-u2rFZX38JGo&callback=initMap&libraries=&v=weekly"
      defer>
</script>
<script type = "text/javascript">
	function inputcheck(){
		f = document.f;
		if(f.board_subject.value == ""){
			alert("������ �Է��ϼ���");
			f.board_subject.focus();
			return;
		}
		if(Number.isInteger(f.score_category_a.value)){
			alert("�����׸��� ��� ���� �����ϴ�!!!");
			f.score_category_a.focus();
		}
		if(f.score_category_b.value == ''){
			alert("�����׸��� ��� ���� �����ϴ�!!!");
			f.score_category_b.focus();
		}
		if(f.score_category_c.value == ''){
			alert("�����׸��� ��� ���� �����ϴ�!!!");
			f.score_category_c.focus();
		}
		if(f.score_category_d.value == ''){
			alert("�����׸��� ��� ���� �����ϴ�!!!");
			f.score_category_d.focus();
		}
		if(f.score_category_a.value > 25){
			alert("�ϳ��� �׸� ������ 25���� �ѱ� �� �����ϴ�!!!");
			f.score_category_a.focus();
			return;
		}
		if(f.score_category_b.value > 25){
			alert("�ϳ��� �׸� ������ 25���� �ѱ� �� �����ϴ�!!!");
			f.score_category_b.focus();
			return;
		}
		if(f.score_category_c.value > 25){
			alert("�ϳ��� �׸� ������ 25���� �ѱ� �� �����ϴ�!!!");
			f.score_category_c.focus();
			return;
		}
		if(f.score_category_d.value > 25){
			alert("�ϳ��� �׸� ������ 25���� �ѱ� �� �����ϴ�!!!");
			f.score_category_d.focus();
			return;
		}
		f.submit();
	}
	$(function(){
		if($("#board_notice_able_checker").prop("checked")){
			$("#board_notice_able").val("1");
		}else{
			$("#board_notice_able").val("0");
		}
	})
	function initMap() {
        const myLatlng = { lat: 37.47779053695607, lng: 126.87901758473859 };
        const map = new google.maps.Map(document.getElementById("map"), {
          zoom: 14,
          center: myLatlng,
        });
        // Create the initial InfoWindow.
        let infoWindow = new google.maps.InfoWindow({
          content: "�����Ͻ� ��Ҹ� �����ϼ���!",
          position: myLatlng,
        });
        infoWindow.open(map);
        // Configure the click listener.
        map.addListener("click", (mapsMouseEvent) => {
          // Close the current InfoWindow.
          infoWindow.close();
          // Create a new InfoWindow.
          infoWindow = new google.maps.InfoWindow({
            position: mapsMouseEvent.latLng
          });
          infoWindow.setContent(
        		  "����� �ϰڽ��ϴ�!"
          );
          infoWindow.open(map);
          f.area_xpoint.value = mapsMouseEvent.latLng.toJSON().lat;
          f.area_ypoint.value = mapsMouseEvent.latLng.toJSON().lng;
        });
      }
</script>
<style type="text/css">
      #map {
        height: 100%;
      }
      html,
      body {
        height: 100%;
        margin: 0;
        padding: 0;
      }
</style>
</head>
<body>
	<form action = "write.do" method = "post" enctype = "multipart/form-data" name = "f">
	<input type = "hidden" name = "board_notice_able" value = "0">
	<input type = "hidden" name = "something" value = "0">
	<table class="table table-bordered">
		<caption>��ȭ���� �۾���</caption>
		<tr>
			<th>
				����
			</th>
			<td>
				<input type = "text" name = "board_subject">
			</td>
		</tr>
		<tr>
			<th>
				����
			</th>
			<td>
				<textarea rows = "15" name = "board_content" id = "board_content" class = "w3-input w3-border"></textarea>
			</td>
		</tr>
		<script>
			CKEDITOR.replace("board_content", {
				filebrowserImageUploadUrl : "imgupload.do"
				})
		</script>
		<tr>
			<td>
				���� ǥ��
			</td>
			<td>
				<div id="map" style="width: 800px; height: 600px; margin:0px;"></div>	
				<input type = "hidden" name = "area_xpoint" value = "0">
				<input type = "hidden" name = "area_ypoint" value = "0">
			</td>
		</tr>
		<tr>
			<th>
				���� ��Ī
			</th>
			<td>
			<select name="area_name">
                <option  value="��ü����">��ü����</option>
                <option  value="����/���">����/���</option>
                <option  value="��õ/��õ">��õ/��õ</option>
                <option  value="��õ/����">��õ/����</option>
                <option  value="�λ�/���/�泲">�λ�/���/�泲</option>
                <option  value="�뱸/���">�뱸/���</option>
                <option  value="����/����">����/����</option>
                <option  value="����/����">����/����</option>
                <option  value="û��/���">û��/���</option>
                <option  value="û��/���">û��/���</option>
                <option  value="����/�泲">����/�泲</option>
                <option  value="����">����</option>
            </select>
			</td>
		</tr>
		<tr>
			<th>
				���� ��Ī
			</th>
			<td>
				<input type = "text" name = "area_name_specific">
			</td>
		</tr>
		<tr>
			<th>
				÷������
			</th>
			<td>
				<input type = "file" name = "board_attached_file">
			</td>
		</tr>
		<tr>
			<td colspan = "2">
			���� ���� :
			<select name="score_category_a">
                <option  value="1">1</option>
                <option  value="2">2</option>
                <option  value="3">3</option>
                <option  value="4">4</option>
                <option  value="5">5</option>
                <option  value="6">6</option>
                <option  value="7">7</option>
                <option  value="8">8</option>
                <option  value="9">9</option>
                <option  value="10">10</option>
                <option  value="11">11</option>
                <option  value="12">12</option>
                <option  value="13">13</option>
                <option  value="14">14</option>
                <option  value="15">15</option>
                <option  value="16">16</option>
                <option  value="17">17</option>
                <option  value="18">18</option>
                <option  value="19">19</option>
                <option  value="20">20</option>
                <option  value="21">21</option>
                <option  value="22">22</option>
                <option  value="20">23</option>
                <option  value="24">24</option>
                <option  value="25">25</option>
            </select>
			ȯ�� ���� : 
			<select name="score_category_b">
                <option  value="1">1</option>
                <option  value="2">2</option>
                <option  value="3">3</option>
                <option  value="4">4</option>
                <option  value="5">5</option>
                <option  value="6">6</option>
                <option  value="7">7</option>
                <option  value="8">8</option>
                <option  value="9">9</option>
                <option  value="10">10</option>
                <option  value="11">11</option>
                <option  value="12">12</option>
                <option  value="13">13</option>
                <option  value="14">14</option>
                <option  value="15">15</option>
                <option  value="16">16</option>
                <option  value="17">17</option>
                <option  value="18">18</option>
                <option  value="19">19</option>
                <option  value="20">20</option>
                <option  value="21">21</option>
                <option  value="22">22</option>
                <option  value="20">23</option>
                <option  value="24">24</option>
                <option  value="25">25</option>
            </select>
			�԰Ÿ� ���� :
			<select name="score_category_c">
                <option  value="1">1</option>
                <option  value="2">2</option>
                <option  value="3">3</option>
                <option  value="4">4</option>
                <option  value="5">5</option>
                <option  value="6">6</option>
                <option  value="7">7</option>
                <option  value="8">8</option>
                <option  value="9">9</option>
                <option  value="10">10</option>
                <option  value="11">11</option>
                <option  value="12">12</option>
                <option  value="13">13</option>
                <option  value="14">14</option>
                <option  value="15">15</option>
                <option  value="16">16</option>
                <option  value="17">17</option>
                <option  value="18">18</option>
                <option  value="19">19</option>
                <option  value="20">20</option>
                <option  value="21">21</option>
                <option  value="22">22</option>
                <option  value="20">23</option>
                <option  value="24">24</option>
                <option  value="25">25</option>
            </select>
			��Ÿ ���� : 
			<select name="score_category_d">
                <option  value="1">1</option>
                <option  value="2">2</option>
                <option  value="3">3</option>
                <option  value="4">4</option>
                <option  value="5">5</option>
                <option  value="6">6</option>
                <option  value="7">7</option>
                <option  value="8">8</option>
                <option  value="9">9</option>
                <option  value="10">10</option>
                <option  value="11">11</option>
                <option  value="12">12</option>
                <option  value="13">13</option>
                <option  value="14">14</option>
                <option  value="15">15</option>
                <option  value="16">16</option>
                <option  value="17">17</option>
                <option  value="18">18</option>
                <option  value="19">19</option>
                <option  value="20">20</option>
                <option  value="21">21</option>
                <option  value="22">22</option>
                <option  value="20">23</option>
                <option  value="24">24</option>
                <option  value="25">25</option>
            </select>
			</td>
		</tr>
		<tr>
			<td colspan = "2" align = "center">
				<core:if test = "${!empty sessionScope.admin}">
				<input type = "checkbox" name = "board_notice_able_checker" value = "1">���� ���
				</core:if>
				<input type = "submit" value = "�Խù� ���" class = "redbutton"> 
			</td>
		</tr>
	</table>
</form>
</body>
</html>
</core:if>



<!--  information write form -->
<core:if test = "${sessionScope.board_type == 2}">
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="${path}/resource/mycss.css">
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js">
</script>
 <script src="https://polyfill.io/v3/polyfill.min.js?features=default"></script>
<script
      src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDdjN2QZk3VM026nj2NXFC-u2rFZX38JGo&callback=initMap&libraries=&v=weekly"
      defer>
</script>
<script type = "text/javascript">
	function inputcheck(){
		f = document.f;
		if(f.board_subject.value == ""){
			alert("������ �Է��ϼ���");
			f.board_subject.focus();
			return;
		}
		if(Number.isInteger(f.score_category_a.value)){
			alert("�����׸��� ��� ���� �����ϴ�!!!");
			f.score_category_a.focus();
		}
		if(f.score_category_b.value == ''){
			alert("�����׸��� ��� ���� �����ϴ�!!!");
			f.score_category_b.focus();
		}
		if(f.score_category_c.value == ''){
			alert("�����׸��� ��� ���� �����ϴ�!!!");
			f.score_category_c.focus();
		}
		if(f.score_category_d.value == ''){
			alert("�����׸��� ��� ���� �����ϴ�!!!");
			f.score_category_d.focus();
		}
		if(f.score_category_a.value > 25){
			alert("�ϳ��� �׸� ������ 25���� �ѱ� �� �����ϴ�!!!");
			f.score_category_a.focus();
			return;
		}
		if(f.score_category_b.value > 25){
			alert("�ϳ��� �׸� ������ 25���� �ѱ� �� �����ϴ�!!!");
			f.score_category_b.focus();
			return;
		}
		if(f.score_category_c.value > 25){
			alert("�ϳ��� �׸� ������ 25���� �ѱ� �� �����ϴ�!!!");
			f.score_category_c.focus();
			return;
		}
		if(f.score_category_d.value > 25){
			alert("�ϳ��� �׸� ������ 25���� �ѱ� �� �����ϴ�!!!");
			f.score_category_d.focus();
			return;
		}
		f.submit();
	}
	$(function(){
		if($("#board_notice_able_checker").prop("checked")){
			$("#board_notice_able").val("1");
		}else{
			$("#board_notice_able").val("0");
		}
	})
	function initMap() {
        const myLatlng = { lat: 37.47779053695607, lng: 126.87901758473859 };
        const map = new google.maps.Map(document.getElementById("map"), {
          zoom: 14,
          center: myLatlng,
        });
        // Create the initial InfoWindow.
        let infoWindow = new google.maps.InfoWindow({
          content: "�����Ͻ� ��Ҹ� �����ϼ���!",
          position: myLatlng,
        });
        infoWindow.open(map);
        // Configure the click listener.
        map.addListener("click", (mapsMouseEvent) => {
          // Close the current InfoWindow.
          infoWindow.close();
          // Create a new InfoWindow.
          infoWindow = new google.maps.InfoWindow({
            position: mapsMouseEvent.latLng
          });
          infoWindow.setContent(
        		  "����� �ϰڽ��ϴ�!"
          );
          infoWindow.open(map);
          f.area_xpoint.value = mapsMouseEvent.latLng.toJSON().lat;
          f.area_ypoint.value = mapsMouseEvent.latLng.toJSON().lng;
        });
      }
</script>
<style type="text/css">
      #map {
        height: 100%;
      }
      html,
      body {
        height: 100%;
        margin: 0;
        padding: 0;
      }
</style>
</head>
<body>
	<form action = "write.do" method = "post" enctype = "multipart/form-data" name = "f">
	<input type = "hidden" name = "board_notice_able" value = "0">
	<table class="table table-bordered">
		<caption>���� �۾���</caption>
		<tr>
			<td>
				���� ����
			</td>
			<td>
				<select name="information_type">
                <option  value="0">�Ϲ�����</option>
                <option  value="1">�̺�Ʈ</option>
                <option  value="2">�û�ȸ</option>
                <option  value="3">��Ÿ</option>
            </select>
			</td>
		</tr>
		<tr>
			<th>
				����
			</th>
			<td>
				<input type = "text" name = "board_subject">
			</td>
		</tr>
		<tr>
			<th>
				����
			</th>
			<td>
				<textarea rows = "15" name = "board_content" id = "board_content" class = "w3-input w3-border"></textarea>
			</td>
		</tr>
		<script>
			CKEDITOR.replace("board_content", {
				filebrowserImageUploadUrl : "imgupload.do"
				})
		</script>
		<tr>
			<td>
				���� ǥ��
			</td>
			<td>
				<div id="map" style="width: 800px; height: 600px; margin:0px;"></div>	
				<input type = "hidden" name = "area_xpoint" value = "0">
				<input type = "hidden" name = "area_ypoint" value = "0">
			</td>
		</tr>
		<tr>
			<td>
				���� ��Ī : 
			<select name="area_name">
                <option  value="��ü����">��ü����</option>
                <option  value="����/���">����/���</option>
                <option  value="��õ/��õ">��õ/��õ</option>
                <option  value="��õ/����">��õ/����</option>
                <option  value="�λ�/���/�泲">�λ�/���/�泲</option>
                <option  value="�뱸/���">�뱸/���</option>
                <option  value="����/����">����/����</option>
                <option  value="����/����">����/����</option>
                <option  value="û��/���">û��/���</option>
                <option  value="û��/���">û��/���</option>
                <option  value="����/�泲">����/�泲</option>
                <option  value="����">����</option>
            </select>
			</td>
			<td>
				�̺�Ʈ ���� �� : <input type = "text" name = "area_name_specific">
			</td>
		</tr>
		<tr>
			<th>
				÷������
			</th>
			<td>
				<input type = "file" name = "board_attached_file">
			</td>
		</tr>

		<tr>
			<td colspan = "2" align = "center">
				<core:if test = "${!empty sessionScope.admin}">
				<input type = "checkbox" name = "board_notice_able_checker" value = "1">���� ���
				</core:if>
				<input type = "submit" value = "�Խù� ���" class = "redbutton"> 
			</td>
		</tr>
	</table>
</form>
</body>
</html>
</core:if>



<!--  give write form -->
<core:if test = "${sessionScope.board_type == 3}">
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="${path}/resource/mycss.css">
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js">
</script>
 <script src="https://polyfill.io/v3/polyfill.min.js?features=default"></script>
<script
      src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDdjN2QZk3VM026nj2NXFC-u2rFZX38JGo&callback=initMap&libraries=&v=weekly"
      defer>
</script>
<script type = "text/javascript">
	function inputcheck(){
		f = document.f;
		if(f.board_subject.value == ""){
			alert("������ �Է��ϼ���");
			f.board_subject.focus();
			return;
		}
		if(Number.isInteger(f.score_category_a.value)){
			alert("�����׸��� ��� ���� �����ϴ�!!!");
			f.score_category_a.focus();
		}
		if(f.score_category_b.value == ''){
			alert("�����׸��� ��� ���� �����ϴ�!!!");
			f.score_category_b.focus();
		}
		if(f.score_category_c.value == ''){
			alert("�����׸��� ��� ���� �����ϴ�!!!");
			f.score_category_c.focus();
		}
		if(f.score_category_d.value == ''){
			alert("�����׸��� ��� ���� �����ϴ�!!!");
			f.score_category_d.focus();
		}
		if(f.score_category_a.value > 25){
			alert("�ϳ��� �׸� ������ 25���� �ѱ� �� �����ϴ�!!!");
			f.score_category_a.focus();
			return;
		}
		if(f.score_category_b.value > 25){
			alert("�ϳ��� �׸� ������ 25���� �ѱ� �� �����ϴ�!!!");
			f.score_category_b.focus();
			return;
		}
		if(f.score_category_c.value > 25){
			alert("�ϳ��� �׸� ������ 25���� �ѱ� �� �����ϴ�!!!");
			f.score_category_c.focus();
			return;
		}
		if(f.score_category_d.value > 25){
			alert("�ϳ��� �׸� ������ 25���� �ѱ� �� �����ϴ�!!!");
			f.score_category_d.focus();
			return;
		}
		f.submit();
	}
	$(function(){
		if($("#board_notice_able_checker").prop("checked")){
			$("#board_notice_able").val("1");
		}else{
			$("#board_notice_able").val("0");
		}
	})
	function initMap() {
        const myLatlng = { lat: 37.47779053695607, lng: 126.87901758473859 };
        const map = new google.maps.Map(document.getElementById("map"), {
          zoom: 14,
          center: myLatlng,
        });
        // Create the initial InfoWindow.
        let infoWindow = new google.maps.InfoWindow({
          content: "�����Ͻ� ��Ҹ� �����ϼ���!",
          position: myLatlng,
        });
        infoWindow.open(map);
        // Configure the click listener.
        map.addListener("click", (mapsMouseEvent) => {
          // Close the current InfoWindow.
          infoWindow.close();
          // Create a new InfoWindow.
          infoWindow = new google.maps.InfoWindow({
            position: mapsMouseEvent.latLng
          });
          infoWindow.setContent(
        		  "����� �ϰڽ��ϴ�!"
          );
          infoWindow.open(map);
          f.area_xpoint.value = mapsMouseEvent.latLng.toJSON().lat;
          f.area_ypoint.value = mapsMouseEvent.latLng.toJSON().lng;
        });
      }
</script>
<style type="text/css">
      #map {
        height: 100%;
      }
      html,
      body {
        height: 100%;
        margin: 0;
        padding: 0;
      }
</style>
</head>
<body>
	<form action = "write.do" method = "post" enctype = "multipart/form-data" name = "f">
	<input type = "hidden" name = "board_notice_able" value = "0">
	<input type = "hidden" name = "give_state" value = "0">
	<table class="table table-bordered">
		<caption>�Խ��� �۾���</caption>
		<tr>
			<th>
				����
			</th>
			<td>
				<input type = "text" name = "board_subject">
			</td>
		</tr>
		<tr>
			<th>
				����
			</th>
			<td>
				<textarea rows = "15" name = "board_content" id = "board_content" class = "w3-input w3-border"></textarea>
			</td>
		</tr>
		<script>
			CKEDITOR.replace("board_content", {
				filebrowserImageUploadUrl : "imgupload.do"
				})
		</script>
		<tr>
			<td>
				���� ��Ī : 
			<select name="area_name">
                <option  value="��ü����">��ü����</option>
                <option  value="����/���">����/���</option>
                <option  value="��õ/��õ">��õ/��õ</option>
                <option  value="��õ/����">��õ/����</option>
                <option  value="�λ�/���/�泲">�λ�/���/�泲</option>
                <option  value="�뱸/���">�뱸/���</option>
                <option  value="����/����">����/����</option>
                <option  value="����/����">����/����</option>
                <option  value="û��/���">û��/���</option>
                <option  value="û��/���">û��/���</option>
                <option  value="����/�泲">����/�泲</option>
                <option  value="����">����</option>
            </select>
			</td>
			<td>
				���� ���� : <select name="give_type">
                <option  value="0">��ȭ Ƽ��</option>
                <option  value="1">����</option>
                <option  value="2">���ǰ</option>
                <option  value="3">��Ÿ</option>
            </select>
			</td>
		</tr>
		<tr>
			<td>
				���� ǥ��
			</td>
			<td>
				<div id="map" style="width: 800px; height: 600px; margin:0px;"></div>	
				<input type = "hidden" name = "area_xpoint" value = "0">
				<input type = "hidden" name = "area_ypoint" value = "0">
			</td>
		</tr>
		<tr>
			<td>
				���� ���� : <input type="date" id="date_start_date" name="date_start_date" value="2020-01-01">
			</td>
			<td>
				���� ���� : <input type="date" id="date_end_date" name="date_end_date" value="2020-01-01">
			</td>
		</tr>
		<tr>
			<th>
				÷������
			</th>
			<td>
				<input type = "file" name = "board_attached_file">
			</td>
		</tr>
		<tr>
			<td colspan = "2" align = "center">
				<core:if test = "${!empty sessionScope.admin}">
				<input type = "checkbox" name = "board_notice_able_checker" value = "1">���� ���
				</core:if>
				<input type = "submit" value = "�Խù� ���" class = "redbutton"> 
			</td>
		</tr>
	</table>
</form>
</body>
</html>
</core:if>



<!--  activity write form -->
<core:if test = "${sessionScope.board_type == 4}">
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="${path}/resource/mycss.css">
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js">
</script>
 <script src="https://polyfill.io/v3/polyfill.min.js?features=default"></script>
<script
      src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDdjN2QZk3VM026nj2NXFC-u2rFZX38JGo&callback=initMap&libraries=&v=weekly"
      defer>
</script>
<script type = "text/javascript">
	function inputcheck(){
		f = document.f;
		if(f.board_subject.value == ""){
			alert("������ �Է��ϼ���");
			f.board_subject.focus();
			return;
		}
		if(Number.isInteger(f.score_category_a.value)){
			alert("�����׸��� ��� ���� �����ϴ�!!!");
			f.score_category_a.focus();
		}
		if(f.score_category_b.value == ''){
			alert("�����׸��� ��� ���� �����ϴ�!!!");
			f.score_category_b.focus();
		}
		if(f.score_category_c.value == ''){
			alert("�����׸��� ��� ���� �����ϴ�!!!");
			f.score_category_c.focus();
		}
		if(f.score_category_d.value == ''){
			alert("�����׸��� ��� ���� �����ϴ�!!!");
			f.score_category_d.focus();
		}
		if(f.score_category_a.value > 25){
			alert("�ϳ��� �׸� ������ 25���� �ѱ� �� �����ϴ�!!!");
			f.score_category_a.focus();
			return;
		}
		if(f.score_category_b.value > 25){
			alert("�ϳ��� �׸� ������ 25���� �ѱ� �� �����ϴ�!!!");
			f.score_category_b.focus();
			return;
		}
		if(f.score_category_c.value > 25){
			alert("�ϳ��� �׸� ������ 25���� �ѱ� �� �����ϴ�!!!");
			f.score_category_c.focus();
			return;
		}
		if(f.score_category_d.value > 25){
			alert("�ϳ��� �׸� ������ 25���� �ѱ� �� �����ϴ�!!!");
			f.score_category_d.focus();
			return;
		}
		f.submit();
	}
	$(function(){
		if($("#board_notice_able_checker").prop("checked")){
			$("#board_notice_able").val("1");
		}else{
			$("#board_notice_able").val("0");
		}
	})
	function initMap() {
        const myLatlng = { lat: 37.47779053695607, lng: 126.87901758473859 };
        const map = new google.maps.Map(document.getElementById("map"), {
          zoom: 14,
          center: myLatlng,
        });
        // Create the initial InfoWindow.
        let infoWindow = new google.maps.InfoWindow({
          content: "�����Ͻ� ��Ҹ� �����ϼ���!",
          position: myLatlng,
        });
        infoWindow.open(map);
        // Configure the click listener.
        map.addListener("click", (mapsMouseEvent) => {
          // Close the current InfoWindow.
          infoWindow.close();
          // Create a new InfoWindow.
          infoWindow = new google.maps.InfoWindow({
            position: mapsMouseEvent.latLng
          });
          infoWindow.setContent(
        		  "����� �ϰڽ��ϴ�!"
          );
          infoWindow.open(map);
          f.area_xpoint.value = mapsMouseEvent.latLng.toJSON().lat;
          f.area_ypoint.value = mapsMouseEvent.latLng.toJSON().lng;
        });
      }
</script>
<style type="text/css">
      #map {
        height: 100%;
      }
      html,
      body {
        height: 100%;
        margin: 0;
        padding: 0;
      }
</style>
</head>
<body>
	<form action = "write.do" method = "post" enctype = "multipart/form-data" name = "f">
	<input type = "hidden" name = "board_notice_able" value = "0">
	<input type = "hidden" name = "activity_able" value = "0">
	<table class="table table-bordered">
		<caption>�Խ��� �۾���</caption>
		<tr>
			<th>
				����
			</th>
			<td>
				<input type = "text" name = "board_subject">
			</td>
		</tr>
		<tr>
			<th>
				����
			</th>
			<td>
				<textarea rows = "15" name = "board_content" id = "board_content" class = "w3-input w3-border"></textarea>
			</td>
		</tr>
		<script>
			CKEDITOR.replace("board_content", {
				filebrowserImageUploadUrl : "imgupload.do"
				})
		</script>
		<tr>
			<td>
				���� ǥ��
			</td>
			<td>
				<div id="map" style="width: 800px; height: 600px; margin:0px;"></div>	
				<input type = "hidden" name = "area_xpoint" value = "0">
				<input type = "hidden" name = "area_ypoint" value = "0">
			</td>
		</tr>
		<tr>
			<td>
				���� ��Ī : 
			<select name="area_name">
                <option  value="��ü����">��ü����</option>
                <option  value="����/���">����/���</option>
                <option  value="��õ/��õ">��õ/��õ</option>
                <option  value="��õ/����">��õ/����</option>
                <option  value="�λ�/���/�泲">�λ�/���/�泲</option>
                <option  value="�뱸/���">�뱸/���</option>
                <option  value="����/����">����/����</option>
                <option  value="����/����">����/����</option>
                <option  value="û��/���">û��/���</option>
                <option  value="û��/���">û��/���</option>
                <option  value="����/�泲">����/�泲</option>
                <option  value="����">����</option>
            </select>
			</td>
			<td>
				Ȱ�� ���� : <input type = "text" name = "activity_type">
				Ȱ�� ���� : 
				<select name="activity_able">
				<option  value="0">�غ�</option>
                <option  value="1">Ȱ��</option>
                <option  value="2">����</option>
				</select>
			</td>
		</tr>
		<tr>
			<td>
				Ȱ�� ���� : <input type="date" id="date_start_date" name="date_start_date" value="2020-01-01">
			</td>
			<td>
				Ȱ�� ���� : <input type="date" id="date_end_date" name="date_end_date" value="2020-01-01">
			</td>
		</tr>
		<tr>
			<th>
				÷������
			</th>
			<td>
				<input type = "file" name = "board_attached_file">
			</td>
		</tr>
		<tr>
			<td colspan = "2" align = "center">
				<core:if test = "${!empty sessionScope.admin}">
				<input type = "checkbox" name = "board_notice_able_checker" value = "1">���� ���
				</core:if>
				<input type = "submit" value = "�Խù� ���" class = "redbutton"> 
			</td>
		</tr>
	</table>
</form>
</body>
</html>
</core:if>