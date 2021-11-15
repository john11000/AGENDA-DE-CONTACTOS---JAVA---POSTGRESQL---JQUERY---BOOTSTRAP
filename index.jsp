<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ page import="java.util.ResourceBundle"%>
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
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="./assets/logo_web.png" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="css/styles.css" rel="stylesheet" />
    </head>
    <body>
        <!-- Responsive navbar-->
     <jsp:include page="components/nav.jsp" />

        <!-- Header - set the background image for the header in the line below-->
     <jsp:include page="components/header.jsp" />
        <!-- Content section-->
  	 <jsp:include page="components/sectionHecha.jsp" />
        <!-- Image element - set the background image for the header in the line below-->
 	 <jsp:include page="components/tecnologias.jsp" />
        <!-- Content section-->
     <jsp:include page="components/objectivos.jsp" />
        <!-- Footer-->
     <jsp:include page="components/footer.jsp" />
     
     
    </body>
    
       <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
      
</html>
