<%@page import="java.io.File"%>
<%@page import="java.util.Iterator"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>파일 업로드(common)</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
		
		String path = "D:\\workspace-jsp\\upload";
		String fileName = "";
		
		//넘어온 파일의 형태가 multipart/form-data 인지 확인함
		boolean isMultipart = ServletFileUpload.isMultipartContent(request);
		//파일이 넘어왔다면
		if(isMultipart) {
			//메모리나 파일로 업로드 할 때 파일을 보관하는 역할을 하는 FileItem의 Factory설정
			DiskFileItemFactory factory = new DiskFileItemFactory();
			//업로드 요청처리하는 ServletFileUpload 객체 생성
			ServletFileUpload upload = new ServletFileUpload(factory);
			//업로드의 요청이 들어올때 파싱해서 FileItem목록 구하는 코드
			List<FileItem> items = upload.parseRequest(request);
			//반복자 얻음
			Iterator<FileItem> iterator = items.iterator();
			
			while(iterator.hasNext()) {
				FileItem item = iterator.next();
				//파일인지 확인하는 부분
				//텍스트라면
				if(item.isFormField()) {
					String name = item.getFieldName();  //태그 속성이 name
					String value = item.getString("utf-8");
					out.println("일반 폼 필드 : " + name + "-" + value + "<br/>");
				}
				//파일이라면
				else {
					String fileFieldName = item.getFieldName();  //태그 속성이 name
					String contentType = item.getContentType();
					boolean isInMemory = item.isInMemory();  //메모리에 할당되어 있다면 true
					long sizeInBytes = item.getSize();  //파일 용량
					
					fileName = item.getName();
					fileName = fileName.substring(fileName.lastIndexOf("\\")+1);
					
					File file = new File(path + "/" + fileName);
					
					if(file.exists()) {
						for(int i = 0; true; i++) {
							file = new File(path + "/" + "(" + i + ")" + fileName);
							
							//빠져나가는 경우(같은 file이 존재하지 않는 경우)
							if(!(file.exists()) == true) {
								fileName = "(" + i + ")" + fileName;
								break;
							}
							
						}
					}
					item.write(file);
					out.println("저장 파일 이름 : " + fileName + "<br/>");
					out.println("요청 파라미터 이름 : " + fileFieldName + "<br/>");
					out.println("파일 콘텐츠 유형 : " + contentType + "<br/>");
					out.println("파일 크기 : " + sizeInBytes + "<br/>");
					out.println("파일 경로 : " + path + "<br/>");
					
				}
			}
			
		}
		
	%>
	저장된 이미지<br/>
	<img alt="사진" src="D://workspace-jsp//upload//<%= fileName %>">
</body>
</html>