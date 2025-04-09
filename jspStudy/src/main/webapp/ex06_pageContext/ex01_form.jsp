<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- ex06_pageContext\ex01_form.jsp   --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도시 조회</title>
</head>
<body>


        <select id="city">
            <option value="seoul">서울</option>
            <option value="busan">부산</option>
        </select> 
        <input type="button" value="버튼" onclick="city_select()">
        <script type="text/javascript">
        function city_select() {
        	 var city = document.getElementById("city").value;
            /*
        	 console.log(city);
            */
             location.href="ex01_city.jsp?city="+ city;
            /* city는 select option에 둘중 하나다  */
        }
        </script>
</body>
</html>