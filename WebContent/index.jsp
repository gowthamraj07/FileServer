<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Gowtham's File Server</title>
</head>
<body>



<%
	String loc = request.getParameter("l");
	loc = loc == null? "C:\\UserTemp\\Downloads" : loc;
	File folder = new File(loc);

%>

<h1><I>File Server</I></h1>
<hr/>
<form method="post" action="UploadServlet" enctype="multipart/form-data">
Select file to upload:
<input type="file" name="dataFile" id="fileChooser" multiple/><br/><br/>
<input type="submit" value="Upload" />
</form>
<hr/>
<ul>

<%

for(File f : folder.listFiles()) {
	if(f.isDirectory()){
		%>
		<li><a href="l=<%=f.getName() %>"><%=f.getName() %></a></li>
		<%
	}else{
		%>
		<li><a href="/static/<%=f.getName() %>"><%=f.getName() %></a></li>
		<%
	}
}
%>
</ul>
</body>
</html>