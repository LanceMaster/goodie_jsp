<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>EL을 사용하여 연산자 사용하기</title>
</head>
<body>
    <h3>
        \${5+7} = ${5+7}<br>
        \${8 div 3} = ${8 div 3}<br>
        \${8 mod 3} = ${8 mod 3} <br>
        \${10 == 9} = ${10 == 9} <br>
        \${10 eq 9} = ${10 eq 9} <br> 
        \${5+4==8?8:10} = ${5+4==8?8:10} <br>
        \${10 le 9} = ${10 le 9} <br>
        \${10 gt 9 } = ${10 gt 9} <br>
        \${10 le 9 } = ${10 le 9}
         

    </h3>
</body>
</html>