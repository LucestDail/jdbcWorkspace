package controller;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;
import action.Action;
import action.ActionForward;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 * Servlet implementation class ControllerServlet
 */
@WebServlet(
		urlPatterns = {"*.me"},
		initParams = {
				@WebInitParam(
						name = "properties",
						value = "action.properties")
				}
		)
public class ControllerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Map<String, Action> commandMap = new HashMap<>();
    public ControllerServlet() {
        super();
    }
    //config : ("properties","action.properties")
    //	@WebInitParam ��ü�� ���޵�.
    
    @Override // ControllerServlet Ŭ������ ��ü ������ �ѹ� ȣ��
    public void init(ServletConfig config) throws ServletException{
    	//props : action.properties
    	String props = config.getInitParameter("properties");
    	//Properties : Hashtable ����Ŭ������!
    	//Hashtable �� ��<- ��ü�Դϴ�...
    	//<String, String> map ��ü��� �� �� �ֽ��ϴ�..
    	Properties pr = new Properties();
    	FileInputStream f = null;
    	try {
    		//f : action.properties ������ �б� ���� �Է½�Ʈ��
    		f = new FileInputStream(config.getServletContext().getRealPath("/") + "WEB-INF/" + props);
    		//model2/hello.me = action.HelloAction
    		//key : /model2/hello.me
    		//value : action.HelloAction
    		//("/model2/hello.me","action.HelloAction") ������ Ű��, �������� ����� �ڵ����� ������ �ϴ� �Լ�!
    		pr.load(f);
    	}catch(IOException e) {
    		throw new ServletException(e);
    	}finally {
    		try {
    			if(f != null) {
    				f.close();
    			}
    		}catch(IOException e) {
    			e.printStackTrace();
    		}
    	}
    	for(Object k : pr.keySet()) {
    		String command = (String)k;
    		//className : "action.HelloAction"
    		String className = pr.getProperty(command);
    		try {
    			//commandClass : action.HelloAction Ŭ��������
    			Class commandClass = Class.forName(className.trim());
    			//newInstance() : ��üȭ �ض�...
    			//commandObj : action.HelloAction ��ü�� ������.
    			Object commandObj = commandClass.newInstance();
    			commandMap.put(command, (Action)commandObj);
    		}catch(Exception e) {
    			throw new ServletException(e);
    		}
    	}
    }
    
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//http://localhost:8080/jspstudy2/model2/hello.me
		request.setCharacterEncoding("euc-kr");
		Action action = null;
		ActionForward forward = null;
		String command = null;
		try {
			
			//request.getRequestURI() : /jspstudy2/model2/hello.me
			//request.getContextPath() : /jspstudy2
			//command : /model1/hello.me
			command = request.getRequestURI().substring(request.getContextPath().length());
			action = commandMap.get(command);
			System.out.println(request.getSession().getAttribute("login") + " : " + command);
			forward = action.execute(request, response);
		}catch(NullPointerException e) {
			forward = new ActionForward();
		}catch(Exception e) {
			throw new ServletException(e);
		}
		if(forward != null) {
			if(forward.isRedirect()) {
				response.sendRedirect(forward.getView());
			}else {
				if(forward.getView() == null) {
					forward.setView(command.replace(".me", ".jsp"));
				}
				
				//forward.getView() : hello.jsp
				RequestDispatcher disp = request.getRequestDispatcher(forward.getView());
				disp.forward(request, response); //forward
			}
		}
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
