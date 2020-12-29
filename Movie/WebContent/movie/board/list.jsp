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

		<!--  movie board type selected start-->
		<core:if test = "${param.board_type == 0}">
		<tr>
			<td>��ȭ ������
			</td>
			<td>��ȭ ����
			</td>
			<td>��ȭ ���� ��ȣ�ۿ�
			<table>
				<tr>
					<td>
						���ƿ�
					</td>
				</tr>
				<tr>
					<td>
						�þ��
					</td>
				</tr>
				<tr>
					<td>
						���ǿ�
					</td>
				</tr>
			</table>
			</td>
		</tr>
		<tr>
			<th width = "5%">�� ��ȣ</th>
			<th width = "40%"> ���� ����</th>
			<th width = "10%"> �ۼ���</th>
			<th width = "10%">����</th>
			<th width = "10%"> �ۼ�����</th>
			<th width = "10%">��ȸ��</th>
			<th width = "10%">��õ</th>
			<th width = "10%">����õ</th>	
		</tr>
		<core:forEach var="board" items="${list}">
		<tr>
			<!--  �۹�ȣ -->
			<td>${boardnum}</td>
			<core:set var = "boardnum" value = "${boardnum -1 }"/>
			<!-- �� ���� -->
			<td style = "text-align : left">
				<a href = "info.do?board_num=${board.board_num}&&board_type=${param.board_type}">${board.board_subject}(${board.counter})</a>
			</td>
			<!--  �ۼ��� -->
			<td>${board.member_id}</td>
			<!--  ���� -->
			<td>${board.score_category_a + board.score_category_b + board.score_category_c + board.score_category_d}</td>
			<!--  �ۼ����� -->
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
			<!--  ��ȸ��-->
			<td>${board.board_readcnt}</td>
			<!--  ��õ -->
			<td>${board.recommand_count}</td>
			<!--  ��õ -->
			<td>${board.not_recommand_count}</td>
		</tr>
		</core:forEach>
		</core:if>
		<!--  movie board type end -->
		
		
		
		<!--  theater board type start-->
		<core:if test = "${param.board_type == 1}">
		<tr>
			<th width = "5%">�� ��ȣ</th>
			<th width = "10%"> ���� ��Ī</th>
			<th width = "10%"> ���� ��Ī</th>
			<th width = "30%"> ����</th>
			<th width = "10%"> �ۼ���</th>
			<th width = "5%">����</th>
			<th width = "10%"> �ۼ�����</th>
			<th width = "5%">��ȸ��</th>
			<th width = "5%">��õ</th>
			<th width = "5%">����õ</th>	
		</tr>
		
		<core:forEach var="board" items="${list}">
		<tr>
			<td>${boardnum}</td>
			<core:set var = "boardnum" value = "${boardnum -1 }"/>
			
			<td>${board.area_name}</td>
			<td>${board.area_name_specific}</td>
			
			<td style = "text-align : left">
				<a href = "info.do?board_num=${board.board_num }&&board_type=${param.board_type}">${board.board_subject}(${board.counter})</a>
			</td>
			
			<td>${board.member_id}</td>
			
			<!--  ���� -->
			<td>${board.score_category_a + board.score_category_b + board.score_category_c + board.score_category_d}</td>
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
			<!--  ��ȸ��-->
			<td>${board.board_readcnt}</td>
			<!--  ��õ -->
			<td>${board.recommand_count}</td>
			<!--  ��õ -->
			<td>${board.not_recommand_count}</td>
		</tr>
		</core:forEach>
		</core:if>
		<!--  theater board type end -->
		
		
		
		<!--  information board type start-->
		<core:if test = "${param.board_type == 2}">
		<tr>
			<th width = "5%"> ��ȣ</th>
			<th width = "5%"> �з�</th>
			<th width = "30%"> ����</th>
			<th width = "5%"> �ۼ���</th>
			<th width = "20%"> �ۼ�����</th>
			<th width = "5%"> ��ȸ��</th>
			<th width = "5%">��õ</th>
			<th width = "5%">����õ</th>
		</tr>
		
		<core:forEach var="board" items="${list}">
		<tr>
			<td>${boardnum}</td>
			<td>${board.information_type}</td>
			<core:set var = "boardnum" value = "${boardnum -1 }"/>
			<td style = "text-align : left">
				<a href = "info.do?board_num=${board.board_num }&&board_type=${param.board_type}">${board.board_subject}(${board.counter})</a>
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
						<!--  ��õ -->
			<td>${board.recommand_count}</td>
			<!--  ��õ -->
			<td>${board.not_recommand_count}</td>
		</tr>
		</core:forEach>
		</core:if>
		<!--  information board type end -->
		
		
		
		<!--  give board type start-->
		<core:if test = "${param.board_type == 3}">
		<tr>
			<th width = "5%"> ��ȣ</th>
			<th width = "5%"> �з�</th>
			<th width = "30%"> ����</th>
			<th width = "10%"> �ۼ���</th>
			<th width = "10%"> �ۼ�����</th>
			<th width = "15%"> ��������</th>
			<th width = "10%"> ��ȸ��</th>
			<th width = "5%"> ���� </th>
			<th width = "5%">��õ</th>
			<th width = "5%">����õ</th>
		</tr>
		
		<core:forEach var="board" items="${list}">
		<tr>
			<td>${boardnum}</td>
			<core:set var = "boardnum" value = "${boardnum -1 }"/>
			
			<td>${board.give_information_type}</td>
			
			<td style = "text-align : left">
				<a href = "info.do?board_num=${board.board_num }&&board_type=${param.board_type}">${board.board_subject}(${board.counter})</a>
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
			
			<td><fmt:formatDate value = "${board.date_start_date}" pattern = "yyyy-MM-dd"/> ~ <fmt:formatDate value = "${board.date_end_date}" pattern = "yyyy-MM-dd"/></td>
			
			<td>${board.board_readcnt}</td>
			
			<td>${board. give_state }</td>
						<!--  ��õ -->
			<td>${board.recommand_count}</td>
			<!--  ��õ -->
			<td>${board.not_recommand_count}</td>
		</tr>
		</core:forEach>
		</core:if>
		<!--  give board type end -->
		
		
		
		<!--  activity board type start-->
		<core:if test = "${param.board_type == 4}">
		Ȱ�������� �Խ��� ����
		<tr>
			<th width = "5%"> ��ȣ</th>
			<th width = "5%"> ����</th>
			<th width = "5%"> �з�</th>
			<th width = "20%"> ����</th>
			<th width = "10%"> �ۼ���</th>
			<th width = "10%"> �ۼ�����</th>
			<th width = "15%"> Ȱ���Ⱓ</th>
			<th width = "5%"> ������</th>
			<th width = "5%"> ����</th>
			<th width = "5%"> ��ȸ��</th>
			<th width = "5%">��õ</th>
			<th width = "5%">����õ</th>
		</tr>
		
		<core:forEach var="board" items="${list}">
		<tr>
			<td>${boardnum}</td>
			<core:set var = "boardnum" value = "${boardnum -1 }"/>
			
			<td>${board.area_name}</td>
			
			<td>${board.activity_type}</td>
			
			<td style = "text-align : left">
				<a href = "info.do?board_num=${board.board_num }&&board_type=${param.board_type}">${board.board_subject}(${board.counter})</a>
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
			
			<td><fmt:formatDate value = "${board.date_start_date}" pattern = "yyyy-MM-dd"/> ~ <fmt:formatDate value = "${board.date_end_date}" pattern = "yyyy-MM-dd"/></td>
			<td>�����μ�</td>
			<td>${board.activity_able}</td>
			<td>${board.board_readcnt}</td>
						<!--  ��õ -->
			<td>${board.recommand_count}</td>
			<!--  ��õ -->
			<td>${board.not_recommand_count}</td>
		</tr>
		</core:forEach>
		</core:if>
		<!--  activity board type end -->
		
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
			<core:if test = "${!empty sessionScope.login}">
			<td colspan = "5" style = "text-align:right">
				<a href = "writeForm.do?board_type=${sessionScope.board_type}">[�۾���]</a>
			</td>
			</core:if>
			<core:if test = "${empty sessionScope.login}">
			<td colspan = "5" style = "text-align:right">
				���ۼ��� �α��� �� �����մϴ�...
			</td>
			</core:if>
		</tr>
	</table>
	<form action = "list.do" method = "post" name = "sf">
		<div style = "display : flex; justify-content : center;">
			<input type = "hidden" name = "pageNum" value = "1">
			<input type = "hidden" name = "Paramfind" value = "${find}">
			<input type = "hidden" name = "Paramcolumn" value = "${column}">
			<input type = "hidden" name = "board_type" value = "${sessionScope.board_type}">
				<select name = "column">
					<option value = ""> �����ϼ���</option>
					<option value = "board_subject"> ����</option>
					<option value = "member_id"> �ۼ���</option>
					<option value = "board_content"> ����</option>
					<option value = "board_subject, member_id"> ���� + �ۼ���</option>
					<option value = "board_subject, board_content"> ���� + ����</option>
					<option value = "member_id, board_content"> �ۼ��� + ����</option>
					<option value = "board_subject, member_id, board_content"> ���� + �ۼ��� + ����</option>
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