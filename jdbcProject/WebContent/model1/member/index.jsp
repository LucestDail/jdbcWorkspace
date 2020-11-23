<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- index.jsp
만약 우리가 요청을 하게되면 주요한 주소가
localhost:8080/jspstudt1/model1/member/main.jsp 로 길어진다..
따라서 이 프로젝트 이름까지만 붙여주면 자동으로 main.jsp 를 호출하도록 만든 것입니다.
반드시 필요한것은 아닙니다.

로그인이 되어있으면 우리가 원하는 페이지를 보여줄 것이므로. main.jsp 를기준점으로 잡고 localhost:8080/jspstudy1 하면
바로 들어갈 수 있습니당...
이런 부분을 설정하는 것이 web.xml 에 있습니다.


--%>
<script type = "text/javascript">
	location.href = "model1/member/main.jsp";
</script>