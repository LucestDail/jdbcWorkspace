<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="core" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="decorator"
	uri="http://www.opensymphony.com/sitemesh/decorator"%>
<core:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Index</title>
<link rel="stylesheet" href="${path}/resource/mycss.css">
<style>
* {
	margin: 0;
	padding: 0;
}

.animation_canvas {
	overflow: hidden;
	position: relative;
	width: 600px;
	height: 400px;
}

.slider_panel {
	width: 3000px;
	position: relative;
}

.slider_image {
	float: left;
	width: 600px;
	height: 400px;
}

.slider_text_panel {
	position: absolute;
	top: 100px;
	left: 50px;
}

.slider_text {
	position: absolute;
	width: 250px;
}

.control_panel {
	position: absolute;
	top: 380px;
	left: 270px;
	height: 15px;
	overflow: hidden;
}

.control_button {
	width: 12px;
	height: 46px;
	position: relative;
	float: left;
	cursor: pointer;
	background: url("slidimg/point_button.png");
}

.control_button:hover {
	top: -16px;
}

.control_button:select {
	top: -31px;
}
</style>
</head>
<body>
	<table style="width: 100%; table-layout: fixed;" >
		<tr>
			<td colspan="2" rowspan="2">
				<div class="animation_canvas">
					<div class="slider_panel">
						<img src="${path}/resource/slidimg/Desert.jpg"
							class="slider_image"> <img
							src="${path}/resource/slidimg/movie.jpg" class="slider_image">
						<img src="${path}/resource/slidimg/cinema.jpg"
							class="slider_image"> <img
							src="${path}/resource/slidimg/Desert.jpg" class="slider_image">
						<img src="${path}/resource/slidimg/ticket.jpg"
							class="slider_image"> <img
							src="${path}/resource/slidimg/Desert.jpg" class="slider_image">
					</div>
					<div class="slider_text_panel">
						<div class="slider_text">
							<h1>movie picture1</h1>
							<p>����Ʈ �Ұ��Դϴ�...</p>
						</div>
						<div class="slider_text">
							<h1>movie picture2</h1>
							<p>��ȭ�����Դϴ�...</p>
						</div>
						<div class="slider_text">
							<h1>movie picture3</h1>
							<p>���帶���Դϴ�...</p>
						</div>
						<div class="slider_text">
							<h1>movie picture4</h1>
							<p>�����ٴ��Դϴ�...</p>
						</div>
						<div class="slider_text">
							<h1>movie picture5</h1>
							<p>���������Դϴ�...</p>
						</div>
						<div class="slider_text">
							<h1>movie picture6</h1>
							<p>Ȱ�������Դϴ�...</p>
						</div>
					</div>
					<div class="control_panel">
						<div class="control_button"></div>
						<div class="control_button"></div>
						<div class="control_button"></div>
						<div class="control_button"></div>
						<div class="control_button"></div>
						<div class="control_button"></div>
					</div>
				</div> <script type="text/javascript"
					src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js">
					
				</script> <script>
	$(function() {
		$(".control_button").each(function(index) {
			$(this).attr("idx", index);
		}).click(function() {
			let index = $(this).attr("idx");
			moveSlider(index);
		});
		$(".slider_text").css("left", -300).each(function(index) {
			$(this).attr("idx", index);
		});
		moveSlider(0);
		let index = 0;
		let inc = 1;
		setInterval(function() {
			if (index >= 4)
				inc = -1;
			if (index <= 0)
				inc = 1;
			index += inc;
			moveSlider(index);
		}, 4000);
		function moveSlider(index) {
			let moveLeft = -(index * 600);
			$(".slider_panel").animate({
				left : moveLeft
			}, 'slow');
			$(".control_button[idx=" + index + "]").addClass("select");
			$(".control_button[idx!=" + index + "]").removeClass("select");
			$(".slider_text[idx=" + index + "]").show().animate({
				left : 0
			}, 'slow');
			$(".slider_text[idx!=" + index + "]").hide('slow', function() {
				$(this).css("left", -300);
			});
		}
	});

	function inputcheck(f) {
		if (f.id.value == '') {
			alert("���̵� �Է��ϼ���");
			f.id.focus();
			return false;
		}
		if (f.id.value.length < 4) {
			alert("���̵�� 4�ڸ� �̻� �Է��ϼ���");
			f.id.focus();
			return false;
		}
		if (f.pass.value == '') {
			alert("��й�ȣ�� �Է��ϼ���");
			f.pass.focus();
			return false;
		}
		return true;
	}
	function win_open(page) {
		var op = "width = 500, height=350, left=50, top=150";
		open(page + ".me", "", op);
	}
</script>
			</td>
			
			
			<!-- �������� �޴� -->
			<td>��������â</td>

			<td style = "width:25%; height:30%; border:1px solid black;">
			<core:if test="${!empty sessionScope.login}">
					<table>
						<tr>
							<td align = "center">
								<img src="${path}/movie/member/picture/${sessionScope.picture}" style="width: 32px; height:48px;">
							</td>
							<td align = "center">
								ȯ���մϴ�! <strong>${sessionScope.login}</strong>��
							</td>
						</tr>
						<tr>
							<td>
								<a href="${path}/movie/member/logout.me" class = "redbutton">�α׾ƿ�</a>
							</td>
							<td>
								<a href="${path}/movie/member/info.me?id=${sessionScope.login}" class = "normalbutton">������</a>
							</td>
						</tr>
					</table>
				</core:if> <core:if test="${empty sessionScope.login}">
				
					<form action="${path}/movie/member/login.me" method="post" name="f" onsubmit="return inputcheck(this)">
						<table>
							<tr>
								<td align = "center"><input type="text" name="id" onfocus="this.value=''" value = "���̵� �Է��ϼ���"></td>
								<td rowspan = "2">
									<input type="submit" class="normalbutton" value="��  ��  ��" style = "width:100%;">
								</td>
							</tr>
							<tr>
								<td align = "center"><input type="password" name="pass" onfocus="this.value=''" value = "��й�ȣ�� �Է��ϼ���"></td>
							</tr>
							<tr>
								<td>
									<input type="button" class="redbutton" value="ȸ������" style = "width:100%;" onclick="location.href = '${path}/movie/member/joinForm.me'">
								</td>
								<td>
									<input type="button" class="normalbutton" value="���̵�ã��" style = "width:100%;" onclick="win_open('idForm')">
								</td>
								<td>
									<input type="button" class="normalbutton" value="��й�ȣã��" style = "width:100%;" onclick="win_open('pwForm')">
								</td>
							</tr>
						</table>
					</form>
				</core:if>
				
				</td>
		</tr>
		<tr>
			<td colspan="2" rowspan="2">���ȸ�� �׷��� ǥ��</td>
		</tr>
		<tr>
			<td>��ȸ�� ���� �������� 10�� ǥ��</td>
			<td>��õ�� ���� �������� 10�� ǥ��</td>
		</tr>


	</table>
</body>
</html>