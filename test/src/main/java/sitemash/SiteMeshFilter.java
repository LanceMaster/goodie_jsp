package sitemash;

import javax.servlet.annotation.WebFilter;

import org.sitemesh.builder.SiteMeshFilterBuilder;
import org.sitemesh.config.ConfigurableSiteMeshFilter;

/**
 * 
 * 1.sitemesh 패키지생성 2. sitemeshfilter 클래스 파일생성
 * 
 * sitemesh 기능 :화면에 layout 페이지를 구현하여 jsp페이지를 적용하는 프레임워크 filter 기능 :servlet 이전에
 * 먼저 실행하여 request나 response 객체를 변경할 수 있는 기능
 */
@WebFilter("/*") // 모든 요청에 대해 필터링
public class SiteMeshFilter extends ConfigurableSiteMeshFilter {

	@Override
	protected void applyCustomConfiguration(SiteMeshFilterBuilder builder) {
//		layout 페이지의 위치정보를 설정 
		// /member/* => https://localhost:8080/model1Study/member/* 이하 모든 요청시
//		/layout/layout.jsp 페이지를 적용하겠다.
		// adddecoratorpath(url,decoratror 페이지) : layout을 설정
		// excludedpath(url): member인데 picture로 시작하는건 layout을 제외시킨다.
		builder.addDecoratorPath("/board/loginForm.jsp", "/layout/layout.jsp");
//		현재 layout에 css가 걸려있어서 picture는 css가 없다.
	}

}
