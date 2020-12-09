package osh.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface OshAction {
	OshActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception;

}
