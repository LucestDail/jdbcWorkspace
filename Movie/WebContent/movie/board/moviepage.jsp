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
<title>�Խù� ��� ���</title>
<link rel="stylesheet" href="${path}/resource/mycss.css">
<script type = "text/javascript">
	function listdo(page){
		f = document.sf;
		f.pageNum.value = page;
		f.submit();
	}
</script>
</head>
<body>
<table>

	<caption>�Խñ� ���</caption>
		<core:if test = "${boardcount == 0}">
		<tr>
			<td colspan = "5"> ��ϵ� �Խñ��� �����ϴ�...
			</td>
		</tr>
		</core:if>
		
		
		<core:if test = "${boardcount > 0}">
		
		
		<tr>
			<td colspan = "5" style = "text-align:right"> �۰���:${boardcount}
			</td>
		</tr>
		
		
		<tr>
			<th width = "5%"> ��ȣ</th>
			<th width = "55%"> ����</th>
			<th width = "10%"> �ۼ���</th>
			<th width = "20%"> �ۼ�����</th>
			<th width = "10%"> ��ȸ��</th>			
		</tr>
		
		
		<core:forEach var="board" items="${list}">
		<tr>
			<td>${boardnum}</td>
			<core:set var = "boardnum" value = "${boardnum -1 }"/>
			<td style = "text-align : left">
				<a href = "info.do?board_num=${board.board_num }&&board_type=${param.board_type}">${board.board_subject}</a>
			</td>
			<td>${board.member_id}</td>
			<fmt:formatDate var = "rdate" value="${board.board_regdate}" pattern = "yyyy-MM-dd"/>
			<core:if test = "${today == rdate}">
				<!-- ������ ��� -->
				<td>
				<fmt:formatDate value = "${board.board_regdate}" pattern = "HH:mm:ss"/>
				</td>
			</core:if>
			<core:if test = "${today != rdate}">
				<!--  ������ �ƴ� ��� -->
				<td>
				<fmt:formatDate value = "${board.board_regdate}" pattern = "yyyy-MM-dd HH:mm"/>
				</td>
			</core:if>
			<td>${board.board_readcnt}</td>
		</tr>
		</core:forEach>
		
		
		<tr>
			<td colspan = "5">
				<core:if test = "${pageNum <= 1}">
					[����]
				</core:if>
				<core:if test = "${pageNum > 1}">
					<a href = "javascript:listdo(${pageNum - 1 })">[����]</a>
				</core:if>
				<core:forEach var = "a" begin = "${startpage}" end = "${endpage}">
					<core:if test = "${a == pageNum}">
						[${a }]
					</core:if>
					<core:if test = "${a != pageNum}">
						<a href = "javascript:listdo(${a })">[${a }]</a>
					</core:if>
				</core:forEach>
				<core:if test = "${pageNum >= maxpage}">
					[����]
				</core:if>
				<core:if test = "${pageNum < maxpage}">
					<a href = "javascript:listdo(${pageNum + 1 })">[����]</a>
				</core:if>
			</td>
		</tr>
		
		
		</core:if>
		<tr>
			<td colspan = "5" style = "text-align:right">
				<a href = "writeForm.do?board_type=${param.board}">[�۾���]</a>
			</td>
		</tr>
	</table>
	<form action = "list.do" method = "post" name = "sf">
		<div style = "display : flex; justify-content : center;">
			<input type = "hidden" name = "pageNum" value = "1">
			<input type = "hidden" name = "Paramfind" value = "${find}">
			<input type = "hidden" name = "Paramcolumn" value = "${column}">
				<select name = "column">
					<option value = ""> �����ϼ���</option>
					<option value = "subject"> ����</option>
					<option value = "name"> �ۼ���</option>
					<option value = "content"> ����</option>
					<option value = "subject, name"> ���� + �ۼ���</option>
					<option value = "subject, content"> ���� + ����</option>
					<option value = "name, content"> �ۼ��� + ����</option>
					<option value = "subject, name, content"> ���� + �ۼ��� + ����</option>
				</select>
				<script>
					document.sf.column.value = "${param.column}";
				</script>
				<input type = "text" name = "find" value = "${param.find}" style = "width:50%;">
				<input type = "submit" value = "�˻�">
		</div>
	</form>
	
</body>
</html>