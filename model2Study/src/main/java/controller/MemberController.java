package controller;

import java.io.FileInputStream;
import java.io.UnsupportedEncodingException;
import java.lang.reflect.Member;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import gdu.mskim.MSLogin;
import gdu.mskim.MskimRequestMapping;
import gdu.mskim.RequestMapping;
import model.member.MemberDAO;
import model.member.member;

/*
http://localhost:8080/model2Study/member/joinForm
http://localhost:8080/model2Study/member/loginForm
=> @RequestMapping("joinForm") => 필요
   구현되지 않은 경우
   /member/joinForm url 정보를 이용하여 /wepapp/view/member/joinForm.jsp 페이지가
    View 로 설정되도록 구현
   /member/loginForm url 정보를 이용하여 /wepapp/view/member/loginForm.jsp 페이지가
    View 로 설정되도록 구현
*/
@WebServlet(urlPatterns = { "/member/*" }, initParams = { @WebInitParam(name = "view", value = "/view/") })
public class MemberController extends MskimRequestMapping {
	private MemberDAO dao = new MemberDAO();

	/*
	 * 1. 파라미터 정보를 Member 객체에 저장. 인코딩 필요(Filter 이용) 2. Member 객체를 이용하여 db에 insert
	 * (member 테이블) 저장 3. 가입성공 : 성공 메세지 출력 후 loginForm 페이지 이동 가입실패 : 실패 메세지 출력 후
	 * joinForm 페이지 이동
	 */
	@RequestMapping("join") // http://localhot:8080/model2Study/member/join
	public String join(HttpServletRequest request, HttpServletResponse response) {

		member mem = new member();
		mem.setId(request.getParameter("id"));
		mem.setPass(request.getParameter("pass"));
		mem.setName(request.getParameter("name"));
		mem.setGender(Integer.parseInt(request.getParameter("gender")));
		mem.setTel(request.getParameter("tel"));
		mem.setEmail(request.getParameter("email"));
		mem.setPicture(request.getParameter("picture"));
		if (dao.insertMember(mem)) {
			request.setAttribute("msg", mem.getName() + "님 회원 가입 되었습니다.");
			request.setAttribute("url", "loginForm");
		} else {
			request.setAttribute("msg", mem.getName() + "님 회원가입시 오류 발생했습니다.");
			request.setAttribute("url", "joinForm");
		}
		return "alert"; // view의 이름
	}

	@RequestMapping("login")
	public String login(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		String pass = request.getParameter("pass");
		member mem = dao.selectOne(id);
		String msg = null;
		String url = null;
		if (mem == null) {
			msg = "아이디를 확인하세요";
			url = "loginForm";
		} else if (!pass.equals(mem.getPass())) {
			msg = "비밀번호를 확인하세요";
			url = "loginForm";
		} else {
			msg = mem.getName() + "님 반갑습니다";
			url = "main";
			request.getSession().setAttribute("login", id);
		}
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		return "alert";
	}

	@RequestMapping("main")
	public String main(HttpServletRequest request, HttpServletResponse response) {
		String login = (String) request.getSession().getAttribute("login");
		if (login == null || login.trim().equals("")) {
			request.setAttribute("msg", "로그인 하세요");
			request.setAttribute("url", "loginForm");
			return "alert";
		}
		return "member/main"; // forward 됨
	}

	@RequestMapping("logout")
	public String logout(HttpServletRequest request, HttpServletResponse response) {
		request.getSession().invalidate();
		return "redirect:loginForm"; // redirect 하도록 설정
	}

	/*
	 * 1. 로그인 상태 검증 => @MSLogin("loginIdCheck") loginIdCheck() 함수를 호출하여 검증실행 리턴값이
	 * null인 경우 info() 호출함 로그아웃상태 : 로그인하세요 메세지, loginForm 페이지로 이동 로그인 상태 : - 다른 id를
	 * 조회할 수 없음. 단 관리자는 다른 id 조회가능함 내정보만 조회 가능합니다. 메세지 출력. main 페이지 이동 2. id 파라미터 조회
	 * 3. id에 해당하는 레코드를 조회하여 Member 객체에 저장(mem)
	 */
	@RequestMapping("info")
	@MSLogin("loginIdCheck")
	public String info(HttpServletRequest request, HttpServletResponse response) {
		// 실행되는 경우는 로그인 검증이 완료된 경우
		String id = request.getParameter("id");
		member member = dao.selectOne(id);
		request.setAttribute("mem", member);
		return "member/info";
	}

