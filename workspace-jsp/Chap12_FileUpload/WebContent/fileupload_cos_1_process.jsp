<%@page import="java.io.File"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
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
		MultipartRequest multi = new MultipartRequest(request, 
							"D:\\workspace-jsp\\upload",  		//업로드 될 경로 지정
							10*1024*1024,				  		//파일의 최대크기 지정(10MB)
							"utf-8",							//인코딩 방식
							new DefaultFileRenamePolicy());		//파일이름에 대한 정책
																//동일한 이름의 파일이 있다면 덮어쓰는 것이 아니라 새로운 파일로 만들어줌
		Enumeration params = multi.getParameterNames();
							
		while(params.hasMoreElements()) {
			String name = (String)params.nextElement();
			String value = multi.getParameter(name);
			out.println(name + " = " + value + "<br/>");
		}
		
		out.println("=======================================================================================<br/>");
		
		Enumeration files = multi.getFileNames();
		while(files.hasMoreElements()) {
			String name = (String)files.nextElement();
			String filename = multi.getFilesystemName(name);  //업로드 한 파일 이름 얻기
			
			String original = multi.getOriginalFileName(name);  //이전 파일 이름 얻기
			String type = multi.getContentType(name);  //파일 타입(mp3, image..)
			File file = multi.getFile(name);  //파일의 참조를 얻음.
			
			out.println("요청 들어온 파라메터 이름 : " + name + "<br/>");
			out.println("저장 파일 이름 : " + filename + "<br/>");
			out.println("실제 파일 이름 : " + original + "<br/>");
			out.println("파일 컨텐츠 유형 : " + type + "<br/>");
			
			if(file != null) {
				out.println("파일 크기 : " + file.length() + "<br/>");
				out.println("파일 경로 : " + file.getPath() + "<br/>");
			}
		}
		
	%>
</body>
</html>