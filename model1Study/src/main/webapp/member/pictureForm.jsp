<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<style>
/* 전체 바디 스타일 */
body {
    font-family: Arial, sans-serif;
    margin: 0;
    padding: 0;
    background-color: #f5f5f5;
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
}

/* 테이블 스타일 */
table {
    background-color: #ffffff;
    border-radius: 8px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    padding: 20px;
    border-collapse: collapse;
}

/* 이미지 미리보기 스타일 */
#preview {
    width: 100%;
    height: auto;
    max-width: 300px; /* 최대 너비를 설정하여 너무 크지 않게 */
    display: block;
    margin: 0 auto; /* 중앙 정렬 */
    border-radius: 8px;
    object-fit: cover;
}

/* 폼 스타일 */
form {
    margin-top: 20px;
    text-align: center;
}

/* 파일 입력 스타일 */
#imagefile {
    margin: 10px 0;
    padding: 8px;
    border: 1px solid #ddd;
    border-radius: 4px;
    background-color: #f9f9f9;
}

/* 제출 버튼 스타일 */
input[type="submit"] {
    background-color: #4CAF50;
    color: white;
    padding: 10px 20px;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    font-size: 16px;
    transition: background-color 0.3s;
}

input[type="submit"]:hover {
    background-color: #45a049;
}
</style>
<body>
    <table>
        <tr>
            <td><img id="preview" src=""></td>
        </tr>
        <tr>
            <td>
                <form action="picture.jsp" method="post"
                    enctype="multipart/form-data">
                    <input type="file" name="picture" id="imagefile"
                        accept="img/*"> <input type="submit"
                        value="사진등록">
                </form>
            </td>
        </tr>
    </table>
    <script type="text/javascript">
let imagefile = document.querySelector("#imagefile");
let preview = document.querySelector("#preview");
/* change 이벤트 : 선택된 파일이 변경되었을때  */
imagefile.addEventListener("change",(e)=> { //이벤트 핸들러
	//e.target : file객체
	//e.target.files : 선택된 파일들 . 배열로 return됨
    let get_file = e.target.files;
    let reader = new FileReader(); //파일을 읽기 위한 Stream 객체 
    reader.onload = (function(Img) { //reader 객체에 파일이 로드되는 경우 이벤트 동록 
        return function(e) {
    	//preview(이미지 태그)를 넣어서 매개변수로 이 함수를 호출함
    	//Img 매개변수 : preview객체를 저장
    	//자바스크립트에서는 함수객체를 리턴할수있음
            Img.src = e.target.result;
    	//e.target.result : 선택된 파일의 값
        }
    })(preview);
    /*get_file : 선택된 파일이 존재하니  */
    //reader.readAsDataURL(get_file[0]) : 첫번째 선택된 파일을 reader로 읽기
    if(get_file){reader.readAsDataURL(get_file[0]); }   
    
});
</script>
</body>
</html>
