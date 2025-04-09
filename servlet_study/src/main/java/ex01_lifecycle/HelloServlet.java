package ex01_lifecycle;

import java.io.IOException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class HelloServlet
 */
@WebServlet("/HelloServlet")
public class HelloServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	/**
	 * 1. 생성자 1)가장 먼저 호출됨 2)한번 생성된 객체는 재사용됨 3)생정자 호출후 init 메서드 호출
	 */
	public HelloServlet() {
		super();
		System.out.println("생성자 호출");
	}

	/**
	 * 1. init() 1) 서블릿 환경 설정 담당 2) init() 메서드 호출 후 service() 메서드 호출
	 * 
	 */

	@Override
	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
		// config 객체 : servlet의 환경 설정값을 저장하고있는 객체
		System.out.println("init 메서드 호출");
	}

	/**
	 * 2. service() 1)클라이언트의 요청시 호출되는 메서드 2)클라이언트의 요청 처리 3)요청 방식 (get, post ) 방식에 따라
	 * doget,dopost 호출함 4)service() 메서드를 구현하지않으면 doget dopost 메서드 호출함
	 */

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("service 호출");
		switch (req.getMethod()) {
		case "GET":
			doGet(req, resp);
			break;

		case "POST":
			doPost(req, resp);
			break;
		}
	}
	
	

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 * 
	 *      4. doGet() 1) GET방식 요청처리하는 메서드 2) GET방식 요청 => 기본 요청방식 진짜 거의 모든게 다 GET임
	 *      (1) <form action="http://local> (2) a href (3) location.href (4) open
	 *      (5) $.ajax({ type : "GET", url : "url"})
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// request 요청객체. 클라이언트로 부터 전달 받은 정보 저장
		// response 응답객체. 클라이언트에 전달할 정보 저장 
		//PrintWriter getWriter() : 문자형 출력스트림
		//append() , writer() , print() , println() : 브라우저로 리턴을 할수가있다.
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 * 
	 */
	/**
	 * 5. doPost() 1) POST방식의 요청을 처리하는 메서드 2) POST방식의 요청 방법 <for method = "POST"
	 * $.ajax({type : "POST"
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
