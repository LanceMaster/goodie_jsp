package ex15_model2;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Action {

	public ActionForward hello(HttpServletRequest request, HttpServletResponse response) {
		request.setAttribute("hello", "HELLO WORLD");
		return new ActionForward(false, "ex15_model2/hello.jsp");
	}

}
