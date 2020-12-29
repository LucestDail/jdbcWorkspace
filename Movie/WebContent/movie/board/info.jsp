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
<title>�Խù� �� ����</title>
<link rel="stylesheet" href="${path}/resource/mycss.css">
<script type = "text/javascript">
function inputcheck(f){
	if(f.comment_content.value == ''){
		alert("��۳����� �Է��ϼ���");
		f.comment_content.focus();
		return false;
	}
	return true;
}
</script>
</head>
<body>

	<table>
	<!--  movie info -->
	<core:if test = "${sessionScope.board_type == 0}">
		<tr>
			<th>��ȭ</th>
			<td>${infoBoard.movie_subject}</td>
		</tr>
		<tr>
			<th>�۾���</th>
			<td>${infoBoard.member_id}</td>
		</tr>
		<tr>
			<th>����</th>
			<td>${infoBoard.board_subject}</td>
		</tr>
		<tr>
			<th>����</th>
			<td>${infoBoard.board_content}</td>
		</tr>
		<tr>
			<td>
				������� : ${infoBoard.score_category_a},
				�������� : ${infoBoard.score_category_b},
				�������� : ${infoBoard.score_category_c},
				��Ÿ���� : ${infoBoard.score_category_d}
			</td>
		</tr>
		<tr>
			<th>÷������</th>
				<core:if test = "${empty infoBoard.board_attached_file}">
					<td><a href="#">÷������ ����</a></td>
				</core:if>
				<core:if test = "${!empty infoBoard.board_attached_file}">
					<td><a href="file/${infoBoard.board_attached_file}">${infoBoard.board_attached_file}</a></td>
				</core:if>
		</tr>
		<core:if test = "${!empty sessionScope.login}">
		<tr>
			<td>
				<a href = "recommand.do?board_num=${infoBoard.board_num}&&board_type=${sessionScope.board_type}">��õ</a>
				<a href = "notRecommand.do?board_num=${infoBoard.board_num}&&board_type=${sessionScope.board_type}">����õ</a>
				<a href = "alert.do?board_num=${infoBoard.board_num}&&board_type=${sessionScope.board_type}">�Ű�</a>
			</td>
		</tr>
		</core:if>
		<core:if test = "${infoBoard.member_id == sessionScope.login}">
		<tr>
			<td colspan = "2">
				<a href = "updateForm.do?board_num=${infoBoard.board_num}&&board_type=${sessionScope.board_type}">[����]</a>
				<a href = "deleteForm.do?board_num=${infoBoard.board_num}&&board_type=${sessionScope.board_type}">[����]</a>
				<a href = "list.do?board_type=${sessionScope.board_type}">[���]</a>
			</td>
		</tr>
		</core:if>
	</core:if>
	
		<!--  theater info -->
	<core:if test = "${sessionScope.board_type == 1}">

		<tr>
			<th>�۾���</th>
			<td>${infoBoard.member_id}</td>
		</tr>
		<tr>
			<th>����</th>
			<td>${infoBoard.board_subject}</td>
		</tr>
		<tr>
			<th>����</th>
			<td>${infoBoard.board_content}</td>
		</tr>
		<tr>
			<td>
				���� ǥ��
			</td>
			<td>
				����
				${infoBoard.area_xpoint}, ${infoBoard.area_xpoint}
			</td>
		</tr>
		<tr>
			<td>
				���� ��Ī : 
				${infoBoard.area_name}
			</td>
			<td>
				�����Ī : 
				${infoBoard.area_name_specific}
			</td>
		</tr>
		<tr>
			<td>
				�������� : ${infoBoard.score_category_a},
				ȯ������ : ${infoBoard.score_category_b},
				�԰Ÿ����� : ${infoBoard.score_category_c},
				��Ÿ���� : ${infoBoard.score_category_d}
			</td>
		</tr>
		<tr>
			<th>÷������</th>
				<core:if test = "${empty infoBoard.board_attached_file}">
					<td><a href="#">÷������ ����</a></td>
				</core:if>
				<core:if test = "${!empty infoBoard.board_attached_file}">
					<td><a href="file/${infoBoard.board_attached_file}">${infoBoard.board_attached_file}</a></td>
				</core:if>
		</tr>
		<core:if test = "${!empty sessionScope.login}">
		<tr>
			<td>
				<a href = "recommand.do?board_num=${infoBoard.board_num}&&board_type=${sessionScope.board_type}">��õ</a>
				<a href = "notRecommand.do?board_num=${infoBoard.board_num}&&board_type=${sessionScope.board_type}">����õ</a>
				<a href = "alert.do?board_num=${infoBoard.board_num}&&board_type=${sessionScope.board_type}">�Ű�</a>
			</td>
		</tr>
		</core:if>
		<core:if test = "${infoBoard.member_id == sessionScope.login}">
		<tr>
			<td colspan = "2">
				<a href = "updateForm.do?board_num=${infoBoard.board_num}&&board_type=${sessionScope.board_type}">[����]</a>
				<a href = "deleteForm.do?board_num=${infoBoard.board_num}&&board_type=${sessionScope.board_type}">[����]</a>
				<a href = "list.do?board_type=${sessionScope.board_type}">[���]</a>
			</td>
		</tr>
		</core:if>
	</core:if>
	
		<!--  information info -->
	<core:if test = "${sessionScope.board_type == 2}">
		<tr>
			<th>�۾���</th>
			<td>${infoBoard.member_id}</td>
		</tr>
		<tr>
			<th>����</th>
			<td>${infoBoard.board_subject}</td>
		</tr>
		<tr>
			<th>����</th>
			<td>${infoBoard.board_content}</td>
		</tr>
		<tr>
			<td>
				���� ǥ��
			</td>
			<td>
				����
				${infoBoard.area_xpoint}, ${infoBoard.area_xpoint}
			</td>
		</tr>
		<tr>
			<td>
			���� ��Ī
				${infoBoard.area_name}
			</td>
			<td>
			���� ���� ��
				${infoBoard.area_name_specific}
			</td>
		</tr>
		<tr>
			<th>÷������</th>
				<core:if test = "${empty infoBoard.board_attached_file}">
					<td><a href="#">÷������ ����</a></td>
				</core:if>
				<core:if test = "${!empty infoBoard.board_attached_file}">
					<td><a href="file/${infoBoard.board_attached_file}">${infoBoard.board_attached_file}</a></td>
				</core:if>
		</tr>
		<core:if test = "${!empty sessionScope.login}">
		<tr>
			<td>
				<a href = "recommand.do?board_num=${infoBoard.board_num}&&board_type=${sessionScope.board_type}">��õ</a>
				<a href = "notRecommand.do?board_num=${infoBoard.board_num}&&board_type=${sessionScope.board_type}">����õ</a>
				<a href = "alert.do?board_num=${infoBoard.board_num}&&board_type=${sessionScope.board_type}">�Ű�</a>
			</td>
		</tr>
		</core:if>
		<core:if test = "${infoBoard.member_id == sessionScope.login}">
		<tr>
			<td colspan = "2">
				<a href = "updateForm.do?board_num=${infoBoard.board_num}&&board_type=${sessionScope.board_type}">[����]</a>
				<a href = "deleteForm.do?board_num=${infoBoard.board_num}&&board_type=${sessionScope.board_type}">[����]</a>
				<a href = "list.do?board_type=${sessionScope.board_type}">[���]</a>
			</td>
		</tr>
		</core:if>
	</core:if>
	
		<!--  give info -->
	<core:if test = "${sessionScope.board_type == 3}">

		<tr>
			<th>�۾���</th>
			<td>${infoBoard.member_id}</td>
		</tr>
		<tr>
			<th>����</th>
			<td>${infoBoard.board_subject}</td>
		</tr>
		<tr>
			<th>����</th>
			<td>${infoBoard.board_content}</td>
		</tr>
		<tr>
			<td>
			����
				${infoBoard.area_name}
			</td>
			<td>
			���� ����
				${infoBoard.give_type}
			</td>
		</tr>
		<tr>
			<td>
				���� ���� : ${infoBoard.date_start_date}
			</td>
			<td>
				���� ���� : ${infoBoard.date_start_date}
			</td>
		</tr>
		<tr>
			<th>÷������</th>
				<core:if test = "${empty infoBoard.board_attached_file}">
					<td><a href="#">÷������ ����</a></td>
				</core:if>
				<core:if test = "${!empty infoBoard.board_attached_file}">
					<td><a href="file/${infoBoard.board_attached_file}">${infoBoard.board_attached_file}</a></td>
				</core:if>
		</tr>
		<core:if test = "${!empty sessionScope.login}">
		<tr>
			<td>
				<a href = "recommand.do?board_num=${infoBoard.board_num}&&board_type=${sessionScope.board_type}">��õ</a>
				<a href = "notRecommand.do?board_num=${infoBoard.board_num}&&board_type=${sessionScope.board_type}">����õ</a>
				<a href = "alert.do?board_num=${infoBoard.board_num}&&board_type=${sessionScope.board_type}">�Ű�</a>
			</td>
		</tr>
		</core:if>
		<core:if test = "${infoBoard.member_id == sessionScope.login}">
		<tr>
			<td colspan = "2">
				<a href = "updateForm.do?board_num=${infoBoard.board_num}&&board_type=${sessionScope.board_type}">[����]</a>
				<a href = "deleteForm.do?board_num=${infoBoard.board_num}&&board_type=${sessionScope.board_type}">[����]</a>
				<a href = "list.do?board_type=${sessionScope.board_type}">[���]</a>
			</td>
		</tr>
		</core:if>
	</core:if>
	
		<!--  activity info -->
	<core:if test = "${sessionScope.board_type == 4}">

		<tr>
			<th>�۾���</th>
			<td>${infoBoard.member_id}</td>
		</tr>
		<tr>
			<th>����</th>
			<td>${infoBoard.board_subject}</td>
		</tr>
		<tr>
			<th>����</th>
			<td>${infoBoard.board_content}</td>
		</tr>
		<tr>
			<td>
			Ȱ�� ����
				${infoBoard.area_name}
			</td>
			<td>
			Ȱ�� ��
				${infoBoard.activity_type}
			</td>
		</tr>
		<tr>
			<td>
				Ȱ�� ���� : ${infoBoard.date_start_date}
			</td>
			<td>
				Ȱ�� ���� : ${infoBoard.date_start_date}
			</td>
		</tr>
		<tr>
			<th>÷������</th>
				<core:if test = "${empty infoBoard.board_attached_file}">
					<td><a href="#">÷������ ����</a></td>
				</core:if>
				<core:if test = "${!empty infoBoard.board_attached_file}">
					<td><a href="file/${infoBoard.board_attached_file}">${infoBoard.board_attached_file}</a></td>
				</core:if>
		</tr>
		<core:if test = "${!empty sessionScope.login}">
		<tr>
			<td>
				<a href = "recommand.do?board_num=${infoBoard.board_num}&&board_type=${sessionScope.board_type}">��õ</a>
				<a href = "notRecommand.do?board_num=${infoBoard.board_num}&&board_type=${sessionScope.board_type}">����õ</a>
				<a href = "alert.do?board_num=${infoBoard.board_num}&&board_type=${sessionScope.board_type}">�Ű�</a>
			</td>
		</tr>
		</core:if>
		<core:if test = "${infoBoard.member_id == sessionScope.login}">
		<tr>
			<td colspan = "2">
				<a href = "updateForm.do?board_num=${infoBoard.board_num}&&board_type=${sessionScope.board_type}">[����]</a>
				<a href = "deleteForm.do?board_num=${infoBoard.board_num}&&board_type=${sessionScope.board_type}">[����]</a>
				<a href = "list.do?board_type=${sessionScope.board_type}">[���]</a>
			</td>
		</tr>
		</core:if>
	</core:if>
		<!--  comment list start -->
		
		<core:forEach var="listComment" items="${listComment}">
		<tr>
			<td style = "text-align : left">
				${listComment.member_id}
			</td>
			
			<td style = "text-align : center">${listComment.comment_content}</td>
			<td style = "text-align : center">${listComment.recommand_count}</td>
			<td style = "text-align : center">${listComment.not_recommand_count }</td>
			<fmt:formatDate var = "rdate" value="${listComment.comment_regdate}" pattern = "yyyy-MM-dd"/>
			<core:if test = "${today == rdate}">
				<!-- ������ ��� -->
				<td style = "text-align : center">
				<fmt:formatDate value = "${listComment.comment_regdate}" pattern = "HH:mm:ss"/>
				</td>
			</core:if>
			<core:if test = "${today != rdate}">
				<!--  ������ �ƴ� ��� -->
				<td style = "text-align : center">
				<fmt:formatDate value = "${listComment.comment_regdate}" pattern = "yyyy-MM-dd HH:mm"/>
				</td>
			</core:if>
			<core:if test = "${listComment.member_id == sessionScope.login}">
				<!--  ������ �ƴ� ��� -->
				<td style = "text-align : center">
					<a href = "deleteCommentForm.do?comment_num=${listComment.comment_num}">��� ����</a>
					<a href = "updateCommentForm.do?comment_num=${listComment.comment_num}&&comment_content=${listComment.comment_content}">��� ����</a>
				</td>
			</core:if>
			<core:if test = "${!empty sessionScope.login}">
				<td>
					<a href = "recommandComment.do?comment_num=${listComment.comment_num}">��õ</a>
					<a href = "notRecommandComment.do?comment_num=${listComment.comment_num}">����õ</a>
					<a href = "alertComment.do?comment_num=${listComment.comment_num}">�Ű�</a>
				</td>
			</core:if>
		</tr>
		</core:forEach>
		
		<!--  comment list end -->
		<core:if test = "${!empty sessionScope.login}">
		<tr>
			<td>
				<form action="${path}/movie/board/commentwrite.do" method="post" name="f" onsubmit="return inputcheck(this)">
					<input type = "hidden" name = "board_num" value = "${infoBoard.board_num}">
					<input type = "hidden" name = "member_id" value = "${sessionScope.login}">
					<input type = "hidden" name = "board_type" value = "${sessionScope.board_type}">
					<input type = "text" name = "comment_content" onfocus="this.value=''" value = "����� �Է��ϼ���" >
					<input type = "submit" value = "��� �ۼ�">
				</form>
			</td>
		</tr>
		</core:if>
		<core:if test = "${empty sessionScope.login}">
			<td>
				����ۼ��� �α��� �� �����մϴ�...
			</td>
		</core:if>
	</table>
</body>
</html>