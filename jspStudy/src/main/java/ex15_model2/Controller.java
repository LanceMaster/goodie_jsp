package ex15_model2;

import java.io.FileInputStream;
import java.io.IOException;
import java.lang.reflect.Method;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Controller
 */
@WebServlet(urlPatterns = { "*.do" }, initParams = { @WebInitParam(name = "properties", value = "url.properties") })
public class Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Properties pr = new Properties();
	private Action action = new Action();
	private Class[] paramType = new Class[] { HttpServletRequest.class, HttpServletResponse.class };

	public Controller() {
		super();
	}

	/**
	 *     
	 */
	@Override
	public void init(ServletConfig config) throws ServletException {
		FileInputStream f = null;
		String props = config.getInitParameter("properties");
		try {
			f = new FileInputStream(config.getServletContext().getRealPath("/") + "WEB-INF/" + props);
			pr.load(f);
			f.close();
		} catch (Exception e) {
			// TODO: handle exception
		}
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		Object[] paramObjs = new Object[] { request, response };
		ActionForward forward = null;
		String command = null;
		try {
			command = request.getRequestURI().substring(request.getContextPath().length());
			String methodName = pr.getProperty(command);
			Method method = action.getClass().getMethod(methodName, paramType);
			forward = (ActionForward) method.invoke(action, paramObjs);
		} catch (NullPointerException e) {
			forward = new ActionForward();
		} catch (Exception e) {
			throw new ServletException(e);
		}
		if (forward != null) {
			if (forward.isRedirect()) {
				response.sendRedirect(forward.getView());
			} else {
				RequestDispatcher disp = request.getRequestDispatcher(forward.getView());
				disp.forward(request, response);
			}
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
