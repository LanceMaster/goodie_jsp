# jsp_study
goodie academy jsp_study

# JSP Study Project
2024-04-10 업데이트

## 프로젝트 개요
이 프로젝트는 JSP와 JSTL을 활용한 웹 애플리케이션 개발 학습을 위한 프로젝트입니다. 
주요 학습 내용은 JSTL 태그 라이브러리, EL(Expression Language), 그리고 다양한 데이터 타입의 처리 방법입니다.

## 참고 파일 목록
- `ex04_core.jsp`: Map, List, 배열 객체 처리 예제
- `ex05_fmt.jsp`: 숫자 포맷팅 관련 예제
- `ex06_fmt.jsp`: 날짜 포맷팅 관련 예제
- `ex07_fmt.jsp`: 숫자 파싱 관련 예제
- `ex07_el.jsp`: EL과 JSTL 조합 예제

## 1. JSTL (JSP Standard Tag Library)
JSTL은 JSP 페이지에서 자주 사용되는 기능들을 태그 형태로 제공하는 라이브러리입니다. 
스크립틀릿(`<% %>`) 대신 태그를 사용하여 코드의 가독성과 유지보수성을 높일 수 있습니다.

### 1.1 주요 JSTL 태그 라이브러리
1. **Core 태그 (c)**
   - 변수 선언, 조건문, 반복문 등 기본적인 프로그래밍 기능
   - 예: `<c:if>`, `<c:forEach>`, `<c:set>`

2. **Formatting 태그 (fmt)**
   - 날짜, 숫자, 통화 등의 포맷팅
   - 예: `<fmt:formatDate>`, `<fmt:formatNumber>`

3. **SQL 태그 (sql)**
   - 데이터베이스 작업을 위한 태그
   - 예: `<sql:query>`, `<sql:update>`

4. **XML 태그 (x)**
   - XML 문서 처리
   - 예: `<x:parse>`, `<x:transform>`

5. **Functions 태그 (fn)**
   - 문자열 처리 함수
   - 예: `fn:length()`, `fn:substring()`

## 2. EL (Expression Language)
EL은 JSP에서 데이터를 쉽게 접근하고 조작할 수 있게 해주는 표현 언어입니다. 
JSTL과 함께 사용하면 더욱 강력한 기능을 구현할 수 있습니다.

### 2.1 EL의 주요 특징
1. **간결한 문법**
   - `${변수명}` 형태로 사용
   - 예: `${member.name}`

2. **내장 객체 접근**
   - pageScope, requestScope, sessionScope, applicationScope
   - param, paramValues
   - header, headerValues
   - cookie
   - initParam

3. **연산자 지원**
   - 산술 연산자: +, -, *, /, %
   - 비교 연산자: ==, !=, <, >, <=, >=
   - 논리 연산자: &&, ||, !
   - 삼항 연산자: ? :

4. **메서드 호출**
   - `${객체.메서드()}` 형태로 사용
   - 예: `${list.size()}`

## 3. JSTL과 EL의 조합 활용
JSTL과 EL을 함께 사용하면 복잡한 로직도 간결하게 표현할 수 있습니다.

### 3.1 Map, List, 배열 객체 처리
[참고: ex04_core.jsp]

#### JSTL forEach 사용
```jsp
<c:forEach var="m" items="${map1}" varStatus="stat">
    ${stat.count}: ${m.key} = ${m.value}
</c:forEach>
```

#### EL로 직접 접근
```jsp
<!-- 점(.) 표기법 -->
${map1.name}
${map1.today}
${map1.age}

<!-- 대괄호([]) 표기법 -->
${map1["name"]}
${map1["today"]}
${map1["age"]}
```

#### JSTL forEach 사용
```jsp
<c:set var="arr" value="<%=new int[]{10,20,30,40,50}%>"/>
<c:forEach var="a" items="${arr}" varStatus="stat">
    arr[${stat.index}] = ${a}
</c:forEach>
```

#### EL로 직접 접근
```jsp
${arr[0]}
${arr[1]}
${arr[2]}
```

#### JSTL forEach 사용
```jsp
<c:set var="list" value="<%=Arrays.asList(10,20,30,40,50,60)%>"/>
<c:forEach var="item" items="${list}" varStatus="stat">
    list[${stat.index}] = ${item}
</c:forEach>
```

#### EL로 직접 접근
```jsp
${list[0]}
${list[1]}
${list[2]}
```

### 3.2 조건문과 반복문
```jsp
<!-- 조건문 예시 -->
<c:if test="${user.role == 'ADMIN'}">
    관리자 메뉴
</c:if>

<!-- 반복문 예시 -->
<c:forEach var="item" items="${items}" varStatus="status">
    ${status.count}. ${item.name}
</c:forEach>
```

## 4. 데이터 포맷팅
JSTL의 Formatting 태그를 사용하면 숫자와 날짜를 원하는 형식으로 쉽게 표시할 수 있습니다.

### 4.1 숫자 포맷팅
[참고: ex05_fmt.jsp]

### 4.2 날짜 포맷팅
[참고: ex06_fmt.jsp]

### 4.3 숫자 파싱
[참고: ex07_fmt.jsp]

#### 4.3.1 숫자 파싱 기본 사용법
```jsp
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
```

#### 4.3.2 숫자 파싱 예제
```jsp
<!-- 포맷된 숫자를 숫자로 변환 -->
<fmt:parseNumber value="20,000" var="num1" pattern="##,###"/>
<fmt:parseNumber value="10,000" var="num2" pattern="##,###"/>
합: ${num1} + ${num2} = ${num1 + num2}
```

#### 4.3.3 주요 속성
1. **value** (필수)
   - 파싱할 문자열 값
   - 예: "20,000", "10,000"

2. **pattern**
   - 숫자 형식 패턴
   - 예: "##,###", "#,##0.00"

3. **var**
   - 파싱 결과를 저장할 변수명
   - EL에서 사용 가능

4. **scope**
   - 변수를 저장할 스코프
   - 기본값: page

#### 4.3.4 주의사항
1. pattern 속성은 value의 형식과 일치해야 함
2. 파싱 실패 시 예외가 발생할 수 있음
3. null 값은 처리되지 않음
4. locale에 따라 구분 기호가 다를 수 있음

## 5. 실무 적용 팁

### 5.1 코드 가독성 향상
- JSTL과 EL을 적절히 조합하여 사용
- 복잡한 로직은 Java 코드로 처리
- 반복되는 코드는 커스텀 태그로 분리

### 5.2 성능 최적화
- 불필요한 스크립틀릿 사용 최소화
- EL 표현식의 중복 계산 방지
- 적절한 스코프 사용 (page, request, session, application)

### 5.3 에러 처리
- null 값에 대한 적절한 처리
- 숫자 형식 변환 시 예외 처리
- 데이터 유효성 검증

## 6. 참고 자료
- Oracle JSP/Servlet 문서
- JSTL API 문서
- EL 스펙 문서
- Java EE 튜토리얼

## 7. 라이센스
Copyright © 2024 구디아카데미 김준희
