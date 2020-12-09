package action.osh;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import osh.action.OshActionForward;
import osh.model.Osh;
import osh.model.OshDao;

public class OshAction {
	OshDao dao = new OshDao();
	public OshActionForward osh(HttpServletRequest request, HttpServletResponse response) {
     	String column = request.getParameter("column");
     	String find = request.getParameter("find");
     	if(column == null || column.trim().equals("")||find == null || find.trim().equals("")) {
     		column = null;
     		find = null;
     	}
     	int count = dao.Count(column, find);
     	List<Osh> list = dao.list(column, find);
     	request.setAttribute("recordcnt", count);
     	request.setAttribute("list", list);
		return new OshActionForward();
	}

}