	@RequestMapping("updateForm")
	@MSLogin("loginIdCheck")
	public String updateForm(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		member member = dao.selectOne(id);
		request.setAttribute("mem", member);
		return "member/updateForm";
	}

	/*
	 * 1. 모든 파라미터를 Member 객체에 저장하기 2. 입력된 비밀번호와 db에 저장된 비밀번호 비교. 관리자로 로그인 한 경우
	 * 관리자비밀번호로 비교 본인 정보 수정시 본인의 비밀번호로 비교 불일치 : '비밀번호 오류' 메세지 출력후 updateForm 페이지 이동
	 * 3. Member 객체의 내용으로 db를 수정하기 : boolean MemberDao.update(Member) - 성공 : 회원정보 수정
	 * 완료 메세지 출력후 info로 페이지 이동 - 실패 : 회원정보 수정 실패 메세지 출력 후 updateForm 페이지 이동
	 */
	@RequestMapping("update")
	@MSLogin("loginIdCheck")
	public String update(HttpServletRequest request, HttpServletResponse response) {
		member mem = new member();
		mem.setId(request.getParameter("id"));
		mem.setPass(request.getParameter("pass"));
		mem.setName(request.getParameter("name"));
		mem.setGender(Integer.parseInt(request.getParameter("gender")));
		mem.setTel(request.getParameter("tel"));
		mem.setEmail(request.getParameter("email"));
		mem.setPicture(request.getParameter("picture"));
		// 2 비밀번호를 위한 db의 데이터 조회. : login 정보로 조회하기
		String login = (String) request.getSession().getAttribute("login");
		member dbMem = dao.selectOne(login);
		String msg = "비밀번호가 틀립니다.";
		String url = "updateForm?id=" + mem.getId();
		if (mem.getPass().equals(dbMem.getPass())) {
			if (dao.update(mem)) {
				msg = "회원정보 수정완료";
				url = "info?id=" + mem.getId();
			} else {
				msg = "회원정보 수정실패";
			}
		}
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		return "alert";
	}

	@RequestMapping("deleteForm")
	@MSLogin("loginIdCheck")
	public String deleteForm(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		if (id.equals("admin")) {
			request.setAttribute("msg", "관리자는 탈퇴할 수 없습니다.");
			request.setAttribute("url", "info?id=" + id);
			return "alert";
		}
		return "member/deleteForm";
	}

	/*
	 * 1. 2개의 파라미터 정보 변수 저장 2. 로그인정보 검증 - 로그아웃상태 : 로그인하세요. loginForm.jsp로 페이지 이동 -
	 * 본인만 탈퇴가능(관리자는 제외) : 본인만 탈퇴 가능합니다. main.jsp 페이지 이동 - 관리자가 탈퇴는 불가 : 관리자는
	 * 탈퇴불가합니다. list.jsp로 페이지 이동 3. 비밀번호 검증 - 로그인 정보로 비밀번호 검증. - 비밀번호 불일치 : 비밀번호 오류
	 * 메세지 출력. deleteForm.jsp로 페이지 이동 4. db에서 id에 해당하는 회원정보 삭제하기 boolean
	 * MemberDao.delete(id) 탈퇴 성공 - 일반사용자 : 로그아웃실행. 탈퇴메세지 출력, loginForm.jsp로 페이지 이동
	 * - 관리자 : 탈퇴메세지 출력. list.jsp로 페이지 이동 탈퇴 실패 - 일반사용자 : 탈퇴실패메세지 출력, main.jsp로 페이지
	 * 이동 - 관리자 : 탈퇴실패메세지 출력. list.jsp로 페이지 이동
	 */
	@RequestMapping("delete")
	@MSLogin("loginIdCheck")
	public String delete(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		String pass = request.getParameter("pass");
		String login = (String) request.getSession().getAttribute("login");
		if (id.equals("admin")) {
			request.setAttribute("msg", "관리자는 탈퇴할 수 없습니다.");
			request.setAttribute("url", "info?id=" + id);
			return "alert";
		}
		member dbMem = dao.selectOne(login);
		String msg = "비밀번호 오류 입니다.";
		String url = "deleteForm?id=" + id;
		if (pass.equals(dbMem.getPass())) {
			if (login.equals("admin"))
				url = "list";
			if (dao.delete(id)) {
				msg = id + "회원 탈퇴 성공";

				if (!login.equals("admin")) {
					request.getSession().invalidate();
					url = "loginForm";
				}
			} else {
				msg = id + "회원 탈퇴 실패";
				if (!login.equals("admin")) {
					url = "main";
				}
			}
		}
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		return "alert";
	}

