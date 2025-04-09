package ex02_urlmapping;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class HiServlet
 */

/**
 * urlmapping 방법 1.@webservlet 어너테이션방식
 * 
 * @webservlet(urlmapping) 2.web.xml에서 servlet-mapping으로 추가 가능함 (근데 번거로운듯
 *                         web.xml을 안쓰는게 좋을듯하다.) (내가 만든 servlet이 아닐때 web.xml에
 *                         설정하면 가능할거같다. 대표적으로 spring 일거같다.)
 * 
 */
// 2가지로도 가능하다
//@WebServlet({"/hi","/hello"})
public class HiServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public HiServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
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
