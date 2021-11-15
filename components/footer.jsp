<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.util.ResourceBundle"%>

<%
 


 
Cookie cookie = null;
Cookie[] cookies = null;
String name = null;
String footer = ".";
cookies = request.getCookies();
ResourceBundle resource;
 


 if (cookies != null) {
  for (int i = 0; i < cookies.length; i++) {
  		 cookie = cookies[i];
  		 name = cookie.getName();
  	
	   if("idioma".equals(name)){
		   try{
			    resource =  ResourceBundle.getBundle(cookie.getValue()); 
			    footer = resource.getString("footer");
		   }catch(Exception e){
			   
			   Cookie language = new Cookie("idioma","es");
			   language.setMaxAge(60 * 60);
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
    

     <footer class="py-5 bg-dark">
            <div class="container"><p class="m-0 text-center text-white">Copyright &copy; <%=footer %> </p></div>
        </footer>