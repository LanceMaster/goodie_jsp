# JSP Model 2 (MVC) 패턴 설명
2024-04-11 업데이트

## 1. Model 2 패턴이란?
Model 2는 MVC(Model-View-Controller) 패턴을 JSP에서 구현한 아키텍처입니다. 웹 애플리케이션의 각 구성요소를 명확히 분리하여 유지보수성과 확장성을 높입니다.

## 2. 주요 구성요소

### 2.1 Controller
- 전체 흐름을 제어하는 중앙 관리자
- 모든 요청을 받아서 적절한 Action으로 전달
- `Controller.java`에서 구현
```java
@WebServlet(urlPatterns = { "*.do" })
public class Controller extends HttpServlet {
    // 요청 처리 로직
}
```

### 2.2 Model (Action)
- 비즈니스 로직을 처리
- 데이터 조작 및 처리 담당
- `Action.java`에서 구현
```java
public class Action {
    public ActionForward hello(HttpServletRequest request, HttpServletResponse response) {
        request.setAttribute("hello", "HELLO WORLD");
        return new ActionForward(false, "ex15_model2/hello.jsp");
    }
}
```

### 2.3 View
- 사용자 인터페이스 담당
- JSP 파일로 구현
- Model에서 전달받은 데이터 표시
```jsp
${hello}  <!-- "HELLO WORLD" 출력 -->
```

## 3. 실행 흐름

1. **요청 수신**
   - 클라이언트가 `*.do` URL로 요청
   - 예: `http://localhost:8080/hello.do`

2. **Controller 처리**
   - `Controller` 서블릿이 요청을 받음
   - `url.properties`에서 매핑된 메서드 확인
   - 해당 Action 메서드 호출

3. **Model 처리**
   - `Action` 클래스의 해당 메서드 실행
   - 비즈니스 로직 처리
   - 데이터를 request에 저장
   - 다음 이동할 View 정보 반환

4. **View 렌더링**
   - 지정된 JSP로 포워딩
   - EL을 통해 Model의 데이터 표시
   - 최종 HTML 생성

## 4. 데이터 흐름 예시
```
클라이언트 요청 (hello.do)
    ↓
Controller (요청 처리)
    ↓
Action.hello() 메서드 실행
    ↓
request.setAttribute("hello", "HELLO WORLD")
    ↓
hello.jsp로 포워딩
    ↓
${hello} → "HELLO WORLD" 출력
```

## 5. 장점
1. **관심사 분리**
   - Controller: 요청 처리
   - Model: 비즈니스 로직
   - View: 화면 표시

2. **유지보수성**
   - 각 컴포넌트가 독립적
   - 코드 수정이 용이

3. **재사용성**
   - 컴포넌트별 재사용 가능
   - 확장이 용이

4. **테스트 용이성**
   - 각 컴포넌트를 독립적으로 테스트 가능

## 6. 주요 파일 설명
- `Controller.java`: 전체 흐름 제어
- `Action.java`: 비즈니스 로직 처리
- `ActionForward.java`: View 이동 정보 저장
- `url.properties`: URL-메서드 매핑 정보
- `*.jsp`: View 템플릿

## 7. 참고사항
- Model 2는 Spring MVC의 기반이 되는 패턴
- 현대적인 웹 애플리케이션의 기본 구조
- RESTful API와 함께 사용 가능 