	@RequestMapping("list")
	@MSLogin("loginAdminCheck")
	public String list(HttpServletRequest request, HttpServletResponse response) {
		List<member> list = dao.list();
		request.setAttribute("list", list);
		return "member/list";
	}

	/**
	 * 아이디 찾기
	 * 
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("findId")
	public String findId(HttpServletRequest request, HttpServletResponse response) {

		String email = request.getParameter("email");

		String tel = request.getParameter("tel");

		System.out.println(email + "," + tel);

		String findId = dao.idSearch(email, tel);

		request.setAttribute("findId", findId);

		return findId;
	}

	/**
	 * 이메일 발송 폼 (SMTP 서버를 이용항 메일 전송하기 >
	 * 
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("mailForm")
	@MSLogin("loginAdminCheck")
	public String mailForm(HttpServletRequest request, HttpServletResponse response) {
		String ids[] = request.getParameterValues("idchks");
		List<member> list = dao.emailList(ids);
		request.setAttribute("list", list);
		return "member/mailForm";
	}

	@RequestMapping("mailSend")
	@MSLogin("loginAdminCheck")
	public String mailSend(HttpServletRequest request, HttpServletResponse response) {
		String sender = request.getParameter("googleid") + "@gmail.com";
		String passwd = request.getParameter("googlepw");
		String recipient = request.getParameter("recipient");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String mtype = request.getParameter("mtype");
		Properties props = new Properties();
		try {
			String path = request.getServletContext().getRealPath("/WEB-INF/mail.properties");
			FileInputStream fis = new FileInputStream(path);
			props.load(fis);
			props.put("mail.smtp.user", sender);

		} catch (Exception e) {
			e.printStackTrace();
		}
		MyAuthenticator auth = new MyAuthenticator(sender, passwd);
		Session mailSession = Session.getInstance(props, auth);
		MimeMessage msg = new MimeMessage(mailSession);
		List<InternetAddress> addrs = new ArrayList<InternetAddress>();
		try {
			String[] emails = recipient.split(",");
			for (String email : emails) {
				try {

					addrs.add(new InternetAddress((new String(email.getBytes("UTF-8"), "ISO-8859-1"))));
				} catch (UnsupportedEncodingException e) {
					e.printStackTrace();
				}

			}
			InternetAddress[] address = new InternetAddress[emails.length];
			for (int i = 0; i < emails.length; i++) {
				address[i] = addrs.get(i);
			}
			InternetAddress from = new InternetAddress(sender);
			msg.setFrom(from);
			msg.setRecipients(Message.RecipientType.TO, address);
			msg.setSubject(title);
			msg.setText(content);
			Multipart multipart = new MimeMultipart();
			MimeBodyPart body = new MimeBodyPart();
			body.setContent(content, mtype);
			multipart.addBodyPart(body);
			msg.setContent(multipart);
			Transport.send(msg);
		} catch (Exception e) {
			e.printStackTrace();
		}
		request.setAttribute("msg", "메일이 전송되었습니다.");
		request.setAttribute("url", "list");
		return "alert";
	}

	@RequestMapping("password")
	@MSLogin("passwordLoginCheck")
	public String passwordForm(HttpServletRequest request, HttpServletResponse response) {
		// 비밀번호 변경 폼 변경비밀번호 변경비밀번호 확인

		String pass = request.getParameter("old_password");
		String chgpass = request.getParameter("new_password");

		// 비밀번호 검증

		if (pass.equals(chgpass)) {
			request.setAttribute("msg", "비밀번호가 같습니다.");
			request.setAttribute("url", "passwordForm");
			return "alert";
		}

		// 멤버 정보 갖고오기
		String login = (String) request.getSession().getAttribute("login");
		member dbmem = dao.selectOne(login);
		// dbmem와 pass가 다를경우
		if (!pass.equals(dbmem.getPass())) {
			request.setAttribute("msg", "비밀번호가 틀립니다.");
			request.setAttribute("url", "passwordForm");
			return "alert";
		} else {
			// dbpass와 pass가 같을경우
			if (dao.updatePass(login, pass, chgpass)) {
				// 비밀번호 변경 성공
				request.setAttribute("msg", "비밀번호 변경 완료");
				request.setAttribute("url", "info?id=" + login);
				System.out.println("MSG : " + request.getAttribute("msg") + " , URL : " + request.getAttribute("url"));
				return "openalert";
			} else {
				// 비밀번호 변경 실패
				StringBuilder sb = new StringBuilder();
				sb.append("alert('비밀번호 수정시 오류 발생.');\n");
				sb.append("self.close()");
				request.setAttribute("script", sb.toString());
				return "dummy";
			}
		}

	}

	// ================================================

	public String passwordLoginCheck(HttpServletRequest request, HttpServletResponse response) {
		String login = (String) request.getSession().getAttribute("login");
		if (login == null || login.trim().equals("")) {
			request.setAttribute("msg", "로그인 하세요");
			request.setAttribute("url", "loginForm");
			System.out.println("MSG : " + request.getAttribute("msg") + " , URL : " + request.getAttribute("url"));
			return "openalert";
		}
		return null; // 정상인 경우

	}

	// ================================================
	public final class MyAuthenticator extends Authenticator {
		private String id;
		private String pw;

		public MyAuthenticator(String id, String pw) {
			this.id = id;
			this.pw = pw;
		}

		protected PasswordAuthentication getPasswordAuthentication() {
			return new PasswordAuthentication(id, pw);
		}
	}

	// ================================================

	public String loginAdminCheck(HttpServletRequest request, HttpServletResponse response) {
		String login = (String) request.getSession().getAttribute("login");
		if (login == null) {
			request.setAttribute("msg", "로그인 하세요");
			request.setAttribute("url", "loginForm");
			return "alert";
		} else if (!login.equals("admin")) {
			request.setAttribute("msg", "관리자만 가능한 업무입니다..");
			request.setAttribute("url", "main");
			return "alert";
		}
		return null;

	}

	/**
	 * 1.파라미터값 (email,tel) 저장 2.db에서 두개의 파라미터를 이용하여 id값을 리턴해주는 함수 id
	 * Memberdao.idSearch(eamil,tel) 3. id 존재 : 화면 뒤쪽 2자리를 **표시하여 화면에 출력하기 아이디 전송
	 * 버튼을 클릭하면 opener 창에 id 입력란에 전달, id.jsp 화면을 닫기 id 없음 : id가 없습니다. 현재 화면을
	 * idForm.jsp 페이지로 이동
	 */
	@RequestMapping("id")
	public String idForm(HttpServletRequest request, HttpServletResponse response) {
		String email = request.getParameter("email");
		String tel = request.getParameter("tel");
		String id = dao.idSearch(email, tel);
		if (id == null) {
			request.setAttribute("msg", "아이디가 없습니다.");
			request.setAttribute("url", "idForm");
			return "alert";
		} else {
			StringBuilder sb = new StringBuilder();
			sb.append(id.substring(0, 2));
			sb.append("**");
			sb.append(id.substring(4));
			request.setAttribute("id", sb.toString());
			return "member/id";
		}
	}
	/**
	 * 1.파라미터 id email tel 저장 2. db에서 id ,email과 tel 을 이용하여 해당 계정이 있는지 확인하기? pass값이
	 * 있는지 3. 없으면 없다 다음에 pwForm.jsp로 이동 있으면 앞 두자리는 **로 표시하여 화면에 출력 닫기버튼 클릭시 현재버튼 닫기
	 */
	@RequestMapping("pw")
	public String pwForm(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		String email = request.getParameter("email");
		String tel = request.getParameter("tel");
		String pass = dao.pwSearch(id, email, tel);
		if (pass == null) {
			request.setAttribute("msg", "비밀번호가 없습니다.");
			request.setAttribute("url", "pwForm");
			return "alert";
		} else {
			StringBuilder sb = new StringBuilder();
			sb.append(pass.substring(0, 2));
			sb.append("**");
			sb.append(pass.substring(4));
			request.setAttribute("pass", sb.toString());
			return "member/pw";
		}
	}
	
	

	// ================================================
	public String loginIdCheck(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		String login = (String) request.getSession().getAttribute("login");
		if (login == null) {
			request.setAttribute("msg", "로그인 하세요");
			request.setAttribute("url", "loginForm");
			return "alert";
		} else if (!login.equals("admin") && !id.equals(login)) {
			request.setAttribute("msg", "본인만 확인 가능합니다.");
			request.setAttribute("url", "main");
			return "alert";
		}
		return null; // 정상인 경우
	}
}