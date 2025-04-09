<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!--2025-04-03  -->
<%--
    enctype="multipart/form-data" : 파일 업로듸 선택된 파일의 내용도 함께 서버로 전송하도록 설정 method="post"로 무조건 설정해야함
    
        =>이 요청을 받는 서버에서는 request객체를 이용하여 파리미터값을 가져올수가 읎다.
        => file에 대한 value값을 전부다 넘길수는 없어가지고
        <%--http protocol body 에 file에 대한 value를 넘기기에는 한계가 있어  --%>
=> request처리를할떄 file에 대한 --%>

<%--
  ex01_upload.jsp 요청시 1개의 파라미터의 파일 정보를 가지고 요청 multipart/form-data 설정인 경우 request 객체 파라미터 정보 사용불가
  1개의 파라미터의 1개의 파일 정보를 가지고 요청
  uploader 파라미터 
  filename 파일정보 + 파일의 내용
  
  --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script src="https://code.jquery.com/jquery-3.7.1.js"
    integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4="
    crossorigin="anonymous"></script>
<script type="text/javascript">
  $()
  </script>
<body>
    <div>
        <form id="frm_upload" action="ex01_upload.jsp" method="post"
            enctype="multipart/form-data">
            <div>
                <label for="uploader">작성자</label> <input type="text"
                    id="uploader" name="uploader">
            </div>
            <div>
                <label for="filename">파일첨부</label> <input type="file"
                    id="filename" name="filename">
            </div>
            <div>
                <!-- button의 기본타입은 submit ex01_upload.jsp로 넘어가게된다.  -->
                <button>첨부하기</button>
                <!-- form 안에 있는것이 전부 reset  -->
                <input type="reset" value="다시작성">
            </div>

        </form>



    </div>

    <script type="text/javascript">
  $("#filename").on("change",(e)=> {
	  console.log("test");
	  let filename = $(e.target).val();
	  let extname = filename.substring(filename.lastIndexOf(".")+1).toLowerCase();
	  let acceptList = ["jpg","jpeg","png","gif","tif"];
	  if($.inArray(extname,acceptList) == -1) {
		  alert("이미지만 첨부 가능합니다.");
		  $(e.target).val("");
		  return;
	  } 
  });
  </script>
</body>
</html>