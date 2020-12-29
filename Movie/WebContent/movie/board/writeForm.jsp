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
	<input type = "hidden" name = "movie_id" value = "1">
	<input type = "hidden" name = "movie_subject" value = "1">
	<table class="w3-table-all">
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
			<td>
				<input type = "file" name = "board_attached_file">
			</td>
		</tr>
		
		<tr>
			<td colspan = "2">
				<core:if test = "${!empty sessionScope.admin}">
				<input type = "checkbox" name = "board_notice_able_checker" value = "1">���� ���
				</core:if>
				<a href = "javascript:inputcheck()">[�Խù� ���]</a>
				<input type = "submit" value = "�Խù� ���"> 
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
	<input type = "hidden" name = "something" value = "0">
	<table class="w3-table-all">
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
				����
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
			<th>
				÷������
			</th>
			<td>
				<input type = "file" name = "board_attached_file">
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
			<td colspan = "2">
				<input type = "checkbox" name = "board_notice_able_checker" value = "1">���� ���
				<a href = "javascript:inputcheck()">[�Խù� ���]</a>
				<input type = "submit" value = "�Խù� ���"> 
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
	<table class="w3-table-all">
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
				����
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
			<td colspan = "2">
				<input type = "checkbox" name = "board_notice_able_checker" value = "1">���� ���
				<a href = "javascript:inputcheck()">[�Խù� ���]</a>
				<input type = "submit" value = "�Խù� ���"> 
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
	<input type = "hidden" name = "give_state" value = "0">
	<table class="w3-table-all">
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
			<td colspan = "2">
				<input type = "checkbox" name = "board_notice_able_checker" value = "1">���� ���
				<a href = "javascript:inputcheck()">[�Խù� ���]</a>
				<input type = "submit" value = "�Խù� ���"> 
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
	<input type = "hidden" name = "activity_able" value = "0">
	<table class="w3-table-all">
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
				Ȱ�� ���� : <input type = "text" name = "activity_type">
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
			<td colspan = "2">
				<input type = "checkbox" name = "board_notice_able_checker" value = "1">���� ���
				<a href = "javascript:inputcheck()">[�Խù� ���]</a>
				<input type = "submit" value = "�Խù� ���"> 
			</td>
		</tr>
	</table>
</form>
</body>
</html>
</core:if>