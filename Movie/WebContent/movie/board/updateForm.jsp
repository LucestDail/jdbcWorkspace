<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix = "core" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix = "functions" uri = "http://java.sun.com/jsp/jstl/functions" %>
<core:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�Խñ� ���� ȭ��</title>
<link rel="stylesheet" href="${path}/resource/mycss.css">
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js">
</script>
<script src="https://polyfill.io/v3/polyfill.min.js?features=default"></script>
<script
      src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDdjN2QZk3VM026nj2NXFC-u2rFZX38JGo&callback=initMap&libraries=&v=weekly"
      defer>
</script>
<script>
	function file_delete(){
		document.f.board_attached_file_temp.value = "";
		file_desc.style.display = "none";
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
<!-- movie update form -->
<core:if test = "${sessionScope.board_type == 0}">
<form action="update.do" method="post" enctype = "multipart/form-data" name = "f">
<input type = "hidden" name = "board_num" value = "${b.board_num}">
<input type = "hidden" name = "board_type" value = "${sessionScope.board_type}">
<input type = "hidden" name = "board_attached_file_temp" value = "${b.board_attached_file}">
<input type = "hidden" name = "board_notice_able" value = "0">
	<table class = "w3-table-all">
	<!--  movie info -->
	
		<caption>�Խñ� ����</caption>
		<tr>
			<th>
				����
			</th>
			<td>
				<input type = "text" name = "board_subject" value = "${b.board_subject}">
			</td>
		</tr>
		<tr>
			<th>
				����
			</th>
			<td>
				<textarea rows = "15" name = "board_content" id = "content1" class = "w3-input w3-border">${b.board_content}
				</textarea>
			</td>
		</tr>
		<tr>
			<td>
				���� ǥ��
			</td>
			<td>
				<div id="map" style="width: 600px; height: 600px; margin:0px;"></div>	
				<input type = "hidden" name = "area_xpoint" value = "0">
				<input type = "hidden" name = "area_ypoint" value = "0">
			</td>
		</tr>
		<script>
			CKEDITOR.replace("content1", {
				filebrowserImageUploadUrl : "imgupload.do"
				})
		</script>
		<tr>
			<td colspan = "2">
			��� ���� : <input type = "text" name = "score_category_a" style = "width:30px">
			���� ���� : <input type = "text" name = "score_category_b" style = "width:30px">
			���� ���� : <input type = "text" name = "score_category_c" style = "width:30px">
			��Ÿ ���� : <input type = "text" name = "score_category_d" style = "width:30px">
			</td>
		</tr>
		<tr>
			<th>
				÷������
			</th>
			<td style = "text-align:left">
			<core:if test = "${!empty b.board_attached_file}">
			<div id = "file_desc">${b.board_attached_file}
			<a href = "javascript:file_delete()">[÷������ ����]</a></div>
			</core:if>
				<input type = "file" name = "board_attached_file">
			</td>
		</tr>
		<tr>
			<td colspan = "2">
				<core:if test = "${!empty sessionScope.admin}">
				<input type = "checkbox" name = "board_notice_able_checker" value = "1">���� ���
				</core:if>
				<a href = "javascript:document.f.submit()">[�Խù� ����]</a>
				<a href = "javascript:history.go(-1)">[�ڷΰ���]</a>
			</td>
		</tr>
	</table>
</form>
</core:if>









<!-- theater update form -->
<core:if test = "${sessionScope.board_type == 1}">
<form action="update.do" method="post" enctype = "multipart/form-data" name = "f">
<input type = "hidden" name = "board_num" value = "${b.board_num}">
<input type = "hidden" name = "board_type" value = "${sessionScope.board_type}">
<input type = "hidden" name = "board_attached_file_temp" value = "${b.board_attached_file}">
<input type = "hidden" name = "board_notice_able" value = "0">
	<table class = "w3-table-all">
	<!--  movie info -->
	
		<caption>�Խñ� ����</caption>
		<tr>
			<th>
				����
			</th>
			<td>
				<input type = "text" name = "board_subject" value = "${b.board_subject}">
			</td>
		</tr>
		<tr>
			<th>
				����
			</th>
			<td>
				<textarea rows = "15" name = "board_content" id = "content1" class = "w3-input w3-border">${b.board_content}
				</textarea>
			</td>
		</tr>

		<script>
			CKEDITOR.replace("content1", {
				filebrowserImageUploadUrl : "imgupload.do"
				})
		</script>
		<tr>
			<td>
				���� ǥ��
			</td>
			<td>
				<div id="map" style="width: 600px; height: 600px; margin:0px;"></div>	
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
				���� ��Ī : <input type = "text" name = "area_name_specific">
			</td>
		</tr>
		<tr>
			<td colspan = "2">
			���� ���� : <input type = "text" name = "score_category_a" style = "width:30px">
			ȯ�� ���� : <input type = "text" name = "score_category_b" style = "width:30px">
			�԰Ÿ� ���� : <input type = "text" name = "score_category_c" style = "width:30px">
			��Ÿ ���� : <input type = "text" name = "score_category_d" style = "width:30px">
			</td>
		</tr>
		<tr>
			<th>
				÷������
			</th>
			<td style = "text-align:left">
			<core:if test = "${!empty b.board_attached_file}">
			<div id = "file_desc">${b.board_attached_file}
			<a href = "javascript:file_delete()">[÷������ ����]</a></div>
			</core:if>
				<input type = "file" name = "board_attached_file">
			</td>
		</tr>
		<tr>
			<td colspan = "2">
				<core:if test = "${!empty sessionScope.admin}">
				<input type = "checkbox" name = "board_notice_able_checker" value = "1">���� ���
				</core:if>
				<a href = "javascript:document.f.submit()">[�Խù� ����]</a>
				<a href = "javascript:history.go(-1)">[�ڷΰ���]</a>
			</td>
		</tr>
	</table>
</form>
</core:if>









<!-- information update form -->
<core:if test = "${sessionScope.board_type == 2}">
<form action="update.do" method="post" enctype = "multipart/form-data" name = "f">
<input type = "hidden" name = "board_num" value = "${b.board_num}">
<input type = "hidden" name = "board_type" value = "${sessionScope.board_type}">
<input type = "hidden" name = "board_attached_file_temp" value = "${b.board_attached_file}">
<input type = "hidden" name = "board_notice_able" value = "0">
	<table class = "w3-table-all">
	<!--  movie info -->
	
		<caption>�Խñ� ����</caption>
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
				<input type = "text" name = "board_subject" value = "${b.board_subject}">
			</td>
		</tr>
		<tr>
			<th>
				����
			</th>
			<td>
				<textarea rows = "15" name = "board_content" id = "content1" class = "w3-input w3-border">${b.board_content}
				</textarea>
			</td>
		</tr>
		<script>
			CKEDITOR.replace("content1", {
				filebrowserImageUploadUrl : "imgupload.do"
				})
		</script>
		<tr>
			<td>
				���� ǥ��
			</td>
			<td>
				<div id="map" style="width: 600px; height: 600px; margin:0px;"></div>	
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
			<td style = "text-align:left">
			<core:if test = "${!empty b.board_attached_file}">
			<div id = "file_desc">${b.board_attached_file}
			<a href = "javascript:file_delete()">[÷������ ����]</a></div>
			</core:if>
				<input type = "file" name = "board_attached_file">
			</td>
		</tr>
		<tr>
			<td colspan = "2">
				<core:if test = "${!empty sessionScope.admin}">
				<input type = "checkbox" name = "board_notice_able_checker" value = "1">���� ���
				</core:if>
				<a href = "javascript:document.f.submit()">[�Խù� ����]</a>
				<a href = "javascript:history.go(-1)">[�ڷΰ���]</a>
			</td>
		</tr>
	</table>
</form>
</core:if>









<!-- give update form -->
<core:if test = "${sessionScope.board_type == 3}">
<form action="update.do" method="post" enctype = "multipart/form-data" name = "f">
<input type = "hidden" name = "board_num" value = "${b.board_num}">
<input type = "hidden" name = "board_type" value = "${sessionScope.board_type}">
<input type = "hidden" name = "board_attached_file_temp" value = "${b.board_attached_file}">
<input type = "hidden" name = "board_notice_able" value = "0">
	<table class = "w3-table-all">
	<!--  movie info -->
	
		<caption>�Խñ� ����</caption>
		<tr>
			<th>
				����
			</th>
			<td>
				<input type = "text" name = "board_subject" value = "${b.board_subject}">
			</td>
		</tr>
		<tr>
			<th>
				����
			</th>
			<td>
				<textarea rows = "15" name = "board_content" id = "content1" class = "w3-input w3-border">${b.board_content}
				</textarea>
			</td>
		</tr>
		<tr>
			<td>
				���� ǥ��
			</td>
			<td>
				<div id="map" style="width: 600px; height: 600px; margin:0px;"></div>	
				<input type = "hidden" name = "area_xpoint" value = "0">
				<input type = "hidden" name = "area_ypoint" value = "0">
			</td>
		</tr>
		<script>
			CKEDITOR.replace("content1", {
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
			<td style = "text-align:left">
			<core:if test = "${!empty b.board_attached_file}">
			<div id = "file_desc">${b.board_attached_file}
			<a href = "javascript:file_delete()">[÷������ ����]</a></div>
			</core:if>
				<input type = "file" name = "board_attached_file">
			</td>
		</tr>
		<tr>
			<td colspan = "2">
				<core:if test = "${!empty sessionScope.admin}">
				<input type = "checkbox" name = "board_notice_able_checker" value = "1">���� ���
				</core:if>
				<a href = "javascript:document.f.submit()">[�Խù� ����]</a>
				<a href = "javascript:history.go(-1)">[�ڷΰ���]</a>
			</td>
		</tr>
	</table>
</form>
</core:if>









<!-- activity update form -->
<core:if test = "${sessionScope.board_type == 4}">
<form action="update.do" method="post" enctype = "multipart/form-data" name = "f">
<input type = "hidden" name = "board_num" value = "${b.board_num}">
<input type = "hidden" name = "board_type" value = "${sessionScope.board_type}">
<input type = "hidden" name = "board_attached_file_temp" value = "${b.board_attached_file}">
<input type = "hidden" name = "board_notice_able" value = "0">
	<table class = "w3-table-all">
	<!--  movie info -->
	
		<caption>�Խñ� ����</caption>
		<tr>
			<th>
				����
			</th>
			<td>
				<input type = "text" name = "board_subject" value = "${b.board_subject}">
			</td>
		</tr>
		<tr>
			<th>
				����
			</th>
			<td>
				<textarea rows = "15" name = "board_content" id = "content1" class = "w3-input w3-border">${b.board_content}
				</textarea>
			</td>
		</tr>
		<script>
			CKEDITOR.replace("content1", {
				filebrowserImageUploadUrl : "imgupload.do"
				})
		</script>
		<tr>
			<td>
				���� ǥ��
			</td>
			<td>
				<div id="map" style="width: 600px; height: 600px; margin:0px;"></div>	
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
			<td style = "text-align:left">
			<core:if test = "${!empty b.board_attached_file}">
			<div id = "file_desc">${b.board_attached_file}
			<a href = "javascript:file_delete()">[÷������ ����]</a></div>
			</core:if>
				<input type = "file" name = "board_attached_file">
			</td>
		</tr>
		<tr>
			<td colspan = "2">
				<core:if test = "${!empty sessionScope.admin}">
				<input type = "checkbox" name = "board_notice_able_checker" value = "1">���� ���
				</core:if>
				<a href = "javascript:document.f.submit()">[�Խù� ����]</a>
				<a href = "javascript:history.go(-1)">[�ڷΰ���]</a>
			</td>
		</tr>
	</table>
</form>
</core:if>
</body>
</html>