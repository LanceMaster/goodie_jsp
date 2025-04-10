# jsp_study
goodie academy jsp_study

# JSP Study Project
2024-04-09 업데이트

## JSTL (JSP Standard Tag Library)
JSTL은 JSP 페이지에서 자주 사용되는 기능들을 태그 형태로 제공하는 라이브러리입니다.

### 주요 JSTL 태그 라이브러리
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

## EL (Expression Language)
EL은 JSP에서 데이터를 쉽게 접근하고 조작할 수 있게 해주는 표현 언어입니다.

### EL의 주요 특징
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

### JSTL과 EL의 조합
```jsp
<c:forEach var="member" items="${memberList}">
    <tr>
        <td>${member.id}</td>
        <td>${member.name}</td>
        <td>${member.gender == 1 ? '남' : '여'}</td>
    </tr>
</c:forEach>
```

### 장점
1. **코드 가독성 향상**
   - 스크립틀릿(`<% %>`) 대신 태그와 EL 사용
   - HTML과 JSP 코드의 명확한 분리

2. **유지보수 용이**
   - 로직과 표현의 분리
   - 재사용성 향상

3. **보안 강화**
   - XSS(Cross-Site Scripting) 방지
   - 자동 이스케이프 처리

4. **타입 변환 자동화**
   - 문자열과 숫자 간의 자동 변환
   - null 값 처리 용이
