<%@page import="java.io.File"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.commons.fileupload.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>파일 업로드 처리</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
		
		//업로드를 할 서버의 경로 지정함.
		String fileUploadPath = "D:\\workspace-jsp\\upload";
		
		DiskFileUpload upload = new DiskFileUpload();
		//요청된 파라메터를 전달받기 위해서 parseRequest() 호출
		List items = upload.parseRequest(request);
		//반복자 얻는 코드
		Iterator params = items.iterator();
		
		while(params.hasNext())	{
			FileItem fileItem = (FileItem)params.next();
			
			//isFormField() : 요청 파라미터가 파일이 아니라 일반데이터인 경우 true 리턴함
			if(!fileItem.isFormField()) {
				String fileName = fileItem.getName();
				
				//경로 출력
				//out.println("1 : " + fileName + "<br/>");
				
				/* 파일명 앞에 있는 경로를 제거해서 파일명에 저장 
				   +1을 하는 이유 : lastIndexOf()을 찾지 못하면 -1을 리턴함
				*/
				fileName = fileName.substring(fileName.lastIndexOf("\\")+1);
				
				File file = new File(fileUploadPath + "/" + fileName);
				fileItem.write(file);
				
				out.println("파일 이름 : " + fileName + "<br/>");
				out.println("파일 저장 경로 : " + file.getPath() + "<br/>");
			}
		}
	%>
</body>
</html>