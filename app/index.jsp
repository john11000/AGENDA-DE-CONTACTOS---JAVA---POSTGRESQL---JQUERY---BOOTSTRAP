<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ResourceBundle"%>
<%@ page import="config.Idiomas"%>

<%
Cookie cookie = null;
Cookie[] cookies = null;
String name = null;
String titulo = ".";
cookies = request.getCookies();
ResourceBundle resource;
 if (cookies != null) {
  for (int i = 0; i < cookies.length; i++) {
  		 cookie = cookies[i];
  		 name = cookie.getName();
	   if("idioma".equals(name)){
		   try{	   
			    resource =  ResourceBundle.getBundle(cookie.getValue()); 
			    titulo = resource.getString("titulo");
		   }catch(Exception e){
			   
			   Cookie language = new Cookie("idioma","es");
			   language.setMaxAge(60 * 60);
			   language.setPath("/pruebas");
			   response.addCookie(language);
			   response.sendRedirect("./");   
		   }	   
		    break;
	   }
	   if(i==cookies.length-1){     
		   Cookie language = new Cookie("idioma","es");
		   language.setMaxAge(60 * 60);
		   response.addCookie(language);
		   response.sendRedirect("./");
	   }
   }
 }

 %>


<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title><%= titulo %></title>
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Font Awesome icons (free version)-->
        <script src="https://use.fontawesome.com/releases/v5.15.3/js/all.js" crossorigin="anonymous"></script>
        <!-- Google fonts-->
        <link href="https://fonts.googleapis.com/css?family=Varela+Round" rel="stylesheet" />
        <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="css/styles.css" rel="stylesheet" />
    </head>
    <body id="page-top">
 
        <!-- Navigation-->
           <jsp:include page="components/nav.jsp" />
        <!-- Masthead-->
         <jsp:include page="components/header.jsp" />
        <!-- Bootstrap core JS-->
        
  <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
       
        <script src="https://unpkg.com/axios/dist/axios.min.js"></script>
     	<script src="js/api.jsp"></script>
    
    </body>
</html>